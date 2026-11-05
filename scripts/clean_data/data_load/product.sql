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

INSERT INTO clean_data.product(
	ProductKey,
	ProductCode,
	ProductName,
	Manufacturer,
	Brand,
	Color,
	WeightUnit,
	Weight,
	Cost,
	Price,
	CategoryKey,
	CategoryName,
	SubcategoryKey,
	SubcategoryName
)

SELECT DISTINCT
	ProductKey,
	ProductCode,
	[Product Name] AS ProductName,
	Manufacturer,
	Brand,
	Color,
	WeightUnit,
	Weight,
	Cost,
	Price,
	CategoryKey,
	CategoryName,
	SubcategoryKey,
	SubcategoryName
FROM raw_data.product


SELECT * FROM clean_data.product
