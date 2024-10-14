SELECT order_id, order_date 
FROM customer cc, ordert O
WHERE cc.customer_id = o.customer_id AND o.customer_id = '10001'