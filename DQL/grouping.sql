-- DISTINCT -> to remove duplicate rows
SELECT
    DISTINCT age
FROM
    Users;

SELECT DISTINCT age, email FROM Users;

-- GROUP BY -> to group the result by one or more columns
SELECT
    name
FROM
    Users
GROUP BY
    name;

-- HAVING -> to filter the result after grouping (where cannot be used after group by)
-- Having must be used with aggregate functions
SELECT
    name,
    COUNT(*) as count
FROM
    Users
WHERE age > 18
GROUP BY
    name
HAVING
    count > 1;


