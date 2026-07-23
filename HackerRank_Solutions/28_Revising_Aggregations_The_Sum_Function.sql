/*
Question: Revising Aggregations - The Sum Function
Query the total population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER
*/

-- Answer (Method 1: Standard SUM - Your Solution):
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

/*
-- Method 2: Handling NULLs (T-SQL Best Practice)
-- If no cities match the WHERE clause, SUM() returns NULL. ISNULL() ensures the query returns 0 instead, avoiding null-reference errors in applications.
SELECT ISNULL(SUM(POPULATION), 0)
FROM CITY
WHERE DISTRICT = 'California';
*/