
SELECT 
    *,
    (count * 100 / prev_count - 100)::text || '%'                 
FROM (
    SELECT
        *,
        lag(count) OVER (ORDER BY pub_month) as prev_count        
    FROM (
        SELECT
            date_trunc('month', pub_date)::date as pub_month,     
            COUNT(*)                                              
        FROM task5
        GROUP BY 1
    ) s
) s