SELECT SUM(ol.ordered_quantity * p.standard_price) AS total_payment
FROM ordert o, order_line ol, product p
WHERE o.order_id = ol.order_id AND ol.product_id = p.product_id AND o.order_id = 3 