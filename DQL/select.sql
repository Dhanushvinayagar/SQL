
-- Select - to retrieve data from a table
SELECT * FROM DB.Users;

SELECT name, email FROM DB.Users;

SELECT 1;

-- Arithmetic operators
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;

-- AS -> to rename a column

-- Current date and time
SELECT NOW() as CURRENT_DATE_AND_TIME;

-- Current date
SELECT CURDATE() as CURRENTDATE;

-- Current time
SELECT CURTIME() as CURRENTTIME;

-- 5.30 hrs ahead
SELECT NOW() + INTERVAL 5 HOUR + INTERVAL 30 MINUTE;