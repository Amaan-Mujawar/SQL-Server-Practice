--select * from sys.tables;

--create procedure sp_GetEmployee
--As
--Begin
--	select *
--	from Employees
--END;

--exec sp_GetEmployee;

--OR

--EXECUTE sp_GetEmployee;

--Creating a Stored Procedure:
--CREATE PROCEDURE ProcedureName
--AS
--BEGIN

--    SQL Statements

--END;

--ALTER PROCEDURE sp_GetEmployee
--AS
--BEGIN
--	select *
--	from Employees
--	Where IsActive = 1;
--END;

--exec sp_GetEmployee;

--drop procedure sp_GetEmployee;

--create procedure sp_GetEmployeeByID

--	@EmployeeID int

--As
--Begin
--	select *
--	from Employees
--	where EmployeeID = @EmployeeID
--END;

--exec sp_GetEmployeeByID 1;

--OR

--EXEC sp_GetEmployeeById
--    @EmployeeID = 2;

--create procedure sp_GetEmployeeByDeptSalary
--	@Department varchar(50),
--	@Salary decimal(10,2)
--AS
--BEGIN
--	select *
--	from Employees
--	where Department = @Department 
--	AND Salary = @Salary
--END;

--exec sp_GetEmployeeByDeptSalary 'IT', 50000;

--alter procedure sp_GetEmployeeByDeptSalary
--	@Department varchar(50),
--	@Salary decimal(10,2)
--AS
--BEGIN
--	select *
--	from Employees
--	where Department = @Department 
--	AND Salary >= @Salary
--END;

--exec sp_GetEmployeeByDeptSalary 'IT', 30000;

--create procedure sp_CountEmployees
--	@TotalEmployees int output
--As
--Begin
--	select @TotalEmployees = count(*)
--	from Employees
--End;

--declare @count int;

--exec sp_CountEmployees
--	@count output;

--select @count;

--select * from Employees;

--CREATE PROCEDURE sp_InsertEmployee

--    @FullName NVARCHAR(100),
--    @Salary DECIMAL(10,2)

--AS
--BEGIN

--    INSERT INTO Employees
--    (
--        FullName,
--        Salary
--    )
--    VALUES
--    (
--        @FullName,
--        @Salary
--    );

--END;

--ALTER PROCEDURE sp_InsertEmployee

--    @FullName NVARCHAR(100),
--    @Salary DECIMAL(10,2),
--    @Department Varchar(50),
--    @City varchar(50),
--    @Join_Date date,
--    @IsActive bit

--AS
--BEGIN
--    INSERT INTO Employees
--    (
--        FullName,
--        Salary,
--        Department,
--        City,
--        Join_Date,
--        IsActive
--    )
--    VALUES
--    (
--        @FullName,
--        @Salary,
--        @Department,
--        @City,
--        @Join_Date,
--        @IsActive
--    );
--END;

--EXEC sp_InsertEmployee

--    'Rushikesh',
--    50000,
--    'Finance',
--    'Beed',
--    '2024-11-02',
--    1;

--CREATE PROCEDURE sp_UpdateEmployee

--    @EmployeeID INT,
--    @Salary DECIMAL(10,2)

--AS
--BEGIN

--    UPDATE Employees
--    SET Salary = @Salary
--    WHERE EmployeeID = @EmployeeID;

--END;

--exec sp_UpdateEmployee 1, 85000;

--select * from Employees;

--CREATE PROCEDURE sp_DeleteEmployee

--    @EmployeeID INT

--AS
--BEGIN

--    DELETE FROM Employees
--    WHERE EmployeeID = @EmployeeID;

--END;

--exec sp_DeleteEmployee 8;

--CREATE PROCEDURE sp_GetDashboardData
--AS
--BEGIN

--    SELECT *
--    FROM Employees;

--    SELECT *
--    FROM FormerEmployees;

--END;

--exec sp_GetDashboardData;

--create procedure sp_Test
--AS
--BEGIN
--	DECLARE @Bonus int;

--	Set @Bonus = 5000;

--	Select @Bonus;
--END;

--exec sp_Test;

--CREATE PROCEDURE sp_CheckSalary

--    @Salary DECIMAL(10,2)

--AS
--BEGIN

--    IF @Salary >= 50000
--        SELECT 'High Salary';

--    ELSE
--        SELECT 'Low Salary';

--END;

--exec sp_CheckSalary 60000;

--SELECT

--CASE

--    WHEN Salary >= 70000
--    THEN 'A'

--    ELSE 'B'

--END

--FROM Employees;

--BEGIN TRY

--    INSERT INTO Employees
--    VALUES (...);

--END TRY

--BEGIN CATCH

--    SELECT ERROR_MESSAGE();

--END CATCH;

--BEGIN TRY

--    SELECT 10 / 0;

--END TRY

--BEGIN CATCH

--    SELECT ERROR_MESSAGE();

--END CATCH;

--CREATE PROCEDURE sp_TransferMoney
--AS
--BEGIN

--    BEGIN TRANSACTION;

--    UPDATE Account
--    SET Balance = Balance - 1000
--    WHERE AccountID = 1;

--    UPDATE Account
--    SET Balance = Balance + 1000
--    WHERE AccountID = 2;

--    COMMIT;

--END;

--CREATE PROCEDURE sp_Login

--    @Email VARCHAR(100),
--    @Password VARCHAR(100)

--AS
--BEGIN

--    SELECT *
--    FROM Users
--    WHERE Email = @Email
--      AND Password = @Password;

--END;

--CREATE PROCEDURE sp_SearchEmployee

--    @Name VARCHAR(100)

--AS
--BEGIN

--    SELECT *
--    FROM Employees
--    WHERE FullName LIKE '%' + @Name + '%';

--END;

--exec sp_SearchEmployee 'Amaan';

--CREATE PROCEDURE sp_DashboardCount
--AS
--BEGIN

--    SELECT COUNT(*)
--    FROM Employees;

--END;

--exec sp_DashboardCount;