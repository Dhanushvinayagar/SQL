-- IS NULL -> to filter null values
SELECT
    *
FROM
    Users
WHERE
    email IS NULL;

-- IS NOT NULL -> to filter non-null values
SELECT
    *
FROM
    Users
WHERE
    email IS NOT NULL;

-- Data might be NULL as a string
SELECT
    *
FROM
    Users
WHERE
    email = 'NULL';