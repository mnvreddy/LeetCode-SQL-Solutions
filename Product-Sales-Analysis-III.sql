/* SQL Query */

select
      a.product_id,
      a.year as first_year,
      a.quantity,
      a.price
from  Sales a
where (a.product_id, a.year)
   in (select 
             product_id, 
             min(year)
       from  Sales
       group by product_id) 