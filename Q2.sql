--2 What % sales are in the north in 2020, how does this change by 2024?		

SELECT
	CAST(100.0 * AVG(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2020
                        THEN CASE WHEN r.region_name = 'north' THEN 1.0 ELSE 0.0 END END)
       AS DECIMAL(5,2)) AS [2020 Sales % (North)],
	CAST(100.0 * AVG(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2024
                        THEN CASE WHEN r.region_name = 'north' THEN 1.0 ELSE 0.0 END END)
       AS DECIMAL(5,2)) AS [2024 Sales % (North)],
	CAST(
    (100.0 * AVG(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2024
                      THEN CASE WHEN r.region_name = 'north' THEN 1.0 ELSE 0.0 END END))
    -
    (100.0 * AVG(CASE WHEN YEAR(CAST(s.txn_date AS date)) = 2020
                      THEN CASE WHEN r.region_name = 'north' THEN 1.0 ELSE 0.0 END END))
	AS DECIMAL(5,2)) AS [Diff % points (2024-2020)]
	FROM sales AS s
	JOIN region AS r ON r.region_id = s.region
	WHERE YEAR(CAST(s.txn_date AS date)) IN (2020, 2024);
