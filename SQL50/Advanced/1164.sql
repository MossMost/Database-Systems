with temp as (
    select product_id, 10 as first_price
    from products
    group by product_id
), max_date as (
    select product_id, max(change_date) as max_date
    from (
        select * from products
        where change_date <= '2019-08-16'
    ) as before_16
    group by product_id
), lastest_price as (
    select p.product_id, new_price, p.change_date
    from products p join max_date md
    on p.product_id = md.product_id and 
    p.change_date = md.max_date
)

select t.product_id, (case when lp.product_id is null then first_price else new_price end) as price
from temp t left join lastest_price lp
on t.product_id = lp.product_id