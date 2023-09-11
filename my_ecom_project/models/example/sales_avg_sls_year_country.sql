WITH yearly_sales AS (
    SELECT
        Country,
        YEAR(InvoiceDate) AS sale_year,
        SUM(Quantity * UnitPrice) AS yearly_sales_total
    FROM
        ecommerce_table
    GROUP BY
        Country, sale_year
)
SELECT
    Country,
    sale_year,
    AVG(yearly_sales_total) AS average_sales_per_year
FROM
    yearly_sales
GROUP BY
    Country, sale_year
