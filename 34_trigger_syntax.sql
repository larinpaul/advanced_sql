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

-- It is possible to define multiple triggers for a given table that have the same trigger event and action time.
-- For example, two BEFORE UPDATE triggers for a table.
-- To affect trigger order, specify a clause after FOR EACH ROW
-- that indicates FOLLOWS or PRECEDES and the name of an existing trigger
-- that also has the same trigger event and action time.

CREATE TRIGGER ins_transaction BEFORE INSERT ON account
FOR EACH ROW PRECEDES ins_sum
SET
@deposits = @deposits + IF(NEW.amount>0,NEW.amount,0),
@withdrawals = @withdrawals + IF(NEW.amount<0,-NEW.amount,0);

-- ...

-- Within the trigger body, the OLD and NEW keywords enable your to access columns
-- in the rows affected by a trigger.
-- OLD and NEW are MySQL extensions to triggers; they are not case-sensitive

-- ...

-- The following example illustrates the points.
-- It defines an UPDATE trigger that checks the new value to be used for updating each row,
-- and modifies the value to be within the range from 0 to 100.
-- This must be a BEFORE trigger because the value must be checked
-- before it is used to update the row:

-- mysql>
delimiter //
-- mysql>
CREATE TRIGGER upd_check BEFORE UPDATE ON account
FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SET NEW.amount = 0;
    ELSEIF NEW.amount > 100 THEN
        SET NEW.amount = 100;
    END IF;
END;//
-- mysql>
delimiter ;

-- It can be easier to define a stored procedure separetely and then invoke it
-- from the trigger using a simple CALL statement.

-- ...

-- The trigger cannot use the CALL statement to invoke stored procedures
-- that return data to the client or that use dynamic SQL.
-- (Stored procedures are permitted to return data to the trigger
-- through OUT or INOUT parameters.)

-- The trigger cannot use statement that explicitly or implicitly 
-- begin or end a transaction, such as START TRANSACTION, COMMIT, or ROLLBACK.
-- (ROLLBACK to SAVEPOINT is permitted because it does not end a transaction.)

-- See also Section 27.8, "Restrictions on Stored Programs".

-- Error handling...

-- ...

-- Triggers can contain direct references to tables by name,
-- such as the trigger named testref shown in this example
CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
    a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    b4 INT DEFAULT 0
);

delimiter | -- When defining triggers, stored procedures, or functions that contain multiple SQL statements, you need to change the delimiter to something else (like |) so that MySQL does not interpret the semicolons within the body of the trigger as the end of the entire statement.

CREATE TRIGGER testref BEFORE INSERT ON test1
    FOR EACH ROW
    BEGIN
        INSERT INTO test2 SET a2 = NEW.a1;
        DELETE FROM test3 WHERE a3 = NEW.a1;
        UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
    END;
|

delimiter ;

INSERT INTO test3 (a3) VALUES
    (NULL), (NULL), (NULL), (NULL), (NULL), 
    (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
    (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);
