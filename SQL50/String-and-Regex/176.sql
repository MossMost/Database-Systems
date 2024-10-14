select coalesce(
    (select distinct salary
from employee
group by salary
order by salary desc
limit 1 offset 1),null) as SecondHighestSalary 