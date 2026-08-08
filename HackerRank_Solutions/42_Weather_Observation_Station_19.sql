/*
Question: Weather Observation Station 19
Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

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

-- Answer (Method 1: Using POWER and SQRT - Your Solution):
SELECT CAST(
    ROUND(
        SQRT(
            POWER((MAX(LAT_N) - MIN(LAT_N)), 2) + 
            POWER((MAX(LONG_W) - MIN(LONG_W)), 2)
        )
    , 4) 
AS DECIMAL(14, 4))
FROM STATION;

/*
-- Method 2: Using the T-SQL SQUARE() Function (Best Practice for SQL Server)
-- SQL Server provides a dedicated SQUARE() function which is slightly cleaner to read 
-- than explicitly passing the exponent 2 into the POWER() function.
SELECT CAST(
    ROUND(
        SQRT(
            SQUARE(MAX(LAT_N) - MIN(LAT_N)) + 
            SQUARE(MAX(LONG_W) - MIN(LONG_W))
        )
    , 4) 
AS DECIMAL(14, 4))
FROM STATION;
*/