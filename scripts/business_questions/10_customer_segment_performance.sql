/* Q.10) How does customer spending vary across geographic markets and customer segments, 
	and which segments contribute disproportionately to revenue? */

WITH CustomerSegments AS (
	SELECT
		CustomerKey,
		Gender,
		CASE
			WHEN Age BETWEEN 18 AND 25 THEN '18-25'
			WHEN Age BETWEEN 26 AND 35 THEN '26-35'
			WHEN Age BETWEEN 36 AND 45 THEN '36-45'
			WHEN Age BETWEEN 46 AND 60 THEN '46-60'
			WHEN Age >= 61 THEN '61+'
			ELSE 'Unknown'
		END AS AgeGroup,
		Continent,
		CountryFull
	FROM clean_data.customer 
),

RevenueContribution AS (
	SELECT 
		cs.AgeGroup,
		cs.CountryFull,
		COUNT(DISTINCT cs.CustomerKey) AS CustomerCount,
		SUM(s.Quantity * s.NetPrice / NULLIF(ExchangeRate, 0)) AS Revenue
	FROM CustomerSegments cs
	LEFT JOIN clean_data.sales s
	ON s.CustomerKey = cs.CustomerKey
	GROUP BY 
		cs.AgeGroup,
		cs.CountryFull
),

SegmentAnalysis AS (
    SELECT
        AgeGroup,
        CountryFull,
        CustomerCount,
        Revenue,

        Revenue * 1.0 / NULLIF(CustomerCount, 0) AS AvgRevenuePerCustomer

    FROM RevenueContribution
)

SELECT 
	AgeGroup,
	CountryFull,
	CustomerCount,

	ROUND(Revenue, 2) AS Revenue,

	ROUND(AvgRevenuePerCustomer, 2) AS AvgRevenuePerCustomer,

	CONCAT(ROUND(Revenue * 100.0 / NULLIF(SUM(Revenue) OVER(), 0), 2), '%') AS RevenueContribution,

	CONCAT(ROUND(CustomerCount * 100.0 / NULLIF(SUM(CustomerCount) OVER(), 0), 2), '%') AS CustomerContribution

FROM SegmentAnalysis
ORDER BY Revenue DESC 
