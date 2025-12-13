/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : OLTP
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
        Value NVARCHAR(MAX)   -- MAX yaptýk, truncate yok
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
    DECLARE @pkNullSql NVARCHAR(MAX) = N'';

    SELECT @pkNullSql = @pkNullSql + QUOTENAME(ColumnName) + ' IS NULL OR '
    FROM #pkcols;

    IF LEN(@pkNullSql) > 0
    BEGIN
        SET @pkNullSql = LEFT(@pkNullSql, LEN(@pkNullSql) - 3);

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
    DECLARE @pkCols NVARCHAR(MAX) = N'';

    SELECT @pkCols = @pkCols + QUOTENAME(ColumnName) + ',' 
    FROM #pkcols;

    IF LEN(@pkCols) > 0
    BEGIN
        SET @pkCols = LEFT(@pkCols, LEN(@pkCols) - 1);

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
    -- 3. Column List
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
    -- 4. Null Counts for ALL Columns (NO STRING_AGG)
    --------------------------------------------------------------------
    DECLARE @col NVARCHAR(200);

    DECLARE col_cursor CURSOR FOR
        SELECT ColumnName FROM #cols;

    OPEN col_cursor;
    FETCH NEXT FROM col_cursor INTO @col;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = '
            INSERT INTO #dq_output
            SELECT ''NullCount'', ''' + @col + ''', COUNT(*)
            FROM ' + @FullName + '
            WHERE ' + QUOTENAME(@col) + ' IS NULL;
        ';
        EXEC(@sql);

        FETCH NEXT FROM col_cursor INTO @col;
    END

    CLOSE col_cursor;
    DEALLOCATE col_cursor;

    --------------------------------------------------------------------
    -- 5. Numeric MIN/MAX (cursor ile)
    --------------------------------------------------------------------
    DECLARE @numCol NVARCHAR(200);

    DECLARE num_cursor CURSOR FOR
        SELECT ColumnName
        FROM #cols
        WHERE DataType IN ('int','bigint','smallint','tinyint',
                           'decimal','numeric','money','smallmoney',
                           'float','real');

    OPEN num_cursor;
    FETCH NEXT FROM num_cursor INTO @numCol;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @sql = '
            INSERT INTO #dq_output
            SELECT ''Min'', ''' + @numCol + ''', MIN(' + QUOTENAME(@numCol) + ')
            FROM ' + @FullName + ';

            INSERT INTO #dq_output
            SELECT ''Max'', ''' + @numCol + ''', MAX(' + QUOTENAME(@numCol) + ')
            FROM ' + @FullName + ';
        ';
        EXEC(@sql);

        FETCH NEXT FROM num_cursor INTO @numCol;
    END

    CLOSE num_cursor;
    DEALLOCATE num_cursor;

    --------------------------------------------------------------------
    -- Final Output
    --------------------------------------------------------------------
    SELECT * FROM #dq_output;
END
GO
