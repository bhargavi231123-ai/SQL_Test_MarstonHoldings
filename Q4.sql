--4 Write some code, or describe how you would rank the sales people in each year

SELECT
	YEAR(CAST(s.txn_date AS date)) AS 'Year',
	s.seller_id,
	COUNT(*) AS Sales,
	DENSE_RANK() OVER (PARTITION BY YEAR(CAST(s.txn_date AS date)) ORDER BY COUNT(*) DESC) AS 'Sales Rank'
	FROM sales AS s
	GROUP BY YEAR(CAST(s.txn_date AS date)), s.seller_id
	ORDER BY 'Year', 'Sales Rank';
