with first_login as(
    select player_id,min(event_date) as event_date
    from activity
    group by player_id
), merge_login as(
    select a.player_id
    from activity a join first_login fl 
    on a.player_id = fl.player_id and datediff(a.event_date,fl.event_date) = 1
    group by a.player_id
)

select round(count(case when ml.player_id is not null then 1 end)/count(*), 2) as fraction
from first_login fl left join merge_login ml
on fl.player_id = ml.player_id