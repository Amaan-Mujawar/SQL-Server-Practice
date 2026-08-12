/*
Question: African Cities
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

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
SELECT C.NAME
FROM CITY C
INNER JOIN COUNTRY CC
    ON C.COUNTRYCODE = CC.CODE
WHERE CC.CONTINENT = 'Africa';

/*
-- Method 2: Using an IN Subquery (T-SQL Alternative)
-- When you only need to select data from ONE table, using an IN subquery 
-- instead of an INNER JOIN can sometimes be easier to read and prevents 
-- accidental duplicate rows if the joined table has a one-to-many relationship.
SELECT NAME
FROM CITY
WHERE COUNTRYCODE IN (
    SELECT CODE
    FROM COUNTRY
    WHERE CONTINENT = 'Africa'
);
*/