/*SQL Query */

select 
      a.product_id, 
      ifnull(round(sum(a.total_price)/sum(a.units),2), 0) as average_price
from
     (select 
            p.product_id, 
            us.purchase_date, 
            us.units, 
            p.price*us.units as total_price
      from  UnitsSold us right join Prices p
        on  us.product_id = p.product_id 
       and (us.purchase_date between p.start_date and p.end_date)) a
group by a.product_id