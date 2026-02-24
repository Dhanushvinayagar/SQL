-- Truncate - to delete all rows from a table without deleting the table and its structure
-- Reset the table auto increment
TRUNCATE TABLE DB.Users;

-- Check if the table is empty
SELECT
    count(*) as row_count
FROM
    DB.Users;