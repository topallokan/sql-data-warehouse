/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for sales person table.
****************************************************************************************/

USE AdventureWorks_OLTP
GO

CREATE OR ALTER PROCEDURE Sales.usp_Extract_SalesPerson
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
         BusinessEntityID
        ,TerritoryID
        ,SalesQuota
        ,Bonus
        ,CommissionPct
        ,SalesYTD
        ,SalesLastYear
        ,rowguid
        ,ModifiedDate
    FROM Sales.SalesPerson;

END
GO
