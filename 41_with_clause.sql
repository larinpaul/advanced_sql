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

-- Let's go a little further from the previous example.
-- This time, you don't  have to calculate the difference between salaries.
-- But you need to show all the employees' analytical data 
-- and then show the average departmental and company salary.

-- You can do that by writing two CTEs instead of one:

WITH avg_total_salary AS (
    SELECT AVG(salary) AS average_company_salary
    FROM employees
),
avg_dpt_salary AS (
    SELECT department,
        AVG(salary) AS average_department_salary
    FROM employees
    GROUP BY department
)

SELECT e.id,
       e.first_name,
       e.last_name,
       e.salary,
       average_department_salary,
       average_company_salary
FROM employees e JOIN avg_dpt_salary ads ON e.department = ads.department,
avg_total_salary; -- they missed the cross join statement?

-- Yes, you can write multiple CTEs, one after another,
-- and then reference them in the main query.

-- To correct the error from the last line...

WITH avg_total_salary AS (
    SELECT AVG(salary) AS average_company_salary
    FROM employees
),
avg_dpt_salary AS (
    SELECT department,
           AVG(salary) AS average_department_salary
    FROM employees
    GROUP BY department
)
SELECT e.id,
       e.first_name,
       e.last_name,
       e.salary,
       ads.average_department_salary,
       ats.average_company_salary
FROM employees e 
JOIN avg_dpt_salary ads ON e.department = ads.department
CROSS JOIN avg_total_salary ats;

-- This is how you write multiple CTEs: the WITH clause is written only before the first query
-- (it mustn't appear before any other CTE!), and a comma must separate the CTEs.

-- No matter the number of CTEs, they must always be followed by the main query.
-- And there's no comma between the last CTE and the main query!


-- Examples 3 & 4: Revenue:


-- Example 3: Show Each Year with the Corresponding Annual Revenue and Total Revenue

-- This task is similar to Example 1, but we'll use a different aggregate function:

WITH total_revenue AS (
    SELECT SUM(revenue_amount) AS total_company_revenue
    FROM revenue
)

SELECT year,
    SUM (revenue_amount) AS annual_revenue,
    total_company_revenue
FROM revenue, total_revenue
GROUP BY year, total_company_revenue109516
ORDER BY year;


-- Example 4: Show Each Quarter Along with the Highest and Lowest Quarterly Revenue for That Year and Overall

-- You need to list all the years and quarters with the corresponding revenue.
-- So far, so good.
-- Then you need to show the lowest quarterly revnue for that year and the lowest quarterly revenue for all years.
-- Next, you do the same for the highest revenue.

-- Here's the solution:

WITH yearly_min_max_quarters AS (
    SELECT year,
            MIN(revenue_amount) AS minimum_quarterly_revenue_annual,
            MAX(revenue_amount) AS maximum_quarterly_revenue_annual
FROM revenue
GROUP BY year),

min_max_overall AS (
    SELECT MIN(revenue_amount) AS overall_min_revenue,
           MAX(revenue_amount) AS overall_max_revenue
FROM revenue)

SELECT r.year,
       quarter,
       revenue_amount,
       minimum_quarterly_revenue_annual,
       overall_min_revenue,
       maximum_quarterly_revenue_annual,
       overall_max_revenue
FROM revenue r
JOIN yearly_min_max_quarter ymmq
ON r.year = ymmq.year, min_max_overall
ORDER BY year, quarter ASC;


-- Example 5: Show the Lowest and Highest Average Working Hours

-- This example wants you to first find the average working hours by employee
-- and then only output the lowest and the highest average.

-- Here's the code to solve this problem:

WITH logic_times AS (
    SELECT
    id,
    employee_id,
    start_time,
    end_time,
    end_time - start_time AS working_hours
    FROM employee_timesheet),

avg_login AS (
    SELECT
employee_id,
AVG(working_hours) AS average_working_hours
FROM login_times
GROUP BY employee_id)

SELECT MIN(average_working_hours) AS min_average_working_hours,
    MAX(average_working_hours) AS max_average_working_hours
FROM avg_login;
