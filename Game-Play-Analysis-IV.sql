/* SQL Query */

select
      round(count(nullif(a.event_date, null))/count(*),2) as fraction
from  Activity a right join 
     (select 
            player_id,
            min(event_date) as event_date
      from  Activity 
      group by player_id) b
      on a.player_id = b.player_id
      and datediff(a.event_date, b.event_date) = 1
