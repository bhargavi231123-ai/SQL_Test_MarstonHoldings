--1a Produce a timeseries showing sales for all months from 2020 to 2024

SELECT
    YEAR(c.dte) AS 'Year',
    LEFT(DATENAME(month, c.dte), 3) AS 'Month',
    COUNT(s.item_id) AS Sales
	FROM calendar AS c
	LEFT JOIN sales AS s
	ON CAST(s.txn_date AS date) = c.dte
	WHERE c.dte >= '2020-01-01' AND c.dte <  '2025-01-01'
	GROUP BY YEAR(c.dte), MONTH(c.dte), LEFT(DATENAME(month, c.dte), 3)
	ORDER BY YEAR(c.dte), MONTH(c.dte);
