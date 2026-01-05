-- Validates row counts between OLTP and STG tables;
--shows 'Successful' if counts match, else 'ERROR'


SELECT 
    'Sales.SalesPerson' AS TableName,
    COUNT(*) AS OLTP_RowCount,
    (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesPerson) AS STG_RowCount,
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesPerson) THEN 'Basarili'
        ELSE 'Error'
    END AS ValidationStatus
FROM AdventureWorks_OLTP.Sales.SalesPerson

UNION ALL

SELECT 
    'Sales.SalesOrderHeader',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesOrderHeader),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesOrderHeader) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Sales.SalesOrderHeader

UNION ALL

SELECT 
    'Sales.SalesOrderDetail',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesOrderDetail),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.SalesOrderDetail) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Sales.SalesOrderDetail

UNION ALL

SELECT 
    'Sales.Customer',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.Customer),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Sales.Customer) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Sales.Customer

UNION ALL

SELECT 
    'Production.Product',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Production.Product),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Production.Product) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Production.Product

UNION ALL

SELECT 
    'Person.Person',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Person.Person),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Person.Person) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Person.Person

UNION ALL

SELECT 
    'Person.Address',
    COUNT(*),
    (SELECT COUNT(*) FROM AdventureWorks_STG.Person.Address),
    CASE 
        WHEN COUNT(*) = (SELECT COUNT(*) FROM AdventureWorks_STG.Person.Address) THEN 'Basarili'
        ELSE 'Error'
    END
FROM AdventureWorks_OLTP.Person.Address;
