USE AdventureWorksDW
GO

-- 1️ Create a temp table for monthly/yearly row counts
IF OBJECT_ID('tempdb..#MonthlyCounts') IS NOT NULL DROP TABLE #MonthlyCounts;

SELECT 'WorkOrderRouting' AS TableName, 
       YEAR(ScheduledStartDate) AS [Year], 
       MONTH(ScheduledStartDate) AS [Month], 
       COUNT(1) AS Row_Count
INTO #MonthlyCounts
FROM Production.WorkOrderRouting
GROUP BY YEAR(ScheduledStartDate), MONTH(ScheduledStartDate)

UNION ALL
SELECT 'SalesOrderDetail' AS TableName, 
       YEAR(h.OrderDate) AS [Year], 
       MONTH(h.OrderDate) AS [Month], 
       COUNT(1) AS Row_Count
FROM Sales.SalesOrderDetail d
INNER JOIN Sales.SalesOrderHeader h
    ON d.SalesOrderID = h.SalesOrderID
GROUP BY YEAR(h.OrderDate), MONTH(h.OrderDate)

UNION ALL
SELECT 'TransactionHistory' AS TableName, 
       YEAR(TransactionDate) AS [Year], 
       MONTH(TransactionDate) AS [Month], 
       COUNT(1) AS Row_Count
FROM Production.TransactionHistory
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)

UNION ALL
SELECT 'SalesOrderHeader' AS TableName, 
       YEAR(OrderDate) AS [Year], 
       MONTH(OrderDate) AS [Month], 
       COUNT(1) AS Row_Count
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)

UNION ALL
SELECT 'TransactionHistoryArchive' AS TableName, 
       YEAR(TransactionDate) AS [Year], 
       MONTH(TransactionDate) AS [Month], 
       COUNT(1) AS Row_Count
FROM Production.TransactionHistoryArchive
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate);

-- 2️ Calculate growth compared to previous month
SELECT 
    mc.TableName,
    mc.Year,
    mc.Month,
    mc.Row_Count,
    LAG(Row_Count) OVER (PARTITION BY mc.TableName ORDER BY mc.Year, mc.Month) AS PreviousMonth,
    mc.Row_Count - LAG(Row_Count) OVER (PARTITION BY mc.TableName ORDER BY mc.Year, mc.Month) AS Growth,
    CASE 
        WHEN LAG(Row_Count) OVER (PARTITION BY mc.TableName ORDER BY mc.Year, mc.Month) = 0 THEN NULL
        ELSE ((mc.Row_Count - LAG(Row_Count) OVER (PARTITION BY mc.TableName ORDER BY mc.Year, mc.Month)) * 100.0
               / LAG(Row_Count) OVER (PARTITION BY mc.TableName ORDER BY mc.Year, mc.Month))
    END AS GrowthPercent
FROM #MonthlyCounts mc
ORDER BY mc.TableName, mc.Year, mc.Month
