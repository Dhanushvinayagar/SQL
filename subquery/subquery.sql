-- Subquery - a query nested inside another SQL query.
-- The subquery is executed first and then the main query is executed
-- The result of the subquery is used as input for the main query

Select name from ( select * from Users) as subquery;

-- Single row subquery
SELECT
    *
FROM
    Users
WHERE
    age > (
        SELECT
            AVG(age)
        FROM
            Users
    );

-- Multiple row subquery
SELECT
    *
FROM
    customers
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            orders
        WHERE
            order_date > '2026-02-01'
    );

-- Multiple column subquery
SELECT
    *
FROM
    Users
WHERE
    (name, email) IN (
        SELECT
            name,
            email
        FROM
            SENIORS
        WHERE
            age > 19
    );
