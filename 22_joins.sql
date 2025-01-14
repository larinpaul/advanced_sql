-- 2024 01 14

-- SQL JOIN


-- A JOIN clause is used to combine rows from two or more tables,
-- based on a related column between them.

-- Let's look at a selection from the Orders table:

OrderID	CustomerID	OrderDate
10308	2	1996-09-18
10309	37	1996-09-19
10310	77	1996-09-20

-- Then, look at a selection from the Customers table:

CustomerID	CustomerName	ContactName	Country
1	Alfreds Futterkiste	Maria Anders	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mexico

-- Then, wecreate the following SQL Statement (that contains an INNER JOIN),
-- that selects records that have matching values in both tables:

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- And it will product something like this:

OrderID	CustomerName	OrderDate
10308	Ana Trujillo Emparedados y helados	9/18/1996
10365	Antonio Moreno Taquería	11/27/1996
10383	Around the Horn	12/16/1996
10355	Around the Horn	11/15/1996
10278	Berglunds snabbköp	8/12/1996

-- Different Types of SQL JOINs:
-- * (INNER) JOIN: Returns records that have matching values in both tables
-- * LEFT (OUTER) JOIN: Returns all records from the left table,and the matched records from the right table
--* RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- * FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table


-- SQL Query with Join on Multiple Columns
-- You want to join the tables on both OrderID and ProductID to get detailed information about each order.

-- Orders table:
OrderID	CustomerID	ProductID	OrderDate
1	101	201	2023-01-01
2	102	202	2023-01-02
3	101	203	2023-01-03

-- OrderDetails table:
OrderID	ProductID	Quantity	Price
1	201	2	50
2	202	1	100
3	203	3	75

SELECT
    O.OrderID,
    O.CustomerID,
    O.ProductID,
    O.OrderDate,
    OD.Quantity,
    OD.Price
FROM
    Orders O
JOIN
    OrderDetails OD
ON
    O.OrderID = OD.OrderID
    AND O.ProductID = OD.ProductID;

-- Result
-- The query will returns rows where both OrderID and ProductID match between the two tables:
OrderID	CustomerID	ProductID	OrderDate	Quantity	Price
1	101	201	2023-01-01	2	50
2	102	202	2023-01-02	1	100
3	101	203	2023-01-03	3	75

-- The ON clause specifies two conditions:
-- Only rows that satisfy BOTH conditions are included in the result.

-- Notes
-- * Youcan join on as many columns as needed by adding more conditions with AND or OR
-- * If you use OR, the join will include rows that satisfy EITHER condition
-- * Be cautious when joining on multiple columns,as it can lead to fewer matches if the conditions are too strict.

-- This approach is commonly used when tables have composite keys 
-- or when you need to join on multiple attributes to uniquely identify rows.
