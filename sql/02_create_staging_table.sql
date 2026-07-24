USE ecommerce_analytics;

CREATE TABLE ecommerce_sales (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    amount DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,
    category VARCHAR(50),
    sub_category VARCHAR(100),
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    day INT,
    weekday INT,
    weekday_name VARCHAR(20)
);


-- import the csv file first then run the following query to create the primary key

ALTER TABLE ecommerce_sales
ADD COLUMN transaction_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

