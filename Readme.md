# E-Commerce Transaction Analytics Engine

An end-to-end SQL analytics project that transforms raw e-commerce transaction data into a structured star schema for business intelligence and reporting. The project demonstrates data modeling, ETL, advanced SQL techniques, and analytical query development using MySQL.

---

## Project Overview

This project imports an e-commerce sales dataset from a CSV file into MySQL, transforms the data into a star schema, and performs advanced SQL analysis to uncover sales trends, customer behavior, product performance, and regional insights.

The project demonstrates:

- Data Modeling using a Star Schema
- ETL (Extract, Transform, Load) Process
- Data Quality Validation
- Advanced SQL Queries
- Common Table Expressions (CTEs)
- Window Functions
- CASE WHEN Logic
- Analytical Views

---

## Tech Stack

- MySQL
- MySQL Workbench
- SQL
- CSV Dataset
- Git & GitHub

---

## Dataset

The dataset contains 1,500 e-commerce transactions with the following attributes:

- Order ID
- Order Date
- Customer Name
- State
- City
- Category
- Sub-Category
- Amount
- Profit
- Quantity

---

## Project Architecture

```
CSV Dataset
      │
      ▼
Staging Table (ecommerce_sales)
      │
      ▼
Star Schema
      │
      ├── dim_customer
      ├── dim_product
      ├── dim_location
      ├── dim_date
      └── fact_sales
      │
      ▼
SQL Analytics
      │
      ▼
Business Insights
```

---

## Database Schema

### Staging Table

- ecommerce_sales

### Dimension Tables

- dim_customer
- dim_product
- dim_location
- dim_date

### Fact Table

- fact_sales

---

## ETL Workflow

1. Imported CSV dataset into MySQL.
2. Performed data quality validation.
3. Created star schema.
4. Loaded dimension tables.
5. Loaded fact table using joins.
6. Performed analytical SQL queries.

---

## SQL Features Used

- Aggregate Functions
- GROUP BY
- HAVING
- ORDER BY
- INNER JOIN
- Common Table Expressions (CTEs)
- Window Functions
    - ROW_NUMBER()
    - RANK()
    - DENSE_RANK()
    - Running Totals
- CASE WHEN
- Views

---

## Project Structure

```
E-Commerce-Transaction-Analytics-Engine/

│
├── data/
│   └── merged_orders_cleaned.csv
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_staging_table.sql
│   ├── 03_data_quality_checks.sql
│   ├── 04_create_star_schema.sql
│   ├── 05_load_dimension_tables.sql
│   ├── 06_load_fact_table.sql
│   ├── 07_basic_analysis.sql
│   ├── 08_sales_analysis.sql
│   ├── 09_customer_analysis.sql
│   ├── 10_window_functions.sql
│   ├── 11_cte_queries.sql
│   ├── 12_case_when_queries.sql
│   ├── 13_views.sql
│   └── 14_business_insights.sql
│
├── screenshots/
│
├── README.md
│
└── LICENSE
```

---

## Key Business Questions

- What is the total revenue generated?
- Which product category generates the highest revenue?
- Which cities contribute the highest sales?
- Which customers spend the most?
- Which categories generate the highest profit?
- How does revenue change month over month?
- Who are the high-value customers?
- Which states generate the highest revenue?

---

## Sample Insights

- Electronics is the highest revenue-generating product category.
- Indore generated the highest sales revenue among all cities.
- Multiple customers spent more than ₹5,000, indicating a segment of high-value customers.
- Monthly revenue analysis reveals seasonal sales patterns.
- Revenue contribution varies significantly across product categories.

---

## SQL Analysis

The project contains more than 30 SQL queries covering:

- Data Exploration
- Sales Analysis
- Customer Analytics
- Window Functions
- CTEs
- CASE WHEN Logic
- Business Insight Generation

---

## Learning Outcomes

Through this project, I gained practical experience in:

- Designing dimensional data models
- Building ETL workflows in SQL
- Data quality validation
- Advanced SQL querying
- Business intelligence reporting
- Customer and sales analytics
- SQL performance using reusable views

---

## Author

**Sakshi Gokhale**

LinkedIn: https://www.linkedin.com/in/sakshi-gokhale

GitHub: https://github.com/sakshi-gokhale
