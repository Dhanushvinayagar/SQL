-- WHERE -> to filter the result
-- > -> greater than
-- < -> less than
-- >= -> greater than or equal to
-- <= -> less than or equal to
-- = -> equal to
-- <> -> not equal to
-- () -> to group conditions
-- AND -> to combine conditions all conditions must be true
-- OR -> to combine conditions at least one condition must be true
-- XOR -> to combine conditions only one condition must be true
SELECT
    *
FROM
    Users
WHERE
    age > 18
    AND age < 30
    OR (
        email = 'Q4f9s@example.com'
        and email <> '9G0oq@example.com'
    )
    OR (
        age >= 1
        XOR age <= 30
    );

-- BETWEEN -> to filter a range of values
SELECT
    *
FROM
    Users
WHERE
    age BETWEEN 18
    AND 30;

-- NOT -> to negate a condition
SELECT
    *
FROM
    Users
WHERE
    age NOT BETWEEN 18
    AND 30;

-- IN -> to filter multiple values
SELECT
    *
FROM
    Users
WHERE
    age IN (18, 25, 30);

-- NOT IN -> to filter multiple values
SELECT
    *
FROM
    Users
WHERE
    age NOT IN (18, 25, 30);

