SELECT StockCode, Description, SUM(Quantity * UnitPrice) AS total_sales
FROM ecommerce_table
GROUP BY StockCode,Description
ORDER BY total_sales DESC
LIMIT 5