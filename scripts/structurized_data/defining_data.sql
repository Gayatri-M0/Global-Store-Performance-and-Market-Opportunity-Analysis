/*
==================================================================================================================
This script creates the following eight tables in the raw_data schema: 
	customer, orderrows, orders, sales, currencyexchange, date, product, store.
Each tables is created with its respective columns, data types and appropriate, data lengths, precision, and scale.

EXECUTION: Before creating a table, the script checks whether it already exists.
If the table exists, it is dropped and recreated with the specified structure.

WARNING: This scripts is destructive. Executing it will permanently delete existing table along with 
all the data stored inside them. 
Make sure to take appropriate precautions and maintain backups before executing the script.
==================================================================================================================
*/

IF OBJECT_ID ('raw_data.customer', 'U') IS NOT NULL
	DROP TABLE raw_data.customer;
CREATE TABLE raw_data.customer(
	[CustomerKey] INT,
	[GeoAreaKey] INT,
	[StartDT] DATE,
	[EndDT] DATE,
	[Continent] NVARCHAR(50),
	[Gender] NVARCHAR(50),
	[Title] NVARCHAR(50),
	[GivenName] NVARCHAR(50),
	[MiddleInitial] NVARCHAR(50),
	[Surname] NVARCHAR(50),
	[StreetAddress] NVARCHAR(100),
	[City] NVARCHAR(50),
	[State] NVARCHAR(100),
	[StateFull] NVARCHAR(50),
	[Zip Code] NVARCHAR(50),
	[Country] NVARCHAR(50),
	[CountryFull] NVARCHAR(50),
	[Birthday] DATE,
	[Age] INT,
	[Occupation] NVARCHAR(100),
	[Company] NVARCHAR(100),
	[Vehicle] NVARCHAR(100), 
	[Latitude] DECIMAL(9,6),
	[Longitude]	DECIMAL(9,6)
);

IF OBJECT_ID ('raw_data.orderrows', 'U') IS NOT NULL
	DROP TABLE raw_data.orderrows;
CREATE TABLE raw_data.orderrows(
	[OrderKey] INT,
	[LineNumber] INT,
	[ProductKey] INT,
	[Quantity] INT,
	[UnitPrice] DECIMAL(19,6),
	[NetPrice] DECIMAL(19,6),
	[UnitCost] DECIMAL(19,6)
);

IF OBJECT_ID ('raw_data.orders', 'U') IS NOT NULL
	DROP TABLE raw_data.orders;
CREATE TABLE raw_data.orders(
	[OrderKey] INT,
	[CustomerKey] INT,
	[StoreKey] INT,
	[OrderDate] DATE,
	[DeliveryDate] DATE,
	[CurrencyCode] NVARCHAR(50)
);

IF OBJECT_ID ('raw_data.sales', 'U') IS NOT NULL
	DROP TABLE raw_data.sales;
CREATE TABLE raw_data.sales(
	[OrderKey] INT,
	[LineNumber] INT,
	[OrderDate]	DATE,
	[DeliveryDate] DATE,
	[CustomerKey] INT,
	[StoreKey] INT,
	[ProductKey] INT,
	[Quantity] INT,
	[UnitPrice]	DECIMAL(19,6),
	[NetPrice] DECIMAL(19,6),
	[UnitCost] DECIMAL(19,6),
	[CurrencyCode] NVARCHAR(50),
	[ExchangeRate] DECIMAL(9,6)
);

IF OBJECT_ID ('raw_data.currencyexchange', 'U') IS NOT NULL
	DROP TABLE raw_data.currencyexchange;
CREATE TABLE raw_data.currencyexchange(
	[Date] DATE,
	[FromCurrency] NVARCHAR(50),
	[ToCurrency] NVARCHAR(50),
	[Exchange] DECIMAL(9,6)
);

IF OBJECT_ID ('raw_data.date', 'U') IS NOT NULL
	DROP TABLE raw_data.date;
CREATE TABLE raw_data.date(
	[Date] DATE,
	[DateKey] INT,	
	[Year] INT,	
	[YearQuarter] NVARCHAR(50),
	[YearQuarterNumber] INT,
	[Quarter] NVARCHAR(10),
	[YearMonth] NVARCHAR(50),
	[YearMonthShort] NVARCHAR(50),
	[YearMonthNumber] INT,
	[Month] NVARCHAR(50),
	[MonthShort] NVARCHAR(50),
	[MonthNumber] INT,
	[DayofWeek] NVARCHAR(50),
	[DayofWeekShort] NVARCHAR(50),
	[DayofWeekNumber] INT,
	[WorkingDay] INT,
	[WorkingDayNumber] INT
);


IF OBJECT_ID ('raw_data.product', 'U') IS NOT NULL
	DROP TABLE raw_data.product;
CREATE TABLE raw_data.product(
	[ProductKey] INT,
	[ProductCode] INT,
	[Product Name] NVARCHAR(200),
	[Manufacturer] NVARCHAR(200),
	[Brand] NVARCHAR(50),
	[Color] NVARCHAR(50),
	[WeightUnit] NVARCHAR(50),
	[Weight] DECIMAL(19,6),
	[Cost] DECIMAL(19,6),
	[Price] DECIMAL(19,6),
	[CategoryKey] INT,
	[CategoryName] NVARCHAR(100),
	[SubcategoryKey] INT,
	[SubcategoryName] NVARCHAR(100)
	
);

IF OBJECT_ID ('raw_data.store', 'U') IS NOT NULL
	DROP TABLE raw_data.store;
CREATE TABLE raw_data.store(		
	[StoreKey] INT,
	[StoreCode] INT,
	[GeoAreaKey] INT,
	[CountryCode] NVARCHAR(50),
	[CountryName] NVARCHAR(50),
	[State] NVARCHAR(100),
	[OpenDate] DATE,
	[CloseDate] DATE,
	[Description] NVARCHAR(100),
	[Square Meters] INT,
	[Status] NVARCHAR(50)
);
