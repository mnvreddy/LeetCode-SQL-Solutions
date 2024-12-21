/* SQL Query */

select 
      ss.student_id, 
      ss.student_name, 
      ss.subject_name, 
      ifnull(ec.attended_exams, 0) as attended_exams 
from
      (select 
             stu.student_id, 
             stu.student_name, 
             sub.subject_name 
       from Students stu join Subjects sub) ss
       left join 
      (select 
             exm.student_id, 
             exm.subject_name, 
             count(*) as attended_exams
        from Examinations exm
        group by exm.student_id, exm.subject_name) ec
on ec.student_id = ss.student_id 
and ec.subject_name = ss.subject_name
order by ss.student_id, ss.subject_name