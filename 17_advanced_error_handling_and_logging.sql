Begin Try
	--Code
End Try
Begin Catch
	--Error Handling
End Catch

Select 10/0;

Begin Try
	Select 10/0;
End Try
Begin Catch
	--Select 'An Error Occured.';
	SELECT ERROR_MESSAGE() AS ErrorDetails;
End Catch

Create Table Employee (
	EmployeeID Int Primary Key,
	EmployeeName Varchar(50)
);

Insert into Employee values (1, 'Mangesh');

Insert into Employee values (1, 'Edwin');

Begin Try
	Insert into Employee values (2, 'Rushikesh');

	Insert into Employee values (2, 'Vivek');
End Try
Begin Catch
	Select ERROR_MESSAGE() as ErrorDetails;
	--SELECT 'Duplicate Employee ID';
End Catch

Begin Try
	Select 10/0;
End Try
Begin Catch
	Select ERROR_LINE();
End Catch

Begin Try
	Select 10/0;
End Try
Begin Catch
	Select ERROR_NUMBER();
End Catch

Begin Try
	Select 10/0;
End Try
Begin Catch
	Select ERROR_PROCEDURE();
End Catch

Begin Try
	Select 10/0;
End Try
Begin Catch
	Select ERROR_SEVERITY();
End Catch

Begin Try
	Select 10/0;
End Try
Begin Catch
	Select ERROR_STATE();
End Catch

BEGIN TRY

    SELECT 10 / 0;

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_LINE() AS ErrorLine;

END CATCH

Select * from Accounts;

Begin Try
	
	Begin Transaction;

	Update Accounts
	Set Balance = Balance - 1000
	Where AccountID = 1;

	Update Accounts
	Set Balance = Balance + 1000
	Where AccountID = 2;

	Commit;

End Try
Begin Catch
	
	Rollback;

	Select ERROR_MESSAGE() as ErrorDetails;

End Catch

Begin Try

	Begin Transaction;

	Update Accounts
	Set Balance = Balance - 10000
	Where AccountID = 1;

	Update Accounts
	Set Balance = Balance + 10000
	Where AccountID = 2;

	Commit;

End Try

Begin Catch

	Rollback;
	
	Select ERROR_LINE() as ErrorLine;

End Catch

Begin Try
	
	Begin Transaction;

	Update Accounts
	Set Balance = Balance - 1000
	Where AccountID = 1;

	Update Accounts
	Set Balance = Balance + 101000
	Where AccountID = 2;

	Commit;

End Try

Begin Catch

	Rollback;

	Select ERROR_NUMBER() as ErrorNumber;

End Catch

Begin Try

	Begin Transaction;

	Update Accounts
	Set Balance = Balance + 200
	Where AccountID = 3;

	Update Accounts
	Set Balance = Balance - 200
	Where AccountID = 4;

	Commit;

End Try

Begin Catch

	Rollback;

	Select ERROR_PROCEDURE() as ErrorProcedure;

End Catch

Begin Try
	
	Begin Transaction;

	Update Accounts
	Set Balance = Balance + 500
	Where AccountID = 3;

	Update Accounts
	Set Balance = Balance - 500
	Where AccountID = 4;

	Commit;

End Try

Begin Catch
	
	Rollback;

	Select ERROR_SEVERITY() as ErrorSeverity;

End Catch

Begin Try

	Begin Transaction;

	Update Accounts
	Set Balance = Balance - 500
	Where AccountID = 3;

	Update Accounts
	Set Balance = Balance + 500
	Where AccountID = 4;

	Commit;

End Try

Begin Catch
	
	Rollback;

	Select ERROR_STATE() as ErrorState;

End Catch

Begin Try
	
	Begin Transaction;

	--Business Logic

	Commit;

End Try

Begin Catch

	If @@TRANCOUNT > 0
		Rollback;

	Select ERROR_MESSAGE() as ErrorMessage;

End Catch

Declare @Salary Decimal(15, 3);

SET @Salary = -5000;

If @Salary < 0
Begin
	
	THROW 50001, 'Invalid Salary', 1;

End
ELSE
BEGIN
    PRINT 'Salary is valid: ' + CAST(@Salary AS VARCHAR(20));
END

RAISERROR (
	'Employee Not Found', 16, 1
)

Create Table ErrorLog (
	ErrorId Int Identity(1, 1),
	ErrorMessage Varchar(500),
	ErrorLine Int,
	ErrorDate Datetime
);

BEGIN TRY

	SELECT 10/0;

END TRY

BEGIN CATCH

	INSERT INTO ErrorLog (ErrorMessage, ErrorLine, ErrorDate)
	VALUES (ERROR_MESSAGE(), ERROR_LINE(), GETDATE())

END CATCH

SELECT * FROM ErrorLog;

Select * from employee_data;

CREATE PROCEDURE sp_UpdateSalary

    @employee_id INT,
    @salary DECIMAL(10,2)

AS
BEGIN

    BEGIN TRY

        UPDATE employee_data
        SET salary = @Salary
        WHERE employee_id = @employee_id;

    END TRY

    BEGIN CATCH

        SELECT ERROR_MESSAGE();

    END CATCH

END;

Exec sp_UpdateSalary 1, 100000;

