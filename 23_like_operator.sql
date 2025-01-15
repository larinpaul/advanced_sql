-- 2024 01 15

-- The SQL LIKE Operator

-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- There are two wildcards often used in conjunction with the LIKE operator:
-- * The percent sign % represents zero, one, or multiple characters
-- * The underscore sign _ represents one, single character.

-- You will learn more about wildcards in the next chapter -- https://www.w3schools.com/sql/sql_wildcards.asp -- % _ [] ^ - {}


-- Example

-- Select all customers that start with the letter "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- Syntax
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;


