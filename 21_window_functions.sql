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



