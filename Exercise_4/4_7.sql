WITH QUANTITY AS (
    SELECT ol.product_id, ol.ordered_quantity
    FROM ordert o, order_line ol, product p
    WHERE ol.order_id = o.order_id 
    AND ol.product_id = p.product_id
)
SELECT p.product_id, p.product_description
FROM quantity q, product p
WHERE q.product_id = p.product_id 
AND q.ordered_quantity = (SELECT MAX(ordered_quantity) FROM quantity);
