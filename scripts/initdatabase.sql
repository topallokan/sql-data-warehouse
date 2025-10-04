-- ========================================================
-- Data Warehouse Initialization Script
-- ========================================================

-- Step 1️⃣: Create Database
-- ========================================================
DROP DATABASE IF EXISTS "DataWarehouse";
CREATE DATABASE "DataWarehouse";

-- Step 2️⃣: Create Schemas
-- ========================================================

-- Gold schema: for curated, analysis-ready data
DROP SCHEMA IF EXISTS gold CASCADE;
CREATE SCHEMA gold;

-- Silver schema: for cleaned or processed data
DROP SCHEMA IF EXISTS silver CASCADE;
CREATE SCHEMA silver;

-- Bronze schema: for raw, unprocessed data
DROP SCHEMA IF EXISTS bronze CASCADE;
CREATE SCHEMA bronze;
