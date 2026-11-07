-- Q.6) How concentrated is the retailer's gross profit across its stores and markets, and how dependent is overall profitability on a small number of high-performing segments?

WITH EntityProfit AS (
	SELECT 
		'Country' AS EntityType,
		st.CountryName AS EntityName,
		SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.sales s
	LEFT JOIN clean_data.store st
	ON s.StoreKey = st.StoreKey
	GROUP BY st.CountryName

	UNION ALL

	SELECT 
		'Store' AS EntityType,
		CAST(StoreKey AS NVARCHAR(50)) AS EntityName,
		SUM(Quantity * (NetPrice - UnitCost) / NULLIF(ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.sales 
	GROUP BY StoreKey
),

EntityContribution AS (
	SELECT
		EntityType,
		EntityName,
		GrossProfit,

		GrossProfit * 100.0 / NULLIF(SUM(GrossProfit) OVER(PARTITION BY EntityType), 0) AS GrossProfitContribution
	FROM EntityProfit
)

SELECT
	EntityType,
	EntityName,
	ROUND(GrossProfit, 2) AS GrossProfitAmt,
	CONCAT(ROUND(GrossProfitContribution, 2), '%') AS GrossProfitContributionPct,

	CONCAT(ROUND(SUM(GrossProfitContribution) OVER(PARTITION BY EntityType ORDER BY GrossProfit DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2), '%') AS CumulativeGP 
FROM EntityContribution
ORDER BY EntityType, GrossProfit DESC

