-- 2024 01 04

-- https://www.w3schools.com/sql/sql_distinct.asp

-- SQL SELECT DISTINCT Statement

SELECT DISTINCT Country FROM Customers;

-- Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;

-- Count distinct
SELECT COUNT(DISTINCT Country) FROM Customers;

-- Some RDBMS don't support SELECT COUNT(DISTINCT Country)
-- for example MS Access
-- so you have to use something like this

SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);
