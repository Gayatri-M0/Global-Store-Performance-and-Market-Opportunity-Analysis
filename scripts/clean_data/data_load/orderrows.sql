IF OBJECT_ID ('clean_data.orderrows', 'U') IS NOT NULL
	DROP TABLE clean_data.orderrows;
CREATE TABLE clean_data.orderrows(
	[OrderKey] INT,
	[LineNumber] INT,
	[ProductKey] INT,
	[Quantity] INT,
	[UnitPrice] NUMERIC(18,6),
	[NetPrice] NUMERIC(18,6),
	[UnitCost] NUMERIC(18,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

INSERT INTO clean_data.orderrows(
	OrderKey,
	LineNumber,
	ProductKey,
	Quantity,
	UnitPrice,
	NetPrice,
	UnitCost
)

SELECT 
	OrderKey,
	LineNumber,
	ProductKey,
	Quantity,
	UnitPrice,
	NetPrice,
	UnitCost
FROM raw_data.orderrows;

SELECT * FROM clean_data.orderrows
