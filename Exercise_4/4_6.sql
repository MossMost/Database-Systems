WITH order_number AS (
    SELECT c.customer_id, c.customer_name, COUNT(c.customer_id) AS number_of_orders
    FROM customer c, ordert o
    WHERE c.customer_id = o.customer_id
    GROUP BY c.customer_id
    ORDER BY number_of_orders DESC
) 
SELECT customer_id, customer_name 
FROM order_number
WHERE number_of_orders = (SELECT MAX(number_of_orders) FROM order_number);
