/* SQL Query */

with 
    CTE_Activity_times 
    (new_machine_id, 
     new_process_id, 
     start_timestamp, 
     end_timestamp) 
AS ( 
    select 
        a.machine_id, 
        a.process_id, 
        a.timestamp, 
        b.timestamp
    from  Activity a INNER JOIN Activity b 
    on a.machine_id = b.machine_id 
    and a.process_id = b.process_id
    where a.activity_type = 'start' 
    and b.activity_type = 'end'
    group by a.machine_id, a.process_id
    )

select 
      new_machine_id as machine_id, 
      round(avg(end_timestamp - start_timestamp), 3) as processing_time 
from  CTE_Activity_times 
group by new_machine_id
