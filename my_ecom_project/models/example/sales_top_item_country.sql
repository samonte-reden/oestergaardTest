WITH ranked_sales AS (
    SELECT
        Country,
        StockCode,
        SUM(Quantity * UnitPrice) AS total_sales,
        RANK() OVER (PARTITION BY Country ORDER BY SUM(Quantity * UnitPrice) DESC) AS sales_rank
    FROM
        ecommerce_table
    GROUP BY
        Country, StockCode
)
SELECT
    Country,
    StockCode,
    total_sales
FROM
    ranked_sales
WHERE
    sales_rank = 1
