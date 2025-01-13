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


-- If you add a WHERE clause to a query with GROUP BY,
-- the filtering happens BEFORE the grouping.
-- The WHERE clause filters the rows from the table,
-- and then the remaining rows are grouped and aggregated.
-- Let's extends the previous example to include a WHERE clause and see how it works. 

-- Suppose you want to calculate the average price AVG(Price) 
-- for each combination of CategoryID and SupplierID,
-- but only for rpdeocuts with a price greater than 15.00
SELECT
    AVG(Price) AS AveragePrice,
    CategoryID,
    SupplierID
FROM Products
WHERE Price > 15.00
GROUP BY CategoryID, SupplierID;

-- WHAT HAPPENS STEP-BY-STEP
-- 1. Filtering with WHERE. Only rows with Price > 15.00 are considered for grouping and aggregation
-- 2. Grouping with GROUP BY. The remaining rows are grouped by CategoryID and SupplierID
-- 3. Aggregation with AVG(Price). The average price is calculated for each group

-- Filtered data (WHERE Price > 15.00)
ProductID	ProductName	CategoryID	SupplierID	Price
3	Product C	1	102	20.00
4	Product D	2	101	25.00
5	Product E	2	102	30.00
6	Product F	2	102	35.00

-- Grouped and Aggregated Result:
AveragePrice	CategoryID	SupplierID
20.00	1	102
25.00	2	101
32.50	2	102

-- Key Points:
-- The WHERE clause is applied BEFORE grouping and aggregation
-- Only rows that satisfy the WHERE condition are included in the groups
-- If a group has no rows after the WHERE clause, it will not appear in the result.

-- What if you want to filter after grouping?
-- If you want to filter the results after grouping
-- (e.g., only show groups where the average price is greater than a certain value),
-- you would use the HAVING clause instead of WHERE. For example:
SELECT 
    AVG(Price) AS AveragePrice,
    CategoryID,
    SupplierID
FROM Products
GROUP BY CategoryID, SupplierID
HAVING AVG(Price) > 20.00;
-- This would exclude groups where the average price is 20.00 or less.

-- Many HAVING use cases can also be achieved with WHERE in certain scenarions.
-- However, the key difference lies in when the filtering happens and what you're filtering.
SELECT
    SupplierID,
    COUNT(*) AS ProductCount
FROM Products
GROUP BY SupplierID
HAVING COUNT(*) > 10;
-- What's Happening:
-- The query groups rows by SupplierID and counts the number of products for each supplier.
-- The HAVING clause filters out groups where the count of products is 10 or less.
-- Why WHERE Can't Replace HAVING Here:
-- The COUNT(*) function is an aggregate function, and its result is only available AFTER grouping.
-- The WHERE clause operates before grouping, so it doesn't have access to the result of COUNT(*).

-- Why Other Examples Can Be Done with WHERE (Sometimes)...
-- Example 1: Find Categories with High Average Prices HERE IT CANNOT:
SELECT
    CategoryID,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY CategoryID
HAVING AVG(Price) > 50; -- Cannot because we first have to calculate average price
-- Example 4: Filter Rows Before Grouping
SELECT
    CategoryID,
    AVG(Price) AS AveragePrice
FROM Products
WHERE Price > 50
GROUP BY CategoryID;

