/*
Question: Weather Observation Station 12
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:
        STATION
Field           Type
ID              NUMBER
CITY            VARCHAR2(21)
STATE           VARCHAR2(2)
LAT_N           NUMBER
LONG_W          NUMBER
*/

-- Answer (Method 1: Using AND with NOT LIKE - Recommended):
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[aeiou]%' AND CITY NOT LIKE '%[aeiou]';

/*
-- Method 2: Using the Negation Caret (^) inside Character Class
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[^aeiou]%' AND CITY LIKE '%[^aeiou]';

-- Method 3: Using De Morgan's Law (Negating the OR condition directly)
SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE '[aeiou]%' OR CITY LIKE '%[aeiou]');
*/