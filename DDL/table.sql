-- use database - to point to the database that we want to use
USE DB;

-- See all tables
SHOW TABLES;

-- CONSTRAINTS
-- UNIQUE - to ensure that all values in a column are unique
-- NOT NULL - to ensure that all values in a column are not null
-- CHECK - to ensure that all values in a column meet a specific condition
-- DEFAULT - to set a default value for a column if no value is provided
-- PRIMARY KEY - to ensure that all values in a column are unique and not null
-- FOREIGN KEY - to ensure that all values in a column are unique and not null

-- Create table
CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    email VARCHAR(255) NOT NULL UNIQUE,
    number INT
);

-- Rename table
RENAME TABLE user TO Users;

-- Create table using as - (copy data only and not constraints)
CREATE TABLE IF NOT EXISTS SENIORS AS
SELECT
    *
FROM
    Users
WHERE
    age > 18;

-- Create table using like (copy structure/constraints only and not data)
CREATE TABLE IF NOT EXISTS UserCopy LIKE Users;

-- Temporary table - to create a temporary table that will be deleted after the session
CREATE TEMPORARY TABLE temp_students (id INT, name VARCHAR(100));

-- Query to see the structure of the table
SHOW CREATE TABLE Users;

-- See all columns in a table
SHOW COLUMNS
FROM
    Users;

CREATE TABLE IF NOT EXISTS Courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    academic_year INT NOT NULL,
    department VARCHAR(255),
    joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Describe table and details
DESCRIBE Users;

-- Alter table
-- Add column
ALTER TABLE
    Users
ADD
    COLUMN phone VARCHAR(255);

-- Drop column
ALTER TABLE
    Users DROP COLUMN number;

-- Rename column
ALTER TABLE
    Users RENAME COLUMN phone TO phone_number;

-- Modify column 
ALTER TABLE
    Users
MODIFY
    COLUMN phone_number BIGINT;

-- Modify column (FIRST- adds the column at the beginning of the table)
ALTER TABLE
    Users
MODIFY
    COLUMN phone_number BIGINT FIRST;

-- Modify column (AFTER- adds the column after the specified column)
ALTER TABLE
    Users
MODIFY
    COLUMN phone_number BIGINT
AFTER
    name;

-- Drop table (will delete the table and all its data)
DROP TABLE IF EXISTS users_1;