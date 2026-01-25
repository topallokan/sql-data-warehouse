/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects Address data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Person].[usp_Extract_BronzeAddress]
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
        ,SpatialLocation
        ,RowGuid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Person.Address

END
GO