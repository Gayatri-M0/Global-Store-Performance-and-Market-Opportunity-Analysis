--Q.4) Which markets, stores, or product categories generate substantial revenue but contribute disproportionately little to overall gross profit?


WITH EntitySales AS (
	-- 1. Country-Level Analysis
	SELECT 
		'Country' AS EntityType,
		c.CountryFull AS EntityName,
		SUM(s.Quantity * s.NetPrice / NULLIF(ExchangeRate, 0))  AS Revenue,
		SUM(s.Quantity * (s.NetPrice - s.UnitCost) /  NULLIF(ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.sales s
	LEFT JOIN clean_data.customer c
		ON c.CustomerKey = s.CustomerKey
	GROUP BY c.CountryFull

	UNION ALL

	-- 2. Individual Store Analysis
	SELECT
		'Store' AS EntityType,
		CAST(st.StoreKey AS NVARCHAR(100)) AS EntityName,
		SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0))  AS Revenue,
		SUM(Quantity * (NetPrice - UnitCost) /  NULLIF(ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.store st
	LEFT JOIN clean_data.sales s
		ON st.StoreKey = s.StoreKey
	GROUP BY st.StoreKey
	
	UNION ALL

	-- 3. Product Category Analysis
	SELECT 
		'Product Category' AS EntityType,
		p.CategoryName AS EntityName,
		SUM(s.Quantity * s.NetPrice / NULLIF(ExchangeRate, 0))  AS Revenue,
		SUM(s.Quantity * (s.NetPrice - s.UnitCost) /  NULLIF(ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.sales s 
	LEFT JOIN clean_data.product p
		ON p.ProductKey = s.ProductKey
	GROUP BY p.CategoryName
),

Contributions AS (

	SELECT 
		EntityType,
		EntityName,
		Revenue,
		GrossProfit,

		SUM(Revenue) OVER (PARTITION BY EntityType) AS TotalRevenue,

		SUM(GrossProfit) OVER(PARTITION BY EntityType) AS TotalGrossProfit
	FROM EntitySales
)

SELECT
	EntityType,
	EntityName,

	ROUND(Revenue, 2) AS Revenue,
	ROUND(GrossProfit, 2) AS GrossProfit,

	CONCAT(ROUND((Revenue / NULLIF(TotalRevenue, 0)) * 100, 2), '%') AS RevenueContribution,
	CONCAT(ROUND((GrossProfit / NULLIF(TotalGrossProfit, 0)) * 100, 2), '%') AS GrossProfitContribution
FROM Contributions
ORDER BY 
	EntityType,
	Revenue DESC
