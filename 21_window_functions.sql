-- 2024 01 13

-- WINDOW FUNCTIONS

-- Window functions in SQL are powerful tools that allow you to performs calculations
-- across a set of table rows that are somehow related to the current row.
-- Unlike aggregate functions, which return a single result for a group of rows,
-- window functions return a value for each row in the result set.
-- This makes them incredibly useful for tasks like 
-- running totals, moving averages, ranking, and more. -- A running total or rolling total is the summation of a sequence of numbers which is updated each time a new number is added to the sequence, by adding the value of the new number to the previous running total. Another term for it is partial sum.

-- Key Concepts of Window Functions
-- 1. Window Definition:
-- * A window function operates on a set of rows defined by the OVER clause.
-- * The OVER clause specifies how to partition and order the rows for the window function.
-- 2. Partitioning:
-- * The PARTITION BY clause divides the result set into partitions (groups) 
-- to which the window function is applied.
-- * If PARTITION BY is omitted, the function treats teh entire result set as a single partition.
-- 3. Ordering:
-- * The ORDER BY clause within the OVER clause determines the order of rows within each partition.
-- * This is crucialfor functions like ROW_NUMBER(), RANK(), and cumulative calculations.
-- 4. Frame Specification:
-- * For some window functions, you can define a frame (a subset of rows within the partition)
-- using the ROWS or RANGE clause.
-- * This is useful for running totals, moving averages, etc.


-- Common Window Functions


-- 1. ROW_NUMBER():
-- * Assigns a unique sequential integer to each row within a partition.
SELECT
    ProductID,
    ProductName,
    Price,
    ROW_NUMBER() OVER (ORDER BY Price DESC) AS RowNum
FROM Products;

-- 2. RANK()
-- * Assigns a rank to each row within a partition, with gaps in the ranking values if there are ties.
SELECT
ProductID,
ProductName,
Price,
RANK() OVER (ORDER BY Price DESC) AS Rank
FROM Products;

-- 3. DENSE_RANK():
-- * Similar to RANK(), but without gaps in the ranking values.
SELECT
ProductID,
ProductName,
Price,
DENSE_RANK() OVER (ORDER BY Price DESC) AS DenseRank
FROM Products;

-- 4. NTILE(n):
-- * Divides the rows into n buckets and assigns a bucket number to each row.
SELECT
ProductID,
ProductName,
Price,
NTILE(4) OVER (ORDER BY Price DESC) AS Quartile
FROM Products;

-- 5. SUM(), AVG(), MIN(), MAX():
-- These aggregate functions can be used as window functions
-- to calculate running totals, moving averages, etc.
SELECT
    ProductID,
    ProductName,
    Price,
    SUM(Price) OVER (ORDER BY ProductID) AS RunningTotal
FROM Products;

-- 6. LAG() and LEAD():
-- * LAG() accesses data from a previous row in the same result set.
-- * LEAD() accesses data from a subsequent row.
SELECT
    ProductID,
    ProductName,
    Price,
    LAG(Price, 1) OVER (ORDER BY ProductID) AS PreviousPrice,
    LEAD(Price, 1) OVER (ORDER BY ProductID) AS NextPrice
FROM Products;


-- Examples

-- 1. Running Total:
SELECT
ProductID,
ProductName,
Price,
SUM(Price) OVER (ORDER BY ProductID) AS RunningTotal
FROM Products;

-- 2. Moving Average:
SELECT
    ProductID,
    ProductName,
    Price,
    AVG(Price) OVER (ORDER BY ProductID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg
FROM Products;

-- 3. Ranking Products by Price:
SELECT
ProductID,
ProductName,
Price,
RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Products;

-- 4. Partitioned Ranking:
SELECT
ProductID,
ProductName,
CategoryID,
Price,
RANK() OVER (PARTITION BY CategoryID ORDER BY Price DESC) AS CategoryPriceRank
FROM Products;


-- Advanced Use Cases

-- 1. Cumulative Distribution:
SELECT
    ProductID,
    ProductName,
    Price,
    CUME_DIST() OVER (ORDER BY Price) AS CumulativeDistribution
FROM Products;

-- 2. Percentile Rank:
SELECT
    ProductID,
    ProductName,
    Price,
    PERCENT_RANK() OVER (ORDER BY Price) AS PercentileRank
FROM Products;

-- 3. First and Last Value in a Window:
SELECT
    ProductID,
    ProductName,
    Price,
    FIRST_VALUE(Price) OVER (ORDER BY ProductID) AS FirstPrice,
    LAST_VALUE(Price) OVER (ORDER BY ProductID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastPrice
FROM Products;

-- Performance Considerations:
-- * Indexing: Ensure that the columns used in the ORDER BY and PARTITION BY clauses are indexed for better performance.
-- * Frame Specification: Bemindful of the frame specification (`ROWS` vs `RANGE`) as it can impact performance, especially with large datasets.
-- ROWS defines the widnow frame based on PHYSICAL ROWS relative to the current row. It works with a fixed number of rows before or after the current row.
-- ROWS BETWEEN <start> AND <end>
-- RANGE defines the winow function frame based on LOGICAL RANGES OF VALUES relative to the current row. It groups rows with the same value in the ORDER BY columnand treats them as a single unit.
-- RANGE BETWEEN <start> AND <end>
-- * Partitioning: Proper partitioning can reduce the amoung of data processed by the window function.
