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

-- using constraints In SQL Server
CREATE TABLE Customer(
             CustomerID INT PRIMARY KEY,
			 FirstName VARCHAR(100),
             LastName VARCHAR(100)
			 );

-- Creating a foreign key
CREATE TABLE Orders(
             OrderID INT PRIMARY KEY,
			 CustomerID INT,
			 OrderDate DATE,
			 ProductName VARCHAR(100)
			 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
			 );

-- Creating a table with a Unique constraint
CREATE TABLE Products(
             ProductsID INT UNIQUE,
			 ProductName VARCHAR(100)
			 );

ALTER TABLE Orders
DROP COLUMN ProductName 

ALTER TABLE Orders
ADD ProductID INT;

-- Creating a table with a Unique constraint
CREATE TABLE Products(
             ProductsID INT,
			 ProductName VARCHAR(100)
			 );

INSERT INTO Products(ProductsID, ProductName)
VALUES(1, 'Electronics'),
      (2, 'Appliances'),
	  (3, 'Furnitures'),
	  (4, 'Cooking Utentils'),
	  (5, 'Toiletries');

ALTER TABLE Products
ADD Price DECIMAL(10, 2)

SELECT * FROM Products

UPDATE Products
SET Price = 200.00
WHERE ProductsID = 1 

UPDATE Products
SET Price = 300.00
WHERE ProductsID = 2

UPDATE Products
SET Price = 150.00
WHERE ProductsID = 3 

UPDATE Products
SET Price = 500.00
WHERE ProductsID = 4

UPDATE Products
SET Price = 600.00
WHERE ProductsID = 5

SELECT * FROM Products

-- Creating a table with a check constraints
CREATE TABLE Students(
             StudentID INT PRIMARY KEY,
			 Age INT,
			 CHECK (Age >=18)
			 );

INSERT INTO Students(StudentID, Age)
            VALUES (001, 16);

-- Creating a table with a Default constraints  
CREATE TABLE Orders_1(
OrderID INT PRIMARY KEY,
OrderDate DATE DEFAULT GETDATE()
)
SELECT * From Orders_1
INSERT INTO Orders_1(OrderID)
VALUES (1);

CREATE TABLE Parties(
             Party_id INT,
             Party_Name VARCHAR(100),
             Candidate_Name VARCHAR(100) DEFAULT 'NOT AVAILABLE',
			 Position VARCHAR(100)
			 );
INSERT INTO Parties (Party_id, Party_Name, Position)
VALUES(001, 'PDP', 'Presidency');

SELECT * FROM Parties

-- Adding a primary key constraints to an existing table
ALTER TABLE Parties
ALTER COLUMN Party_id INT NOT NULL;

ALTER TABLE Parties
ADD PRIMARY KEY (Party_id);

-- Logical Operators
-- AND example
SELECT * FROM Employees
WHERE Salary >= 55000 AND Department = 'IT'

SELECT * FROM Employees
WHERE Salary >= 55000 OR Department = 'IT'

SELECT * FROM Employees
WHERE Salary >= 55000 AND Department = 'IT'

INSERT INTO Products(Prices)
VALUES(200.00),
      (300.00),
	  (150.00),
	  (500.00),
	  (600.00);

DROP TABLE Products

SELECT * FROM Products

ALTER TABLE Products
ADD Price DECIMAL(10, 2)

SELECT * FROM Products


UPDATE Products
SET Price = 200.00
WHERE ProductsID = 1 

UPDATE Products
SET Price = 300.00
WHERE ProductsID = 2

UPDATE Products
SET Price = 150.00
WHERE ProductsID = 3 

UPDATE Products
SET Price = 500.00
WHERE ProductsID = 4

UPDATE Products
SET Price = 600.00
WHERE ProductsID = 5

SELECT * FROM Products

DELETE FROM Products
WHERE ProductsID IS NULL;

-- Using the NOT operator
SELECT * FROM Products
WHERE NOT ProductName = 'Electronics'

-- Short way to using the NOT operator
SELECT * FROM Products
WHERE  ProductName != 'Electronics'

-- Using the IN operator
SELECT * FROM Products
WHERE ProductsID IN (1, 2)

SELECT * FROM Products
WHERE ProductName IN ('Electronics','Cooking Utentils')

-- Using the BETWEEN operator
SELECT * FROM Products
WHERE Price BETWEEN 200 AND 500

-- Using the NOT BETWEEN operator
SELECT * FROM Products
WHERE Price NOT BETWEEN 200 AND 500

-- Using the LIKE operator(That starts with F)
SELECT * FROM Products
WHERE ProductName LIKE 'F%'

-- Using the LIKE operator(That ends with F)
SELECT * FROM Products
WHERE ProductName LIKE '%F'

-- Using the LIKE, OR, IN operator
SELECT * FROM Products
WHERE ProductName LIKE 'F%' OR ProductName IN ('Electronics', 'Cooking Utentils')

SELECT * FROM Students

-- CASE Statement
SELECT * FROM Students

