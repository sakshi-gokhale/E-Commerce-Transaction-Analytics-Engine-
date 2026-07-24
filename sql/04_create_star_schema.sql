USE ecommerce_analytics;

-- ==========================
-- Customer Dimension
-- ==========================
CREATE TABLE dim_customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) UNIQUE
);

-- ==========================
-- Product Dimension
-- ==========================
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(100),
    UNIQUE(category, sub_category)
);

-- ==========================
-- Location Dimension
-- ==========================
CREATE TABLE dim_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    state VARCHAR(100),
    city VARCHAR(100),
    UNIQUE(state, city)
);

-- ==========================
-- Date Dimension
-- ==========================
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE UNIQUE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    weekday INT,
    weekday_name VARCHAR(20)
);

-- ==========================
-- Sales Fact Table
-- ==========================
CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),

    customer_id INT,
    product_id INT,
    location_id INT,
    date_id INT,

    amount DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,

    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);