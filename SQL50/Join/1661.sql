with process_id_time as (
    select s.machine_id, s.process_id, (e.timestamp - s.timestamp) as processing_time
    from activity s join activity e 
    on s.activity_type = 'start' and e.activity_type = 'end' 
    and s.machine_id = e.machine_id and s.process_id = e.process_id
)

select machine_id, round(sum(processing_time)/count(process_id),3) as processing_time
from process_id_time
group by machine_id