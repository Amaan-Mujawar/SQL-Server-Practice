-- 1. Base Table Exploration
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'Base Table';

SELECT * 
FROM employee_data 
WHERE employee_id = 1001;
GO

/* ==========================================
   BASIC AUDITING (AFTER TRIGGERS)
========================================== */

-- Create initial Audit Table
CREATE TABLE EmployeeAudit (
	AuditID INT IDENTITY(1, 1),
	Message VARCHAR(200)
);
GO

SELECT * FROM EmployeeAudit;
GO

-- AFTER INSERT Trigger
CREATE OR ALTER TRIGGER trg_AfterEmployeeInsert
ON employee_data
AFTER INSERT
AS 
BEGIN
	PRINT 'Employee Inserted';
	INSERT INTO EmployeeAudit (Message)
	VALUES ('New Employee Added');
END;
GO

-- Test INSERT Trigger
INSERT INTO employee_data VALUES (1001, 'Alex', 'Ketchem', 'alex99@gmail.com', 'IT', 83258.1221, '2022-02-02', 23);
GO

-- AFTER UPDATE Trigger
CREATE OR ALTER TRIGGER trg_AfterEmployeeUpdate
ON employee_data
AFTER UPDATE
AS
BEGIN
	PRINT 'Employee Updated';
	INSERT INTO EmployeeAudit(Message)
	VALUES ('Employee Updated');
END;
GO

-- Test UPDATE Trigger
UPDATE employee_data
SET salary = 78929.52819
WHERE employee_id = 1001;
GO

-- AFTER DELETE Trigger
CREATE OR ALTER TRIGGER trg_AfterEmployeeDelete
ON employee_data
AFTER DELETE
AS
BEGIN
	PRINT 'Employee Deleted';
	INSERT INTO EmployeeAudit(Message)
	VALUES ('Employee Deleted');
END;
GO

/* ==========================================
   MANAGING TRIGGERS (DISABLE / ENABLE)
========================================== */
DISABLE TRIGGER trg_AfterEmployeeInsert ON employee_data;
DISABLE TRIGGER trg_AfterEmployeeUpdate ON employee_data;
DISABLE TRIGGER trg_AfterEmployeeDelete ON employee_data;
GO

/* ==========================================
   INTERCEPTING ACTIONS (INSTEAD OF TRIGGERS)
========================================== */
TRUNCATE TABLE EmployeeAudit;
GO

-- INSTEAD OF DELETE Trigger (Prevents Deletion)
CREATE OR ALTER TRIGGER trg_PreventDelete 
ON employee_data
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Employee Deletion not allowed';
END;
GO

-- Test INSTEAD OF Trigger
DELETE FROM employee_data WHERE employee_id = 1001;
SELECT * FROM employee_data;
GO

DISABLE TRIGGER trg_PreventDelete ON employee_data;
DELETE FROM employee_data WHERE employee_id = 1001;
GO

/* ==========================================
   ADVANCED AUDITING (Using inserted/deleted tables)
========================================== */
DROP TABLE EmployeeAudit;
GO

-- Create detailed Audit Table
CREATE TABLE EmployeeAudit (
	AuditID INT IDENTITY(1,1),
	employee_id INT,
    OldSalary DECIMAL(19,9),
    NewSalary DECIMAL(19,9),
    ChangeDate DATETIME
);
GO

-- Trigger to track exact salary changes
CREATE OR ALTER TRIGGER trg_EmployeeDetailsAudit 
ON employee_data
AFTER UPDATE
AS
BEGIN
	INSERT INTO EmployeeAudit (
		employee_id,
		OldSalary,
		NewSalary,
		ChangeDate
	)
	SELECT
		D.employee_id,
		D.salary,
		I.salary,
		GETDATE()
	FROM deleted D
	INNER JOIN inserted I
	    ON D.employee_id = I.employee_id;
END;
GO

-- Test Detailed Audit Trigger
UPDATE employee_data
SET salary = 78929.52819
WHERE employee_id = 1001;

SELECT * FROM employee_data WHERE employee_id = 1001;
SELECT * FROM EmployeeAudit;
GO

/* ==========================================
   BUSINESS LOGIC ENFORCEMENT (ROLLBACK)
========================================== */

-- Trigger to prevent salary reductions
CREATE OR ALTER TRIGGER trg_PreventSalaryReduction
ON employee_data
AFTER UPDATE
AS
BEGIN
	IF EXISTS (
		SELECT 1
		FROM inserted I
		INNER JOIN deleted D
			ON I.employee_id = D.employee_id
		WHERE I.salary < D.salary
	)
	BEGIN
		RAISERROR (
			'Salary cannot be reduced',
			16,
			1
		);
		ROLLBACK TRANSACTION;
	END
END;
GO

-- Check System Triggers Metadata
SELECT * FROM sys.triggers;
GO