with temp as(
    select *
    from students s cross join subjects sj 
    group by s.student_id, sj.subject_name
    order by s.student_id, case sj.subject_name 
            when 'Math' then 1
            when 'Physics' then 2
            when 'Programming' then 3
            else 4
    end
), count_table as (
    select s.student_id, s.student_name, x.subject_name, count(*) as attended_exams
    from students s join examinations x
    on s.student_id = x.student_id
    group by s.student_id, s.student_name, x.subject_name
)

select t.student_id, t.student_name, t.subject_name, ifnull(c.attended_exams,0) as attended_exams
from temp t left join count_table c on
t.student_id = c.student_id and 
t.subject_name = c.subject_name 

order by t.student_id, t.subject_name

