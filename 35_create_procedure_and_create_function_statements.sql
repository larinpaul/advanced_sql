-- 2025 01 29


-- 15.1.17 CREATE PROCEDURE and CREATE FUNCTION Statements
-- https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html


CREATE
    [DEFINER = user]
    PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = user]
    FUNCTION [IF NOT EXISTS] sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

func_parameter:
    param_name type

type:
    Any valid MySQL data type

characteristic: {
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMENISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

}

routine_body:
    SQL routine

-- These statements are used to create a stored routine (a stored procedure or a function)

-- See Section 15.7.4.1. "CREATE FUNCTION Statement for Loadable Functions"
-- A loadable function can be regarded as an external stored function.

-- To invoke a stored procedure, use the CALL statement (see Section 15.2.1, "CALL Statement")


-- The following example shows a simple procedure that,
-- given a country code, counts the number of cities for that country that appear in the city table
-- of the world database.
-- The country code is passed using an IN parameter,
-- and the city count is returned using an OUT parameter:

-- mysql>
delimiter //

-- mysql> 
CREATE PROCEDURE citycount (IN country CHAR(3), OUT cities INT)
    BEGIN
        SELECT COUNT(*) INTO cities FROM world.city
        WHERE CountryCode = country;
    END//
-- Query OK, 0 rows affected (0.01 sec)

-- mysql>
delimiter ;

-- mysql>
CALL citycount('JPN', @cities); -- cities in Japan
-- Query OK, 1 row affected (0.00 sec)

-- mysql>
SELECT @cities;
-- +---------+
-- | @cities |
-- +---------+
-- |     248 |
-- +---------+
-- 1 row in set (0.00 sec)

-- mysql>
CALL citycount('FRA', @cities); -- cities in France
-- Query OK, 1 row affected (0.00 sec)

-- mysql>
SELECT @cities;
-- +---------+
-- | @cities |
-- +---------+
-- |      40 |
-- +---------+
-- 1 row in set (0.00 sec)

-- The example uses the mysql client delimiter command
-- to change the statement delimiter from ; to //
-- while the procedure is being befined.
-- This enables the ; delimiter used in the procedure body to be passed through to the server
-- rather than being interpreted by mysql itsef.
-- See Section 27.1, "Defining Stored Programs" -- https://dev.mysql.com/doc/refman/8.4/en/stored-programs-defining.html

-- ...

-- The following example function takes a parameter,
-- performs an operation using an SQL function, and returns the result.
-- In this case, it is unnecessary to use delimiter
-- because the function definition contains to internal ; statement delimiters:

/*
-- mysql>
CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMENISTIC
RETURN CONCAT('Hello, ',s,'!');
-- mysql>
SELECT hello('world'):
+----------------+
| hello('world') |
+----------------+
| Hello, world!  |
+----------------+
1 row in set (0.00 sec)
*/

-- ...

-- The routine_bdy consists of a valid SQL routine statement.
-- This can be a simple statement such as  SELECT or INSERT,
-- or a compound statement written using BEGIN and END.
-- Compound statements can contain declarations, loops, and other control structure statements.
-- The syntax for these statements is described in Section 15.6, "Compound Statement Syntax". -- https://dev.mysql.com/doc/refman/8.4/en/sql-compound-statements.html

-- MySQL perimits routines to contain DDL statements, such as CREATE and DROP.
-- MySQL also permits stored procedures (but not stored functions) to contain SQL transaction statements such as COMMIT.

-- Statements that return a result set can be used within a stored procedure but not within a stored function.
-- This prohibition includes SELECT statements that do not have an INTO var_list clause
-- and other statements such as SHOW, EXPLAIN, and CHECK TABLE.

-- ...

-- USE statements within stored routines are not permitted.
-- When a routine is invoked, an implicit USE db_name is performed
-- (and undone when the routine terminates).
-- This causes the routine to have the given default database while it executes.
-- References to objects in databases other than the routine default database
-- should be qualified with the appropriate database name.

-- ...

-- A routine is considered "determenistic" if it always produces the same result for the same input parameters,
-- and "not determenistic" otherwise.

-- ...

-- Within the body of a stored routine that is defined with SQL SECURITY DEFINER characteristic,
-- the CURRENT USER https://dev.mysql.com/doc/refman/8.4/en/information-functions.html#function_current-user
-- function returns the routine's DEFINER value.
-- For information about user auditing within stored routines, see
-- Section 8.2.23, "SQL-Based Account Activity Auditing". -- https://dev.mysql.com/doc/refman/8.4/en/account-activity-auditing.html

-- Consider the following procedure, which displays a count of the number of MySQL accounts
-- listed in the mysql.user system table:
CREATE DEFINED = 'admin'@'localhost' PROCEDURE account_count()
BEGIN
    SELECT 'Number of accounts:', COUNT(*) FROM mysql.user;
END;

-- ...
