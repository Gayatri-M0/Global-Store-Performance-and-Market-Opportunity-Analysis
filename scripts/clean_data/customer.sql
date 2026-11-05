INSERT INTO clean_data.customer(
	CustomerKey,
	GeoAreaKey,
	Title,
	GivenName, 
	MiddleInitial,
	Surname,
	Gender,
	Birthday,
	Age,
	Occupation,
	Company,
	Vehicle,
	Continent,
	Country,
	CountryFull,
	State,
	StateFull,
	City,
	ZipCode,
	StreetAddress,
	Latitude,
	Longitude,
	StartDT,
	EndDT,
	DateQualityStatus
)

SELECT
CustomerKey,
GeoAreaKey,
Title,
GivenName, 
MiddleInitial,
Surname,
CASE 
	WHEN Gender = 'female' THEN 'Female'
	ELSE 'Male'
END Gender,
Birthday,
Age,
Occupation,
CASE 
	WHEN Company IS NULL THEN 'N/A'
	ELSE Company
END Company,
Vehicle,
Continent,
Country,
CountryFull,
State,
StateFull,
City,
[Zip Code] AS ZipCode,
StreetAddress,
Latitude,
Longitude,
StartDT,
CASE 
	WHEN EndDT > GETDATE() THEN NULL
	ELSE EndDT
END EndDT,
CASE 
	WHEN Birthday IS NULL OR StartDT IS NULL THEN 'Requires Review'
	WHEN Birthday > StartDT THEN 'Invalid Date Sequence'
	ELSE 'Valid Date Sequence'
END DateQualityStatus

FROM raw_data.customer
ORDER BY CustomerKey
