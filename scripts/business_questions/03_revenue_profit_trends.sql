-- B) Revenue & Profitability
/* Q.3) How has the retailer's revenue and gross profit evolved over time, 
and are periods of revenue growth accompanied by improvements in profitability? */

SELECT 
	YEAR(OrderDate) AS TimePeriod,

	ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2) AS Revenue,

	LAG(ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2)) OVER(ORDER BY YEAR(OrderDate) ASC) AS PreviousRevenue,

	ROUND(SUM(Quantity * (NetPrice - UnitCost) / NULLIF(ExchangeRate, 0)), 2) AS GrossProfit,

	ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2) - 
		LAG(ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2)) OVER(ORDER BY YEAR(OrderDate) ASC) AS RevenueChange,

	CONCAT( ROUND( ( ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2) - LAG(ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2)) OVER(ORDER BY YEAR(OrderDate))) /
			NULLIF(LAG(ROUND(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 2)) OVER(ORDER BY YEAR(OrderDate)), 0 ) * 100, 2 ), '%') AS RevenueGrowth,

	CONCAT(ROUND(SUM(Quantity * (NetPrice - UnitCost) / ExchangeRate) / NULLIF(SUM(Quantity * Netprice / ExchangeRate), 0) * 100, 2), '%') AS  GrossProfitMargin



FROM clean_data.sales
GROUP BY YEAR(OrderDate)

