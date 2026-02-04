/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for SalesOrderHeader table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_SalesOrderHeader]
AS
BEGIN

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
,rowguid
,ModifiedDate   
 
 FROM Sales.SalesOrderHeader

END
