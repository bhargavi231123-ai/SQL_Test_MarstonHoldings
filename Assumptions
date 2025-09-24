Engine & syntax: Microsoft SQL Server (T-SQL), 2012+ (uses window functions like DENSE_RANK).

Dates & ranges: Use half-open windows (>= 'YYYY-01-01' AND < 'YYYY+1-01-01'). When filtering by year we cast to DATE to ignore time parts.

Data types: sales.txn_date is a DATE/DATETIME (or safely castable with CAST(... AS date)); calendar.dte is DATE.

Calendar coverage (Q1a): calendar contains all days from 2020-01-01 to 2024-12-31 (at least one row per day). Using LEFT JOIN to ensure months with zero sales appear. Grouping by YEAR(c.dte), MONTH(c.dte) is intended.

Unit of sale: Each row in sales represents one item sold (no separate quantity column). “Sales” counts rows.

Prices (Q3): prices is type-2/effective-dated per item_id with non-overlapping ranges; date_from is inclusive and date_to is exclusive. If no price row matches, use £25 as the default price per sale.

Revenue calc: Revenue = sum of the matched (or default) price per sale; no taxes/discounts considered.

Region join (Q2): sales.region → region.region_id. “North” is identified via region.region_name = 'north' (case-insensitive under default collations).

% North (Q2): Percentage is by transaction count (not revenue). Computed as AVG(CASE WHEN region='north' THEN 1.0 ELSE 0.0 END) * 100.

Trends (Q3b): Results are monthly since 2023, grouped by YEAR/MONTH of txn_date. Months with no sales are omitted (not required to include zero months here).

Ranking (Q4): Ranking is done per year by Revenue (and an alternative by Sales count) using DENSE_RANK.

Collation/case: Assumes a case-insensitive collation (e.g., SQL_Latin1_General_CP1_CI_AS) so 'north' matches any case.

Currency: All prices/revenue are in GBP.
