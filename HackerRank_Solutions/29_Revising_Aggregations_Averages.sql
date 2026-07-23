/*
Question: Revising Aggregations - Averages
Query the average population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER
*/

-- Answer (Method 1: Standard AVG - Your Solution):
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

/*
-- Method 2: High-Precision AVG and NULL Handling (T-SQL Best Practice)
-- In SQL Server, AVG() on an integer column performs integer math (truncating decimals).
-- Multiplying by 1.0 forces decimal division for a much more precise average. 
-- ISNULL() ensures the query returns 0 instead of NULL if no cities match.
SELECT ISNULL(AVG(POPULATION * 1.0), 0)
FROM CITY
WHERE DISTRICT = 'California';
*/