/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects SalesPerson data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_BronzeSalesPerson]
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
        ,Rowguid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Sales.SalesPerson

END
GO