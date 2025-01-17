-- 2025 01 17

-- SQL TOP, LIMIT, FETCH FIRST or ROWNUM Clause


-- The SQL SELECT TOP Clause
-- The SELECT TOP clause is used tospecify the number of records to return.
-- Example
SELECT TOP 3 * FROM Customers;

-- Note: Not all database systems suport the SELECT TOP clause.
-- MySQL supports the LIMIT clause to select a limited number of records,
-- while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM.

-- SQL Server / MS Access Syntax:
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

-- MySQL Syntax:
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

-- Oracle 12 Syntax:
SELECT column_name(s)
FROM table_name
ORDER BY column_name(s)
FETCH FIRST number ROWS ONLY;

-- Older Oracle Syntax:
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number;

-- Older Oracle Syntax (with ORDER BY):
SELECT *
FROM (SELECT column_name(s) FROM table_name ORDER BY column_name(s))
WHERE ROWNUM <= number;


-- Demo Database

-- Below is a selection from the Customers table used in the example:
CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


-- LIMIT

-- The following SQL statement shows the equivalent example for MySQL:
-- Example
-- Select the first 3 records of the Customers table:
SELECT * FROM Customers
LIMIT 3;

-- FETCH FIRST
-- The following SQL statement shows the equivalent for Oracle:
SELECT * FROM Customers
FETCH FIRST 3 ROWS ONLY;

-- SQL TOP PERCENT Example
-- The following SQL statement selects the first 50% of the records 
-- from the "Customers" table (for SQL Server/MS Access):
-- Example
SELECT TOP 50 PERCENT * FROM Customers;

-- The following SQL statement shows the equivalent example for Oracle:
-- Example
SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY;


-- ADD a WHERE CLAUSE

-- The following SQL statement selects the first three records from the "Customers" table,
-- where the country is "Germany" (for SQL Server/MS Access):
-- Example
SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

-- The following SQL statement showst he equivalent example for MySQL:
-- Example
SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

-- The followign SQL statement shows the equivalent example for Oracle:
-- Example
SELECT * FROM Customers
WHERE Country='Germany'
FETCH FIRST 3 ROWS ONLY;


-- ADD the ORDER BY Keyword

-- Add the ORDER BY keyword when you want to sort the result,
-- and return the first 3 records of the sorted result.

-- For SQL Server and MS Access:
-- Example
-- Sort the result reverse aphabetically by CustomerName, and return the first 3 records:
SELECT TOP 3 * FROM Customers
ORDER BY CustomerName DESC;

-- The following SQL statement shows the equivalent example for MySQL:
SELECT * FROM Customers
ORDER BY CustomerName DESC
LIMIT 3;

-- The following SQL statement shows the equivalent example for Oracle:
SELECT * FROM Customers
ORDER BY CustomerName DESC
FETCH FIRST 3 ROWS ONLY;
