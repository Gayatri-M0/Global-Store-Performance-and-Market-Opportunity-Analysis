-- Q.5) How does discounting vary across products, categories, and markets, and how is discount intensity associated with gross profit margins?

SELECT 
	'Product' AS EntityType,
	CAST(ProductKey AS NVARCHAR(100)) AS EntityName,

	ROUND(SUM(Quantity * (UnitPrice - NetPrice) / NULLIF(ExchangeRate, 0)), 2) AS DiscountAmt,
	
	CONCAT(ROUND(SUM(Quantity * (UnitPrice - NetPrice)) * 100.0 / NULLIF(SUM(Quantity * UnitPrice), 0), 2), '%') AS DiscountPercentage,

	CONCAT(ROUND(SUM(Quantity * (NetPrice - UnitCost) / NULLIF(ExchangeRate, 0)) * 100.0 / 
		NULLIF(SUM(Quantity * NetPrice / NULLIF(ExchangeRate, 0)), 0), 2), '%') AS GrossProfitMargin
FROM clean_data.sales
GROUP BY ProductKey

UNION ALL

SELECT
	'Category' AS EntityType,
	p.CategoryName AS EntityName,

	ROUND(SUM(Quantity * (UnitPrice - NetPrice) / NULLIF(s.ExchangeRate, 0)), 2) AS DiscountAmt,

	CONCAT(ROUND(SUM(s.Quantity * (s.UnitPrice - s.NetPrice)) * 100.0 / NULLIF(SUM(s.Quantity * s.UnitPrice), 0), 2), '%') AS DiscountPercentage,

	CONCAT(ROUND(SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) * 100.0 / 
		NULLIF(SUM(s.Quantity * s.NetPrice / NULLIF(s.ExchangeRate, 0)), 0), 2), '%') AS GrossProfitMargin
FROM clean_data.sales s
LEFT JOIN clean_data.product p
ON s.ProductKey = p.ProductKey
GROUP BY p.CategoryName

UNION ALL

SELECT
	'Country' AS EntityType,
	st.CountryName AS EntityName,

	ROUND(SUM(Quantity * (UnitPrice - NetPrice) / NULLIF(s.ExchangeRate, 0)), 2) AS DiscountAmt,

	CONCAT(ROUND(SUM(s.Quantity * (s.UnitPrice - s.NetPrice)) * 100.0 / NULLIF(SUM(s.Quantity * s.UnitPrice), 0), 2), '%') AS DiscountPercentage,

	CONCAT(ROUND(SUM(s.Quantity * (s.NetPrice - s.UnitCost) / NULLIF(s.ExchangeRate, 0)) * 100.0 / 
		NULLIF(SUM(s.Quantity * s.NetPrice / NULLIF(s.ExchangeRate, 0)), 0), 2), '%') AS GrossProfitMargin
FROM clean_data.sales s
LEFT JOIN clean_data.store st
ON s.StoreKey = st.StoreKey
GROUP BY st.CountryName

	
