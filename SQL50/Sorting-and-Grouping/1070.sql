select s.product_id, s.year as first_year, s.quantity, s.price
from sales as s
join (select product_id, min(year) as first_year, quantity, price
from sales
group by product_id) as fs on 
fs.product_id = s.product_id and fs.first_year = s.year