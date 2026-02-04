/****************************************************************************************
 Author      : Okan Topal
 Created On  : 2025-12-08
 Layer       : Gold
 Description : Extracts joined Header and Detail data from Silver for Gold mapping.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Silver.usp_Extract_Gold_FactSales]
    @TargetDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         H.SalesOrderID
        ,D.SalesOrderDetailID
        ,H.CustomerID
        ,D.ProductID
        ,H.SalesPersonID
        ,H.TerritoryID
        ,D.SpecialOfferID
        ,H.OrderDate
        ,H.DueDate
        ,H.ShipDate
        ,H.Status
        ,H.SalesOrderNumber
        ,H.PurchaseOrderNumber
        ,H.AccountNumber
        ,D.CarrierTrackingNumber
        ,D.OrderQty
        ,D.UnitPrice
        ,D.UnitPriceDiscount
        ,D.LineTotal
        ,H.SubTotal
        ,H.TaxAmount
        ,H.Freight
        ,H.TotalDue
        ,CAST(@TargetDate AS DATE) AS DWH_ExecutionDate
    FROM Silver.SalesOrderHeader H
    INNER JOIN Silver.SalesOrderDetail D ON H.SalesOrderID = D.SalesOrderID
    WHERE CAST(H.OrderDate AS DATE) = @TargetDate;

END
GO

