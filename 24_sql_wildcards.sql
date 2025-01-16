-- 2024 01 15

-- SQL Wildcard Characters

-- A wildcard character is used to substitute one or more characters in a string.

-- Wildcard characters are used with the LIKE operator.
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- Example
-- Return all customers that start with the letter 'a':
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- Wildcard Characters
% -- Represents zero or more characters
_ -- Represents a single character
[] -- Represents any single character with the brackets *
^ -- Represents any character not in the brackets *
- -- Represents any single character within the specified range *
{} -- Represents any escaped character **

-- * Not supported in PostgreSQL and MySQL databases.
-- ** Supported only in Oracle databases.

-- Demo Database
-- Below is a selection from the Customers table used in the examples:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden

-- Using the % Wildcard

-- The % wildcard represents any number of characters, even zero characters.

SELECT * FROM Customers
WHERE CustomerName LIKE '%es';

SELECT * FROM Customers
WHERE CustomerName LIKE '%mer%';

-- Using the _ Wildcard

SELECT * FROM Customers
WHERE City LIKE '_ondon';

SELECT * FROM Customers
WHERE City LIKE 'L___on';

-- Using the [] Wildcard
-- The [] wildcard returns a result if any of the characters inside gets a match.
-- Example
-- Return all customers starting with either "b", "s", or "p"
SELECT * FROM Customers
WHERE CustomerName LIKE '[bsp]%';

-- Using the - Wildcard


-- Combine Wildcards


-- Without Wildcard


-- Microsoft Access Wildcards

