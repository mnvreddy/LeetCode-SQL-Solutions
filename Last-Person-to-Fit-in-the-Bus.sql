/* SQL Query */

select
      q2.person_name
from
     (select
            q1.turn,
            q1.person_id,
            q1.person_name,
            (select sum(weight) from Queue where turn <= q1.turn) as total_weight
      from  Queue q1
      order by q1.turn) q2
where q2.total_weight <= 1000
order by q2.total_weight desc
limit 1
