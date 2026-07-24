USE ecommerce_analytics;

-- Customer Revenue View
CREATE VIEW vw_customer_revenue AS
SELECT
c.customer_name,
SUM(f.amount) total_revenue,
SUM(f.profit) total_profit
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id=c.customer_id
GROUP BY c.customer_name;

-- Category Revenue View
CREATE VIEW vw_category_revenue AS
SELECT
p.category,
SUM(f.amount) revenue,
SUM(f.profit) profit
FROM fact_sales f
JOIN dim_product p
ON f.product_id=p.product_id
GROUP BY p.category;

-- City Revenue View
CREATE VIEW vw_city_sales AS
SELECT
l.city,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_location l
ON f.location_id=l.location_id
GROUP BY l.city;

-- Monthly Sales View
CREATE VIEW vw_monthly_sales AS
SELECT
d.year,
d.month,
SUM(f.amount) revenue
FROM fact_sales f
JOIN dim_date d
ON f.date_id=d.date_id
GROUP BY d.year,d.month;