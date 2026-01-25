/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms SalesOrderDetail data from Bronze to Silver layer.
              Standardizes unit prices and line totals to DECIMAL(18,2).
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_SalesOrderDetail]
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
        -- Standardizing currency fields to DECIMAL(18,2)
        ,CAST(UnitPrice AS DECIMAL(18,2)) AS UnitPrice
        ,CAST(UnitPriceDiscount AS DECIMAL(18,2)) AS UnitPriceDiscount
        ,CAST(LineTotal AS DECIMAL(18,2)) AS LineTotal
        ,ModifiedDate
    FROM Bronze.SalesOrderDetail;

END
GO