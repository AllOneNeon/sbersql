--- Запросы выводят имена 3-ех самых молодых сотрудников 
--- 1 
SELECT name FROM test WHERE age < 30
--- 2
SELECT name FROM test ORDER BY age ASC LIMIT 3
