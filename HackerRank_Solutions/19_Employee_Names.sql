/*
Question: Employee Names
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Input Format

The Employee table containing employee data for a company is described as follows:

Field           Type
employee_id     Integer
name            String
months          Integer
salary          Integer

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Input

(Sample Data Omitted by HackerRank Image)

Sample Output

Angela
Bonnie
Frank
Joe
Kimberly
Lisa
Michael
Patrick
Rose
Todd
*/

-- Answer (Method 1: Explicit Ascending Sort - Recommended for Readability):
SELECT name
FROM Employee
ORDER BY name ASC;

/*
-- Method 2: Implicit Ascending Sort (T-SQL Default Behavior)
-- In SQL Server, ORDER BY defaults to Ascending (ASC) if no direction is specified.
SELECT name
FROM Employee
ORDER BY name;
*/