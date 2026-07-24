USE ecommerce_analytics;

-- 1. Rank customers by total spending
SELECT
    c.customer_name,
    SUM(f.amount) AS total_spent,
    DENSE_RANK() OVER(ORDER BY SUM(f.amount) DESC) AS spending_rank
FROM fact_sales f
JOIN dim_customer c ON f.customer_id=c.customer_id
GROUP BY c.customer_name;

-- 2. Rank cities by revenue
SELECT
    l.city,
    SUM(f.amount) AS revenue,
    RANK() OVER(ORDER BY SUM(f.amount) DESC) AS city_rank
FROM fact_sales f
JOIN dim_location l ON f.location_id=l.location_id
GROUP BY l.city;

-- 3. Top-selling subcategory within each category
SELECT
    p.category,
    p.sub_category,
    SUM(f.amount) revenue,
    ROW_NUMBER() OVER(
        PARTITION BY p.category
        ORDER BY SUM(f.amount) DESC
    ) AS row_num
FROM fact_sales f
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY p.category,p.sub_category;

-- 4. Running revenue by month
SELECT
    d.year,
    d.month,
    SUM(f.amount) monthly_revenue,
    SUM(SUM(f.amount))
    OVER(ORDER BY d.year,d.month) AS running_total
FROM fact_sales f
JOIN dim_date d ON f.date_id=d.date_id
GROUP BY d.year,d.month;

-- 5. Running profit
SELECT
    d.order_date,
    SUM(f.profit) daily_profit,
    SUM(SUM(f.profit))
    OVER(ORDER BY d.order_date) running_profit
FROM fact_sales f
JOIN dim_date d ON f.date_id=d.date_id
GROUP BY d.order_date;

-- 6. Revenue share inside each category
SELECT
    p.category,
    p.sub_category,
    SUM(f.amount) revenue,
    ROUND(
        SUM(f.amount)*100/
        SUM(SUM(f.amount)) OVER(PARTITION BY p.category),2
    ) percentage
FROM fact_sales f
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY p.category,p.sub_category;

-- 7. Top 3 customers in every state
SELECT *
FROM(
SELECT
l.state,
c.customer_name,
SUM(f.amount) revenue,
DENSE_RANK() OVER(
PARTITION BY l.state
ORDER BY SUM(f.amount) DESC
) rnk
FROM fact_sales f
JOIN dim_customer c ON f.customer_id=c.customer_id
JOIN dim_location l ON f.location_id=l.location_id
GROUP BY l.state,c.customer_name
)x
WHERE rnk<=3;