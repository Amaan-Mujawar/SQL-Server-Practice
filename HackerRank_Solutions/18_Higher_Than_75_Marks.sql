/*
Question: Higher Than 75 Marks
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output 
by the last three characters of each name. If two or more students both have names ending in 
the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Input Format

The STUDENTS table is described as follows: 
Field           Type
ID              Integer
Name            String
Marks           Integer

Note: The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

Sample Output

Ashley
Julia
Belvet

Explanation

Only Ashley, Julia, and Belvet have Marks > 75. If you look at the last three characters of 
each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
*/

-- Answer (Method 1: Using RIGHT() - Cleanest and Most Efficient in T-SQL):
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(NAME, 3) ASC, ID ASC;

/*
-- Method 2: Using SUBSTRING() and LEN() (T-SQL Dynamic Indexing Alternative)
-- This calculates the starting index dynamically by subtracting 2 from the total string length:
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTRING(Name, LEN(Name) - 2, 3) ASC, ID ASC;
*/