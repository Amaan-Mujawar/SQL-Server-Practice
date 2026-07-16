Select TABLE_NAME
from INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'Base Table';

Select * from department_data;
select * from employee_data;
select * from employee_manager;
select * from colors;
select * from size;

create function fn_AddNumbers
(
	@Num1 Int,
	@Num2 Int
)
Returns Int
As
Begin
	
	Return @Num1 + @Num2;

End;

Select dbo.fn_AddNumbers(4, 6) as TotalNum;

alter function dbo.Subtractor (
	@Num1 int,
	@Num2 int
)
Returns int
as
Begin
	return @Num1 - @Num2;
End;

Select dbo.Subtractor(9, 6) as TotalNum;

create function fn_YearlySalary (
	@MonthlySalary decimal(10, 2)
)
Returns int
as 
Begin
	return @MonthlySalary * 12;
End;

Select dbo.fn_YearlySalary(147272.56) as SalaryPerAnnum;

Select 
	first_name,
	last_name,
	dbo.fn_YearlySalary(Salary) as YearlySalary
from employee_data
order by YearlySalary desc;

create function fn_GetEmployee (
	@department_id int
)
Returns Table
as
RETURN(
	Select *
	from employee_data
	where department_id = @department_id
);
go

select * from dbo.fn_GetEmployee(1);

alter function fn_HighSalaryEmployee (
	@MinimumSalary Decimal(10, 2)
)
Returns @EmployeeTable Table
(
	employee_id int,
	first_name varchar(50),
	salary decimal(10, 2)
)
AS
Begin
	insert into @EmployeeTable

	Select 
		employee_id,
		first_name + ' ' + last_name,
		salary
	from employee_data
	where salary >= @MinimumSalary;

	Return;
End;

Select * from dbo.fn_HighSalaryEmployee(70000);

select abs(-5);

Select GETDATE();

alter function fn_CalculateBonus (
	@Salary Decimal(15, 4)
)
Returns Decimal
As
Begin
	Return @Salary * 0.02;
End;

select 
	first_name, 
	last_name, 
	dbo.fn_CalculateBonus(Salary) as Bonus 
from employee_data;

create function fn_GetEmployeeById (
	@employee_id int
)
Returns Table
as
Return (
	Select * 
	from employee_data
	where employee_id = @employee_id
);

Select * from dbo.fn_GetEmployeeById(10);

create function fn_GetEmployeebyDepartmentId (
	@department_id int
)
Returns table
as
return (
	Select *
	from employee_data
	where department_id = @department_id
);

Select * from dbo.fn_GetEmployeebyDepartmentId(1);

Select * from Employees;

Create Function fn_GetEmployeeByDepartment (
	@Department varchar(50)
)
Returns Table
As
Return (
	Select * 
	from Employees
	where Department = @Department
);

Select * from dbo.fn_GetEmployeeByDepartment('IT');

alter Function fn_GetAge (
	@DateOfBirth Date
)
Returns INT
As
Begin
	Return DATEDIFF (
		YEAR,
		@DateOfBirth,
		GETDATE()
	);
END;

Select dbo.fn_GetAge('1991-06-26') as Age;

Create Function fn_CalculateEmployeesYears (
	@Join_Date Date
)
Returns int
AS
BEGIN
	Return DATEDIFF(Year, @Join_Date, GetDate());
END;

Select 
	EmployeeID,
	FullName,
	dbo.fn_CalculateEmployeesYears(Join_Date) as YearsOfService
from Employees;