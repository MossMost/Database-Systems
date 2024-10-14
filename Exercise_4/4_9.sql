SELECT DISTINCT c.customer_id, c.customer_name
FROM customer c, ordert o
WHERE c.customer_id = o.customer_id 
AND order_date BETWEEN '2020-01-10 00:00:00' AND '2020-01-15 23:59:59'