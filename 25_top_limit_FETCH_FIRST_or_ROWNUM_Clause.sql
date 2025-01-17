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
1

Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4

Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


-- LIMIT


-- FETCH FIRST


-- SQL TOP PERCENT Example


-- ADD a WHERE CLAUSE


-- ADD the ORDER BY Keyword








