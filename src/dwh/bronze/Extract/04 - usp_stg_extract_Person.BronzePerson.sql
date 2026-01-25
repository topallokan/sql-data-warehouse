/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : Bronze
 Description: Selects Person data from STG for Bronze layer mapping.
****************************************************************************************/

USE [AdventureWorks_STG]
GO

CREATE OR ALTER PROCEDURE [Person].[usp_Extract_BronzePerson]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
         BusinessEntityID
        ,PersonType
        ,NameStyle
        ,Title
        ,FirstName
        ,MiddleName
        ,LastName
        ,Suffix
        ,EmailPromotion
        ,AdditionalContactInfo
        ,Demographics
        ,RowGuid
        ,ModifiedDate
        ,GETDATE() AS BRZ_LoadDatetime
        ,AuditId   AS BRZ_AuditId
    FROM Person.Person

END
GO