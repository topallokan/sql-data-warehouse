/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms Address data from Bronze to Silver layer.
              Filters out spatial and rowguid data for Silver schema compatibility.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_Address]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         AddressID
        ,AddressLine1
        ,AddressLine2
        ,City
        ,StateProvinceID
        ,PostalCode
        ,ModifiedDate
    FROM Bronze.Address;

END
GO