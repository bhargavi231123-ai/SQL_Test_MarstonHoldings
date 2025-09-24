--3a How did revenue grow in 2022 vs 2021?  (If there are any missing prices, use the default price of £25)	
SELECT
	SUM(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2021 THEN COALESCE(p.price, 25.0) ELSE 0 END) AS Revenue_2021,
	SUM(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2022 THEN COALESCE(p.price, 25.0) ELSE 0 END) AS Revenue_2022,
	CAST(
    100.0 * (
      SUM(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2022 THEN COALESCE(p.price, 25.0) ELSE 0 END) -
      SUM(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2021 THEN COALESCE(p.price, 25.0) ELSE 0 END)
    ) / NULLIF(SUM(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2021 THEN COALESCE(p.price, 25.0) ELSE 0 END), 0)
	AS DECIMAL(10,2)) AS [Growth % (2022 vs 2021)]
	FROM sales AS s
	LEFT JOIN prices AS p
	ON p.item_id = s.item_id
	AND CAST(s.txn_date AS date) >= CAST(p.date_from AS date)
	AND CAST(s.txn_date AS date) <  CAST(p.date_to   AS date)
	WHERE YEAR(CAST(s.txn_date AS date)) IN (2021, 2022);
