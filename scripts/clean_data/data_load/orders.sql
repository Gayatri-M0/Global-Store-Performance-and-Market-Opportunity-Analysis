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

INSERT INTO clean_data.orders(
	OrderKey,
	CustomerKey,
	StoreKey,
	OrderDate,
	DeliveryDate,
	CurrencyCode
)

SELECT 
	OrderKey,
	CustomerKey,
	StoreKey,
	OrderDate,
	DeliveryDate,
	CurrencyCode
FROM raw_data.orders

SELECT * FROM clean_data.orders
