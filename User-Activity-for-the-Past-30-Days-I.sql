/* SQL Query */

select
      activity_date as day,
      count(distinct user_id) as active_users
from  Activity 
where activity_date between date_add('2019-07-27', interval -29 day) 
  and date('2019-07-27')
group by activity_date
order by activity_date