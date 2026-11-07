-- A) Store and Market Performance
/* Q.1) Which countries generate the highest revenue and gross profit, and do the largest revenue-generating
markets also deliver the strongest profitability? */

SELECT 
	c.Country,
	c.CountryFull,

	-- Revenue and Profit in Original Currency
	SUM(s.Quantity * s.NetPrice) AS NetRevenue, 
	SUM(s.Quantity * (s.NetPrice - s.UnitCost)) AS GrossProfit, 
	CONCAT(ROUND(SUM(s.Quantity * (s.NetPrice - s.UnitCost)) * 100.0 / 
		NULLIF(SUM(s.Quantity * s.NetPrice), 0), 2), '%') AS ProfitMargin, 

	-- Revenue and Profit converted to USD
	SUM((s.Quantity * s.NetPrice) / NULLIF(s.ExchangeRate, 0)) AS NetRevenueUSD,
	SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) AS GrossProfitUSD,
	CONCAT(
		ROUND(
			SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0))  * 100.0 /
			NULLIF(
			SUM(s.Quantity * s.NetPrice / NULLIF(s.ExchangeRate, 0)), 
			0), 2), '%') AS ProfitMarginUSD

FROM clean_data.customer c
LEFT JOIN clean_data.sales s
	ON c.CustomerKey = s.CustomerKey
GROUP BY 
	c.Country, 
	c.CountryFull
ORDER BY 
	NetRevenueUSD DESC, 
	GrossProfitUSD DESC, 
	ProfitMarginUSD DESC

