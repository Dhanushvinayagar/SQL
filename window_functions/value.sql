-- Value window functions
SELECT
    'LAG' AS function_name;

-- LAG
-- gives the value of the row that is immediately preceding the current row
-- LAG(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)
SELECT
    *,
    LAG(email) OVER (
        PARTITION BY graduation_year
        ORDER BY
            age DESC
    ) AS previous_email
FROM
    Users;

-- graduation_year => NULL - 5 records (5,1,2,3,4), 2029 - 2 records(6,11) 
-- [First record of each partition is null]
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
-- | id | name      | phone_number | age | email               | graduation_year | previous_email      |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL | NULL                |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL | steve@example.com   |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL | Q4f9sip@example.com |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL | Q4f9s@example.com   |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL | S4f9sd@example.com  |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 | NULL                |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 | max@example.com     |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
SELECT
    'LEAD' AS function_name;

-- LEAD
-- gives the value of the row that is immediately following the current row
-- LEAD(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)
-- graduation_year => NULL - 5 records (5,1,2,3,4), 2029 - 2 records(6,11) 
-- [Last record of each partition is null]
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
-- | id | name      | phone_number | age | email               | graduation_year | previous_email      |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL | Q4f9sip@example.com |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL | Q4f9s@example.com   |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL | S4f9sd@example.com  |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL | FmR2M@example.com   |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL | NULL                |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 | mike@example.com    |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 | NULL                |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------------------+
SELECT
    'FIRST_VALUE' as function_name;

-- FIRST_VALUE
-- gives the value of the first row in the window frame
-- graduation_year => NULL - 5 records (5,1,2,3,4), 2029 - 2 records(6,11) 
-- [First value of the record of each partition]
SELECT
    *,
    FIRST_VALUE(email) OVER (
        PARTITION BY graduation_year
        ORDER BY
            age DESC
    ) AS previous_email F ROM Users;

-- ------+--------------+-----+---------------------+-----------------+-------------------+
-- | id | name      | phone_number | age | email               | graduation_year | previous_email    |
-- +----+-----------+--------------+-----+---------------------+-----------------+-------------------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL | steve@example.com |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL | steve@example.com |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL | steve@example.com |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL | steve@example.com |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL | steve@example.com |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 | max@example.com   |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 | max@example.com   |
-- +----+-----------+--------------+-----+---------------------+-----------------+-------------------+



-- LAST_VALUE
-- gives the value of the last row in the window frame
-- [Last value of the record of each partition]
-- Need to specify ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING because there is no default
SELECT 
    *,
    LAST_VALUE(age) OVER (
        PARTITION BY graduation_year
        ORDER BY graduation_year DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_age
FROM Users;
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+
-- | id | name      | phone_number | age | email               | graduation_year | last_age |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |       25 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |       25 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |       25 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |       25 |
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |       25 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |       12 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |       12 |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+

SELECT 'NTH_VALUE' as function_name;
-- NTH VALUE
-- gives the value of the Nth row in the window frame
-- [Nth value of the record of each partition]
-- Need to specify ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING because there is no default
SELECT 
    *,
    NTH_VALUE(email, 2) OVER (
        PARTITION BY graduation_year
        ORDER BY graduation_year DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_age
FROM Users;
-- +----+-----------+--------------+-----+---------------------+-----------------+-------------------+
-- | id | name      | phone_number | age | email               | graduation_year | last_age          |
-- +----+-----------+--------------+-----+---------------------+-----------------+-------------------+
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL | Q4f9s@example.com |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL | Q4f9s@example.com |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL | Q4f9s@example.com |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL | Q4f9s@example.com |
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL | Q4f9s@example.com |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 | mike@example.com  |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 | mike@example.com  |
-- +----+-----------+--------------+-----+---------------------+-----------------+-------------------+

SELECT 'NTILE' as function_name;
-- NTILE
-- gives the value of the row that is immediately following the current row
-- NTILE(count) OVER (PARTITION BY column ORDER BY column)

SELECT
    *,
    NTILE(2) OVER (
        PARTITION BY graduation_year
        ORDER BY
            age DESC
    ) AS n_tile
FROM
    Users;
-- SPILIT IN 2 => 1 - 5 records (5,1,2,6), 2 - 2 records(3,4,11)
--     +----+-----------+--------------+-----+---------------------+-----------------+--------+
-- | id | name      | phone_number | age | email               | graduation_year | n_tile |
-- +----+-----------+--------------+-----+---------------------+-----------------+--------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |      1 |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |      1 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |      1 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |      2 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |      2 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |      1 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |      2 |
-- +----+-----------+--------------+-----+---------------------+-----------------+--------+