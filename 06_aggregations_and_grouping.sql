--use practiceDB;

--select * from Employees;

--select count(*) from Employees;

--select count(Salary) from Employees;

--select sum(salary) from Employees;

--select avg(salary) from Employees;

--select max(Salary) As Highest_Salary from Employees;

--select upper(FullName) as FullName from Employees;

--select len(FullName) as FullName from Employees;

--select datediff(year, Join_Date, Getdate()) from Employees;

--select SUBSTRING(FullName, 1, 3) from Employees;

--select getdate();

--select Department, count(*) as total_employees
--from Employees
--group by Department;

--select department, sum(Salary) as total_employees_salary
--from Employees
--group by Department;

--select Department, avg(Salary) as avg_emp_salary
--from Employees
--group by Department;

--select department, count(*) as emp
--from Employees
--group by Department
--having count(*) > 2;

--select department, sum(salary) as sum_salary
--from employees
--where Department = 'IT'
--group by Department;

--select department, sum(salary) as sum_salary
--from Employees
--group by Department
--having sum(salary) > 100000;

--select department, max(salary) as highest_salary
--from Employees
--group by Department
--order by max(salary) desc;

--select department, avg(salary) as avg_salary
--from Employees
--group by Department
--order by avg(Salary) desc;