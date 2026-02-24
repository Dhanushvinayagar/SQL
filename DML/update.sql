USE DB;

-- Update - without where clause will update all rows
UPDATE
    Users
SET
    age = 25;

-- Update - with where clause will update only the rows that match the condition
UPDATE
    Users
SET
    age = 26
WHERE
    id = 1;

-- Update multiple columns
UPDATE
    Users
SET
    age = 26,
    email = 'Q4f9sip@example.com'
WHERE
    id = 1;

-- Update multiple rows with set clause column logic , order by and limit - will update the first 2 rows by age
UPDATE
    Users
SET
    age = age + 2
Order By
    age DESC
LIMIT
    2;

-- Update using JOIN
UPDATE
    Users u
    JOIN Courses c ON u.id = c.id
SET
    u.age = 26
WHERE
    c.id = 1;