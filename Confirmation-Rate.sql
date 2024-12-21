/* SQL Query */

select 
      s.user_id, 
      ifnull(c.confirmation_rate, 0) as confirmation_rate
from  Signups s left join 
     (select 
            a.user_id, 
            round((b.confirmed_requests/a.total_requests),2) as confirmation_rate 
       from (select 
                   user_id, 
                   count(*) as total_requests
             from  Confirmations
             group by user_id) a join
            (select 
                   user_id, 
                   count(*) as confirmed_requests
             from  Confirmations
             group by user_id, action
             having action = 'confirmed') b
      on a.user_id = b.user_id) c
on s.user_id = c.user_id
