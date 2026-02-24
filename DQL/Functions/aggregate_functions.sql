-- FOR MULTIPLE ROWS of column value ----------------
-- COUNT -> to count the number of rows
SELECT
    COUNT(*)
FROM
    Users;

-- SELECT with group by
SELECT
    name,
    COUNT(*) -- count the number of rows for each grouped name
FROM
    Users
GROUP BY
    name
Having
    COUNT(*) > 1;

-- SUM -> to sum the values
SELECT
    SUM(age)
FROM
    Users;

-- MIN -> to get the minimum value
SELECT
    MIN(age)
FROM
    Users;

-- MAX -> to get the maximum value
SELECT
    MAX(age)
FROM
    Users;

-- AVG -> to get the average value
SELECT
    AVG(age)
FROM
    Users;

-- FOR SINGLE column value -------------------------------
-- MOD -> to get the modulus value
SELECT
    MOD(AVG(age), 2)
FROM
    Users;

-- ROUND -> to round the value
SELECT
    ROUND(AVG(age), 2)
FROM
    Users;

-- SQRT -> to get the square root
SELECT
    SQRT(AVG(age))
FROM
    Users;

-- ABS -> to get the absolute value
SELECT
    ABS(AVG(age))
FROM
    Users;

-- CEIL -> to get the ceiling value 
SELECT
    CEIL(AVG(age))
FROM
    Users;

-- FLOOR -> to get the floor value
SELECT
    FLOOR(AVG(age))
FROM
    Users;

-- POWER -> to get the power value
SELECT
    POWER(AVG(age), 2)
FROM
    Users;