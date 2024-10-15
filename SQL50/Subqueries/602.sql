with req as (
    select requester_id as id, count(*) as num
    from RequestAccepted
    group by requester_id
), acc as (
    select accepter_id as id, count(*) as num
    from RequestAccepted
    group by accepter_id
) 

select id, sum(num) as num
from (select * from req union all select * from acc) as s
group by id
order by num desc
limit 1