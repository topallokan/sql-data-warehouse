/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects Product data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Production].[usp_Extract_BronzeProduct]
AS
BEGIN
    SET NOCOUNT ON;

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
        ,RowGuid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Production.Product

END
GO