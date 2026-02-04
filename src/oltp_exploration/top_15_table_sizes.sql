USE AdventureWorksDW;

-- ==============================================================
--  Top 15 Tables by DATA_MB (Actual Data Size)
--  Why DATA_MB?
--    - Counts only real data pages (most accurate ETL workload metric)
--    - Filters out inflated sizes caused by indexes or reserved space
--    - The metric that most impacts ETL performance,
--      DWH design decisions, and Power BI refresh duration
-- ==============================================================

SELECT TOP 15
    t.NAME AS TableName,
    SUM(a.total_pages) * 8 / 1024.0 AS Total_MB,  -- reserved + used space
    SUM(a.used_pages) * 8 / 1024.0 AS Used_MB,    -- data + index pages
    SUM(a.data_pages) * 8 / 1024.0 AS Data_MB     -- actual data size (core metric)
FROM sys.tables t
INNER JOIN sys.indexes i 
    ON t.object_id = i.object_id
INNER JOIN sys.partitions p 
    ON i.object_id = p.object_id 
    AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a 
    ON p.partition_id = a.container_id
GROUP BY t.NAME
ORDER BY Data_MB DESC;  -- Sort by actual data size only
