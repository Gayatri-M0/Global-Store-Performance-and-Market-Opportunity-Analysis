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
	[UnitPrice]	 NUMERIC(18,6),
	[NetPrice] NUMERIC(18,6),
	[UnitCost] NUMERIC(18,6),
	[CurrencyCode] NVARCHAR(50),
	[ExchangeRate] NUMERIC(18,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

INSERT INTO clean_data.sales (
	OrderKey,
	LineNumber,
	OrderDate,
	DeliveryDate,
	CustomerKey,
	StoreKey,
	ProductKey,
	Quantity,
	UnitPrice,
	NetPrice,
	UnitCost,
	CurrencyCode,
	ExchangeRate
)

SELECT 
	OrderKey,
	LineNumber,
	OrderDate,
	DeliveryDate,
	CustomerKey,
	StoreKey,
	ProductKey,
	Quantity,
	UnitPrice,
	NetPrice,
	UnitCost,
	CurrencyCode,
	ExchangeRate
FROM raw_data.sales


SELECT * FROM clean_data.sales
