/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects SalesOrderHeader data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_BronzeSalesOrderHeader]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
         SalesOrderID
        ,RevisionNumber
        ,OrderDate
        ,DueDate
        ,ShipDate
        ,Status
        ,OnlineOrderFlag
        ,SalesOrderNumber
        ,PurchaseOrderNumber
        ,AccountNumber
        ,CustomerID
        ,SalesPersonID
        ,TerritoryID
        ,BillToAddressID
        ,ShipToAddressID
        ,ShipMethodID
        ,CreditCardID
        ,CreditCardApprovalCode
        ,CurrencyRateID
        ,SubTotal
        ,TaxAmt
        ,Freight
        ,TotalDue
        ,Comment
        ,RowGuid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Sales.SalesOrderHeader

END
GO