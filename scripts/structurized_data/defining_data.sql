IF OBJECT_ID ('raw_data.Customers', 'U') IS NOT NULL
	DROP TABLE raw_data.Customers;
CREATE TABLE raw_data.Customers(
	[CustomerKey] INT,
	[Gender] NVARCHAR(50),
	[Name] NVARCHAR(100),
	[City] NVARCHAR(100),
	[State Code] NVARCHAR(50),
	[State] NVARCHAR(100),
	[Zip Code] NVARCHAR(50),
	[Country] NVARCHAR(50),
	[Continent] NVARCHAR(50),
	[Birthday] DATE
);

IF OBJECT_ID ('raw_data.Exchange_Rates', 'U') IS NOT NULL
	DROP TABLE raw_data.Exchange_Rates;
CREATE TABLE raw_data.Exchange_Rates(
	[Date] DATE,
	[Currency] NVARCHAR(50),
	[Exchange] DECIMAL(10,4)
);

IF OBJECT_ID ('raw_data.Products', 'U') IS NOT NULL
	DROP TABLE raw_data.Products;
CREATE TABLE raw_data.Products(
	[ProductKey] INT,
	[Product Name] NVARCHAR(200),
	[Brand] NVARCHAR(50),
	[Color] NVARCHAR(50),
	[Unit Cost USD] NVARCHAR(50),
	[Unit Price USD] NVARCHAR(50),
	[SubcategoryKey] NVARCHAR(50),
	[Subcategory] NVARCHAR(100),
	[CategoryKey] NVARCHAR(50),
	[Category] NVARCHAR(100)
);

IF OBJECT_ID ('raw_data.Sales', 'U') IS NOT NULL
	DROP TABLE raw_data.Sales;
CREATE TABLE raw_data.Sales(
	[Order Number] INT,
	[Line Item] INT,
	[Order Date] DATE,
	[Delivery Date] DATE,
	[CustomerKey] INT,
	[StoreKey] INT,
	[ProductKey] INT,
	[Quantity] INT,
	[Currency Code] NVARCHAR(50)
);

IF OBJECT_ID ('raw_data.Stores', 'U') IS NOT NULL
	DROP TABLE raw_data.Stores;
CREATE TABLE raw_data.Stores(		
	[StoreKey] INT,
	[Country] NVARCHAR(50),
	[State] NVARCHAR(100),
	[Square Meters] INT,
	[Open Date] DATE
);
