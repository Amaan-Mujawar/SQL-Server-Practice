--SELECT * FROM employee_data;
--select * from department_data;

--select * 
--from employee_data
--where salary >
--(select avg(salary)
--from employee_data);

--select *
--from employee_data
--where salary = 
--(select max(salary)
--from employee_data);

--select max(salary) as second_highest_salary
--from employee_data
--where salary <
--(select max(salary)
--from employee_data);

--select *
--from employee_data
--where department_id in (
--	select department_id
--	from department_data
--);

--select *
--from employee_data
--where department_id in (
--	select department_id
--	from department_data
--	where department_name = 'Engineers'
--);

--select *
--from employee_data
--where department_id in (
--	select department_id
--	from department_data
--	where department_name like '%En%'
--);

--select *
--from employee_data
--where department_id in (
--	select department_id
--	from department_data
--	where department_name like '%H%'
--);

--select *
--from employee_data
--where department_id not in (
--	select department_id
--	from department_data
--	where department_name like '%En%'
--);

--SELECT *
--FROM employee_data
--WHERE salary > ANY
--(
--    SELECT salary
--    FROM employee_data
--    WHERE department_id = 1
--);

--SELECT *
--FROM employee_data
--WHERE salary > ALL
--(
--    SELECT salary
--    FROM employee_data
--    WHERE department_id = 1
--);

--select e.first_name,
--	e.salary,
--	e.department_id
--from employee_data e
--where e.salary > (
--	select avg(salary)
--	from employee_data
--	where department_id = e.department_id
--);

--select *
--from employee_data
--where department_id = (
--	select department_id
--	from department_data
--	where department_name = (
--		select top 1 department_name
--		from department_data
--	)
--);

--SELECT *
--FROM department_data D
--WHERE EXISTS
--(
--    SELECT 1
--    FROM employee_data E
--    WHERE E.department_id = D.department_id
--);

--SELECT *
--FROM department_data D
--WHERE NOT EXISTS
--(
--    SELECT 1
--    FROM employee_data E
--    WHERE E.department_id = D.department_id
--);