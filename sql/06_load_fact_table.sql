USE ecommerce_analytics;

INSERT INTO fact_sales (
    order_id,
    customer_id,
    product_id,
    location_id,
    date_id,
    amount,
    profit,
    quantity
)

SELECT
    s.order_id,
    c.customer_id,
    p.product_id,
    l.location_id,
    d.date_id,
    s.amount,
    s.profit,
    s.quantity

FROM ecommerce_sales s

JOIN dim_customer c
ON s.customer_name = c.customer_name

JOIN dim_product p
ON s.category = p.category
AND s.sub_category = p.sub_category

JOIN dim_location l
ON s.state = l.state
AND s.city = l.city

JOIN dim_date d
ON s.order_date = d.order_date;

-- Verify the Fact Table
SELECT COUNT(*) AS total_sales
FROM fact_sales;


-- Verify the Star Schema
SELECT
    fs.sales_id,
    fs.order_id,
    c.customer_name,
    p.category,
    p.sub_category,
    l.city,
    l.state,
    d.order_date,
    fs.amount,
    fs.profit,
    fs.quantity
FROM fact_sales fs
JOIN dim_customer c
ON fs.customer_id = c.customer_id
JOIN dim_product p
ON fs.product_id = p.product_id
JOIN dim_location l
ON fs.location_id = l.location_id
JOIN dim_date d
ON fs.date_id = d.date_id
LIMIT 10;