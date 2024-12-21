/* SQL Query */

select 
      q1.query_name, 
      round(avg(q1.individual_quality),2) as quality,
      round(((select 
                    count(*) 
              from  Queries 
              where query_name = q1.query_name 
                and rating <3) / 
             (select 
                    count(*) 
              from  Queries 
              where query_name = q1.query_name) * 100), 2) as poor_query_percentage
from
    (select 
           *, 
           (rating/position) as individual_quality
     from  Queries where query_name is not null) q1 
group by q1.query_name