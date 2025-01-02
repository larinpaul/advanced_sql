-- 2024 01 02 

-- https://careerfoundry.com/en/blog/data-analytics/advanced-sql/

-- 4. Writing advanced SQL joins


-- For example, we can write a subquery in a JOIN clause like this:
SELECT t1.column_a, t2.column_b
FORM table_1 t1
INNER JOIN (SELECT column_a, column_b from table_2) t2 ON t2.column_a = t1.column_a;





