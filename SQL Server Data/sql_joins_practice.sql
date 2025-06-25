
-- Practice SQL File: SQL Joins Deep Dive

-- Sample Tables
-- Table: Employees
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    DeptID INT,
    ManagerID INT
);

-- Table: Departments
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Table: Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Item VARCHAR(100)
);

-- Table: Stores
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    Store VARCHAR(100)
);

-- Sample Data
INSERT INTO Employees VALUES 
(1, 'Alice', 10, NULL),
(2, 'Bob', 20, 1),
(3, 'Charlie', NULL, 1),
(4, 'Diana', 30, 2),
(5, 'Eve', 20, 2);

INSERT INTO Departments VALUES 
(10, 'HR'),
(20, 'Finance'),
(30, 'IT'),
(40, 'Marketing');

INSERT INTO Products VALUES 
(1, 'Laptop'),
(2, 'Tablet');

INSERT INTO Stores VALUES 
(1, 'Store A'),
(2, 'Store B');

-- Practice Questions

-- 1. List all employees and their department names (use INNER JOIN)
SELECT e.Name, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

-- 2. List all employees including those without departments (use LEFT JOIN)
SELECT e.Name, COALESCE(d.DeptName, 'No Department') AS DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;

-- 3. Find departments that have no employees (use RIGHT JOIN or LEFT JOIN flipped)
SELECT d.DeptName
FROM Departments d
LEFT JOIN Employees e ON e.DeptID = d.DeptID
WHERE e.EmpID IS NULL;

-- 4. List all employees and all departments (use FULL OUTER JOIN)
SELECT e.Name, d.DeptName
FROM Employees e
FULL OUTER JOIN Departments d ON e.DeptID = d.DeptID;

-- 5. Show every combination of product and store (use CROSS JOIN)
SELECT p.Item, s.Store
FROM Products p
CROSS JOIN Stores s;

-- 6. List employees and their manager names (use SELF JOIN)
SELECT e.Name AS Employee, m.Name AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmpID;

-- 7. Use subquery to fetch department name for each employee
SELECT Name,
       (SELECT DeptName FROM Departments d WHERE d.DeptID = e.DeptID) AS DeptName
FROM Employees e;
