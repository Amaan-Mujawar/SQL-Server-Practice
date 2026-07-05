--select * from employees;

--create table Former_Employees (
--	EmployeeID int,
--	FullName varchar(50),
--	Salary decimal(10,2),
--	Department varchar(20),
--	City varchar(20),
--	Left_Date Date,
--	IsActive bit
--);

--INSERT INTO Former_Employees
--(EmployeeID, FullName, Salary, Department, City, Left_Date, IsActive)
--VALUES
--(101, 'Rahul Sharma',      55000.00, 'HR',         'Pune',       '2024-01-15', 0),
--(102, 'Priya Patel',       72000.50, 'IT',         'Mumbai',     '2023-11-20', 0),
--(103, 'Amit Verma',        68000.00, 'Finance',    'Delhi',      '2024-03-10', 0),
--(104, 'Sneha Kulkarni',    61000.75, 'Marketing',  'Pune',       '2023-09-05', 0),
--(105, 'Rohan Mehta',       80000.00, 'IT',         'Bengaluru',  '2024-02-28', 0),
--(106, 'Neha Joshi',        59000.25, 'HR',         'Nagpur',     '2023-12-18', 0),
--(107, 'Karan Singh',       95000.00, 'Sales',      'Delhi',      '2024-04-12', 0),
--(108, 'Anjali Deshmukh',   70000.00, 'Finance',    'Pune',       '2023-10-30', 0),
--(109, 'Vikram Rao',        87000.50, 'IT',         'Hyderabad',  '2024-05-22', 0),
--(110, 'Pooja Nair',        64000.00, 'Marketing',  'Chennai',    '2024-06-01', 0);

--select * from Employees;
--select * from Former_Employees;

--Select EmployeeID, FullName
--from Employees

--UNION

--Select EmployeeID, FullName
--from Former_Employees;

--select Department 
--from Employees

--UNION

--select Department
--from Former_Employees;

--select Department
--from Employees

--UNION ALL

--select Department
--from Former_Employees;

--select Department
--from Employees

--Intersect

--select Department
--from Former_Employees;

--select Department
--from Former_Employees

--Except

--select Department
--from Employees;

--select FullName
--from Employees

--UNION

--select FullName
--from Former_Employees

--Order by FullName;

--UPDATE Employees
--SET FullName = 'Amaan Mujawar'
--WHERE FullName = 'Amaan';

--UPDATE Employees
--SET FullName = 'Rahul Sharma'
--WHERE FullName = 'Rahul';

--UPDATE Employees
--SET FullName = 'Priya Patel'
--WHERE FullName = 'Priya';

--UPDATE Employees
--SET FullName = 'Neha Joshi'
--WHERE FullName = 'Neha';

--UPDATE Employees
--SET FullName = 'Amit Verma'
--WHERE FullName = 'Amit';

--CREATE TABLE Contract_Employees (
--    EmployeeID INT,
--    FullName VARCHAR(50),
--    Salary DECIMAL(10,2),
--    Department VARCHAR(20),
--    City VARCHAR(20),
--    Contract_End_Date DATE,
--    IsActive BIT
--);

--INSERT INTO Contract_Employees
--(EmployeeID, FullName, Salary, Department, City, Contract_End_Date, IsActive)
--VALUES
--(201, 'Amaan Mujawar',     52000.00, 'IT',        'Pune',      '2026-12-31', 1),
--(202, 'Rahul Sharma',      58000.00, 'HR',        'Mumbai',    '2026-10-15', 1),
--(203, 'Priya Patel',       75000.00, 'IT',        'Pune',      '2027-03-20', 1),
--(204, 'Sneha Kulkarni',    62000.00, 'Marketing', 'Pune',      '2026-09-30', 1),
--(205, 'Vikram Rao',        89000.00, 'IT',        'Hyderabad', '2027-01-10', 1),
--(206, 'Karan Singh',       92000.00, 'Sales',     'Delhi',     '2026-11-25', 1),
--(207, 'Ritika Shah',       61000.00, 'Finance',   'Ahmedabad', '2027-02-15', 1),
--(208, 'Arjun Kumar',       57000.00, 'Support',   'Chennai',   '2026-08-18', 1),
--(209, 'Pooja Nair',        65000.00, 'Marketing', 'Chennai',   '2027-04-05', 1),
--(210, 'Mohit Agarwal',     70000.00, 'IT',        'Noida',     '2026-12-20', 1);

--select FullName
--from Employees

--UNION

--select FullName
--from Former_Employees

--UNION 

--select FullName
--from Contract_Employees;

--select FullName
--from Employees

--UNION ALL

--select FullName
--from Former_Employees

--UNION ALL

--select FullName
--from Contract_Employees;

--select FullName
--from Employees

--INTERSECT

--select FullName
--from Former_Employees

--INTERSECT 

--select FullName
--from Contract_Employees;

--SELECT FullName 
--FROM Contract_Employees

--EXCEPT

--SELECT FullName 
--FROM Employees

--EXCEPT

--SELECT FullName 
--FROM Former_Employees;

--select FullName 
--from Employees

--UNION

--select FullName
--from Former_Employees

--EXCEPT 

--select FullName
--from Contract_Employees;

/*
--Practice Exercises
Create:

	CurrentEmployees
EmployeeID		Name
	1			Amaan
	2			Rahul
	3			Priya

	FormerEmployees
EmployeeID		Name
	3			Priya
	4			Neha
	5			Amit

Tasks:
1. Use UNION.
2. Use UNION ALL.
3. Find common employees using INTERSECT.
4. Find employees only in CurrentEmployees using EXCEPT.
*/

--create table CurrentEmployees (
--	EmployeeID int,
--	Name varchar(50)
--);

--create table FormerEmployees (
--	EmployeeID int,
--	Name varchar(50)
--);

--insert into CurrentEmployees values (1, 'Amaan'), (2, 'Rahul'), (3, 'Priya');

--insert into FormerEmployees values (3, 'Priya'), (4, 'Neha'), (5, 'Amit');

--select EmployeeID, Name
--from CurrentEmployees

--UNION

--select EmployeeID, Name
--from FormerEmployees;

--select EmployeeID, Name
--from CurrentEmployees

--UNION ALL

--select EmployeeID, Name
--from FormerEmployees;

--select EmployeeID, Name
--from CurrentEmployees

--INTERSECT

--select EmployeeID, Name
--from FormerEmployees;

--select EmployeeID, Name
--from CurrentEmployees

--EXCEPT

--select EmployeeID, Name
--from FormerEmployees;