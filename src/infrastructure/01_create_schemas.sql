/* Creates logical schemas to separate data layers.
   Safe to re-run (idempotent). */

USE AdventureWorks_STG;
GO


IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Sales')
    EXEC('CREATE SCHEMA Sales');
GO


IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Person')
    EXEC('CREATE SCHEMA Person');
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Production')
    EXEC('CREATE SCHEMA Production');

GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Etl')
    EXEC('CREATE SCHEMA Etl');
GO

USE AdventureWorks_DWH;
GO

-- Bronze: source-aligned data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Bronze')
    EXEC('CREATE SCHEMA Bronze');
GO

-- Silver: cleansed and conformed data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Silver')
    EXEC('CREATE SCHEMA Silver');
GO

-- Gold: business-ready analytical models
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Gold')
    EXEC('CREATE SCHEMA Gold');
GO

-- Data quality objects
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Dq')
    EXEC('CREATE SCHEMA Dq');
GO


IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Etl')
    EXEC('CREATE SCHEMA Etl');
GO
