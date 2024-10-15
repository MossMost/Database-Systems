with highest_user_rating as (
    select u.name as results
    from (select * from MovieRating group by movie_id, user_id) as m join users u
    on m.user_id = u.user_id
    group by m.user_id
    having count(*) = (select count(*)
        from (select * from MovieRating group by movie_id, user_id) as m
        group by user_id
        order by count(*) desc
        limit 1
    )
    order by u.name
    limit 1
), highest_avg_movie as (
    select m.title as results
    from MovieRating mr join movies m on mr.movie_id = m.movie_id
    where year(created_at) = 2020 and month(created_at) = 02
    group by mr.movie_id
    having avg(rating) = (select avg(rating)
        from MovieRating
        where year(created_at) = 2020 and month(created_at) = 02
        group by movie_id
        order by avg(rating) desc
        limit 1
    )
    order by m.title
    limit 1
)

select *
from highest_user_rating 
union all
select *
from highest_avg_movie