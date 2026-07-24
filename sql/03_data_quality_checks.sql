USE ecommerce_analytics;

-- Preview Data
SELECT *
FROM ecommerce_sales
LIMIT 100;

-- Total Records
SELECT COUNT(*) AS total_records
FROM ecommerce_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales;

-- Total Customers
SELECT COUNT(DISTINCT customer_name) AS total_customers
FROM ecommerce_sales;