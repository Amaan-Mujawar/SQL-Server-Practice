/*
Question: The PADS
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of occurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

Input Format

The OCCUPATIONS table is described as follows: 
Field           Type
Name            String
Occupation      String

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Output

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

Explanation

The results of the first query are formatted to the problem description's specifications.
The results of the second query are ascendingly ordered first by number of names corresponding to each profession (2, 2, 3, and 3), and then alphabetically by profession (doctors, singers, actors, and professors).
*/

-- Answer (Method 1: Using CONCAT and LEFT - Modern & Recommended):
SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS NameWithOccupation
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS OccupationCount
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*) ASC, Occupation ASC;

/*
-- Method 2: Using the + Operator and SUBSTRING (Legacy T-SQL Alternative)
-- Note: When using +, integers like COUNT(*) must be explicitly CAST to VARCHAR.
SELECT Name + '(' + SUBSTRING(Occupation, 1, 1) + ')'
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT 'There are a total of ' + CAST(COUNT(*) AS VARCHAR) + ' ' + LOWER(Occupation) + 's.'
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*) ASC, Occupation ASC;
*/