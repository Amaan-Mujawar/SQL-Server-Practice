/*
Question: Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

The STATION table is described as follows:
        STATION
Field           Type
ID              NUMBER
CITY            VARCHAR2(21)
STATE           VARCHAR2(2)
LAT_N           NUMBER
LONG_W          NUMBER
*/

-- Answer (Method 1: Using AND - Clean and Readable):
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[aeiou]%' AND CITY LIKE '%[aeiou]';

/*
-- Method 2: Single Pattern Matching
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[aeiou]%[aeiou]';
*/