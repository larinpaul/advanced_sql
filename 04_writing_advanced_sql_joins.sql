-- 2024 01 02 

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 4. Writing advanced SQL joins


-- For example, we can write a subquery in a JOIN clause like this:
SELECT t1.column_a, t2.column_b
FORM table_1 t1
INNER JOIN (SELECT column_a, column_b from table_2) t2 ON t2.column_a = t1.column_a;

-- Joining on a subquery can be very handy in situations
-- where it's less resource intensive to calculate statistics on the
-- smaller dataset than trying to do it on the larger dataset.

-- There are also nested joins, which are joins within joins. For example:
SELECT t1.column_a, t2.column_b, t3.column_c
FROM table_1 t1
INNER JOIN (table_2 t2 
    INNER JOIN table_3 t3 on t3.column_c = t2.column_c) z on z.t2_column_a = t1.column_a

-- Nested joins are useful for when you need fields joined to one table,
-- without impacting the joins on other tables.
-- In the example above, we see table_2 has a nested join with table_3,
-- and then that joined data is joined to table_1.
