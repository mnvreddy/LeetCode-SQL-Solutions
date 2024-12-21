/* SQL Query */

select 
      round(((count(if(d2.order_date = d2.customer_pref_delivery_date, 1, null)))/count(*) * 100),2) as immediate_percentage
from  Delivery d2
where (d2.customer_id, d2.order_date) in 
      (select 
             d1.customer_id,
             min(d1.order_date)
       from  Delivery d1 
       group by d1.customer_id)
    
