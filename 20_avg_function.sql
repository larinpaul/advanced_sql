-- 2024 01 12

-- https://www.w3schools.com/sql/sql_avg.asp

-- The SQL AVG() Function

-- The AVG() function returns the average value of a numeric column


-- Example
-- Find the average price of all products:
SELECT AVG(Price)
FROM Products;

-- Note: NULL values are ignored


-- Syntax
SELECT AVG(column_name)
FROM table_name
WHERE condition;


-- Add a WHERE Clause
-- You canadd a WHERE clause to specify conditions:
-- Example
-- Return the average price of products in category 1:
SELECT AVG(Price)
FROM Products
WHERE CategoryID = 1;


-- Use an Alias
-- Give the AVG columna name by using the AS keyword.
-- Example
-- Name the column "average price":
SELECT AVG(Price) AS [average price]
FROM Products;


-- Higher Than Average
-- To list all records with a higher price than average, 
-- we canuse the AVG() function in a sub query:
-- Example
-- Return all products with a whigher price than the average price:
SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);
-- Potential Optimization:
-- 1. Precompute the Average and store it in a variable or a Common Table Expression (CTE)
WITH AvgPrice AS (
    SELECT AVG(price) AS avg_price FROM Products
)
SELECT * FROM Products
WHERE price > (SELECT avg_price FROM AvgPrice);
-- 2. Index on `price`. This will speed up the filtering process in the `WHERE` clause.
CREATE INDEX idx_price ON Products(price);
-- 3. Avoid Redundant Calculations
-- If the `Products` table is statis or doesn't change frequently, you could precompute the average and store it 
-- in aseparate table or a variable, then use it in your query.
-- Example using a variable (in SQL Server):
DECLARE @avg_price DECIMAL(18, 2);
SELECT @avg_price = AVG(price) FROM Products;
SELECT * FROM Products
WHERE price > @avg_price;
-- 4. Materialized Views:
-- If the `Products` table is very large and the average price doesn't change frequntly,
-- consider using a materialized view to store the average price.
-- Example (PostgreSQL):
CREATE MATERIALIZED VIEW avg_product_price AS
SELECT AVG(price) AS avg_price FROM Products;
SELECT * FROM Products
WHERE price > (SELECT avg_price FROM avg_product_price);
-- 5. Database-Specifix Optimizations:
-- Some databases have specified optimizations for subqueries.
-- For example, in MySQL, you can use the `EXPLAIN` statement
-- to analyze the query and see if there are any bottlenecks.
EXPLAIN SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);
-- Final Thoughts:
-- The query is already quite optimized for small to medium-sized datasets.
-- However, for larger datasets, precomputing the average
-- or using indexing can significantly improve performance.
-- Always consider the specific characteristics of your database and dataset when optimizing queries.


-- Use AVG() with GROUP BY
-- Here we use the AVG() function and the GROUP BY clause,
-- to returns the average price for each category in the Products table:
-- Example
SELECT AVG(Price) AS AveragePrice, CategoryID
FROM Products
GROUP BY CategoryID;

-- You will learn more about the GROUP BY clause later in this tutorial.
-- https://www.w3schools.com/sql/sql_groupby.asp
