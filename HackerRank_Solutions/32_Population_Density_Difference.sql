/*
Question: Population Density Difference
Query the difference between the maximum and minimum populations in CITY.

Input Format

The CITY table is described as follows:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER
*/

-- Answer (Method 1: Direct Subtraction - Your Solution):
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

/*
-- Method 2: Handling Empty Tables (T-SQL Defensive Programming)
-- If the CITY table is completely empty, MAX() and MIN() return NULL. 
-- Wrapping them in ISNULL() ensures that an empty table safely returns 0 instead of NULL.
SELECT ISNULL(MAX(POPULATION), 0) - ISNULL(MIN(POPULATION), 0)
FROM CITY;
*/