INSERT INTO Students(StudentID, Age)
     VALUES(001, 25),
	       (002, 35),
		   (003, 29),
		   (004, 32),
		   (005, 30);

SELECT Age, 
  CASE
     WHEN Age <=29 THEN 'Consider marriage'
	 WHEN Age <=32 THEN 'Marry already!!!'
	 ELSE 'You might consider going to your pastor'
  END AS Marital_status
  From Students;

  -- Another CASE Example
SELECT COUNT(*) AS count_all,
   CASE
     WHEN Age <=29 THEN 'Consider marriage'
	 WHEN Age <=32 THEN 'Marry already!!!'
	 ELSE 'You might consider going to your pastor'
  END AS Marital_status
  From Students
  GROUP BY 
      CASE
      WHEN AGE  <=29
	  THEN 'Consider marriage'
	  WHEN Age <=32 THEN 'Marry already!!!'
      ELSE 'You might consider going to your pastor'
   END;

-- GROUP BY Statement
SELECT * FROM Employees
SELECT Department, AVG(Salary) AS AVG_Salary
  FROM Employees
  Group BY Department
  ORDER BY AVG_Salary;

SELECT FirstName, Department, AVG(Salary) AS AVG_Salary
  FROM Employees
  WHERE FirstName LIKE 'J%'
  Group BY FirstName, Department
  ORDER BY AVG_Salary;

SELECT EmployeeID, FirstName, Department, AVG(Salary) AS AVG_Salary
  FROM Employees
  Group BY EmployeeID, FirstName, Department
  HAVING EmployeeID > 4
  ORDER BY AVG_Salary;

UPDATE Products
SET Price = 
    CASE productsID
	WHEN 1 THEN 200
	WHEN 2 THEN 300
	WHEN 3 THEN 150
	WHEN 4 THEN 500
	WHEN 5 THEN 600
  END;
SELECT * FROM Products

UPDATE Employees
SET Salary =
   CASE
     WHEN Department = 'IT' OR FirstName LIKE 'J%' THEN Salary *2
	 WHEN Department = 'HR' AND FirstName LIKE 'A%' THEN Salary *2.5
    END;
SELECT * FROM Employees

-- SET operation
SELECT * FROM Employees
SELECT * FROM Departments

-- Add more values to Department Table
INSERT INTO Departments (DepartmentID, DepartmentName)
        VALUES (7, 'Software development'),
		       (8, 'Admin'),
			   (9, 'Product Management');

-- SET operation
SELECT EmployeeID, Department FROM Employees
       EXCEPT
SELECT DepartmentID, DepartmentName From Departments


SELECT EmployeeID, Department FROM Employees
       UNION
SELECT DepartmentID, DepartmentName From Departments

SELECT EmployeeID, Department FROM Employees
       INTERSECT
SELECT DepartmentID, DepartmentName From Departments

-- Import dataset
-- Houses that are in perfect condition(4 & 5) from 1990-present
SELECT yr_built, condition, city, COUNT(*) Number_of_houses
FROM house_pricing_dataset
WHERE Condition >= 4 and yr_built >= 1990
GROUP BY yr_built, condition, city
ORDER BY condition Desc

-- Houses that are in perfect condition(4 & 5) from 1990-present
SELECT yr_built, condition, city, COUNT(*) Number_of_houses
FROM house_pricing_dataset
WHERE Condition >= 4 and yr_built >= 1990
GROUP BY yr_built, condition, city
ORDER BY condition, Number_of_houses


-- And 3 bedroom apartment, 2 bathroom, that has condition(4) and price below 500,000
SELECT bedrooms, condition, price, COUNT(*) Number_of_houses
FROM house_pricing_dataset
WHERE Condition = 4
GROUP BY bedrooms, condition, price

-- Houses that have only been renovated and have atleast 2 views, should be 3 bedroom above and should be in (Seattle, Kent, Maple Valley, and Lake Forest Park)

SELECT yr_renovated, bedrooms, city, view_
FROM house_pricing_dataset
WHERE yr_renovated >0 and bedrooms >=3 and city IN ('Seattle', 'Kent', 'Maple Valley', 'Lake Forest Park')
GROUP BY yr_renovated, bedrooms, city, view_
ORDER BY bedrooms DESC


-- ALTER TABLE house_pricing_dataset
-- RENAME COLUMN views to view_;

sp_rename 'house_pricing_dataset.view', 'view_', 'COLUMN'

--SELECT * FROM house_pricing_dataset
-- Houses that have only been renovated, should be 3 bedroom above and should be in (Seattle, Kent, Maple Valley, and Lake Forest Park)
With Table1 as (SELECT * FROM house_pricing_dataset
  WHERE yr_renovated > 0 AND bedrooms >=3)
     SELECT * FROM Table1
	     WHERE city
		    IN ('Seattle', 'Kent', 'Maple Valley', 'Lake Forest Park');


-- SP_help house_pricing_dataset # Checking table structure

SELECT * FROM house_pricing_dataset