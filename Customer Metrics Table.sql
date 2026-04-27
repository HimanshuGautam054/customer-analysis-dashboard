CREATE OR REPLACE TABLE ecommerce_project.customer_metrics AS
SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sale_price) AS total_revenue,
    AVG(sale_price) AS avg_order_value
FROM ecommerce_project.order_items
GROUP BY user_id;