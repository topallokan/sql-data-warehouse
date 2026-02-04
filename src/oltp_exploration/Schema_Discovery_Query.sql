-- SQL Script for Initial Source System Discovery (AdventureWorks OLTP)
-- This query retrieves schema, table, column details, data types, and nullability
-- for the core business domains related to the Sales Data Warehouse (DWH).

SELECT
    t.TABLE_SCHEMA,
    t.TABLE_NAME,
    c.COLUMN_NAME,
    c.DATA_TYPE,
    c.CHARACTER_MAXIMUM_LENGTH, -- Max length for string data types
    c.IS_NULLABLE,              -- Critical for Data Quality Analysis (2.4)
    c.ORDINAL_POSITION
FROM
    INFORMATION_SCHEMA.TABLES t
JOIN
    INFORMATION_SCHEMA.COLUMNS c
    ON t.TABLE_SCHEMA = c.TABLE_SCHEMA
    AND t.TABLE_NAME = c.TABLE_NAME
WHERE
    t.TABLE_TYPE = 'BASE TABLE'
    -- Focus on core schemas: Sales (transactions), Production (products), and Person (customers/geography)
    AND t.TABLE_SCHEMA IN ('Sales', 'Production', 'Person')
ORDER BY
    t.TABLE_SCHEMA,
    t.TABLE_NAME,
    c.ORDINAL_POSITION;