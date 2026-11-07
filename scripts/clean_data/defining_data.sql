/*
===============================================================================
Purpose: Define the structure of analytical tables in the clean_data schema.

Actions Performed:
    1. Drop existing tables if they already exist.
    2. Create tables with appropriate column names and data types.
    3. Include audit columns to track data creation timestamps.

Tables Created:
    1. customer
    2. date
    3. orderrows
    4. orders
    5. sales
    6. currencyexchange
    7. product
    8. store
===============================================================================
*/

IF OBJECT_ID ('clean_data.customer', 'U') IS NOT NULL
	DROP TABLE clean_data.customer;
CREATE TABLE clean_data.customer(
	[CustomerKey] INT,
	[GeoAreaKey] INT,
	[Title] NVARCHAR(50),
	[GivenName] NVARCHAR(100),
	[MiddleInitial] NVARCHAR(10),
	[Surname] NVARCHAR(100),
	[Gender] NVARCHAR(50),
	[Birthday] DATE,
	[Age] INT,
	[Occupation] NVARCHAR(200),
	[Company] NVARCHAR(100),
	[Vehicle] NVARCHAR(100), 
	[Continent] NVARCHAR(50),
	[Country] NVARCHAR(50),
	[CountryFull] NVARCHAR(100),
	[State] NVARCHAR(100),
	[StateFull] NVARCHAR(100),
	[City] NVARCHAR(100),
	[ZipCode] NVARCHAR(50),
	[StreetAddress] NVARCHAR(100),
	[Latitude] NUMERIC(18,6),
	[Longitude]	NUMERIC(18,6),
	[StartDT] DATE,
	[EndDT] DATE,
	[DateQualityStatus] NVARCHAR(100),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('clean_data.orderrows', 'U') IS NOT NULL
	DROP TABLE clean_data.orderrows;
CREATE TABLE clean_data.orderrows(
	[OrderKey] INT,
	[LineNumber] INT,
	[ProductKey] INT,
	[Quantity] INT,
	[UnitPrice] DECIMAL(19,6),
	[NetPrice] DECIMAL(19,6),
	[UnitCost] DECIMAL(19,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('clean_data.orders', 'U') IS NOT NULL
	DROP TABLE clean_data.orders;
CREATE TABLE clean_data.orders(
	[OrderKey] INT,
	[CustomerKey] INT,
	[StoreKey] INT,
	[OrderDate] DATE,
	[DeliveryDate] DATE,
	[CurrencyCode] NVARCHAR(50),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('clean_data.sales', 'U') IS NOT NULL
	DROP TABLE clean_data.sales;
CREATE TABLE clean_data.sales(
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
	[ExchangeRate] DECIMAL(9,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('clean_data.currencyexchange', 'U') IS NOT NULL
	DROP TABLE clean_data.currencyexchange;
CREATE TABLE clean_data.currencyexchange(
	[Date] DATE,
	[FromCurrency] NVARCHAR(50),
	[ToCurrency] NVARCHAR(50),
	[Exchange] DECIMAL(9,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID ('clean_data.date', 'U') IS NOT NULL
	DROP TABLE clean_data.date;
CREATE TABLE clean_data.date(
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
	[WorkingDayNumber] INT,
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID ('clean_data.product', 'U') IS NOT NULL
	DROP TABLE clean_data.product;
CREATE TABLE clean_data.product(
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
	[SubcategoryName] NVARCHAR(100),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
	
);

IF OBJECT_ID ('clean_data.store', 'U') IS NOT NULL
	DROP TABLE clean_data.store;
CREATE TABLE clean_data.store(		
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
	[Status] NVARCHAR(50),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);
