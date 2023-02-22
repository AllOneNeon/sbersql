--- 1
SELECT 
    item_id,  
    item_name,  
    item_price,  
    created_dttm AS effective_from, 
    (CASE WHEN lag(item_price) OVER (PARTITION BY item_id ORDER BY created_dttm) IS NULL THEN '9999-12-31' 
    ELSE lag(entry_date) OVER (PARTITION BY item_id ORDER BY created_dttm) END) 
    AS effective_until 
    FROM task3;
--- 2
SELECT  
    item_id,  
    item_name,  
    item_price,  
    MIN(valid_from_dt) AS starting_date,  
    MAX(CASE WHEN valid_from_dt = '9999-12-31' THEN  NULL ELSE valid_from_dt END) AS valid_to_dt 
FROM task3
GROUP BY item_id, item_name, item_price