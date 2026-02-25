-- index - to create an index on most used where column of a table to speed up queries (uses b-tree)
-- Slows down inserts and updates because of additional overhead
-- Note : primary key index is created by default
-- Unique index - prevents duplicate values
CREATE UNIQUE INDEX user_idx ON Users(id, name);

-- multiple column index
CREATE INDEX course_idx ON Courses(year, department);

-- Add one more index
ALTER TABLE
    Users
ADD
    INDEX user_name (email);

SHOW INDEX
FROM
    Users;

SHOW INDEX
FROM
    Courses;

-- EXPLAIN - to explain the query
EXPLAIN
SELECT
    *
FROM
    Users
WHERE
    email = 'Q4f9sip@example.com';

-- +----+-------------+-------+------------+-------+----------------+-------+---------+-------+------+----------+-------+
-- | id | select_type | table | partitions | type  | possible_keys  | key   | key_len | ref   | rows | filtered | Extra |
-- +----+-------------+-------+------------+-------+----------------+-------+---------+-------+------+----------+-------+
-- |  1 | SIMPLE      | Users | NULL       | const | email,user_idx | email | 1022    | const |    1 |   100.00 | NULL  |
-- +----+-------------+-------+------------+-------+----------------+-------+---------+-------+------+----------+-------+
-- ANALYZE - to analyze the query(explain with cost statistics)
EXPLAIN ANALYZE
SELECT
    *
FROM
    Users
WHERE
    email = 'Q4f9sip@example.com';

-- +--------------------------------------------------------------------------------------------------+
-- | EXPLAIN                                                                                          |
-- +--------------------------------------------------------------------------------------------------+
-- | -> Rows fetched before execution  (cost=0..0 rows=1) (actual time=84e-6..126e-6 rows=1 loops=1)
--  |
-- +--------------------------------------------------------------------------------------------------+
-- DROP INDEX - to drop an index
DROP INDEX user_idx ON Users;