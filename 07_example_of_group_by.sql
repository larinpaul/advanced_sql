-- 2024 01 03 

-- https://careerfoundry.com/en/blog/data-analytics/what-is-sql/

-- What is SQl? The Complete Guide
-- BY ELIOT GUNN, UPDATED ON OCTOBER 4, 2023

-- Although it was created in the 1970s,
-- SQL remains one of the most popular languages today,
-- given its proximity to how massive datasets are managed,
-- stored, and then retrieved.
-- Learning SQL is also an excellent entry point
-- into more advanced programming in data science
-- and machine learning, too.

-- 1. What is SQL?
-- 2. What is SQL used for?
-- 3. What are the benefits of using SQL?
-- 4. How can I learn SQL?
-- 5. What are the best courses for learning SQL?
-- 6. Key takeaways

-- ...

-- Enter SQL (pronounced "sequel"),
-- which stands for structured query language,
-- a language created in 1974 by IBM 
-- to query data in relational database management system
-- (RDBMS).

-- ...

-- A simple script:

SELECT column_name(s)

FROM table_name

WHERE condition

GROUP BY column_name(s)

ORDER BY column_name(s)

-- But it can quickly incorporate much more complex logic
-- through window functions.
-- This snippet depicts how you can integrate 
-- aggregation functions within a database query:

SELECT  column_name(s),
        duration_seconds,
        SUM(duration_seconds) OVER
            (PARTITION BY column_name(s) ORDER BY start_time) -- PARTITION BY is a clause used in conjunction with window functions to divide a result set into partitions or groups based on one or more columns -- When you use PARTITION BY in a SQL query, you're telling the database to: 1. Divide the result set int ogroups based on the columns specified in the PARTITION BY clause. 2. Apply the window function (e.g., SUM, AVG, ROW_NUMBER, etc.) to each partition separately
            AS running_total,
        COUNT(duration_seconds) OVER
            (PARTITION BY column_name(s) ORDER BY start_time)
            AS running_count,
        AVG(duration_seconds) OVER
            (PARTITION BY column_name(s) ORDER BY start_time)
            AS running_avg
    FROM table
WHERE start_time < 'date'

-- Some queries can run into more than a thousand lines of code!
-- These examples demonstrate why SQL is so essentail to the data analytics profession.
-- If you are already familiar with performing data transformations and aggregations
-- from knowledge of DataFrames in Python or in R,
-- the logic behind SQL will come easily to you

-- ...

-- It doesn't matter if your company uses Python or R,
-- PowerBI or Tableau.
-- The odds are high that they use SQL and are hiring 
-- for basic knowledge in that.
-- Hence, learning SQL tremendously 
-- increases your competitiveness in the market.
-- Even if SQL doesn't feature highly in the job description,
-- many companies often choose to screen candidates
-- with a SQL coding challenge
-- as it is a useful way to test for coding ability.

-- ...

-- 4. How can I learn SQL?

-- As a beginner, the quickest way to start learning
-- is through online programming questions banks.
-- e.g. LeetCode, Codewars, HackerRank.

-- If you are a complete beginner to programming
-- and would like a gentler approach to learning the basics of SQL,
-- check our our guide to SQL to learn some beginner queries. 
-- https://careerfoundry.com/en/blog/data-analytics/how-to-use-sql/
-- You could also check out some popular tutorials
-- such as SQL Zoo -- https://sqlzoo.net/wiki/SQL_Tutorial
-- and W3 Schools -- https://www.w3schools.com/sql/default.asp

-- ...
