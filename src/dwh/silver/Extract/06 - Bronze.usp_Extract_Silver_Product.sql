/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms Product data from Bronze to Silver layer.
              Converts Sell/End/Discontinued dates from DATETIME to DATE.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_Product]
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
        -- Date conversions from DATETIME (Bronze) to DATE (Silver)
        ,CAST(SellStartDate AS DATE) AS SellStartDate
        ,CAST(SellEndDate AS DATE) AS SellEndDate
        ,CAST(DiscontinuedDate AS DATE) AS DiscontinuedDate
        ,ModifiedDate
    FROM Bronze.Product;

END
GO