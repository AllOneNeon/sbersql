--- 1
SELECT abonent, region_id, MAX(dttm)
FROM task2
GROUP BY abonent, region_id
--- 2
with helper as (select abonent, region_id, dttm,
                       row_number() over (partition by abonent, date(dttm) 
                                          order by dttm desc) as row_number
                from task2)
select abonent, region_id, dttm 
from helper
where row_number = 1;