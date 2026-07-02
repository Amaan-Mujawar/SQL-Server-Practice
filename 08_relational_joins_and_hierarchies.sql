--use testDB2;

--select * from employee_data;
--select * from department_data;

--select e.employee_id, e.first_name, e.last_name, e.salary, d.department_id, d.department_name
--from employee_data e
--INNER join department_data d
--on e.department_id = d.department_id;

--select e.first_name, e.last_name, e.salary, d.department_name
--from employee_data e
--left join department_data d
--on e.department_id = d.department_id;

--select e.first_name, e.salary, d.department_name
--from employee_data e
--right join department_data d
--on e.department_id = d.department_id;

--select *
--from employee_data
--cross join department_data;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--left join employee_data d
--on e.employee_id = d.department_id;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--left join employee_data d
--on e.department_id = d.employee_id;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--right join employee_data d
--on e.employee_id = d.department_id;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--right join employee_data d
--on e.department_id = d.employee_id;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--inner join employee_data d
--on e.employee_id = d.department_id;

--select e.employee_id as Employee, d.department_id as Department
--from employee_data e
--inner join employee_data d
--on e.department_id = d.employee_id;

--select e.first_name, d.department_name
--from employee_data e
--inner join department_data d
--on e.department_id = d.department_id;

--select e.first_name, d.department_name
--from employee_data e
--left join department_data d
--on e.department_id = d.department_id;

--select e.first_name, d.department_name
--from employee_data e
--right join department_data d
--on e.department_id = d.department_id;

--select e.first_name, d.department_name
--from employee_data e
--full outer join department_data d
--on e.department_id = d.department_id;

--create table employee_manager (
--	employee_id int,
--	employee_post varchar(50),
--	manager_id int
--);

--insert into employee_manager values 
--	(1, 'CEO', null),
--	(2, 'Manager', 1),
--	(3, 'Employee', 2);

--select e.employee_id, e.employee_post, m.employee_post
--from employee_manager e
--left join employee_manager m
--on e.manager_id = m.employee_id;

--SELECT 
--    subordinate.employee_id AS "Employee ID", 
--    subordinate.employee_post AS "Employee Role",
--    manager.employee_post AS "Manager Role"
--FROM employee_manager subordinate
--LEFT JOIN employee_manager manager 
--    ON subordinate.manager_id = manager.employee_id;

--create table colors (
--	colors varchar(50)
--);

--create table size (
--	size char
--);

--insert into colors values ('red'), ('green'), ('yellow'), ('blue');

--insert into size values ('S'), ('M'), ('L');

--select colors, size
--from colors
--cross join size;