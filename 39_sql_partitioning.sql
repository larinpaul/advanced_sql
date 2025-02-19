-- 2025 02 17 

-- SQL Partitioning: A Step-by-Step Guide for Database Optimizaton
-- TiDB Team
-- https://www.pingcap.com/article/sql-partition-demystified-from-concept-to-implementation/

-- Remember the days when a gigabyte was considered a lot of data? Yeah, me neither
-- Today, we're dealing with terabytes and petabytes of data,
-- and managing these massive datasets efficiently is no small feat.
-- This is where SQL partitioning comes in, offering a powerful tool
-- to divide and conquer large tables,
-- boosting performance, and simplifying data management,
-- compared to single partition table.


-- Why Use SQL Partitioning?
-- Imagine trying tofindasepcific book in a library with millions of books and no orgamization system.
-- It would be a nightmare! Partitioning is like organizing the library into different sections
-- based on genre, author, or publication date.
-- This makes it much easier to find what you're looking for.

-- Similarly, partitioning a large table in the dataset brings numerous advantages:

-- Enhanced Performance and Scalability
-- * Faster Queries
-- * Parallel Processing
-- * Efficient Data Management

-- Streamlined Data Management
-- * Data Lifecycle Management -- For example, older partitions can be archived or dropped effortlessly.
-- * Data Locality -- Partitions can reside on different storage devices, even different physical location.

-- Simplified Querying and Analysis
-- * Partition-based Queries
-- * Data Summarization


-- Artitioning Concepts: A Comprehensive Guilde

-- Partition Key
-- The partition key is the column or set of columns that determines how data is distributed across partitions.
-- Ideally, the partition key should be frequently used in query filters
-- to enabble efficient partition pruning.
-- Example:
-- Consider a table storing customer orders.
-- Partitoning the table by the order_date column would be a good choice
-- if queries often filter data based on specific date ranges.


-- Differences Between Partitioning Types

-- The partition function defines the logic for mapping each row's partition key value to a specific partition.
-- Common partition functions include:
-- * Range Partitioning: Assigns rows to partitions based on ranges of value in the partitioning key.
-- For example, you could partition the customer orders table by year 
-- based on the order_date column.
-- * List Partitioning: Assigns rows to partitions based on specific values in the partitioning key.
-- For example, you could partition a customer table by country based on the country column.
-- * Hash Partitioning: Uses a hash partition function to distribute rows across partitions
-- based on the partitioning key.
-- This can be useful for achieving even data distribution and improving write performance,
-- especially when the partitioning key is not frequently used in query filters.

-- Each type of partitioning has its own advantages and use cases.
-- Choosing the right partitioning type depends on your specific requirements and query patterns.

-- Example: For the customer orders table,
-- you could use a range partitioning scheme with partitions defined by year or month,
-- depending on your query patterns.


-- Partition Boundaries

-- Partition boundaries define the specifid values or ranges that determine which partition
-- a particular row belongs to. These boundaries are crucial for the partition function
-- to correctly map rows to partitions.

-- Example: If you partition the customer orders table by year, 
-- the partition boundary values could be definede as '2022-01-01', '2023-01-01', and so on.
-- Rows with an order_date in 2022 would be storedin the p2022 partition, and so on.


-- SQL Partitioning in Practice: Concrete Examples

-- Let's see how partitioning can be applied in real-world scenarios:


-- Scenario 1: Time-based Partitioning for Website Access Logs

-- Imagine a table storing website access logs, expected to grow significantly over time.
-- Queries often involve filtering based on the access date.

-- Solution: Partition the table by the access_date column using range partitioning.
-- This allows efficient management and querying of data
-- based on specific date ranges.


-- PARTITION BY clause

CREATE TABLE access_log(
    id INT NOT NULL AUTO_INCREMENT,
    access_date DATE NOT NULL,
    user_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY (id, access_date)
) PARTITION BY RANGE(YEAR(access_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Benefints:
-- * Queries filtering by access_date can be optimized by pruning irrelevant partitions.
-- * Archiving or dropping older data becomes easier by simply dropping the corresponding partition.
-- * Scalability is enhanced as additional partitions can be added to accommodate new data.


-- Scenario 2: List Partitioning for Customer Data by Country

-- Consider a large customer table with a country column.
-- Frequent queries and reports are based on specific countires.

-- Solution: Utilize list partitioning to partition the table by the country column,
-- enabling efficient querying and management of data for individual countries.

-- PARTITION BY clause:

CREATE TABLE customers (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) PARTITION BY LIST (country) (
  PARTITION pUSA VALUES IN ('USA'),
  PARTITION pUK VALUES IN ('UK'),
  PARTITION pIndia VALUES IN ('India'),
  PARTITION pOther VALUES IN (DEFAULT)
);

-- Benefits:
-- * Queries filtering by specific countries can be optimized by accessing
-- only the relevant partitions.
-- * Managing data for specific countries becomes easier,
-- as data can be archived or deleted by dropping the corresponding partition.


