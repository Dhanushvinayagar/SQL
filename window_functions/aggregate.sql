-- Aggregate window function
-- gives the result of an aggregate function over a group of rows within a window frame
-- SELECT 
--     *,
--     Aggregate_FUNCTION(column) OVER (PARTITION BY column ORDER BY column) AS result
--     (or) 
--     Aggregate_FUNCTION(column) OVER (PARTITION BY column) AS result
--     (or)
--     Aggregate_FUNCTION(column) OVER (ORDER BY column DESC) AS result
-- FROM
--     table_name;
SELECT
    'SUM' AS function_name;

-- SUM
-- gives the sum of a column over a group of rows within a window frame
SELECT
    *,
    SUM(age) OVER (PARTITION BY graduation_year) AS sum_age
FROM
    Users;

-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- | id | name      | phone_number | age | email               | graduation_year | sum_age |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |      85 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |      85 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |      85 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |      85 |
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |      85 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |      32 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |      32 |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- Gives cumulative sum because of no partition
SELECT
    *,
    SUM(age) OVER (
        ORDER BY
            graduation_year
    ) AS total_age
FROM
    Users;

-- +----+-----------+--------------+-----+---------------------+-----------------+-----------+
-- | id | name      | phone_number | age | email               | graduation_year | total_age |
-- +----+-----------+--------------+-----+---------------------+-----------------+-----------+
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL |        85 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL |        85 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL |        85 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL |        85 |
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL |        85 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 |       117 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 |       117 |
-- +----+-----------+--------------+-----+---------------------+-----------------+-----------+
SELECT
    'AVG' AS function_name;

-- AVG
-- gives the average of a column over a group of rows within a window frame
SELECT
    *,
    AVG(age) OVER (PARTITION BY graduation_year) AS avg_age
FROM
    Users;

-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- | id | name      | phone_number | age | email               | graduation_year | avg_age |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+
-- |  1 | John Doe  |   1234567890 |  15 | Q4f9sip@example.com |            NULL | 17.0000 |
-- |  2 | Jane Doe  |   1234567890 |  15 | Q4f9s@example.com   |            NULL | 17.0000 |
-- |  3 | Eve amily |   1234567890 |  15 | S4f9sd@example.com  |            NULL | 17.0000 |
-- |  4 | Bob Smith |   5555555555 |  15 | FmR2M@example.com   |            NULL | 17.0000 |
-- |  5 | Steve     |   1234567890 |  25 | steve@example.com   |            NULL | 17.0000 |
-- |  6 | Max       |   1234567890 |  20 | max@example.com     |            2029 | 16.0000 |
-- | 11 | Mike      |   1234567890 |  12 | mike@example.com    |            2029 | 16.0000 |
-- +----+-----------+--------------+-----+---------------------+-----------------+---------+