-- ===============================
-- Step 1️⃣: Create Database
-- ===============================

-- First, connect to the postgres DB
\c postgres

-- Drop the database if it already exists
DROP DATABASE IF EXISTS "DataWarehouse";

-- Create a new database
CREATE DATABASE "DataWarehouse";

-- Connect to the DataWarehouse DB
\c "DataWarehouse"

-- ===============================
-- Step 2️⃣: Create Schemas
-- ===============================

-- Gold schema: for curated, analysis-ready data
DROP SCHEMA IF EXISTS gold CASCADE;
CREATE SCHEMA gold;

-- Silver schema: for cleaned or processed data
DROP SCHEMA IF EXISTS silver CASCADE;
CREATE SCHEMA silver;

-- Bronze schema: for raw, unprocessed data
DROP SCHEMA IF EXISTS bronze CASCADE;
CREATE SCHEMA bronze;

