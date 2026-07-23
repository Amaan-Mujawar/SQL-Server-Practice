/*
Question: Average Population
Query the average population for all cities in CITY, rounded down to the nearest integer.

Input Format

The CITY table is described as follows:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER
*/

-- Answer (Method 1: Explicitly using FLOOR - Recommended T-SQL Best Practice):
-- FLOOR() mathematically guarantees the value is rounded down to the nearest integer, regardless of the underlying data type.
SELECT FLOOR(AVG(CAST(POPULATION AS FLOAT)))
FROM CITY;

/*
-- Method 2: Implicit Integer Truncation (Your Solution)
-- In SQL Server, if POPULATION is stored as an integer, AVG() will automatically perform integer division. 
-- This drops the decimal places completely, which happens to satisfy the "round down" requirement for positive numbers.
SELECT AVG(POPULATION)
FROM CITY;
*/