/*
Question: Weather Observation Station 11
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:
        STATION
Field           Type
ID              NUMBER
CITY            VARCHAR2(21)
STATE           VARCHAR2(2)
LAT_N           NUMBER
LONG_W          NUMBER
*/

-- Answer (Method 1: Using OR with NOT LIKE - Recommended):
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[aeiou]%' OR CITY NOT LIKE '%[aeiou]';

/*
-- Method 2: Using the Negation Caret (^)
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[^aeiou]%' OR CITY LIKE '%[^aeiou]';

-- Method 3: Using De Morgan's Law (Negating the AND condition directly)
SELECT DISTINCT CITY
FROM STATION
WHERE NOT (CITY LIKE '[aeiou]%' AND CITY LIKE '%[aeiou]');
*/