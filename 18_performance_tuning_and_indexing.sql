-- 1. Base Table and System View Exploration
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'Base Table';

SELECT * FROM sys.tables;
SELECT * FROM employee_data;
GO

/* ==========================================
   CLUSTERED INDEX
========================================== */
-- Note: A table can only have ONE Clustered Index, as it dictates the physical sort order of the rows.
-- If employee_id is set as a Primary Key, SQL Server automatically creates a clustered index for it.
DROP INDEX IF EXISTS IX_EmployeeID ON employee_data;
GO

CREATE CLUSTERED INDEX IX_EmployeeID 
ON employee_data(employee_id);
GO

/* ==========================================
   NON-CLUSTERED INDEXES
========================================== */
-- Composite Index (Multiple Columns)
DROP INDEX IF EXISTS IX_EmployeeName ON employee_data;
GO

CREATE NONCLUSTERED INDEX IX_EmployeeName 
ON employee_data(last_name, first_name);
GO

-- Testing the Composite Index (Index Seek)
SELECT * FROM employee_data WHERE last_name = 'Smith';
SELECT * FROM employee_data WHERE last_name = 'Smith' AND first_name = 'Mary';
GO

-- Single Column Indexes
DROP INDEX IF EXISTS IX_EmployeeEmail ON employee_data;
GO
CREATE NONCLUSTERED INDEX IX_EmployeeEmail ON employee_data(email);
GO

SELECT * FROM employee_data WHERE email = 'littlekyle@yahoo.com';
GO

DROP INDEX IF EXISTS IX_EmployeeDept ON employee_data;
GO
CREATE NONCLUSTERED INDEX IX_EmployeeDept ON employee_data(department);
GO

SELECT * FROM employee_data WHERE department = 'IT';
GO

DROP INDEX IF EXISTS IX_EmployeeSalary ON employee_data;
GO
CREATE NONCLUSTERED INDEX IX_EmployeeSalary ON employee_data(salary);
GO

SELECT * FROM employee_data WHERE salary = 60328.03125;
GO

DROP INDEX IF EXISTS IX_EmployeeJoinDate ON employee_data;
GO
CREATE NONCLUSTERED INDEX IX_EmployeeJoinDate ON employee_data(joining_date);
GO

SELECT * FROM employee_data WHERE joining_date = '2022-12-17';
GO

DROP INDEX IF EXISTS IX_EmployeeAge On employee_data;
GO
Create NonClustered Index IX_EmployeeAge On employee_data(age);
GO

Select * From employee_data Where age = 24;
GO

/* ==========================================
   UNIQUE & COMPOSITE INDEXES
========================================== */
-- Unique Index enforces data integrity (no duplicate emails allowed)
DROP INDEX IF EXISTS IX_Email ON employee_data;
GO
CREATE UNIQUE INDEX IX_Email 
ON employee_data(email);
GO

-- Composite Index for querying specific departments and ages
DROP INDEX IF EXISTS IX_Department_Age ON employee_data;
GO
-- Note: Renamed from IX_Department_City to IX_Department_Age to match the columns
CREATE INDEX IX_Department_Age 
ON employee_data (department, age);
GO

SELECT * 
FROM employee_data 
WHERE department = 'IT' AND age = 24;
GO

/* ==========================================
   COVERING INDEX
========================================== */
-- A Covering Index "includes" non-key columns at the leaf level, 
-- preventing expensive "Key Lookups" to the base table.
DROP INDEX IF EXISTS IX_Covering ON employee_data;
GO

CREATE NONCLUSTERED INDEX IX_Covering 
ON employee_data(employee_id) 
INCLUDE (first_name, salary);
GO

-- This query is completely "covered" by the index above
SELECT first_name, salary 
FROM employee_data 
WHERE employee_id = 17;
GO

/* ==========================================
   INDEX MAINTENANCE
========================================== */
-- REORGANIZE: Defragments the leaf level of the index (Lightweight, online operation)
ALTER INDEX IX_Department_Age ON employee_data REORGANIZE;
GO

-- REBUILD: Drops and recreates the index entirely (Heavyweight, fixes severe fragmentation)
ALTER INDEX IX_Department_Age ON employee_data REBUILD;
GO

-- View all indexes on the system
SELECT * FROM sys.indexes;
GO