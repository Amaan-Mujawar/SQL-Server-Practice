/* ==========================================
   COMMON TABLE EXPRESSIONS (CTEs)
========================================== */

-- 1. Basic CTE
;WITH EmployeeData AS (
	SELECT 
		employee_id,
		first_name,
		salary
	FROM employee_data 
)
SELECT * 
FROM EmployeeData
WHERE salary > 50000;
GO

/* 
Syntax Reminder:
;WITH CTE_Name AS (
    -- Your Query Here
)
SELECT * FROM CTE_Name;
*/

-- 2. CTE for Filtering
;WITH HighSalaryEmployee AS (
	SELECT *
	FROM employee_data
	WHERE salary > 70000
)
SELECT * 
FROM HighSalaryEmployee;
GO

SELECT * FROM sys.tables;
GO

-- 3. Multiple CTEs in a single statement (separated by commas)
;WITH EmployeeData AS (
	SELECT *
	FROM employee_data
), 
DepartmentData AS (
	SELECT *
	FROM department_data
)
SELECT * 
FROM DepartmentData;
GO

-- 4. Using Joins inside a CTE
;WITH EmployeeReport AS (
	SELECT 
		e.employee_id,
		e.first_name,
		d.department_id,
		d.department_name
	FROM employee_data e
	INNER JOIN department_data d
		ON e.department_id = d.department_id
)
SELECT * 
FROM EmployeeReport;
GO

/* ==========================================
   RECURSIVE CTEs (For Hierarchical Data)
========================================== */

SELECT * FROM employee_manager;
GO

-- Setup data for recursion test
DELETE FROM employee_manager WHERE employee_id = 3;
INSERT INTO employee_manager (employee_id, employee_post, manager_id)
VALUES 
    (3, 'Team Lead', 2), 
    (4, 'Developer', 3);
GO

-- 5. Recursive CTE
;WITH EmployeeHierarchy AS (
    -- Anchor Member (The top of the hierarchy, where manager_id is NULL)
	SELECT
		employee_id,
		employee_post,
		manager_id
	FROM employee_manager
	WHERE manager_id IS NULL

	UNION ALL

    -- Recursive Member (Joins back to the CTE itself to find direct reports)
	SELECT
		E.employee_id,
		E.employee_post,
		E.manager_id
	FROM employee_manager E
	INNER JOIN EmployeeHierarchy EH
		ON E.manager_id = EH.employee_id
)
SELECT * 
FROM EmployeeHierarchy;
GO

/* ==========================================
   TEMPORARY TABLES (Local & Global)
========================================== */

-- 6. Local Temp Table (Prefix: #)
-- Exists only for the duration of the current connection/session
DROP TABLE IF EXISTS #EmployeeTemp;

CREATE TABLE #EmployeeTemp (
	EmployeeID INT,
	FullName VARCHAR(100)
);

INSERT INTO #EmployeeTemp VALUES (1, 'JOHN SMITH');

SELECT * FROM #EmployeeTemp;
GO

-- 7. Using SELECT INTO to create and populate a Temp Table on the fly
DROP TABLE IF EXISTS #DepartmentTemp;
SELECT * 
INTO #DepartmentTemp
FROM department_data;

SELECT * FROM #DepartmentTemp;
GO

-- 8. Dropping and re-creating temp tables dynamically
DROP TABLE IF EXISTS #Employee;
SELECT * 
INTO #Employee
FROM employee_data;

DROP TABLE #Employee;
GO

DROP TABLE IF EXISTS #ITEmployee;
SELECT * 
INTO #ITEmployee
FROM employee_data
WHERE department = 'IT';

SELECT * FROM #ITEmployee;
GO

-- 9. Global Temp Table (Prefix: ##)
-- Visible to ALL sessions/connections, dropped when the last referencing session closes
DROP TABLE IF EXISTS ##GlobalTemp;

CREATE TABLE ##GlobalTemp (
	EmployeeID INT,
	FullName VARCHAR(100)
);
GO

/* ==========================================
   TABLE VARIABLES
========================================== */

-- 10. Table Variable (Prefix: @)
-- Exists strictly in memory during the execution of the batch.
-- Highly optimized for small datasets.
DECLARE @EmployeeTable TABLE (
	EmployeeID INT,
	FullName VARCHAR(100)
);

INSERT INTO @EmployeeTable (EmployeeID, FullName)
VALUES (1, 'John Snow');

SELECT * FROM @EmployeeTable;
GO