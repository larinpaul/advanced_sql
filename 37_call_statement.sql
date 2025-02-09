-- 2025 02 09

-- 15.2.1 CALL Statement

-- https://dev.mysql.com/doc/refman/8.4/en/call.html

CALL sp_name([parameter[,...]])
CALL sp_name([])


-- Stored procedures that take no arguments can be invoked without parentheses.
-- That is, CALL p() and CALL p are equivalent.

-- CALL can pass back values to its caller using parameters that are declared as OUT or INOUT.
-- A client program can also obtain the number of rows affected:
-- At the SQL level, call the ROW_COUNT() function;
-- from the C API, call the mysql_affected_rows() function.

-- For information about the effect of unhandled conditions on procedure parameters, see 
-- Section 15.6.7.8. "Condition Handling and OUT or INOUT Paremeters".
-- https://dev.mysql.com/doc/refman/8.4/en/conditions-and-parameters.html

-- ...

-- The following procedure has an OUT parameter that the procedure sets to the current server version,
-- and an INOUT value that the procedure increments by one from its current value:

DELIMITER //

CREATE PROCEDURE p (OUT ver_param VARCHAR(25), INOUT incr_param INT)
BEGIN
    # Set value of OUT parameter
    SELECT VERSION() INTO ver_param;
    # Increment value of INOUT parameter
    SET incr_param = incr_param + 1;
END //

DELIMITER ;

-- MySQL Server supports three comment styles:
* FROM a # character to the end of the line.
* From a -- sequence to the end of the line.
* From a /* sequence to the following */ sequence, as in the C programming language

-- PHP Supprts two types of comments:
-- single-line comments, denoted by "//" or "#" at the beginning of a line,
-- and multi-line comments enclosed between "/*" and "*/" 

-- Comment tags in PHP
-- TODO
-- FIXME
-- NOTE
-- HACK -- A temporary workaround
-- @deprecated


-- Before calling the procedure, initialize the variable to be passed as the INOUT parameter.
-- After calling the procedure, you can see the values of the two variables are set or modified:
mysqL>
SET @increment - 10;
mysql>
CALL p(@version, @increment);
mysql>
SELECT @version, @increment;

+----------+------------+
| @version | @increment |
+----------+------------+
| 8.4.4   |         11 |
+----------+------------+
