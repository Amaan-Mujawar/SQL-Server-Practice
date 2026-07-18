--Begin Transaction;
--Begin Tran;

/* ==========================================
   TRANSACTIONS, ROLLBACKS, AND SAVEPOINTS
========================================== */

-- 1. Setup Base Table
CREATE TABLE Accounts (
	AccountID INT IDENTITY(1, 1),
	AccountName VARCHAR(50),
	Balance DECIMAL(15, 5)
);
GO

INSERT INTO Accounts (AccountName, Balance) 
VALUES 
    ('ABC', 746462.114), 
    ('DEF', 9123.338), 
    ('GHI', 42134.245), 
    ('JKL', 65387.9824);
GO

-- 2. Basic Transaction with COMMIT
-- Ensures both updates succeed together
BEGIN TRANSACTION;
    UPDATE Accounts
    SET Balance = Balance - 1000
    WHERE AccountID = 1;

    UPDATE Accounts
    SET Balance = Balance + 1000
    WHERE AccountID = 2;
COMMIT;
GO

SELECT * FROM Accounts;
GO

-- 3. Basic Transaction with ROLLBACK
-- Undoes the update without saving to the database
BEGIN TRANSACTION;
    UPDATE Accounts
    SET Balance = 89456.8947
    WHERE AccountID = 1;
ROLLBACK;
GO

-- Verify that the rollback was successful
SELECT * FROM Accounts WHERE AccountID = 1;
GO

-- 4. Transactions with Error Handling (TRY...CATCH)
BEGIN TRY
	BEGIN TRANSACTION;

		UPDATE Accounts
		SET Balance = Balance - 10000
		WHERE AccountID = 1;

		UPDATE Accounts
		SET Balance = Balance + 10000
		WHERE AccountID = 2;

	COMMIT;
END TRY
BEGIN CATCH
	-- Safely check if a transaction is still active before rolling back
    IF @@TRANCOUNT > 0
	BEGIN
        ROLLBACK;
    END
	
    -- Output the exact error message
	SELECT ERROR_MESSAGE() AS ErrorDetails;
END CATCH;
GO

-- 5. Using Savepoints
-- Allows rolling back to a specific point within an active transaction
BEGIN TRANSACTION;
    INSERT INTO Accounts (AccountName, Balance) VALUES ('MNO', 27389.99);
    SAVE TRANSACTION SavePoint1;

    INSERT INTO Accounts (AccountName, Balance) VALUES ('PQR', 56000);
    SAVE TRANSACTION SavePoint2;

    INSERT INTO Accounts (AccountName, Balance) VALUES ('STU', 92000.50);
    SAVE TRANSACTION SavePoint3;

    -- Rolls back 'STU', but keeps 'MNO' and 'PQR' pending
    ROLLBACK TRANSACTION SavePoint2;
    
-- You MUST commit the main transaction to finalize the remaining inserts
COMMIT; 
GO

-- 6. Nested Transactions
-- @@TRANCOUNT increases with each BEGIN and decreases with each COMMIT
BEGIN TRANSACTION;
    BEGIN TRANSACTION;
        UPDATE Accounts 
        SET Balance = Balance + 199;
    COMMIT; -- Decrements @@TRANCOUNT to 1
COMMIT; -- Decrements @@TRANCOUNT to 0 and writes to disk
GO

-- 7. Transaction Isolation Levels
-- READ COMMITTED is the default isolation level in SQL Server
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
GO