-- 2024 01 01

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 2. Creating tables using normalization concepts

-- Let's create a new table with two SQL keywords
-- that every advanced SQL analyst should know: IDENTITY and FOREIGN KEY.

-- Create a new table and insert data into it:

CREATE TABLE orders (
    orderID int IDENTITY(1,1) PRIMARY KEY -- 1 means the seed (or starting) value, and 1 means incrementation step
    , clientID int FOREIGN KEY REFERENCES client(clientID)
    , orderType varchar(3)
    , billed float
);

INSERT INTO orders (clientID, orderType, billed)
values (2, 'new', 300.00);
INSERT INTO orders (clientID, orderType, billed)
values (3, 'new', 2564.49);
INSERT INTO orders (clientID, orderType, billed)
values (1, 'new', 139.99);
INSERT INTO orders (clientID, orderType, billed)
values (2, 'new', 299.95);
INSERT INTO orders (clientID, orderType, billed)
values (3, 'rmk', 99.95);
INSERT INTO orders (clientID, orderType, billed)
values (4, 'new', 139.99);

SELECT * FROM orders;

-- an example of a join
SELECT * 
FROM orders
INNER JOIN client
ON orders.clientID = client.clientID;
