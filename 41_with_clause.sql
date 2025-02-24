-- 2025 02 24 -- 6:07


-- https://learnsql.com/blog/sql-with-clause/
-- 5 Practical Examples of SQL's WITH Clause
-- Tiomir Babic


-- These five practicaluse cases will make you want to use the SQL WITH clause daily.

-- ...

-- The WITH clause is also called a Common Table Expression (CTE).


-- What Is the WITH Clause in SQL?

-- ...

-- The CTE can't run without the main query,
-- so it must be followed by a regular query.
-- This query is usually also a SELECT statement,
-- but it can be INSERT, UPDATE, or DELETE.

-- This of a CTE as a temporary table with a query that always has to be run for the table to be used.
-- Since it's a kind of table, you can reference the CTE in the FROM clause like a regular table.


-- Basic WITH Clause Syntax

-- What we explained above can be shows as an SQL code:

WITH cte AS (
    SELECT ...
    FROM table
)

SELECT ...
FROM cte;


