--use practiceDB;

--select * from Employees
--order by Salary desc;

--SELECT *
--FROM Employees
--ORDER BY FullName
--OFFSET 0 ROWS
--FETCH NEXT 10 ROWS ONLY;

--select *
--from Employees
--order by Salary Desc
--offset 2 rows
--fetch next 1 rows only;

--select * 
--from Employees
--order by Salary Asc;

--select *
--from Employees
--order by Salary Desc;

--select Distinct Department
--from Employees;

--select top 3 *
--from Employees
--order by Salary desc;

--select top 1 *
--from Employees
--order by Salary asc;

--select * 
--from Employees
--order by Department Asc,
--	Salary Desc;

--select *
--from Employees
--order by FullName Asc
--offset 0 rows
--fetch next 5 rows only;

--select top 2 with ties *
--from Employees
--order by Salary desc;

--select count(*)
--from Employees;

--select sum(Salary) as Total_Salary
--from Employees;

--select avg(Salary) as Avg_Salary
--from Employees;

--select UPPER(FullName) As Capital_FullName
--from Employees;

--select lower(FullName) As Lower_FullName
--from Employees;

--select * from Employees;

--alter table Employees
--add Join_Date Date;

--update Employees
--set Join_Date = '2021-06-21'
--where EmployeeID = 1;

--update Employees
--set Join_Date = '2022-03-05'
--where EmployeeID = 2;

--update Employees
--set Join_Date = '2024-09-30'
--where EmployeeID = 3;

--update Employees
--set Join_Date = '2023-01-13'
--where EmployeeID = 4;

--update Employees
--set Join_Date = '2021-12-31'
--where EmployeeID = 5;

--select datediff(Year, Join_Date, Getdate()) as Employee_Year from Employees;

