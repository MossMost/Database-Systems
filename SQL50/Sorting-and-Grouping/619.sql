select max(num) as num
from (
    select max(num) as num
    from mynumbers
    group by num
    having count(*) = 1
) as group_single