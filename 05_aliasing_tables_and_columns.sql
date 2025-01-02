-- 2024 01 02

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 5. Aliasing tables and columns

-- SQL is NOT CASE SENSITIVE when it comes to commands and fields.

select * from client c
inner join orders o on o.clientID = c.clientID

-- It is typical to use the AS keyword
SELECT clientID AS clientIDfromClientTable FROM client

-- The aliased column name returns in the result-set;
-- however, when referencing the field in the query we'd still use
-- the original field name.
-- For example, if we INNER JOIN the ORDERS table on clientID,
-- we'd use the fieldname clientID, not the aliased name clientIDfromClientTable
