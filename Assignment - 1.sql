
CREATE DATABASE  EmployeeDetails;
USE  EmployeeDetails;
CREATE TABLE  EmployeeDetails (
  EmpId INTEGER PRIMARY KEY,
  Fullname TEXT NOT NULL,
  ManagerId TEXT NOT NULL,
  DateOfJoining INTEGER,
  city TEXT NOT NULL
);
CREATE TABLE EmployeeSalary (
EmpId INTEGER,
 Project TEXT NOT NULL,
 Salary INTEGER,
 Variable VARCHAR(255)
);
1.SQL Query to fetch records that are present in one table but not in another table:

Ans-
 SELECT EmpId FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary)


2.SQL query to fetch all the employees who are not working on any project:

Ans-
SELECT EmpId, FullName FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS NOT NULL)


3.SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020:

Ans-
SELECT EmpId, FullName, ManagerId, DateOfJoining, City FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020


4.Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary:

Ans- 
SELECT EmpId, FullName, ManagerId, DateOfJoining, City FROM EmployeeDetails
WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary)


5. Write an SQL query to fetch a project-wise count of employees:

Ans- 
SELECT Project, COUNT(*) AS EmployeeCount FROM EmployeeSalary
GROUP BY Project

6. Fetch employee names and salaries even if the salary value is not present for the employee:

Ans- 
SELECT EmployeeDetails.EmpId, FullName, Salary FROM EmployeeDetails
LEFT JOIN EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId


7. Write an SQL query to fetch all the Employees who are also managers:

Ans-
 SELECT e1.EmpId, e1.FullName FROM EmployeeDetails e1
INNER JOIN EmployeeDetails e2 ON e1.EmpId = e2.ManagerId



8. Write an SQL query to fetch duplicate records from EmployeeDetails:

Ans-
 SELECT EmpId, COUNT(*) AS CountOfDuplicates FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(*) > 1


9.Write an SQL query to fetch only odd rows from the table:
Ans-
 SELECT EmpId, FullName, ManagerId, DateOfJoining, City FROM
(SELECT EmpId, FullName, ManagerId, DateOfJoining, City, ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum FROM EmployeeDetails) AS Temp
WHERE RowNum % 2 <> 0


10.Write a query to find the 3rd highest salary from a table without top or limit keyword:

Ans-
SELECT DISTINCT Salary FROM EmployeeSalary e1
WHERE 3 = (SELECT COUNT(DISTINCT e2.Salary) FROM EmployeeSalary e2 WHERE e2.Salary > e1.Salary)
