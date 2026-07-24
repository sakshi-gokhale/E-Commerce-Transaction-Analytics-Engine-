USE ecommerce_analytics;

-- ============================================
-- 1. Revenue by Category
-- ============================================

SELECT
    p.category,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ============================================
-- 2. Revenue Contribution by Category (%)
-- ============================================

SELECT
    p.category,
    ROUND(SUM(f.amount),2) AS total_revenue,
    ROUND(
        SUM(f.amount) * 100 /
        (SELECT SUM(amount) FROM fact_sales),
        2
    ) AS revenue_percentage
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ============================================
-- 3. Top 10 Revenue Generating Cities
-- ============================================

SELECT
    l.city,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_location l
ON f.location_id = l.location_id
GROUP BY l.city
ORDER BY total_revenue DESC
LIMIT 10;

-- ============================================
-- 4. Top 10 Revenue Generating States
-- ============================================

SELECT
    l.state,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_location l
ON f.location_id = l.location_id
GROUP BY l.state
ORDER BY total_revenue DESC
LIMIT 10;

-- ============================================
-- 5. Monthly Revenue Trend
-- ============================================

SELECT
    d.year,
    d.month_name,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_id = d.date_id
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;

-- ============================================
-- 6. Quarterly Revenue Trend
-- ============================================

SELECT
    d.year,
    d.quarter,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_id = d.date_id
GROUP BY d.year, d.quarter
ORDER BY d.year, d.quarter;

-- ============================================
-- 7. Revenue by Sub-Category
-- ============================================

SELECT
    p.sub_category,
    ROUND(SUM(f.amount),2) AS total_revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.sub_category
ORDER BY total_revenue DESC;

-- ============================================
-- 8. Profit by Category
-- ============================================

SELECT
    p.category,
    ROUND(SUM(f.profit),2) AS total_profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

-- ============================================
-- 9. Highest Selling Category (Quantity)
-- ============================================

SELECT
    p.category,
    SUM(f.quantity) AS total_quantity
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity DESC;

-- ============================================
-- 10. Average Order Value by Category
-- ============================================

SELECT
    p.category,
    ROUND(AVG(f.amount),2) AS average_order_value
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY average_order_value DESC;