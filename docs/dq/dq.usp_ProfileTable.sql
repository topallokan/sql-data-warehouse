/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Description: Generic data profiling for a table.
****************************************************************************************/


CREATE OR ALTER PROCEDURE dq.usp_ProfileTable
(
    @SchemaName SYSNAME,
    @TableName  SYSNAME
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FullName NVARCHAR(400) = QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName);
    DECLARE @sql NVARCHAR(MAX);

    --------------------------------------------------------------------
    -- Output Temp Table
    --------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#dq_output') IS NOT NULL DROP TABLE #dq_output;

    CREATE TABLE #dq_output (
        MetricName NVARCHAR(200),
        ColumnName NVARCHAR(200),
        Value NVARCHAR(400)
    );

    --------------------------------------------------------------------
    -- 1. Row Count
    --------------------------------------------------------------------
    SET @sql = '
        INSERT INTO #dq_output
        SELECT ''RowCount'', NULL, COUNT(*)
        FROM ' + @FullName + ';
    ';
    EXEC(@sql);

    --------------------------------------------------------------------
    -- 2. Detect Primary Key Columns
    --------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#pkcols') IS NOT NULL DROP TABLE #pkcols;

    SELECT 
        c.name AS ColumnName
    INTO #pkcols
    FROM sys.indexes i
    JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    JOIN sys.columns c ON c.object_id = ic.object_id AND c.column_id = ic.column_id
    WHERE 
        i.object_id = OBJECT_ID(@FullName)
        AND i.is_primary_key = 1;

    --------------------------------------------------------------------
    -- 2A. Null PK Check
    --------------------------------------------------------------------
    DECLARE @pkNullSql NVARCHAR(MAX) = '';

    SELECT @pkNullSql = STRING_AGG(
        ' OR ' + QUOTENAME(ColumnName) + ' IS NULL'
    , '')
    FROM #pkcols;

    IF @pkNullSql IS NOT NULL
    BEGIN
        SET @pkNullSql = STUFF(@pkNullSql, 1, 4, ''); -- remove first OR

        SET @sql = '
            INSERT INTO #dq_output
            SELECT ''NullPK'', NULL, COUNT(*)
            FROM ' + @FullName + '
            WHERE ' + @pkNullSql + ';
        ';
        EXEC(@sql);
    END
    ELSE
    BEGIN
        INSERT INTO #dq_output VALUES ('NullPK', NULL, 'NO PK');
    END

    --------------------------------------------------------------------
    -- 2B. Duplicate PK Check
    --------------------------------------------------------------------
    DECLARE @pkCols NVARCHAR(MAX);

    SELECT @pkCols = STRING_AGG(QUOTENAME(ColumnName), ', ')
    FROM #pkcols;

    IF @pkCols IS NOT NULL
    BEGIN
        SET @sql = '
            INSERT INTO #dq_output
            SELECT ''DuplicatePK'', NULL, COUNT(*)
            FROM (
                SELECT ' + @pkCols + '
                FROM ' + @FullName + '
                GROUP BY ' + @pkCols + '
                HAVING COUNT(*) > 1
            ) d;
        ';
        EXEC(@sql);
    END
    ELSE
    BEGIN
        INSERT INTO #dq_output VALUES ('DuplicatePK', NULL, 'NO PK');
    END

    --------------------------------------------------------------------
    -- 3. Column List (Metadata Driven)
    --------------------------------------------------------------------
    IF OBJECT_ID('tempdb..#cols') IS NOT NULL DROP TABLE #cols;

    SELECT 
        c.name AS ColumnName,
        t.name AS DataType
    INTO #cols
    FROM sys.columns c
    JOIN sys.types t ON c.user_type_id = t.user_type_id
    WHERE c.object_id = OBJECT_ID(@FullName);

    --------------------------------------------------------------------
    -- 4. Null Counts for ALL Columns
    --------------------------------------------------------------------
    SELECT @sql = STRING_AGG(
        'INSERT INTO #dq_output
         SELECT ''NullCount'', ''' + ColumnName + ''', COUNT(*)
         FROM ' + @FullName + '
         WHERE ' + QUOTENAME(ColumnName) + ' IS NULL;'
    , CHAR(10))
    FROM #cols;

    EXEC(@sql);

    --------------------------------------------------------------------
    -- 5. Numeric MIN/MAX for ALL numeric columns
    --------------------------------------------------------------------
    SELECT @sql = STRING_AGG(
        '
        INSERT INTO #dq_output
        SELECT ''Min'', ''' + ColumnName + ''', MIN(' + QUOTENAME(ColumnName) + ')
        FROM ' + @FullName + ';

        INSERT INTO #dq_output
        SELECT ''Max'', ''' + ColumnName + ''', MAX(' + QUOTENAME(ColumnName) + ')
        FROM ' + @FullName + ';
        '
    , CHAR(10))
    FROM #cols
    WHERE DataType IN ('int','bigint','smallint','tinyint',
                       'decimal','numeric','money','smallmoney',
                       'float','real');

    EXEC(@sql);

    --------------------------------------------------------------------
    -- Final Output
    --------------------------------------------------------------------
    SELECT * FROM #dq_output;
END
GO
