-- 2025 01 27

-- 27.3.1 Trigger Syntax Examples

-- https://dev.mysql.com/doc/refman/8.4/en/trigger-syntax.html


-- To create a trigger or drop a trigger, use the CREATE TRIGGER or DROP TRIGGER statement,
-- described in Section 15.1.22, "CREATE TRIGGER Statement"
-- and Section 15.1.34, "DROP TRIGGER Statement"

-- Here is a simple example that associates a trigger with a table,
-- to activate for INSERT operations.
-- The trigger acts as an accumulator,
-- summing the values inserted into one of the columns of the table.

-- mysql>
CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));
-- Query OK, 0 rows affected (0.03 sec)

-- mysql>
CREATE TRIGGER ins_sum BEFORE INSERT ON account
        FOR EACH ROW SET @sum = @sum + NEW.amount;
-- Query OK, 0 rows affected (0.01 sec)

-- Wokrs with:
-- BEFORE or AFTER
-- INSERT or DELETE or UPDATE
-- The statement following FOR EACH ROW defines the trigger body,
-- that is, the statement to execute each time the trigger activates,
-- which occurs once for each row affected by the trigger event.
-- Here the statement refers to the column as NEW.amount
-- which means "the value of the amount column to be inserted into the new row."

-- To use the trigger, set the accumulator variable to zero,
-- execute an INSERT statement,
-- and then see what value the variable has afterward:
SET @sum = 0;
INSERT INTO account VALUES(137,14.98),(141.1937.50),(97,-100.00);
SELECT @sum AS 'Total amount inserted';
/*
+-----------------------+
| Total amount inserted |
+-----------------------+
|               1852.48 |
+-----------------------+
*/

-- In this case, the value of @sum after the INSERT statement has executed
-- is 14.98 + 1937.50 - 100, or 1852.48.

-- To the destroy the trigger, use a DROP TRIGGER statement.
-- You must specify the schema name if the trigger is not in the default schema:
DROP TRIGGER test.ins_num;

-- If you trop a table, any triggers for the table are also dropped.




