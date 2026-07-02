--use practiceDB;

--alter table Employees
--add IsActive int;

--select * from Employees;

--update Employees
--set IsActive = 1
--where EmployeeID = 1;

--update Employees
--set IsActive = 0
--where EmployeeID = 2;

--update Employees
--set IsActive = 0
--where EmployeeID = 3;

--update Employees
--set IsActive = 1
--where EmployeeID = 4;

--update Employees 
--set IsActive = 1
--where EmployeeID = 5;

--select EmployeeID, 
--	case
--		when IsActive = 1 then 'Active'
--		else 'Inactive'
--	end as Employee_Status
--from Employees;

--select Salary, 
--	case
--		when Salary >= 70000 then 'A Grade'
--		when Salary >= 60000 then 'B Grade'
--		else 'C Grade'
--	end as Salary_Grade
--from Employees;

--select Salary, 
--	case 
--		when Salary >= 70000 then 'Excellent'
--		when Salary >= 50000 then 'Good'
--		else 'Okay'
--	end as Salary_type
--from Employees;

--select Department,
--	case
--		when Department = 'IT' then 1
--		when Department = 'HR' then 2
--		when Department = 'Finance' then 3
--		else 0
--	end as DepartmentID
--from Employees
--order by DepartmentID asc;

--select
--	FullName,
--	case
--		when Salary >= 50000 then 'High Salary'
--		else 'Low Salary'
--	end as Salary_status
--from Employees;

--select count(
--	case
--		when IsActive = 1 then 1
--	end
--) as ActiveEmployee
--from Employees;

--select
--	sum(
--		case
--			when Department = 'IT' then Salary
--			else 0
--		end
--	)
--	as IT_Salary
--from Employees;