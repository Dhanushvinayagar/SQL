
-- NULLIF -> to return null if two values are equal
SELECT NULLIF(name, 'Doe') FROM Users;

-- COALESCE -> to return the first non-null value from a list of values check
SELECT COALESCE(order_id, quantity, 'Unknown') FROM order_items;

-- GROUP_CONCAT -> to group the values into a string
SELECT GROUP_CONCAT(name) FROM Users;

-- CONCAT -> to concatenate two or more strings
SELECT CONCAT(name, ' ', email) FROM Users;

-- SUBSTRING -> to get a substring from a string
SELECT SUBSTRING(name, 1, 3) FROM Users;

-- LENGTH -> to get the length of a string
SELECT LENGTH(name) FROM Users;

-- LOWER -> to convert a string to lowercase
SELECT LOWER(name) FROM Users;

-- UPPER -> to convert a string to uppercase
SELECT UPPER(name) FROM Users;

-- REPLACE -> to replace a substring in a string
SELECT REPLACE(name, 'Doe', 'Smith') FROM Users;

-- REVERSE -> to reverse a string
SELECT REVERSE(name) FROM Users;

-- TRIM -> to remove leading and trailing spaces from a string
SELECT TRIM(name) FROM Users;

