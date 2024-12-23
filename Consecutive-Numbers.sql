/* SQL Query */

select 
      distinct (a.num) as ConsecutiveNums
from
     (select
            num,
            @counter := if(@prev = num, @counter+1, 1) as how_many_time_consecutively,
            @prev := num
      from  Logs y, (select @counter:=0, @prev=null) vars) a
where a.how_many_time_consecutively >= 3
