-- Recursive CTE
-- UNION ALL - is used here to join mutple queries
-- UNION can also be used but avoid it to improve performance as it checks for duplicates to remove

WITH Recursive R_CTE as (
    SELECT
        1 as res -- Anchor part
    UNION
    ALL
    SELECT
        res + 1 as res
    from
        R_CTE
    where
        res < 10 -- Recursive path
)
select
    *
from
    R_CTE;

-- For Table
WITH RECURSIVE employee_hierarchy AS (
    -- Anchor member (starting point)
    SELECT
        id,
        name,
        manager_id,
        1 AS level
    FROM
        employees
    WHERE
        manager_id IS NULL
    UNION
    ALL
    SELECT
        e.id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM
        employees e
        INNER JOIN employee_hierarchy eh ON e.manager_id = eh.id -- Recursive member
)
SELECT
    *
FROM
    employee_hierarchy
ORDER BY
    level,
    id;