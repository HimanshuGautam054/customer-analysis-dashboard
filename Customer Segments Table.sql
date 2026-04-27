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