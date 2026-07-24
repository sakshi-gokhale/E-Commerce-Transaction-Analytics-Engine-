USE ecommerce_analytics;

-- 1. Top 5 customers
WITH customer_sales AS
(
SELECT
c.customer_name,
SUM(f.amount) total_sales
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id=c.customer_id
GROUP BY c.customer_name
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC
LIMIT 5;

-- 2. Average category revenue
WITH category_sales AS
(
SELECT
p.category,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_product p
ON f.product_id=p.product_id
GROUP BY p.category
)
SELECT *
FROM category_sales
WHERE revenue>
(
SELECT AVG(revenue)
FROM category_sales
);

-- 3. Monthly revenue
WITH monthly_sales AS
(
SELECT
d.year,
d.month,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_id=d.date_id
GROUP BY d.year,d.month
)
SELECT *
FROM monthly_sales
ORDER BY year,month;

-- 4. Highest revenue city
WITH city_sales AS
(
SELECT
l.city,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_location l
ON f.location_id=l.location_id
GROUP BY l.city
)
SELECT *
FROM city_sales
ORDER BY revenue DESC
LIMIT 1;

-- 5. Customers spending >5000
WITH spending AS
(
SELECT
c.customer_name,
SUM(f.amount) total_spent
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id=c.customer_id
GROUP BY c.customer_name
)
SELECT *
FROM spending
WHERE total_spent>5000;