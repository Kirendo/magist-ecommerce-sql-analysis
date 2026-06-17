-- Data exploration
-- basic sanity checks before starting the actual analysis

-- How big is each table?
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'sellers', COUNT(*) FROM sellers;

-- What time period does the data cover?
SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- How are orders distributed across statuses?
-- wanted to see how much of the data is actually 'delivered' vs. everything else
SELECT
    order_status,
    COUNT(*) AS num_orders,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 2) AS pct_of_total
FROM orders
GROUP BY order_status
ORDER BY num_orders DESC;

-- Are there orders with no matching order_items (data quality check)?
SELECT COUNT(*) AS orders_without_items
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

-- Are there delivered orders missing a delivery date?
SELECT COUNT(*) AS delivered_missing_date
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL;
