WITH daily_sales_per_country AS (
    SELECT
        Country,
        CAST(InvoiceDate AS DATE) AS sale_date,
        SUM(Quantity * UnitPrice) AS daily_sales
    FROM
        ecommerce_table
    GROUP BY
        Country, sale_date
)
SELECT
    Country,
    sale_date,
    AVG(daily_sales) AS average_sales
FROM
    daily_sales_per_country
GROUP BY
    Country, sale_date