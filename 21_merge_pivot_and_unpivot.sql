/* ==========================================
   THE MERGE STATEMENT (UPSERT & SYNC)
========================================== */
SELECT * FROM employee_data;
GO

-- 1. Create a staging table for incoming updates
DROP TABLE IF EXISTS employeeupdates;
CREATE TABLE employeeupdates (
    employee_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(20, 10),
    joining_date DATE,
    age INT
);
GO

-- 2. Populate the staging table (mix of existing and new employees)
INSERT INTO employeeupdates VALUES     
    (1, 'Joshua', 'Ramos', 'alexandra29@gmail.com', 'Operations', 68313.80078125, '2024-05-23', 42),
    (2, 'Christina', 'Clark', 'littlekyle@yahoo.com', 'IT', 61827.3203125, '2021-10-02', 46),
    (3, 'Jonathon', 'Sullivan', 'tannerivan@johnson.com', 'Operations', 60427.30859375, '2020-04-30', 50),
    (4, 'Clinton', 'Aguirre', 'jamieortega@yahoo.com', 'HR', 48352.73828125, '2021-04-04', 55),
    (5, 'Veronica', 'Weber', 'trevinosteven@ramos.com', 'Operations', 81772.5625, '2020-10-06', 51),
    (1002, 'Sarah', 'Jenkins', 'sjenkins88@gmail.com', 'HR', 92450.50000000, '2025-01-15', 35),
    (1003, 'Marcus', 'Chen', 'mchen.tech@gmail.com', 'IT', 74200.25000000, '2024-11-02', 29);
GO

SELECT * FROM employeeupdates;
GO

-- 3. Manage Triggers (Best practice before bulk merges to avoid audit bloat)
SELECT 
    t.name AS TriggerName,
    tbl.name AS TableName,
    t.is_disabled AS IsDisabled,
    t.create_date AS CreatedDate
FROM sys.triggers t
INNER JOIN sys.tables tbl 
    ON t.parent_id = tbl.object_id
ORDER BY tbl.name, t.name;
GO

DISABLE TRIGGER trg_AfterEmployeeDelete ON employee_data;
DISABLE TRIGGER trg_AfterEmployeeInsert ON employee_data;
DISABLE TRIGGER trg_AfterEmployeeUpdate ON employee_data;
DISABLE TRIGGER trg_EmployeeDetailsAudit ON employee_data;
DISABLE TRIGGER trg_PreventDelete ON employee_data;
DISABLE TRIGGER trg_PreventSalaryReduction ON employee_data;
GO

/* Synax-
MERGE TargetTable AS T

USING SourceTable AS S

ON T.ID = S.ID

WHEN MATCHED THEN
    UPDATE

WHEN NOT MATCHED THEN
    INSERT;
*/

-- 4. Execute the MERGE (Update existing, Insert new)
-- T-SQL STRICT RULE: MERGE statements MUST end with a semicolon!
MERGE employee_data AS Target
USING employeeupdates AS Source
    ON Target.employee_id = Source.employee_id

WHEN MATCHED THEN 
    UPDATE SET Target.salary = Source.salary

WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        employee_id, first_name, last_name, email, 
        department, salary, joining_date, age
    )
    VALUES (
        Source.employee_id, Source.first_name, Source.last_name, Source.email, 
        Source.department, Source.salary, Source.joining_date, Source.age
    );
GO

-- 5. Synchronize Deletes (Delete records in Target that are missing in Source)
MERGE employee_data AS Target
USING employeeupdates AS Source
    ON Target.employee_id = Source.employee_id
WHEN NOT MATCHED BY SOURCE THEN 
    DELETE;
GO


/* ==========================================
   PIVOT (Rows to Columns for Reporting)
========================================== */

-- 1. Setup Sales Data
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
    Employee VARCHAR(100),
    Month VARCHAR(15),
    Sales INT
);
GO

INSERT INTO Sales VALUES 
    ('Amaan', 'Jan', 1000), ('Amaan', 'Feb', 1500), ('Amaan', 'Mar', 1200), ('Amaan', 'Apr', 1800), ('Amaan', 'May', 1100), ('Amaan', 'Jun', 1600), ('Amaan', 'Jul', 2100),
    ('Rahul', 'Jan', 2000), ('Rahul', 'Feb', 2500), ('Rahul', 'Mar', 2200), ('Rahul', 'Apr', 2700), ('Rahul', 'May', 2100), ('Rahul', 'Jun', 2600), ('Rahul', 'Jul', 2800),
    ('Sneha', 'Jan', 3000), ('Sneha', 'Feb', 3200), ('Sneha', 'Mar', 3100), ('Sneha', 'Apr', 3500), ('Sneha', 'May', 3300),
    ('Vikram', 'Jan', 1500), ('Vikram', 'Feb', 1700), ('Vikram', 'Mar', 1600), ('Vikram', 'Apr', 1900), ('Vikram', 'May', 2000), ('Vikram', 'Jun', 2100);
GO

-- 2. Execute PIVOT and store the results in a Temp Table (#SalesPivot)
DROP TABLE IF EXISTS #SalesPivot;

/* Syntax-
SELECT *
FROM SourceTable

PIVOT (
    AggregateFunction(Column)
    FOR PivotColumn
    IN (ColumnList)
) P;
*/

SELECT * 
INTO #SalesPivot
FROM (
    SELECT Employee, Month, Sales
    FROM Sales
) AS SourceTable
PIVOT (
    SUM(Sales)
    FOR Month IN ([Jan], [Feb], [Mar], [Apr], [May], [Jun], [Jul])
) AS PivotTable;
GO

SELECT * FROM #SalesPivot;
GO


/* ==========================================
   UNPIVOT (Columns to Rows for Normalization)
========================================== */

/* Syntax-
SELECT *
FROM SourceTable

UNPIVOT
(
    ValueColumn

    FOR ColumnName

    IN
    (
        Column1,
        Column2
    )
) U;
*/

-- 1. Reverse the PIVOT operation to rebuild the original dataset structure
SELECT 
    Employee, 
    Month, 
    Sales
FROM #SalesPivot
UNPIVOT (
    Sales
    FOR Month IN (
        [Jan], [Feb], [Mar], [Apr], [May], [Jun], [Jul]
    )
) AS UnpivotTable;
GO

/* Syntax-
MERGE Employees
USING EmployeeUpdates
*/

/* Syntax-
MERGE Inventory
USING NewInventory
*/

/* Syntax-
PIVOT
(
SUM(Sales)
)
*/