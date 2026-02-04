/****************************************************************************************
 Author     : Okan Topal
 Created On : 2025-12-08
 Layer      : oltp
 Description: Source extract for Address table.
****************************************************************************************/

USE [AdventureWorks_OLTP]
GO

CREATE OR ALTER PROCEDURE [Person].[usp_Extract_Address]
AS
BEGIN

 SELECT

 AddressID
,AddressLine1
,AddressLine2
,City
,StateProvinceID
,PostalCode
,SpatialLocation
,rowguid
,ModifiedDate
   
 
 FROM Person.Address

END
