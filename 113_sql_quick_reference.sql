-- 2025 01 06

-- https://www.w3schools.com/sql/sql_quickref.asp

-- SQL Quick Reference from W3School


-- SQL Statement
-- Syntax

-- AND / OR

SELECT column_name(s)
FROM table_name
WHERE condition1
AND condition2;

SELECT column_name(s)
FROM table_name
WHERE  condition1
OR condition2;


-- ALTER TABLE

ALTER TABLE table_name
ADD column_name datatype;

-- or

ALTER TABLE table_name
DROP COLUMN column_name;


-- AS (alias)

SELECT column_name AS column_alias
FROM table_name;

-- or

SELECT column_name
FROM table_name AS table_alias;


-- BETWEEN

SELECT column_name(s)
FROM table_name
WHERE column_name
BETWEEN value1 AND value2;

-- sql
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 100000;


-- CREATE DATABASE
CREATE DATABASE database_name;


-- CREATE TABLE
CREATE TABLE table_name
(
column_name1 data_type,
column_name2 data_type,
column_name3 data_type;
...
)

-- CREATE INDEX
CREATE INDEX index_name -- allows duplicate values
ON table_name (column_name)

-- or

CREATE UNIQUE INDEX index_name -- doesn't allow duplicate values
ON table_name (column_name)


-- CREATE VIEW
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition


-- DELETE
DELETE FROM table_name
WHERE some_column=some_value

-- or
DELETE FROM table_name
-- (Note: Deletes the entire table!!)

DELETE * FROM table_name
-- (Note: Deletes the entire table!!)





