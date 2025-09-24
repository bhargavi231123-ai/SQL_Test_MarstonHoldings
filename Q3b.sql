--3b What has been the trend with revenue and prices since 2023?
SELECT
	YEAR(CAST(s.txn_date AS date)) as 'Year',
	LEFT(DATENAME(month, CAST(s.txn_date AS date)), 3) as 'Month',
	SUM(COALESCE(p.price, 25.0)) as 'Revenue',
	CAST(AVG(COALESCE(p.price, 25.0)) AS DECIMAL(10,2)) as 'Avg Price'
	FROM sales AS s
	LEFT JOIN prices AS p
	ON p.item_id = s.item_id
	AND CAST(s.txn_date AS date) >= CAST(p.date_from AS date)
	AND CAST(s.txn_date AS date) <  CAST(p.date_to   AS date)
	WHERE CAST(s.txn_date AS date) >= '2023-01-01'AND CAST(s.txn_date AS date) <  '2025-01-01'
	GROUP BY YEAR(CAST(s.txn_date AS date)),MONTH(CAST(s.txn_date AS date)),LEFT(DATENAME(month, CAST(s.txn_date AS date)), 3)
	ORDER BY YEAR(CAST(s.txn_date AS date)),MONTH(CAST(s.txn_date AS date));
