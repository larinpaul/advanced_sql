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


-- Using GROUP BY with multiple columns.
-- When you use `GROUP BY` with multiple columns,
-- the query groups the results based on the unique combinations of values in those columns.

-- Suppose you have a `Products` table with the following columns:
-- ProductID
-- ProductName
-- CategoryID
-- SupplierID
-- Price

-- Let's assume the Products table has the following data:
ProductID	ProductName	CategoryID	SupplierID	Price
1	Product A	1	101	10.00
2	Product B	1	101	15.00
3	Product C	1	102	20.00
4	Product D	2	101	25.00
5	Product E	2	102	30.00
6	Product F	2	102	35.00

-- You want to calculate the average price AVG(Price) for each combination of CategoryID and SupplierID
SELECT
    AVG(Price) AS AveragePrice,
    CategoryID,
    SupplierID
FROM Products
GROUP BY CategoryID, SupplierID;

-- The query would group the data by CategoryID and SupplierID and calculate the average price for each group.
-- The result would look like this:
AveragePrice	CategoryID	SupplierID
12.50	1	101
20.00	1	102
25.00	2	101
32.50	2	102

-- Key Points: 
-- The GROUP BY clause creates groups based on the unique combinations of CategoryID and SupplierID
-- The AVG(Price) is calculated for each group
-- The result shows the average price for each combination of CategoryID and SupplierID

-- If you want to group by more columns 
-- (e.g., CategoryID, SupplierID, and another column like Region),
-- you can simply add the column to the GROUP BY clause and the SELECT list
SELECT
    AVG(Price) AS AveragePrice,
    CategoryID,
    SupplierID,
    Region
FROM Products
GROUP BY CategoryID, SuppleirID, Region;



