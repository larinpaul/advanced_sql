-- 2024 01 15

-- The SQL LIKE Operator

-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- There are two wildcards often used in conjunction with the LIKE operator:
-- * The percent sign % represents zero, one, or multiple characters
-- * The underscore sign _ represents one, single character.

-- You will learn more about wildcards in the next chapter -- https://www.w3schools.com/sql/sql_wildcards.asp -- % _ [] ^ - {}


-- Example

-- Select all customers that start with the letter "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- Syntax
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;


-- Demo Database

-- The Customers table:
CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Swede


-- The _ Wildcard

-- The _ wildcard represents a single character

-- It can be any character or number, but each _ represents one, and ony one, character.

-- Return all customers form a city that starts with 'L' followed by one wildcard character,
-- then 'nd' and then two wildcard characters:
SELECT * FROM Customers
WHERE city LIKE 'L_nd__';


-- The % Wildcard

-- The % wildcard represents any number of characters, even zero characters.

-- Return all customers from a city that CONTAINS the letter 'L':
SELECT * FROM Customers
WHERE city LIKE '%L%';

-- Starts With

-- To return records that start with a specific letter of phrase, add % at the end of the letter or phrase.
SELECT * FROM Customers
WHERE CustomerName LIKE 'La%';

-- Tip: You can also combine any number of conditions using AND or OR operators.

-- Return all customers that start with 'a' or start with 'b':
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';

