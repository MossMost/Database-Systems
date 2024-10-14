select product_name, sum_unit as unit
from products p join (
    select product_id, sum(unit) as sum_unit
    from orders
    where month(order_date) = 2 and year(order_date) = 2020
    group by product_id) as s 
on p.product_id = s.product_id
where sum_unit >= 100