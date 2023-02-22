--- 1
SELECT  
    item_id, 
    MAX(amount_spent) 
FROM 
    (SELECT  
        transaction_id,  
        customer_id,  
        item_id,  
        number_of_units_purchased, 
        DATE(transaction_dttm), 
        SUM(number_of_units_purchased * price) AS amount_spent 
    FROM task4
    WHERE 
        transaction_dttm > CURRENT_DATE - INTERVAL '30' DAY 
    AND  
        customer_id IN  
        (SELECT customer_id FROM Customers  
            WHERE Last_transaction_date > CURRENT_DATE - INTERVAL '30' DAY) 
    GROUP BY 
        transaction_id, 
        customer_id,  
        item_id,  
        number_of_units_purchased , 
        DATE(transaction_dttm)) T 
GROUP BY 
    item_id; 
--- 2
SELECT 
    transaction_id,  
    customer_id,  
    item_id,  
    number_of_units_purchased, 
    DATE(transaction_dttm), 
    SUM(number_of_units_purchased * price) AS amount_spent 
FROM task4
WHERE 
    transaction_dttm > CURRENT_DATE - INTERVAL '30' DAY 
GROUP BY 
    transaction_id, 
    customer_id,  
    item_id,  
    number_of_units_purchased , 
    DATE(transaction_dttm) 