/* SQL Query */

select
    c1.class
from
    Courses c1
group by c1.class
having (select
              count(*)
        from  Courses c2
        where c2.class = c1.class) >=5 