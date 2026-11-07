-- E) Business Growth & Operational Performance

/* Q.11) How do order delivery times vary across markets, 
	and are longer delivery times associated with differences in customer purchasing patterns or sales performance? */
	
-- a) Delivery Performance by Country
WITH DeliveryData AS (
	SELECT 
		c.CountryFull,
		s.OrderKey,
		s.CustomerKey,
		s.OrderDate,
		s.DeliveryDate,
		DATEDIFF (DAY, s.OrderDate, s.DeliveryDate) AS DeliveryDays
	FROM clean_data.sales s
	LEFT JOIN clean_data.customer c
	ON s.CustomerKey = c.CustomerKey
)

SELECT
    CountryFull,

    COUNT(DISTINCT OrderKey) AS TotalOrders,

    ROUND(AVG(CAST(DeliveryDays AS DECIMAL(10,2))), 2)
        AS AvgDeliveryDays,

    MIN(DeliveryDays) AS MinDeliveryDays,

    MAX(DeliveryDays) AS MaxDeliveryDays,

    COUNT(DISTINCT CustomerKey) AS CustomerCount

FROM DeliveryData
GROUP BY CountryFull
ORDER BY AvgDeliveryDays DESC;



-- b) Delivery Time vs Sales Performance
WITH OrderPerformance  AS (
	SELECT 
		c.CountryFull,
		s.OrderKey,
		s.CustomerKey,
		
		DATEDIFF (DAY, s.OrderDate, s.DeliveryDate) AS DeliveryDays,

		SUM(s.Quantity * s.NetPrice / NULLIF(s.ExchangeRate, 0)) AS OrderRevenue

    FROM clean_data.sales s
    LEFT JOIN clean_data.customer c
        ON s.CustomerKey = c.CustomerKey

    GROUP BY
        s.OrderKey,
        s.CustomerKey,
        c.CountryFull,
        s.OrderDate,
        s.DeliveryDate
)

SELECT
    CountryFull,

    COUNT(DISTINCT OrderKey) AS TotalOrders,

    COUNT(DISTINCT CustomerKey) AS CustomerCount,

    ROUND(AVG(CAST(DeliveryDays AS DECIMAL(10,2))), 2) AS AvgDeliveryDays,

    ROUND(SUM(OrderRevenue), 2) AS TotalRevenue,

    ROUND(AVG(OrderRevenue), 2) AS AvgOrderValue,

    ROUND(SUM(OrderRevenue) / NULLIF(COUNT(DISTINCT OrderKey), 0), 2) AS RevenuePerOrder

FROM OrderPerformance
GROUP BY CountryFull
ORDER BY AvgDeliveryDays DESC;
