/*
Question: Revising Aggregations - The Count Function
Query a count of the number of cities in CITY having a Population larger than 100,000.

Input Format

The CITY table is described as follows:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER
*/

-- Answer (Method 1: Using COUNT(Column) - Your Solution):
SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000;

/*
-- Method 2: Using COUNT(*) (T-SQL Best Practice)
-- COUNT(*) is highly optimized in SQL Server. It simply counts the rows that meet the WHERE condition without having to check the specific column for NULL values.
SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;
*/