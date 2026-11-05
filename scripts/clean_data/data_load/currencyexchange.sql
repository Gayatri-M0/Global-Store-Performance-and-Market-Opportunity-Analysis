IF OBJECT_ID ('clean_data.currencyexchange', 'U') IS NOT NULL
	DROP TABLE clean_data.currencyexchange;
CREATE TABLE clean_data.currencyexchange(
	[Date] DATE,
	[FromCurrency] NVARCHAR(50),
	[ToCurrency] NVARCHAR(50),
	[Exchange] NUMERIC(18,6),
	gsp_create_date DATETIME2 DEFAULT GETDATE()
);

INSERT INTO clean_data.currencyexchange(
	Date,
	FromCurrency,
	ToCurrency,
	Exchange
)

SELECT 
	Date,
	FromCurrency,
	ToCurrency,
	Exchange
FROM raw_data.currencyexchange

SELECT * FROM clean_data.currencyexchange
