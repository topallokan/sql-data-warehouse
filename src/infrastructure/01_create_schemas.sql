/* Creates logical schemas to separate data layers.
   Safe to re-run (idempotent). */

USE AdventureWorks_STG;
GO

-- Raw landing zone for source data
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'raw')
    EXEC('CREATE SCHEMA raw');
GO

-- Load audit and control metadata
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'audit')
    EXEC('CREATE SCHEMA audit');
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
