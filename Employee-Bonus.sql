/* SQL Query */

select 
      e.name, 
      b.bonus
from  Employee e LEFT JOIN Bonus b
   on e.empId = b.empId
where b.bonus < 1000 
   or b.bonus is null
   