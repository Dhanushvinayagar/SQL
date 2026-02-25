-- ranking window functions
-- window functions are used to calculate a value based on a group of rows but does not congest result like group
-- In ranking window functions, each row is assigned a unique number(rank) based on the order of rows
-- PARTITION BY → splits data into groups
-- ORDER BY → defines row order inside each group
-- ROWS/RANGE → defines the window frame (optional)
-- function_name() OVER (
--     PARTITION BY column
--     ORDER BY column
--     ROWS BETWEEN ...
-- )
SELECT
    'ROW_NUMBER' AS function_name;

-- row number
-- gives unique number to each row inside each group based on partition
SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY graduation_year) AS row_num
FROM
    Users;

SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY graduation_year
        ORDER BY
            age DESC
    ) AS row_num
FROM
    Users;
-- Graduation year => NULL -> 1 to 5 , 2029 -> 1
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- | id | name      | phone_number | age | email               | graduation_year | row_num |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |       1 |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |       2 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |       3 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |       4 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |       5 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |       1 |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
SELECT
    'RANK' AS function_name;

-- RANK
-- gives unique number to each row inside each group with gaps between consecutive numbers
SELECT
    *,
    RANK() OVER (
        ORDER BY
            age DESC
    ) AS rank_num
FROM
    Users;

-- age => 25 -> 1 , 20 -> 2, 15 -> 3, 12 -> 7(because of 4 rows with age 15 )
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+
-- | id | name      | phone_number | age | email               | graduation_year | rank_num |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |        1 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |        2 |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |        3 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |        3 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |        3 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |        3 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |        7 |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------+
SELECT
    'DENSE_RANK' AS function_name;

-- DENSE_RANK
-- gives unique number to each row inside each group with no gaps between consecutive numbers
SELECT
    *,
    DENSE_RANK() OVER (
        ORDER BY
            age DESC
    ) AS dense_rank_num
FROM
    Users;

-- age => 25 -> 1 , 20 -> 2, 15 -> 3, 12 -> 4
-- +----+-----------+--------------+-----+---------------------+-----------------+----------------+
-- | id | name      | phone_number | age | email               | graduation_year | dense_rank_num |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------------+
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |              1 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |              2 |
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |              3 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |              3 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |              3 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |              3 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |              4 |
-- +----+-----------+--------------+-----+---------------------+-----------------+----------------+