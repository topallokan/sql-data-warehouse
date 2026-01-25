/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms SalesOrderHeader data from Bronze to Silver layer.
              Converts DATETIME to DATE and standardizes DECIMAL precision to (18,2).
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_SalesOrderHeader]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         SalesOrderID
        ,RevisionNumber
        -- Date conversions from DATETIME (Bronze) to DATE (Silver)
        ,CAST(OrderDate AS DATE) AS OrderDate
        ,CAST(DueDate AS DATE) AS DueDate
        ,CAST(ShipDate AS DATE) AS ShipDate
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
        -- Adjusting decimal precision to match Silver schema (18,2)
        ,CAST(SubTotal AS DECIMAL(18,2)) AS SubTotal
        ,CAST(TaxAmt AS DECIMAL(18,2)) AS TaxAmount -- Mapping TaxAmt to TaxAmount
        ,CAST(Freight AS DECIMAL(18,2)) AS Freight
        ,CAST(TotalDue AS DECIMAL(18,2)) AS TotalDue
        ,Comment
        ,ModifiedDate
    FROM Bronze.SalesOrderHeader;

END
GO