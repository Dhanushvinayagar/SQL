-- Correlated subquery
-- Dependes on the outer query
-- The subquery is executed after the main query
-- The subquery is executed for each row of the main query
SELECT
    *
FROM
    customers
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            orders o
        WHERE
            o.customer_id = customers.customer_id
    );

-- Nested subquery
SELECT
    *
FROM
    customers c
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            orders o
        WHERE
            order_id IN (
                SELECT
                    order_id
                FROM
                    order_items
                WHERE
                    product_id IN (101, 102, 103)
            )
    );

-- Select clause
SELECT
    *,
    (
        SELECT
            COUNT(*)
        FROM
            orders o
        WHERE
            o.customer_id = customers.customer_id
    ) AS order_count
FROM
    customers;

-- Here the subquery is executed first and then the main query is executed and 
-- the result of the subquery is used as input for the main query
-- The subquery is executed for each row of the main query
SELECT
    *
FROM
    customers
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            orders o
        WHERE
            o.customer_id = customers.customer_id
    ) > 1;