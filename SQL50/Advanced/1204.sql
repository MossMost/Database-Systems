with sum_weight as (
    SELECT 
        person_name, 
        weight,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)

select person_name
from sum_weight
where total_weight <= 1000
order by total_weight desc
limit 1