
-- Partioning - to divide a table into smaller tables internally based on a column value
-- while still treating it as a single table.

-- Range partitioning - to divide a table into smaller tables based on a range of values

-- Data of year x will be stored in the respective range of the partition
CREATE TABLE book_orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025)
);

-- Hash partitioning - to divide a table into smaller tables based on a hash of the values
-- Create a hash table kind of structure and based on the id it will be stored in the respective partition
CREATE TABLE book_users (
    id INT,
    name VARCHAR(50)
)
PARTITION BY HASH (id)
PARTITIONS 4;

-- List partitioning - to divide a table into smaller tables based on a list of values
-- 1 is Sales, 2 is HR
CREATE TABLE book_employees (
    id INT,
    name VARCHAR(50),
    department INT
)
PARTITION BY LIST (department) (
    PARTITION p_sales VALUES IN (1),
    PARTITION p_hr VALUES IN (2)
);


-- Alter partition
ALTER TABLE book_orders
ADD PARTITION (
    PARTITION p2025 VALUES LESS THAN (2026)
);

-- Truncate partition - delete all rows from a partition but keeps the partition
ALTER TABLE book_orders
TRUNCATE PARTITION p2022;

-- Drop partition
ALTER TABLE book_orders
DROP PARTITION p2022;

-- Change partitioning to normal table
ALTER TABLE book_orders
REMOVE PARTITIONING;