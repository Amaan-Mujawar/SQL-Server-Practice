--select * from employee_data;
--select * from department_data;

--create view vw_EmployeeDetails
--As
--select
--	e.first_name,
--	e.last_name,
--	e.salary,
--	d.department_name
--from employee_data e
--Inner Join department_data d
--on e.department_id = d.department_id;

--select * 
--from vw_EmployeeDetails;

--create view vw_Employees
--as
--select first_name, salary
--from employee_data;

--alter view vw_Employees
--as
--select first_name, last_name, salary
--from employee_data;

--select *
--from vw_Employees;

--drop view vw_Employees;

--select * from Employees;

--create view vw_ActiveEmployees
--as
--select *
--from Employees
--where IsActive = 1;

--select * 
--from vw_ActiveEmployees;

--create view vw_SalaryGrade
--as
--select 
--	FullName, 
--	Salary,
--	case
--		when Salary >= 70000 then 'High'
--		when Salary >= 60000 then 'Medium'
--		else 'Low'
--	end as SalaryGrade
--from Employees;

--select *
--from vw_SalaryGrade;

--create view vw_Employees
--as
--select FullName, Salary, Department
--from Employees;

--alter view vw_Employees
--as 
--select EmployeeID, FullName, Salary, Department
--from Employees;

--Update vw_Employees
--set FullName = 'Mangesh Khose'
--where EmployeeID = 5;

--select * 
--from vw_Employees;

--select *
--from sys.tables;

--select *
--from sys.views;

--sp_helptext 'vw_Employees';

--CREATE VIEW vw_DepartmentSummary
--AS
--SELECT
--	Department,
--	COUNT(*) AS EmployeeCount
--FROM Employees
--GROUP BY Department;

--select * 
--from vw_DepartmentSummary;