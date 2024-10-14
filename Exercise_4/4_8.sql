SELECT c.customer_id, c.customer_name, COUNT(c.customer_id) AS order_count
FROM ordert o, customer c
WHERE o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY order_count DESC
LIMIT 3;
