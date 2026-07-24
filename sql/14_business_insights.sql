USE ecommerce_analytics;

-- Top Revenue Category
SELECT
p.category,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id=p.product_id
GROUP BY p.category
ORDER BY revenue DESC
LIMIT 1;

-- Top Revenue City
SELECT
l.city,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_location l
ON f.location_id=l.location_id
GROUP BY l.city
ORDER BY revenue DESC
LIMIT 1;

-- Top Customer
SELECT
c.customer_name,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id=c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;

-- Most Profitable Category
SELECT
p.category,
SUM(f.profit) profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id=p.product_id
GROUP BY p.category
ORDER BY profit DESC;

-- Monthly Revenue Trend
SELECT
d.month_name,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_id=d.date_id
GROUP BY d.month,d.month_name
ORDER BY d.month;