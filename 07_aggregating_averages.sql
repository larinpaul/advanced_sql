-- 2024 01 02

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 7. Aggregating averages inadvanced SQL

-- The last aggreagte function we'll look at is AVG(),
-- which is used a lot in advanced sql queries in data analytics.
-- The AVG() function returns the calculated average of a numeric column.
-- Aggreagate functions are also used in window functions,
-- You can find an example of window functions in this article:
-- https://careerfoundry.com/en/blog/data-analytics/what-is-sql/

-- When using aggreaget functions, remember to declare an alias
-- for the aggregation or the column will not return a name.
-- Columns without names can sometimes cause problems in complex queries.

-- Let's say we want to calculate
-- the average amount billed from our orders table.

SELECT AVG(billed) as averageBilled FROM orders

-- Calculating an overall average is easy;
-- however, we sometimes need to figure the average value
-- based on specified groups within our dataset.
-- For example, say we wanted 
-- to find the average bileld per client.
-- For that we need to use the GROUP BY command.

-- Using GROUP BY groups records that have the same value.
-- When using GROUP BY, we must include all the fields 
-- in our select statement except the ones being aggregated.
-- Let's combine what we've learned in this article
-- and write a query that includes client information
-- and calculates the average billed per client:

SELECT c.clientID, c.firstName, c.lastName, avg(o.billed) as
AverageBilledPerClient
FROM client c
INNER JOIN orders o on o.clientID = c.clientID
GROUP BY c.clientID, c.firstName, c.lastName
