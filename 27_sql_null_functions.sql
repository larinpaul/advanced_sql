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

-- The COALESCE() function takes multiple arguments and returns the first non-NULL value in the list.
-- If all arguments are null, it returns NULL.
-- It is more flexible than IFNULL() because it can handle multiple potential NULL values
-- and provide a fallback for each.
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0)) AS TotalValue
FROM Products;
-- In this example, if UnitsOnOrder is NULL, it will be replaced by 0.

-- Example with Multiple Arguments
SELECT COALESCE(column1, column2, column3, 'default_value') AS FirstNonNullValue
FROM YourTable;


-- SQL Server


-- MS Access


-- Oracle


-- 





