/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for Customer table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_Customer]
AS
BEGIN

 SELECT
 CustomerID
,PersonID
,StoreID
,TerritoryID
,AccountNumber
,rowguid
,ModifiedDate  
 
 FROM Sales.Customer

END
