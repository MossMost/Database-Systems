WITH count_product AS(
	SELECT ol.product_id, COUNT(ol.product_id) AS count_p
    FROM ordert o, order_line ol, product p
    WHERE o.order_id = ol.order_id AND ol.product_id = p.product_id
    GROUP BY ol.product_id
)
SELECT p.product_id, p.product_description
FROM count_product cp, product p
WHERE cp.product_id = p.product_id AND count_p = (SELECT MAX(count_p) FROM count_product)


