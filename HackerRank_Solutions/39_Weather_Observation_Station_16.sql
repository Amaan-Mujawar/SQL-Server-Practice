/*
Question: Weather Observation Station 16
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

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

-- Answer (Method 1: Using MIN Aggregate Function - Your Solution):
SELECT CAST(ROUND(MIN(LAT_N), 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N > 38.7780;

/*
-- Method 2: Using TOP 1 and ORDER BY ASC (T-SQL Alternative)
-- Instead of using the MIN() aggregate, this approach sorts all valid latitudes 
-- from smallest to largest (ASC) and simply grabs the first row. 
-- If there is a clustered or non-clustered index on LAT_N, this executes instantly.
SELECT TOP 1 CAST(ROUND(LAT_N, 4) AS DECIMAL(12, 4))
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC;
*/