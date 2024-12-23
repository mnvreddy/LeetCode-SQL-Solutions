/* SQL Query */

select
      max(a.num) as num
from (select
            num,
            count(*)
      from  MyNumbers
      group by num
      having count(*) = 1
      order by num desc) a