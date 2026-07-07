/*
Question: Weather Observation Station 10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:
        STATION
Field           Type
ID              NUMBER
CITY            VARCHAR2(21)
STATE           VARCHAR2(2)
LAT_N           NUMBER
LONG_W          NUMBER
*/

-- Answer (Method 1: Using NOT LIKE - Clean and Intuitive):
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%[aeiou]';

/*
-- Method 2: Using the Negation Caret (^) inside Character Class
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%[^aeiou]';
*/