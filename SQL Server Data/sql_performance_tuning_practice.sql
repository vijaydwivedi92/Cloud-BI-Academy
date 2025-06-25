
-- Practice SQL File: Performance Tuning Examples

-- 1. Creating sample tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 2. Index Creation
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);

-- 3. Poor Query Example (To be tuned)
-- SELECT * usage and function in WHERE clause
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 2023;

-- 4. Optimized Query
SELECT OrderID, CustomerID, OrderDate, Amount FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31';

-- 5. Join Performance Check
-- Poor Join
SELECT * FROM Orders o, Customers c
WHERE o.CustomerID = c.CustomerID;

-- Optimized Join
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 6. Use of CTE for better readability
WITH RecentOrders AS (
    SELECT OrderID, CustomerID, OrderDate
    FROM Orders
    WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE())
)
SELECT * FROM RecentOrders;

-- 7. Updating Statistics
UPDATE STATISTICS Orders;

-- 8. Execution Plan Tip (Enable in SSMS before running queries)
-- Ctrl + M (Include Actual Execution Plan)
