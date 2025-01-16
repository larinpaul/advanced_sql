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
-- The - wildcard allows you to specify a range of characters inside the [] wildcard.
-- Example
-- Return all characters starting with "a", "b", "c", "d", "e" or "f":
SELECT * FROM Customers
WHERE CustomerName LIKE '[a-f]%';

-- Combine Wildcards
-- Any wildcard, like % and _, can be used in combination with other wildcards.

-- Return all cusomers that start with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- Return all customers that have "r" in the second position:
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

-- Without Wildcard

-- If no wildcard is specified, the phrase has to have an exact match to return a result.

SELECT * FROM Customers
WHERE Country LIKE 'Spain'

-- Microsoft Access Wildcards

-- The Microsoft Access Database has some other wildcards:

-- Symbol -- Description -- Example

* -- Represents zero or more characters -- bl* filds bl, black, blue, and blob
? -- Represents a single character -- h?t finds hot, hat, and hit
[] -- Represents any single character within the brackets -- h[oa]t finds hot and hat, but not hit
! -- Represents any character not in the brackets -- h[!oa]t finds hit, but not hot and hat
- -- Represents any single character within the specified range - c[a-b]t finds cat and cbt
# -- Represents any single numeric character -- 2#5 finds 205, 215, 225, 235, 245, 255, 265, 275, 285, and 295
