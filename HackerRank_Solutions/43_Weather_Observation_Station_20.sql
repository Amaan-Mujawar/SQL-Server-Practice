/*
Question: Weather Observation Station 20
A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal 
places.

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

-- Answer (Method 1: Your Solution - Works for Odd-Numbered Datasets):
WITH OrderedData AS (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS RowNum,
        COUNT(*) OVER() AS TotalRows
    FROM STATION
)
SELECT CAST(ROUND(LAT_N, 4) AS DECIMAL(14, 4))
FROM OrderedData
WHERE RowNum = (TotalRows + 1) / 2;

/*
-- Method 2: Robust CTE (Handles both Even and Odd row counts)
-- If a table has an even number of rows, the median is the average of the two middle numbers.
-- By checking if RowNum is IN either of the two middle integer positions and using AVG(), 
-- this query guarantees a perfect median regardless of the table size.
WITH OrderedData AS (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS RowNum,
        COUNT(*) OVER() AS TotalRows
    FROM STATION
)
SELECT CAST(ROUND(AVG(LAT_N), 4) AS DECIMAL(14, 4))
FROM OrderedData
WHERE RowNum IN ((TotalRows + 1) / 2, (TotalRows + 2) / 2);

-- Method 3: PERCENTILE_CONT (Modern T-SQL Best Practice)
-- PERCENTILE_CONT(0.5) is a built-in window function that mathematically calculates 
-- the 50th percentile (the exact median), automatically handling even/odd splits.
SELECT TOP 1 CAST(ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LAT_N) OVER (), 4) AS DECIMAL(14, 4))
FROM STATION;
*/