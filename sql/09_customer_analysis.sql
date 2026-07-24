USE ecommerce_analytics;

-- ============================================
-- 1. Top 10 Customers by Revenue
-- ============================================

SELECT
    c.customer_name,
    ROUND(SUM(f.amount),2) AS total_spent
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- ============================================
-- 2. Top 10 Customers by Profit
-- ============================================

SELECT
    c.customer_name,
    ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- ============================================
-- 3. Customer Purchase Frequency
-- ============================================

SELECT
    c.customer_name,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

-- ============================================
-- 4. Average Spending per Customer
-- ============================================

SELECT
    c.customer_name,
    ROUND(AVG(f.amount),2) AS average_spending
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY average_spending DESC;

-- ============================================
-- 5. Customers Spending More Than ₹5000
-- ============================================

SELECT
    c.customer_name,
    ROUND(SUM(f.amount),2) AS total_spent
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(f.amount) > 5000
ORDER BY total_spent DESC;

-- ============================================
-- 6. Customers with Negative Profit
-- ============================================

SELECT
    c.customer_name,
    ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(f.profit) < 0
ORDER BY total_profit;

-- ============================================
-- 7. Highest Quantity Purchased by Customer
-- ============================================

SELECT
    c.customer_name,
    SUM(f.quantity) AS total_quantity
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_quantity DESC
LIMIT 10;

-- ============================================
-- 8. Revenue Contribution by Customer
-- ============================================

SELECT
    c.customer_name,
    ROUND(SUM(f.amount),2) AS total_revenue,
    ROUND(
        SUM(f.amount) * 100 /
        (SELECT SUM(amount) FROM fact_sales),
        2
    ) AS revenue_percentage
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;