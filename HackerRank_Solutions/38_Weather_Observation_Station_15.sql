/*
Question: Weather Observation Station 15
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

Input Format

The STATION table is described as follows:
Field           Type
ID              NUMBER
CITY            VARCHAR2(21)
STATE           VARCHAR2(2)
LAT_N           NUMBER
LONG_W          NUMBER

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

-- Answer (Method 1: Using TOP 1 and ORDER BY - Your Solution):
SELECT TOP 1 CAST(ROUND(LONG_W, 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC;

/*
-- Method 2: Using a Subquery (ANSI SQL Standard Alternative)
-- This approach finds the exact maximum LAT_N in a subquery first, 
-- then uses that exact value in the outer query's WHERE clause to fetch the LONG_W.
SELECT CAST(ROUND(LONG_W, 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345
);
*/