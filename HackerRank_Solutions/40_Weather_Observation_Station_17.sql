/*
Question: Weather Observation Station 17
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

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

-- Answer (Method 1: Using TOP 1 and ORDER BY ASC - Your Solution):
SELECT TOP 1 CAST(ROUND(LONG_W, 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC;

/*
-- Method 2: Using a Subquery (ANSI SQL Standard Alternative)
-- This approach finds the exact minimum LAT_N in a subquery first, 
-- then uses that exact value in the outer query's WHERE clause to fetch the LONG_W.
SELECT CAST(ROUND(LONG_W, 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
*/