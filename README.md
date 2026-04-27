# 📊 Customer Analytics Dashboard (BigQuery + Looker Studio)

## 🚀 Project Overview
This project analyzes customer behavior using Google BigQuery and visualizes insights using Looker Studio.

---

## 📌 Key Insights
💰 Total Revenue: 2.71M+  
👥 Total Customers: 27.6K+  
📦 Avg Order Value: 59.9  

---
## 📈 Dashboard Preview
![Dashboard](images/dashboard.png)


---

## 🔗 Dataset

Public dataset used:
`bigquery-public-data.thelook_ecommerce`

---
## 🛠️ Tech Stack
- Google BigQuery (SQL)  
- Looker Studio  
- SQL (Aggregations, CASE statements)  

---

## 📂 SQL Queries
All queries used in this project:

- Customer Metrics
- Customer Segmentation

## 📂 SQL Queries


```sql
CREATE OR REPLACE TABLE ecommerce_project.customer_metrics AS
SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sale_price) AS total_revenue,
    AVG(sale_price) AS avg_order_value
FROM ecommerce_project.order_items
GROUP BY user_id;

CREATE OR REPLACE TABLE ecommerce_project.customer_segments AS
SELECT
    user_id,
    total_orders,
    total_revenue,
    avg_order_value,
    CASE
        WHEN total_revenue > 500 THEN 'High Value'
        WHEN total_revenue BETWEEN 200 AND 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM ecommerce_project.customer_metrics;
