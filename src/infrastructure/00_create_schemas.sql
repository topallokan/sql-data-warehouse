-- =============================================
-- Author  : Okan Topal
-- Created : 2025
-- Purpose : Initialize project schemas (staging, dwh, marts, dq, audit)
-- =============================================

USE AdventureWorksDW

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
    EXEC('CREATE SCHEMA staging');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dwh')
    EXEC('CREATE SCHEMA dwh');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'marts')
    EXEC('CREATE SCHEMA marts');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dq')
    EXEC('CREATE SCHEMA dq');
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'audit')
    EXEC('CREATE SCHEMA audit');
GO


