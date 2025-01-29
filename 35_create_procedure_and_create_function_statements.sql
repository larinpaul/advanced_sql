-- 2025 01 29


-- 15.1.17 CREATE PROCEDURE and CREATE FUNCTION Statements
-- https://dev.mysql.com/doc/refman/8.4/en/create-procedure.html


CREATE
    [DEFINER = user]
    PROCEDURE [IF NOT EXISTS] sp_name ([proc_parameter[,...]])
    [chracteristic ...] routine_body

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





