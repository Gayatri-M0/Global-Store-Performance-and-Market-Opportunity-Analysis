/*
============================================================================
This script creates a stored procedure (raw_data.load_raw) to import data
from CSV files into the respective tables in the raw_data schema.

PROCESS:

1. Truncates existing records from each table.
2. Uses BULK INSERT to load fresh data from CSV files.
3. Skips the header row and applies appropriate CSV formatting options.

WARNING:
TRUNCATE TABLE permanently removes all existing records before loading
new data. Ensure backups are maintained before execution.

NOTE:
Update CSV file paths according to your local system.
============================================================================
*/

EXEC raw_data.load_raw

CREATE OR ALTER PROCEDURE raw_data.load_raw AS
BEGIN
	
	PRINT '>> Truncating Table: raw_data.currencyexchange';
	TRUNCATE TABLE raw_data.currencyexchange;
	PRINT '>> Inserting Data Into: raw_data.currencyexchange';
	BULK INSERT raw_data.currencyexchange
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\currencyexchange.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.customer';
	TRUNCATE TABLE raw_data.customer;
	PRINT '>> Inserting Data Into: raw_data.customer';
	BULK INSERT raw_data.customer
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\customer.csv'
	WITH (
		FORMAT = 'CSV',
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.date';
	TRUNCATE TABLE raw_data.date;
	PRINT '>> Inserting Data Into: raw_data.date';
	BULK INSERT raw_data.date
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\date.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.orderrows';
	TRUNCATE TABLE raw_data.orderrows;
	PRINT '>> Inserting Data Into: raw_data.orderrows';
	BULK INSERT raw_data.orderrows
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\orderrows.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.orders';
	TRUNCATE TABLE raw_data.orders;
	PRINT '>> Inserting Data Into: raw_data.orders';
	BULK INSERT raw_data.orders
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\orders.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.product';
	TRUNCATE TABLE raw_data.product;
	PRINT '>> Inserting Data Into: raw_data.product';
	BULK INSERT raw_data.product
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\product.csv'
	WITH (
		FORMAT = 'CSV',
		FIELDTERMINATOR = ',',
		FIELDQUOTE = '"',
		FIRSTROW = 2,
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.sales';
	TRUNCATE TABLE raw_data.sales;
	PRINT '>> Inserting Data Into: raw_data.sales';
	BULK INSERT raw_data.sales
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\sales.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.store';
	TRUNCATE TABLE raw_data.store;
	PRINT '>> Inserting Data Into: raw_data.store';
	BULK INSERT raw_data.store
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\store.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		CODEPAGE = '65001',
		TABLOCK
	);

END

