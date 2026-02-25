
-- WITH -> to create a common table expression (CTE) that can be used in a query
-- Acts as a temporary table
-- Used to seperate large logics

WITH ALUMINI AS (
    SELECT
        *
    FROM
        Users
    WHERE
        age>=27
)
SELECT
    *
FROM
    ALUMINI;

-- MULTIPLE CTE
WITH ALUMINI AS (
    SELECT
        *
    FROM
        Users
    WHERE
        age>=27
),
MAIN_COURSES AS (
    SELECT
        *
    FROM
        Courses
)
SELECT
    *
FROM
    MAIN_COURSES;