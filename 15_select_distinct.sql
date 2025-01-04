-- 2024 01 04

-- https://www.w3schools.com/sql/sql_distinct.asp

-- SQL SELECT DISTINCT Statement

SELECT DISTINCT Country FROM Customers;

-- Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;

-- Count distinct
SELECT COUNT(DISTINCT Country) FROM Customers;
