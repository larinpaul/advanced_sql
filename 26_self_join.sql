-- 2025 01 18

-- SQL Self Join

-- https://www.w3schools.com/sql/sql_join_self.asp


-- A self join is a regular join, but the table is joined with itself.

-- Self Join Syntax

SELECT column_name(s)
FROM table T1, table1 T2
WHERE condition;

-- T1 and T2 are different table aliases for the same table.


-- Demo Database

-- In this tutorial we will use the well-known Northwind sample database.

-- Below is a selection from the "Customers" table:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico


-- SQL Self Join Example

-- The following SQL statement matches customers that are from the same city:
-- Example
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;


-- A self join is a type of join in SQL that allows you to join a table to itself.
-- This can be useful in various scenarios,
-- particularly when you want to compare rows within the same table
-- or when you want to retrieve hierarchical data.
-- Here are some common use cases for self joins:
-- 1. Hierarchical data (e.g., employees and their managers)
-- 2. Comparing rows (for example, if you want to find pairs of products that have the same price)
-- 3. Finding duplicates (by comparing rows to each other)
-- 4. Aggregating data (based on certain conditions, e.g. if you want to find the total sales for each salesperson and compare it to the sales of other salespeople)
-- 5. Data transformation (sometimes, you may need to transform data based on relationships within the same table, and self joins can facilitate that)

-- Example

-- Consider a table Employees with the following structure:
EmployeeID	Name	ManagerID
1	Alice	NULL
2	Bob	1
3	Charlie	1
4	David	2

-- To find the names of employees along with their managers,
-- you could use a self join like this:
SELECT e1.Name AS Employee, e2.Name AS Manager
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID;

-- This query would return:

Employee	Manager
Bob	Alice
Charlie	Alice
David	Bob


-- Now let's create a more detailed example of a hierarchical structure using a self join

-- Employees table structure

EmployeeID	Name	ManagerID
1	Alice	NULL
2	Bob	1
3	Charlie	1
4	David	2
5	Eva	2
6	Frank	3

-- Goal
-- We want to retrieve a list of employees along with their managers' names to visualize the hierarchy.

SELECT
    e1.Name AS Employee,
    e2.Name AS Manager
FROM
    Employees e1
LEFT JOIN
    Employees e2 ON e1.ManagerID = e2.EmployeeID;

-- The result of the query:
EMPLOYEE MANAGER
Alice NULL
Bob Alice
Charlie Alice
David Bob
Eva Bob
Frank Charlie

-- From this result, you can see the hierarchy:
* Alice is at the top (CEO).
    * Bob and Charlie report to Alice.
        * David and Eva report to Bob.
        * Frank reports to Charlie.
