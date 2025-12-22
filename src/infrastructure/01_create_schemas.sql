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
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');
GO

-- Silver: cleansed and conformed data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');
GO

-- Gold: business-ready analytical models
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO

-- Data quality objects
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dq')
    EXEC('CREATE SCHEMA dq');
GO

GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Etl')
    EXEC('CREATE SCHEMA Etl');
GO
