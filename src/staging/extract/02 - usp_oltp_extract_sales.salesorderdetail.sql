/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for SalesOrderDetail table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_SalesOrderDetail]
AS
BEGIN

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
,rowguid
,ModifiedDate   
 
 FROM Sales.SalesOrderDetail

END
