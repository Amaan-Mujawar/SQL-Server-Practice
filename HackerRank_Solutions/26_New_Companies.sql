/*
Question: New Companies
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 
Founder -> Lead Manager -> Senior Manager -> Manager -> Employee

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

Input Format
The following tables contain company data:
Company: The company_code is the code of the company and founder is the founder of the company. 
Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company. 
Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 
Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 
Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

Sample Output
C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2

Explanation
In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under manager M1.
In company C2, the only lead manager is LM2. There is one senior manager, SM3, under LM2. There are two managers, M2 and M3, under senior manager SM3. There is one employee, E3, under manager M2, and another employee, E4, under manager, M3.
*/

-- Answer (Method 1: Using LEFT JOIN and COUNT DISTINCT - Your Solution):
SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS Total_Lead_Managers,
    COUNT(DISTINCT sm.senior_manager_code) AS Total_Senior_Managers,
    COUNT(DISTINCT m.manager_code) AS Total_Managers,
    COUNT(DISTINCT e.employee_code) AS Total_Employees
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
GROUP BY 
    c.company_code, 
    c.founder
ORDER BY c.company_code ASC;

/*
-- Method 2: Using Correlated Subqueries (High-Performance T-SQL Alternative)
-- This completely avoids "join fan-out" by counting distinct values for each company independently, saving immense memory and CPU in large production databases.
SELECT 
    c.company_code, 
    c.founder,
    (SELECT COUNT(DISTINCT lead_manager_code) FROM Lead_Manager WHERE company_code = c.company_code) AS Total_Lead_Managers,
    (SELECT COUNT(DISTINCT senior_manager_code) FROM Senior_Manager WHERE company_code = c.company_code) AS Total_Senior_Managers,
    (SELECT COUNT(DISTINCT manager_code) FROM Manager WHERE company_code = c.company_code) AS Total_Managers,
    (SELECT COUNT(DISTINCT employee_code) FROM Employee WHERE company_code = c.company_code) AS Total_Employees
FROM Company c
ORDER BY c.company_code ASC;
*/