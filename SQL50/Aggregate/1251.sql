select p.product_id, ifnull(round(sum(price * units)/sum(units),2), 0) as average_price
from prices p left join unitssold us
on p.product_id = us.product_id and us.purchase_date >= p.start_date and us.purchase_date <= end_date 
group by product_id