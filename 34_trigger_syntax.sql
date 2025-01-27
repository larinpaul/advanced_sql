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




