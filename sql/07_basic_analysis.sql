USE ecommerce_analytics;

-- =====================================
-- 1. Total Revenue
-- =====================================
SELECT
    SUM(amount) AS total_revenue
FROM fact_sales;

-- =====================================
-- 2. Total Profit
-- =====================================
SELECT
    SUM(profit) AS total_profit
FROM fact_sales;

-- =====================================
-- 3. Total Transactions
-- =====================================
SELECT
    COUNT(*) AS total_transactions
FROM fact_sales;

-- =====================================
-- 4. Total Orders
-- =====================================
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM fact_sales;

-- =====================================
-- 5. Total Customers
-- =====================================
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM fact_sales;

-- =====================================
-- 6. Average Order Value
-- =====================================
SELECT
    ROUND(AVG(amount),2) AS average_order_value
FROM fact_sales;

-- =====================================
-- 7. Total Quantity Sold
-- =====================================
SELECT
    SUM(quantity) AS total_quantity
FROM fact_sales;

-- =====================================
-- 8. Average Profit Per Transaction
-- =====================================
SELECT
    ROUND(AVG(profit),2) AS average_profit
FROM fact_sales;