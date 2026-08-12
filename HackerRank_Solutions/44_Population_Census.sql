/*
Question: Population Census
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Input Format

The CITY and COUNTRY tables are described as follows:

CITY Table:
Field           Type
ID              NUMBER
NAME            VARCHAR2(17)
COUNTRYCODE     VARCHAR2(3)
DISTRICT        VARCHAR2(20)
POPULATION      NUMBER

COUNTRY Table:
Field           Type
CODE            VARCHAR2(3)
NAME            VARCHAR2(44)
CONTINENT       VARCHAR2(13)
REGION          VARCHAR2(25)
SURFACEAREA     NUMBER
INDEPEYEAR      VARCHAR2(5)
POPULATION      NUMBER
LIFEEXPECTANCY  VARCHAR2(4)
GNP             NUMBER
GNPOID          VARCHAR2(9)
LOCALNAME       VARCHAR2(44)
GOVERNMENTFORM  VARCHAR2(45)
HEADOFSTATE     VARCHAR2(32)
CAPITAL         VARCHAR2(4)
CODE2           VARCHAR2(2)
*/

-- Answer (Method 1: Standard INNER JOIN - Your Solution):
SELECT SUM(C.POPULATION)
FROM CITY C
INNER JOIN COUNTRY CC
    ON C.COUNTRYCODE = CC.CODE
WHERE CC.CONTINENT = 'Asia';

/*
-- Method 2: Handling NULLs (T-SQL Defensive Programming)
-- If no cities match the criteria (e.g., if 'Asia' was misspelled), SUM() returns NULL. 
-- Wrapping it in ISNULL() ensures that your backend application safely receives a 0 instead.
SELECT ISNULL(SUM(C.POPULATION), 0)
FROM CITY C
INNER JOIN COUNTRY CC
    ON C.COUNTRYCODE = CC.CODE
WHERE CC.CONTINENT = 'Asia';
*/