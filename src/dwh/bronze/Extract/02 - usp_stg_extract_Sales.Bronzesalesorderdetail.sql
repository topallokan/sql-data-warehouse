/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects SalesOrderDetail data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_BronzeSalesOrderDetail]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
         SalesOrderID
        ,SalesOrderDetailID
        ,CarrierTrackingNumber
        ,OrderQty
        ,ProductID
        ,SpecialOfferID
        ,UnitPrice
        ,UnitPriceDiscount
        ,LineTotal
        ,RowGuid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Sales.SalesOrderDetail

END
GO