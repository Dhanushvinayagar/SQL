-- Delete without where clause will delete all rows
-- Do not reset the table auto increment
DELETE FROM Users;

-- Delete with where clause will delete only the rows that match the condition
DELETE FROM Users WHERE id = 1;

-- Delete multiple rows
DELETE FROM Users WHERE id IN (1, 2, 3);

-- Delete multiple rows with order by and limit
DELETE FROM Users WHERE id IN (1, 2, 3) ORDER BY id DESC LIMIT 2;

-- Delete join
DELETE FROM Users u JOIN Courses c ON u.id = c.user_id WHERE c.id <> 1;