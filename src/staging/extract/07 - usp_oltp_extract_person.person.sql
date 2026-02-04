/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for Person table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Person].[usp_Extract_Person]
AS
BEGIN

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
,rowguid
,ModifiedDate
 
 FROM Person.Person

END
