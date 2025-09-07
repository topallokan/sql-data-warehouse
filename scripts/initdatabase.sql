-- ===============================
-- Step 1️⃣: Create Database
-- ===============================

-- Drop the database if it already exists to start fresh
DROP DATABASE IF EXISTS "DataWarehouse";

-- Create a new database
CREATE DATABASE "DataWarehouse";

-- Connect to the newly created database
\c "DataWarehouse"


-- ===============================
-- Step 2️⃣: Create Schemas
-- ===============================

-- Gold schema: for curated, analysis-ready data
DROP SCHEMA IF EXISTS gold CASCADE;  -- CASCADE drops all tables inside the schema
CREATE SCHEMA gold;

-- Silver schema: for cleaned or processed data
DROP SCHEMA IF EXISTS silver CASCADE;
CREATE SCHEMA silver;

-- Bronze schema: for raw, unprocessed data
DROP SCHEMA IF EXISTS bronze CASCADE;
CREATE SCHEMA bronze;
