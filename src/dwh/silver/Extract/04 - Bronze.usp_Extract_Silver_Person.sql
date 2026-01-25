/****************************************************************************************
 Author     : Okan Topal
 Layer      : Silver
 Description: Extracts and transforms Person data from Bronze to Silver layer.
              Direct mapping of personal attributes to Silver schema.
****************************************************************************************/

USE [AdventureWorks_DWH]
GO

CREATE OR ALTER PROCEDURE [Bronze].[usp_Extract_Silver_Person]
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
        ,ModifiedDate
    FROM Bronze.Person;

END
GO