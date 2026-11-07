-- C) Product Portfolio Performance

/* Q.7) Which product categories and subcategories drive the retailer's gross profit, 
	and which generate high sales volumes without a proportionate contribution to profit?*/

WITH ProductPerformance AS (
	SELECT 
		p.CategoryName,
		p.SubcategoryName,
		SUM(s.Quantity) AS UnitSold,

		SUM((s.Quantity * s.NetPrice) / NULLIF(s.ExchangeRate, 0)) AS Revenue,

		SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) AS GrossProfit

	FROM clean_data.sales s
	LEFT JOIN clean_data.product p
		ON s.ProductKey = p.ProductKey
	GROUP BY 
		p.CategoryName,
		p.SubcategoryName
)

SELECT 
	CategoryName,
	SubCategoryName,

	UnitSold,

	ROUND(Revenue, 2) AS Revenue,
	ROUND(GrossProfit, 2) AS GrossProfit,

	CONCAT(ROUND(GrossProfit * 100.0 / NULLIF(Revenue, 0), 2), '%') AS GPMargin,

	CONCAT(ROUND(Revenue * 100.0 / NULLIF(SUM(Revenue) OVER(), 0), 2), '%') AS RevenueContribution,

	CONCAT(ROUND(GrossProfit * 100.0 / NULLIF(SUM(GrossProfit) OVER(), 0), 2), '%') AS GrossProfitContribution

FROM ProductPerformance
ORDER BY Revenue DESC
