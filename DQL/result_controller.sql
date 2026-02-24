
-- ORDER BY -> to sort the result (by default ASC)
SELECT
    *
FROM
    Users
ORDER BY
    age DESC;

-- LIMIT -> to limit the number of rows returned
SELECT
    *
FROM
    Users
ORDER BY
    age DESC
LIMIT
    2;

-- LIMIT -> to limit the number of rows returned 
-- OFFSET -> to skip the first n rows
SELECT
    *
FROM
    Users
ORDER BY
    age DESC
LIMIT
    2 OFFSET 2;
