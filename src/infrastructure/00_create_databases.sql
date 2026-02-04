/* Creates core databases for the data warehouse environment.
   Executed once per environment. */

USE master;
GO


IF DB_ID('AdventureWorks_STG') IS NULL
    CREATE DATABASE AdventureWorks_STG;
GO

IF DB_ID('AdventureWorks_DWH') IS NULL
    CREATE DATABASE AdventureWorks_DWH;
GO
