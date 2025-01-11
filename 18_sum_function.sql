-- 2024 01 11 

-- https://www.w3schools.com/sql/sql_sum.asp

-- SQL SUM() Functions


-- The SUM() function returns the total sum of a numeric column.

-- Return the sum of all Quantity fields in the OrderDetails table:
SELECT SUM(Quantity)
FROM OrderDetails;


-- Syntax
SELECT SUM(column_name)
FROM table_name
WHERE condition;


-- Add a WHERE Clause

-- Youcanadd a WHERE clause to specify conditions:

-- Example
-- Return the sum of the Quantity field for the product with ProductID 11:
SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductId = 11;


-- Use an Alias
-- Give the summarizedcolumna name by using the AS keyword.
-- Example
-- Name the column "total":
SELECT SUM(Quantity) AS total
FROM OrderDetails;


-- Use SUM() with GROUP BY
-- Here we use the SUM() function and the GROUP BY clause,
-- to return the Quantity for each OrderID in the OrderDetails table:
SELECT OrderID, SUM(Quantity) AS [Total Quantity]
FROM OrderDetails
GROUP BY OrderID;

-- You will learn more about the GROUP BY clause later in this tutorial.
-- https://www.w3schools.com/sql/sql_groupby.asp


-- SUM() With an Expression

-- The parameter inside the SUM() function can  also be an expression

-- Ifwe assume that each product in theOrderDetails columncosts 10 dollars,
-- we can find the total earnings in dollars by multiply each quantity with 10:
-- Example
-- Use an expression inside the SUM() function:
SELECT SUM(Quantity * 10)
FROM OrderDetails;

-- We can also join the OrderDetails table to the Products table to find the actual amount,
-- instead of assuming it is 10 dollars:
-- Example
-- Join OrderDetails with Products, and use SUM() to find the total amount:
SELECT SUM(Price * Quantity)
FROM OrderDetails
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;

-- You will learn more about Joins later in this tutorial
-- https://www.w3schools.com/sql/sql_join.asp
