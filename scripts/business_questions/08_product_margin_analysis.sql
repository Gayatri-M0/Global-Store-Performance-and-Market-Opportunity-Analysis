/* Q.8) Which products have weaker gross profit margins than comparable products within the same category, 
	and how significant is their contribution to total sales? */

WITH ProductPerformance AS (
	SELECT
		p.ProductName,
		p.CategoryName,
		SUM((s.Quantity * s.Netprice) / NULLIF(s.ExchangeRate, 0)) AS Revenue,
		SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) AS GrossProfit
	FROM clean_data.sales s
	LEFT JOIN clean_data.product p
	ON s.ProductKey = p.ProductKey
	GROUP BY 
		p.ProductName,
		p.CategoryName
),

MarginAnalysis AS (
SELECT 
	ProductName,
	CategoryName,
	Revenue,
	GrossProfit,
	GrossProfit * 100.0 / NULLIF(Revenue, 0) AS GPMargin
FROM ProductPerformance
),

CategoryBenchMark AS (
	SELECT
		*,
		AVG(GPMargin) OVER(PARTITION BY CategoryName) AS AvgGPMargin
	FROM MarginAnalysis
)

SELECT 
	ProductName,
	CategoryName,

	ROUND(Revenue, 2) AS Revenue,
	ROUND(GrossProfit, 2) AS GrossProfit,

	CONCAT(ROUND(GPMargin, 2), '%') AS GPMargin,

	CONCAT(ROUND(AvgGPMargin, 2), '%') AS AvgGPMargin,

	ROUND(GPMargin- AvgGPMargin, 2) AS MarginDifference,

	CONCAT(ROUND(Revenue * 100.0 / NULLIF(SUM(Revenue) OVER(), 0), 2), '%') AS RevenueContribution,

	CASE
        WHEN GPMargin < AvgGPMargin THEN 'Below Category Average'
        WHEN GPMargin > AvgGPMargin THEN 'Above Category Average'
        ELSE 'Equal to Category Average'
    END AS MarginStatus

FROM CategoryBenchMark

ORDER BY 
	CASE WHEN GPMargin < AvgGPMargin THEN 0 ELSE 1 END,
    GPMargin - AvgGPMargin ASC;
