SELECT 
    t.name AS TableName,
    s.name AS SchemaName
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY SchemaName, TableName;

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT * FROM employee_data;

SELECT UPPER(first_name) 
FROM employee_data;

SELECT LOWER(first_name) 
FROM employee_data;

SELECT LEN(first_name) AS Length, first_name 
FROM employee_data;

SELECT SUBSTRING(first_name, 1, 3) AS Substring, first_name 
FROM employee_data;

SELECT CONCAT(first_name, last_name), first_name, last_name 
FROM employee_data;

SELECT REPLACE(first_name, 'Joshua', 'Josh'), first_name 
FROM employee_data;

SELECT TRIM(first_name) AS first_name 
FROM employee_data;

SELECT COUNT(age) AS Total_rows_age
FROM employee_data;

SELECT COUNT(*) AS Total_rows
FROM employee_data;

SELECT SUM(age) AS Total_age
FROM employee_data;

SELECT MAX(age) AS Max_age
FROM employee_data;

SELECT MIN(age) AS Min_age
FROM employee_data;

SELECT AVG(age) AS Avg_age
FROM employee_data;

SELECT AVG(salary) AS Avg_salary
FROM employee_data;

SELECT ROUND(AVG(salary), 2) AS Avg_salary
FROM employee_data;

SELECT age, SUM(salary) AS Total 
FROM employee_data
GROUP BY age;

SELECT age, ROUND(SUM(salary), 2) AS Total 
FROM employee_data
GROUP BY age;

SELECT age, SUM(salary) AS Total
FROM employee_data
GROUP BY age
ORDER BY total ASC;

SELECT age, SUM(salary) AS Total
FROM employee_data
GROUP BY age
ORDER BY total DESC;

SELECT age, COUNT(salary) AS Total
FROM employee_data
GROUP BY age 
HAVING COUNT(salary)>=20
ORDER BY total DESC;

SELECT age, COUNT(salary) AS Total
FROM employee_data
GROUP BY age 
HAVING COUNT(salary)>=20 AND COUNT(salary)<=30
ORDER BY total DESC;