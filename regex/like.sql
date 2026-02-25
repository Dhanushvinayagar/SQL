
-- Like - to search for a pattern in a string

-- % - any number of characters
-- _ - any single character

-- '%<string>' - to search for a pattern at the end in a string
-- '<string>%' - to search for a pattern at the beginning in a string
-- '%<string>%' - to search for a pattern anywhere in a string

SELECT * FROM Users WHERE name LIKE 'J%';
SELECT * FROM Users WHERE name LIKE '%Doe';
SELECT * FROM Users WHERE name LIKE '%eve%';

-- Escape character
SELECT * FROM Users WHERE name LIKE 'B_b%';
SELECT * FROM Users WHERE name LIKE '___ %';