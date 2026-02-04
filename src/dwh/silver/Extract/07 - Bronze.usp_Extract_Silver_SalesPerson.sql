/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms SalesPerson data from Bronze to Silver layer.
              Converts MONEY types to DECIMAL for Silver schema compatibility.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_SalesPerson]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         BusinessEntityID
        ,TerritoryID
        -- Converting MONEY/SMALLMONEY to DECIMAL as per Silver schema
        ,CAST(SalesQuota AS DECIMAL(18,2)) AS SalesQuota
        ,CAST(Bonus AS DECIMAL(18,2)) AS Bonus
        ,CAST(CommissionPct AS DECIMAL(18,4)) AS CommissionPct
        ,CAST(SalesYTD AS DECIMAL(18,2)) AS SalesYTD
        ,CAST(SalesLastYear AS DECIMAL(18,2)) AS SalesLastYear
        ,ModifiedDate
    FROM Bronze.SalesPerson;

END
GO