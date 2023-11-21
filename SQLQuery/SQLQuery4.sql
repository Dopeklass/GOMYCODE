 -- Created a database
CREATE DATABASE GOMYCODE;
USE GOMYCODE;
-- creating a table
CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Department VARCHAR(100),
Salary DECIMAL(10, 2)
);

-- Inserting Data into the table
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department,Salary)
  VALUES (1, 'John', 'Doe', 'HR', 55000.00),
         (2, 'Jane', 'Smith', 'Marketing', 60000.00),
   	     (3, 'Bob', 'Johnson', 'IT', 65000.00);
-- view the structure of the table
SP_HELP Employees
-- Retrieve all employee from the Employee Table
SELECT EmployeeID,FirstName From Employees;

-- Retrieve employee in HR department
SELECT * From Employees WHERE Department = 'HR';

-- Retrieve employee with a salary greater than 60000
SELECT * From Employees WHERE Salary > 60000;

-- UPDATE EmployeeID column
UPDATE Employees
SET Salary = 58000.00
WHERE EmployeeID =1;

INSERT INTO Employees(EmployeeID, FirstName, LastName, Department,Salary)
  VALUES (4, 'Ayo', 'Dope', 'DS', 180000.00)

UPDATE Employees
SET Department = 'IT',
    LastName = 'Nikky'
WHERE EmployeeID = 4;


-- Delete employee with ID 4
DELETE FROM Employees
WHERE EmployeeID = 4

SELECT * From Employees

--Create another table
CREATE TABLE Departments(
           DepartmentID INT PRIMARY KEY,
		   DepartmentName VARCHAR (100)
		   );
SELECT * FROM Departments

-- insert data into the 'Department' Table
INSERT INTO Departments (DepartmentID, DepartmentName)
        VALUES (1, 'HR'),
		       (2, 'Marketing'),
			   (3, 'IT');
               
SELECT * FROM Employees
SELECT * FROM Departments

-- INNER JOIN
SELECT * FROM Employees
        INNER JOIN Departments
		ON Employees.Department = Departments.DepartmentName

-- Adding more values on the Employee's table
INSERT INTO Employees(EmployeeID, FirstName, LastName, Department,Salary)
  VALUES (4, 'Andy', 'Fineboy', 'HR', 75000.00),
         (5, 'Joseph', 'Smith', 'Marketing', 80000.00),
   	     (6, 'Dopeklass', 'Johnson', 'IT', 90000.00);


-- insert data into the 'Department' Table
INSERT INTO Departments (DepartmentID, DepartmentName)
        VALUES(4, 'Data Analyst'),
			   (5, 'Finance'),
			   (6, 'Administration');

SELECT * FROM Employees
   Right JOIN Departments
   ON Employees.Department = Departments.DepartmentName;

SELECT * FROM Employees
SELECT * FROM Departments

SELECT * FROM Employees
   Full JOIN Departments
   On Employees.EmployeeID = Departments.DepartmentID

   -- Aggregate fucntion
   -- Calculate the average salary of employees in the IT department
   SELECT AVG(Salary)
   FROM Employees
   WHERE Department = 'IT'

   -- Calculate maximum salary of the employees
   SELECT MAX(Salary) AS Maximum_Salary
   FROM Employees

   SELECT DISTINCT(FirstName)
   FRom Employees

   SELECT TOP 2 *
   FROM Employees
 
 -- Counting records in the table
 SELECT FirstName, Lastname, Count(*) IT_Employee
 FROM Employees
 WHERE Department = 'IT'
 Group BY FirstName, LastName

 --- Subqueries
 SELECT AVG(Salary) From Employees

 SELECT EmployeeID, FirstName, LastName, Salary
 From Employees
 Where Salary > (SELECT AVG(Salary) From Employees)
