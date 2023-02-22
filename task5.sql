SELECT 
    *,
    (count * 100 / prent_growth - 100)::text || '%'                 
FROM (
    SELECT
        *,
        lag(count) OVER (ORDER BY dt) as prent_growth        
    FROM (
        SELECT
            date_trunc('month', created_at)::date as dt,     
            COUNT(*)                                              
        FROM task5
        GROUP BY 1
    ) s
) s