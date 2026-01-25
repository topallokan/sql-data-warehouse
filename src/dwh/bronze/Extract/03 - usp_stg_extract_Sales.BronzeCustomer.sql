/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects Customer data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO
CREATE OR ALTER PROCEDURE [Sales].[usp_Extract_BronzeCustomer]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
         CustomerID
        ,PersonID
        ,StoreID
        ,TerritoryID
        ,AccountNumber
        ,RowGuid
        ,ModifiedDate

    FROM Sales.Customer

END
GO