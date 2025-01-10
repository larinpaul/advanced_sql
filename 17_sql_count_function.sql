-- 2024 01 10

-- https://www.w3schools.com/sql/sql_count.asp

SELECT COUNT(*)
FROM Products;


-- Syntax
SELECT COUNT(column_name)
FROM table_name
WHERE condition;


-- ...


-- Add a WHERE clause
SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;


-- Ignore Duplicates

-- How many *different* prices are there in the Products table:
SELECT COUNT(DISTINCT Price)
FROM Products;


-- Use an Alias
-- "Number of records"
SELECT COUNT(*) AS [Number of records]
FROM Products;


-- Use COUNT() with GROUP BY
SELECT COUNT(*) AS [Number of records], CategoryID
FROM Products
GROUP BY CategoryID;
