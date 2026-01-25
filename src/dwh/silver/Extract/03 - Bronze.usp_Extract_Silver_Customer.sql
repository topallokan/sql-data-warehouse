/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms Customer data from Bronze to Silver layer.
              Direct mapping of customer attributes to Silver schema.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_Customer]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         CustomerID
        ,PersonID
        ,StoreID
        ,TerritoryID
        ,AccountNumber
        ,ModifiedDate
    FROM Bronze.Customer;

END
GO