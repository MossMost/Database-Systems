select round(sum(tiv_2016),2) as tiv_2016
from (
   select *
    from Insurance
    where (lat, lon) not in (
        select lat, lon
        from insurance
        group by lat, lon
        having count(*) > 1
    ) 
) as tmp
where tiv_2015 not in (
    select tiv_2015
    from insurance
    group by tiv_2015
    having count(*) <= 1
)


