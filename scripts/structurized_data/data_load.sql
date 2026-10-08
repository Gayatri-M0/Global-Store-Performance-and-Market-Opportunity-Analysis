EXEC raw_data.load_raw

CREATE OR ALTER PROCEDURE raw_data.load_raw AS
BEGIN
	
	PRINT '>> Truncating Table: raw_data.Customers';
	TRUNCATE TABLE raw_data.Customers;
	PRINT '>> Inserting Data Into: raw_data.Customers';
	BULK INSERT raw_data.Customers
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\Customers.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.Exchange_Rates';
	TRUNCATE TABLE raw_data.Exchange_Rates;
	PRINT '>> Inserting Data Into: raw_data.Exchange_Rates';
	BULK INSERT raw_data.Exchange_Rates
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\Exchange_Rates.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.Products';
	TRUNCATE TABLE raw_data.Products;
	PRINT '>> Inserting Data Into: raw_data.Products';
	BULK INSERT raw_data.Products
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\Products.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.Sales';
	TRUNCATE TABLE raw_data.Sales;
	PRINT '>> Inserting Data Into: raw_data.Sales';
	BULK INSERT raw_data.Sales
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\Sales.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> Truncating Table: raw_data.Stores';
	TRUNCATE TABLE raw_data.Stores;
	PRINT '>> Inserting Data Into: raw_data.Stores';
	BULK INSERT raw_data.Stores
	FROM 'C:\Users\Gayatri\OneDrive\Documents\global-electronics-retail-analysis\data\Stores.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END

