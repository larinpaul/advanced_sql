-- 2025 01 19 

-- SQL NULL FUNCTIONS

-- https://www.w3schools.com/sql/sql_isnull.asp

-- SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions

-- Look at the following "Products" table:

P_Id	ProductName	UnitPrice	UnitsInStock	UnitsOnOrder
1	Jarlsberg	10.45	16	15
2	Mascarpone	32.56	23	 
3	Gorgonzola	15.67	9	20

-- Suppose that the "UnitsOnOrder" column is optional, and may contain NULL values.

-- Look at the following SELECT statement:

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder) -- * is used as a multiplication operator
FROM Products;

-- In the example above, if any of the "UnitsOnOrder" values are NULL, the results will be NULL.


-- Solutions


-- MySQL

-- The MySQL IFNULL() function lets you return an alternative if an expression is NULL:
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;

-- or we can use the COALESCE() function, like this:

SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products;


-- SQL Server


-- MS Access


-- Oracle


-- 





