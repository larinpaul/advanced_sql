-- 2025 01 22

-- SQL GROUP BY Statement

-- https://www.w3schools.com/sql/sql_groupby.asp


-- The SQL GROUP BY Statement

-- The GROUP BY statement groups rows that have the same value into summary rows,
-- like "find the number of customers in each country".

-- The GROUP BY statement is often used with aggregate functions ( COUNT(), MAX(), MIN(), SUM(), AVG() )
-- to group the result-set by one or more columns.


-- GROUP BY Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);


-- Demo Database

-- Below is a selection from the "Customers" table in the Northwind sample database:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


-- SQL GROUP BY Examples

-- The following SQL statement lists the number of customers in each country:

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;








