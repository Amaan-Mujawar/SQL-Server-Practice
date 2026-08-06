/*
Question: Top Earners
We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

Input Format

The Employee table containing employee data for a company is described as follows:
Field           Type
employee_id     Integer
name            String
months          Integer
salary          Integer

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Output
69952 1

Explanation
The maximum earnings value is 69952. The only employee with earnings 69952 is Kimberly, so we print the maximum earnings value (69952) and a count of the number of employees who have earned 69952 (which is 1) as two space-separated values.
*/

-- Answer (Method 1: Using a Subquery - Your Solution):
SELECT MAX(salary * months), COUNT(*)
FROM Employee
WHERE salary * months = (SELECT MAX(salary * months) FROM Employee);

/*
-- Method 2: Using GROUP BY and TOP 1 (High-Performance T-SQL Alternative)
-- This approach groups the employees by their total earnings, orders them from highest to lowest, 
-- and simply grabs the very first row. This requires only a single scan of the table!
SELECT TOP 1 (salary * months) AS max_earnings, COUNT(*)
FROM Employee
GROUP BY (salary * months)
ORDER BY max_earnings DESC;
*/