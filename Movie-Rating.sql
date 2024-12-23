/* SQl Query */

(select 
       u.name as results
 from  Movies m join Users u join MovieRating mr
   on m.movie_id = mr.movie_id and
       u.user_id = mr.user_id
 group by u.user_id
 order by count(m.movie_id) desc, u.name
 limit 1)
UNION ALL
(select 
       b.title as results
 from
    (select 
           m1.title,
           avg(mr1.rating)
     from  Movies m1 join MovieRating mr1
       on m1.movie_id = mr1.movie_id
     where mr1.created_at between '2020-02-01' and '2020-02-29'
     group by m1.movie_id
     order by avg(mr1.rating) desc, m1.title asc) b
 limit 1)