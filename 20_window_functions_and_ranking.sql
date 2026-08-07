/* ==========================================
   BASIC WINDOW AGGREGATES (OVER Clause)
========================================== */
SELECT * FROM employee_data;
GO

-- 1. Apply an aggregate over the entire result set without collapsing rows
SELECT 
	employee_id,
	first_name,
	last_name, 
	AVG(salary) OVER() AS AverageSalary
FROM employee_data;
GO

SELECT 
	first_name,
	salary,
	COUNT(*) OVER() AS TotalEmployees
FROM employee_data;
GO

-- 2. PARTITION BY: Resets the aggregate calculation for each department
SELECT
	first_name,
	department,
	salary,
	AVG(salary) OVER(PARTITION BY department) AS AvgDeptSalary
FROM employee_data;
GO

/* ==========================================
   RANKING FUNCTIONS
========================================== */

-- 3. ROW_NUMBER(): Unique sequential integer for every row
SELECT
	first_name,
	salary,
	ROW_NUMBER() OVER(ORDER BY salary DESC) AS RowNum
FROM employee_data;
GO

-- 4. RANK(): Skips numbers if there is a tie (e.g., 1, 2, 2, 4)
SELECT
	first_name,
	salary,
	RANK() OVER(ORDER BY salary DESC) AS RankNum
FROM employee_data;
GO

-- 5. DENSE_RANK(): Never skips numbers if there is a tie (e.g., 1, 2, 2, 3)
SELECT
	first_name,
	salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS RankNo
FROM employee_data;
GO

/* ==========================================
   LEAD AND LAG (Looking Forward and Backward)
========================================== */
DROP TABLE IF EXISTS Company;
GO

CREATE TABLE Company (
	Month VARCHAR(30),
	Sales INT
);
GO

INSERT INTO Company VALUES 
	('JAN', 100),	
	('FEB', 150), 	
	('MAR', 200),	
	('APR', 250), -- Fixed typo from 'ARP'
	('MAY', 300),	
	('JUN', 400);
GO

SELECT * FROM Company;
GO

-- 6. LEAD(): Fetches the value from the NEXT row
SELECT 
	Month,
	Sales,
	LEAD(Sales) OVER(ORDER BY Sales) AS NextMonthSales
FROM Company;
GO

-- 7. LAG(): Fetches the value from the PREVIOUS row
SELECT
	Month,
	Sales,
	LAG(Sales) OVER(ORDER BY Sales) AS PreviousMonthSales
FROM Company;
GO

/* ==========================================
   PRACTICAL USE CASES (Pagination & Top N)
========================================== */

-- View Global Salary Rank
SELECT
	employee_id,
	first_name,
	last_name,
	department,
	salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS SalaryRank
FROM employee_data;
GO

-- 8. Find the Top 3 Highest Paid Employees Globally
;WITH EmployeeSalary AS (
	SELECT
		employee_id,
		first_name,
		last_name,
		department,
		salary,
		ROW_NUMBER() OVER(ORDER BY salary DESC) AS RN
	FROM employee_data
)
SELECT * 
FROM EmployeeSalary 
WHERE RN <= 3;
GO

-- 9. Backend Pagination (Fetching Rows 11 through 20)
;WITH EmployeePage AS (
	SELECT
		employee_id,
		first_name,
		last_name,
		department,
		salary,
		ROW_NUMBER() OVER(ORDER BY employee_id DESC) AS RN
	FROM employee_data
)
SELECT * 
FROM EmployeePage 
WHERE RN BETWEEN 11 AND 20;
GO

/* ==========================================
   ADVANCED RUNNING TOTALS & OFFSETS
========================================== */

-- 10. Running Total: Calculates the cumulative sum of salary row by row
SELECT
	first_name,
	last_name,
	department,
	salary,
	SUM(salary) OVER(ORDER BY employee_id) AS RunningTotal
FROM employee_data;
GO

-- 11. Compare current row to previous and next rows inline
SELECT
	first_name,
	last_name,
	department,
	salary,
	LAG(salary) OVER(ORDER BY employee_id) AS PreviousSalary,
	LEAD(salary) OVER(ORDER BY employee_id) AS NextSalary
FROM employee_data;
GO

/* ==========================================
   TOP N PER CATEGORY (Classic Interview Question)
========================================== */

-- 12. Find the Top 3 Highest Paid Employees IN EACH Department
;WITH RankedEmployees AS (
	SELECT
		first_name,
		last_name,
		department,
		salary,
		ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS RN
	FROM employee_data
)
SELECT * 
FROM RankedEmployees 
WHERE RN <= 3;
GO

-- 13. Isolate exactly the 1st, 2nd, or 3rd highest paid per department
;WITH HighestEmpDept AS (
	SELECT
		first_name,
		last_name,
		department,
		salary,
		ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS RN
	FROM employee_data
)
-- Change the WHERE clause to fetch the exact rank you want:
-- WHERE RN = 1 (Highest)
-- WHERE RN = 2 (Second Highest)
-- WHERE RN = 3 (Third Highest)
SELECT * 
FROM HighestEmpDept 
WHERE RN = 2; 
GO