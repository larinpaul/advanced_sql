-- 2024 01 01

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- Joining tables

-- In the real world, companies often store data in silos,
-- separating things like customer data, application user data, and corporate financial data.
-- To construct an insignful dataset, a data analyst will often
-- need to pull data from various silos and join the records together
-- into a data model that makes it easy to group records and calculate statistics.

-- Use a JOIN caluse to combine the output form more than one table.
-- Typically, tables are joined based on a related column betweem them
-- like a primary key/ foreign key relationship.

-- We can join our ORDERS and CLIENT tables using the INNER JOIN clause
-- based on the clientID field like this:

SELECT * FROM client

INNER JOIN orders ON orders.clientID = client.clientID;

-- Notice our results are a combination of fields from both tables,
-- appearning in the order the tables were joined.
-- Since we're selecting from CLIENT first,
-- the frield from that table appear first.

-- Think about INNER JOIN like you would a Venn diagram.
-- Any record from table 1 or table 2 that doesn't share the common field,
-- won't output in the result-set.

-- In the case of the LEFT OUTER JOIN, it would return all records from table 1.
-- Also, in the case of LEFT OUTER JOIN, if the shared field does not exist in table 2,
-- the row still outputs from table 1 with nulls in each field of column 2.

-- Possible join types available in SQL Server:
-- * Inner join
-- * Left outer join
-- * Left inner join
-- * Right inner join
-- * Right outer join
-- * Full outer join
-- * Cross join.

-- In his experience, inner join and left join are the most common joins in SQL queries.
-- However, when working with advanced SQL data types like
-- strings, JSON or XML, cross joins become necessary.
-- Check out this tutorial on data transformations
-- for an example of how to work with JSON in SQL Server.
-- https://careerfoundry.com/en/blog/data-analytics/data-transformation/
