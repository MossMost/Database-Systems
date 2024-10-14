with all_count as(
    select user_id, count(*) as count_actions
    from confirmations
    group by user_id
), confirm_count as(
    select *, count(*) as count_confirmed
    from confirmations
    where action = 'confirmed'
    group by user_id
)

select ac.user_id, round(ifnull(count_confirmed/count_actions,0),2) as confirmation_rate
from (
    select su.user_id, ifnull(ac.count_actions,0) as count_actions
    from signups su left join all_count ac on su.user_id = ac.user_id
) ac left join confirm_count cc
on ac.user_id = cc.user_id