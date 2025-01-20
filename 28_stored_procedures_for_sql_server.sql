-- 2025 01 20


-- What is a Stored Procedure?

-- A stored procedure is a prepared SQL code that you can save,
-- so the code can be reused over and over again.

-- So if you have an SQL query that you write over and over again,
-- save it as a astored procedure, and then just call it to execute it.

-- You can also pass arguments to a stored procedure,
-- so that the stored procedure can act based on the parameter value(s) that is passed.


-- Stored Procedure Syntax

CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

-- Execute a Stored Procedure

EXEC procedure_name;


-- Demo Database
-- Below is a selection from the "Customers" table in the Northwind sample database:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1   Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


-- Stored Procedure Example

-- The following SQL statement creates a stored procedure named "SelectAllCustomers"
-- that selects all records from the "Customers" table:

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

-- Execute the stored procedure above as follows:
EXEC SelectAllCustomers;


-- Stored Procedure With One Parameter

-- The following SQL statement creates a stored procedure 
-- that selects Customers from a particular City from the "Customers" table:

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

-- Execute the stored procedure above as follows:

EXEC SelectAllCustomers @City = 'London';


-- Stored Procedure With Multiple Parameters





