CREATE DATABASE Onlineretail;
use Onlineretail;


-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY
);

-- Create Sales Table
CREATE TABLE Sales (
    InvoiceNo INT PRIMARY KEY,
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(50),
    TotalSales DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


show tables;


SELECT count(*) FROM customers;


SELECT SUM(TotalSales) AS TotalSalesAmount
FROM Sales;


SELECT StockCode, Description, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY StockCode, Description
ORDER BY TotalQuantitySold DESC
LIMIT 10;


SELECT Country, SUM(TotalSales) AS TotalSalesAmount
FROM Sales
GROUP BY Country
ORDER BY TotalSalesAmount DESC;


SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(TotalSales) AS MonthlySales
FROM Sales
GROUP BY Year, Month
ORDER BY Year, Month;


SELECT InvoiceNo, COUNT(*) AS RefundCount
FROM Sales
WHERE Quantity < 0
GROUP BY InvoiceNo
HAVING RefundCount > 0;

