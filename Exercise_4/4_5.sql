SELECT c.customer_id, c.customer_name, COUNT(c.customer_id) AS number_of_orders
FROM customer c, ordert o
WHERE c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY number_of_orders DESC