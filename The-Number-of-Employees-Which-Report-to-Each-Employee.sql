/* SQL Query */

select
    a.employee_id,
    a.name,
    count(*) as reports_count,
    round(avg(b.age), 0) as average_age
from
    Employees a inner join Employees b
on a.employee_id = b.reports_to
group by b.reports_to
order by a.employee_id