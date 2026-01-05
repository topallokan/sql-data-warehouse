/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for Product table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Production].[usp_Extract_Product]
AS
BEGIN

 SELECT
 ProductID
,Name
,ProductNumber
,MakeFlag
,FinishedGoodsFlag
,Color
,SafetyStockLevel
,ReorderPoint
,StandardCost
,ListPrice
,Size
,SizeUnitMeasureCode
,WeightUnitMeasureCode
,Weight
,DaysToManufacture
,ProductLine
,Class
,Style
,ProductSubcategoryID
,ProductModelID
,SellStartDate
,SellEndDate
,DiscontinuedDate
,rowguid
,ModifiedDate 
 
 FROM Production.Product

END
