/*
===========================
Create Database and Schemas
===========================
This script creates a new database 'GlobalStoreData' after checking whether already exists or not.
If the same named database already exists it will go and drop the existing and recreates new one. Additionally, this scripts 
creates schemas along with database as 'raw_data', 'clean_data' and 'analysis'.

Warning: Running this script will drop existing 'GlobalStoreData' database and all the data in database will
be deleted permanently. Therefore, proceed with caution and ensure you have proper backup before running script.
*/

USE master;
GO

-- Drop and recreate the GlobalStoreData
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'GlobalStoreData')
BEGIN 
	ALTER DATABASE GlobalStoreData SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE GlobalStoreData;
END
GO

-- Create the GlobalStoreData database
CREATE DATABASE GLobalStoreData;
GO

USE GlobalStoreData;
GO 

-- Create Schemas
CREATE SCHEMA raw_data;
GO

CREATE SCHEMA clean_data;
GO

CREATE SCHEMA analysis;
GO
