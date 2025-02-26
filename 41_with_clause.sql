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

-- Let's take a look at the key parts of the syntax.
-- The CTE is always, without exception,
-- initiated by the WITH clause.
-- The CTE name then follows, which is cte in the above generic example.
-- After the CTE name comes the keyword AS.
-- What follows in the parentheses is the definition of CTE.
-- In the very simple example, this is just a SELECT statement.
-- Finally, there's the main query (like with regular subqueries) that references the CTE.

-- Mind you, this is basic syntax. We're going to revisit it in the examples.
-- Along the way, you'll also see how this basic syntax can be extended by writing multiple or nested CTEs. -- https://learnsql.com/blog/cte-with-examples/

-- Examples 1 & 2: Salary Information


-- Sharding disperses data across various databases or servers,
-- while partitioning segregates data within a single database instance into subsets.

-- ...

-- Example 1: Show How Each Employee's Salary Compares to the Company's Average

-- To solve this problem, you need to show all data from the table employees.
-- Also, you need to show the company's average salary and then the difference to each employee's salary.

-- Here's the solution:

WITH avg_total_salary AS (
    SELECT AVG(salary) AS average_company_salary
    FROM employees
)

SELECT id,
    first_name,
    last_name,
    salary,
    department,
    average_company_salary,
    salary - average_company_salary AS salary_difference
FROM employees, avg_total_salary;

-- First, initiate the CTE using the WITH clause.
-- The CTE's name ('avg_total_salary') comes after that.
-- Open the parentheses after AS, and write the regular SELECT statement.
-- It calculates the company's average salary.


-- Example 2: Show the Employees' Data Along with the Average Department and Average Company Salary

