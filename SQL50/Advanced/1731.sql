select e.employee_id, e.name, count(*) as reports_count, round(avg(r.age)) as average_age
from employees e join employees r on e.employee_id = r.reports_to
group by e.employee_id
order by e.employee_id