-- Q.2) How does store performance vary across markets, and which markets show potential for improving sales productivity?


WITH MarketPerformance AS (
	SELECT 
		st.CountryName,
		st.State,

		COUNT(DISTINCT st.StoreKey) AS No_of_Stores,

		ROUND(SUM(s.Quantity * s.NetPrice / NULLIF(s.ExchangeRate, 0)), 2) AS TotalSalesUSD,

		ROUND(SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(ExchangeRate, 0)), 2) AS GrossProfitUSD


	FROM clean_data.store st
	LEFT JOIN clean_data.sales s
		ON s.StoreKey = st.StoreKey
	GROUP BY 
		st.CountryName,
		st.State
),

MarketArea AS (
	SELECT 
		CountryName,
		State,

		SUM([Square Meters]) AS TotalSquareMeters

	FROM clean_data.store
	GROUP BY 
		CountryName,
		State
)

SELECT 
	mp.CountryName, 
	mp.State,
	mp.No_of_Stores,
	ma.TotalSquareMeters,
	mp.TotalSalesUSD,
	mp.GrossProfitUSD,

	ROUND(mp.TotalSalesUSD / NULLIF(ma.TotalSquareMeters, 0), 2) AS RevenuePerSquareMeter

FROM MarketPerformance mp
INNER JOIN MarketArea ma
	ON mp.CountryName = ma.CountryName AND mp.State = ma.State
ORDER BY RevenuePerSquareMeter DESC
