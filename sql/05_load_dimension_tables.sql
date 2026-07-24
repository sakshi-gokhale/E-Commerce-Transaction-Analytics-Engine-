USE ecommerce_analytics;

-- =====================================
-- Load Customer Dimension
-- =====================================
INSERT INTO dim_customer (customer_name)
SELECT DISTINCT customer_name
FROM ecommerce_sales
ORDER BY customer_name;

-- =====================================
-- Load Product Dimension
-- =====================================
INSERT INTO dim_product (category, sub_category)
SELECT DISTINCT category, sub_category
FROM ecommerce_sales
ORDER BY category, sub_category;

-- =====================================
-- Load Location Dimension
-- =====================================
INSERT INTO dim_location (state, city)
SELECT DISTINCT state, city
FROM ecommerce_sales
ORDER BY state, city;

-- =====================================
-- Load Date Dimension
-- =====================================
INSERT INTO dim_date (
    order_date,
    year,
    quarter,
    month,
    month_name,
    day,
    weekday,
    weekday_name
)
SELECT DISTINCT
    order_date,
    year,
    quarter,
    month,
    month_name,
    day,
    weekday,
    weekday_name
FROM ecommerce_sales
ORDER BY order_date;

-- verify
SELECT COUNT(*) AS customers
FROM dim_customer;

SELECT COUNT(*) AS products
FROM dim_product;

SELECT COUNT(*) AS locations
FROM dim_location;

SELECT COUNT(*) AS dates
FROM dim_date;