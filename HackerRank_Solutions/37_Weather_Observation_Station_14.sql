/*
Question: Weather Observation Station 14
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

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
SELECT TOP 1 CAST(ROUND(LAT_N, 4, 1) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N < 137.2345
GROUP BY LAT_N
ORDER BY LAT_N DESC;

/*
-- Method 2: Using the MAX() Aggregate Function (Standard Alternative)
-- This approach uses the built-in MAX() function to find the greatest value, 
-- eliminating the need for GROUP BY and ORDER BY clauses.
SELECT CAST(ROUND(MAX(LAT_N), 4, 1) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N < 137.2345;
*/