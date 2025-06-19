CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(101, 'Alice Johnson', 'HR', 'Manager', 75000),
(102, 'Bob Smith', 'IT', 'Developer', 68000),
(103, 'Carol Davis', 'IT', 'Tester', 60000),
(104, 'David Brown', 'Sales', 'Executive', 72000),
(105, 'Eva Green', 'HR', 'Recruiter', 55000);

SELECT * from Employees
