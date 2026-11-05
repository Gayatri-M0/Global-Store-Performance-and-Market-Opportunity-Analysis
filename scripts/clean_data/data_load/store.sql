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

INSERT INTO clean_data.store(
	StoreKey,
	StoreCode,
	GeoAreaKey,
	CountryCode,
	CountryName,
	State,
	OpenDate,
	CloseDate,
	Description,
	[Square Meters],
	Status
)

SELECT 
	StoreKey,
	StoreCode,
	GeoAreaKey,
	CountryCode,
	CountryName,
	State,
	OpenDate,
	CloseDate,
	Description,
	[Square Meters] AS SquareMeters,
	Status
FROM raw_data.store

SELECT * FROM clean_data.store
