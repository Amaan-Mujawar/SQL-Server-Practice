/*
Question: Weather Observation Station 18
Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

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

-- Answer (Method 1: Your Solution):
-- This cleverly works because MIN - MAX is always negative, allowing a single ABS() to wrap the entire equation.
SELECT ABS(CAST(ROUND(((MIN(LAT_N) - MAX(LAT_N)) + (MIN(LONG_W) - MAX(LONG_W))), 4) AS DECIMAL(14, 4)))
FROM STATION;

/*
-- Method 2: Standard Manhattan Distance Formula (T-SQL Best Practice)
-- The formal formula is |a - c| + |b - d|. 
-- Applying ABS() independently to the Latitude difference and Longitude difference 
-- guarantees accuracy regardless of the coordinate values or subtraction order.
SELECT CAST(
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W))
    , 4) 
AS DECIMAL(14, 4))
FROM STATION;
*/