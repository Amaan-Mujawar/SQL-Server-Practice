/*
Question: Japan Population
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

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
WHERE COUNTRYCODE = 'JPN';

/*
-- Method 2: Handling NULLs (T-SQL Best Practice)
-- If no cities match the WHERE clause (e.g., if the country code was mistyped), SUM() returns NULL. 
-- ISNULL() ensures the query safely returns 0 instead.
SELECT ISNULL(SUM(POPULATION), 0)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
*/