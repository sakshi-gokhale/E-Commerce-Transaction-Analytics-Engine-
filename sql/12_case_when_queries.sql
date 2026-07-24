USE ecommerce_analytics;

-- 1. Customer Segmentation
SELECT
c.customer_name,
SUM(f.amount) total_spent,
CASE
WHEN SUM(f.amount)>=5000 THEN 'High Value'
WHEN SUM(f.amount)>=3000 THEN 'Medium Value'
ELSE 'Low Value'
END customer_segment
FROM fact_sales f
JOIN dim_customer c
ON f.customer_id=c.customer_id
GROUP BY c.customer_name;

-- 2. Profit Status
SELECT
order_id,
profit,
CASE
WHEN profit>0 THEN 'Profit'
WHEN profit<0 THEN 'Loss'
ELSE 'Break Even'
END status
FROM fact_sales;

-- 3. Revenue Category
SELECT
order_id,
amount,
CASE
WHEN amount>=1000 THEN 'High Revenue'
WHEN amount>=500 THEN 'Medium Revenue'
ELSE 'Low Revenue'
END revenue_group
FROM fact_sales;

-- 4. Order Size
SELECT
order_id,
quantity,
CASE
WHEN quantity>=8 THEN 'Bulk'
WHEN quantity>=4 THEN 'Medium'
ELSE 'Small'
END order_size
FROM fact_sales;

-- 5. Quarterly Performance
SELECT
d.quarter,
SUM(f.amount) revenue,
CASE
WHEN SUM(f.amount)>100000 THEN 'Excellent'
WHEN SUM(f.amount)>50000 THEN 'Good'
ELSE 'Needs Improvement'
END performance
FROM fact_sales f
JOIN dim_date d
ON f.date_id=d.date_id
GROUP BY d.quarter;