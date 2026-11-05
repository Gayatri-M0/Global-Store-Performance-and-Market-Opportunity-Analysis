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

INSERT INTO clean_data.date(
	Date,
	DateKey,
	Year,
	YearQuarter,
	YearQuarterNumber,
	Quarter,
	YearMonth,
	YearMonthShort,
	YearMonthNumber,
	Month,
	MonthShort,
	MonthNumber,
	DayofWeek,
	DayofWeekShort,
	DayofWeekNumber,
	WorkingDay,
	WorkingDayNumber
)

SELECT
	Date,
	DateKey,
	Year,
	YearQuarter,
	YearQuarterNumber,
	Quarter,
	YearMonth,
	YearMonthShort,
	YearMonthNumber,
	Month,
	MonthShort,
	MonthNumber,
	DayofWeek,
	DayofWeekShort,
	DayofWeekNumber,
	WorkingDay,
	WorkingDayNumber
FROM raw_data.date

SELECT * FROM clean_data.date
