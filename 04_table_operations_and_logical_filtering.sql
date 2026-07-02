-- create database practiceDB;

-- use practiceDB;

--create table student_data(
--	StudentID int primary key,
--	FullName varchar(100) not null,
--	Email varchar(50) not null,
--	PhoneNumber varchar(10) not null,
--	DateofBirth date,
--	CGPA decimal(4,2),
--	IsPlaced bit
--);

--select * from student_data;

--select name
--from sys.databases;

--select db_name();

--insert into student_data values (101, 'ABC DEF', 'abc@gmail.com', '9876543210', '01-07-2005', '7.81', 0);

--select * from student_data;

--select *
--from INFORMATION_SCHEMA.TABLES;

--alter table student_data
--add city varchar(50);

--update student_data
--set city = 'Pune'
--where StudentID = 101;

--drop table student_data;

--create table Students (
--	StudentID int Primary key identity(1, 1),
--	FullName nvarchar(100),
--	Email varchar(50),
--	CGPA decimal(4,2),
--	IsPlaced bit
--);

--insert into Students values ('John Smith', 'john@gmail.com', 7.63, 1), ('Williams Ramos', 'williams@gmail.com', 9.12, 1), ('Steve Jackson', 'steve@gmail.com', 8.78, 0), 
--('Alice Doe', 'alice@gmail.com', 9.79, 1), ('Amy Jones', 'amy@gmail.com', 6.99, 0);

--select * from Students;

--update Students
--set CGPA = 8.81
--where StudentID=3;

--delete Students
--where StudentID = 3;

--select FullName, CGPA from Students;

--update Students
--set CGPA = 8.73
--where StudentID = 2;

--create table Employees (
--	EmployeeID int primary key identity(1, 1), 
--	FullName nvarchar(50) not null, 
--	Salary decimal(10, 2) not null, 
--	Department varchar(50) not null, 
--	City varchar(50)
--);

--insert into Employees values
--	('Amaan', 50000, 'IT', 'Pune'),
--	('Rahul', 60000, 'HR', 'Mumbai'),
--	('Priya', 70000, 'IT', 'Pune'),
--	('Neha', 45000, 'Finance', 'Delhi'),
--	('Amit', 55000, 'IT', 'Mumbai');

--select * from Employees
--where Salary >= 50000;

--select * 
--from Employees
--where Department in (
--	'Finance',
--	'IT'
--);

--select * 
--from Employees
--where salary between 5000 and 50000;

--select *
--from Employees
--where Department = 'IT';

--select *
--from Employees
--where Salary > 50000;

--select *
--from Employees
--where City = 'Pune'
--or City = 'Mumbai';

--select * 
--from Employees
--where FullName like 'A%';

--select *
--from Employees
--where FullName like '%ra%';

--select * 
--from Employees
--where Salary>=40000 and Salary<=60000;

--select * 
--from Employees
--where Salary between 40000 and 60000;

--select *
--from Employees
--where Department is null;

select * 
from Employees
where Department is not null;