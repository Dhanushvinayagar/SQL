
-- Regex - Regular Expression
-- Used to match a pattern in a string and perform actions on it

-- ^ - to match the start of the string
-- $ - to match the end of the string

-- Literal pattern match equivalent to LIKE '%<string>%'
SELECT * FROM Users WHERE name REGEX 'John';

-- Letter befor ? can present 0 or 1 times
SELECT * FROM Users WHERE name REGEX 'colou?r'; -- color or colour

-- Letter befor + can present 1 or more times
SELECT * FROM Users WHERE name REGEX 'Max+'; -- Max or Maxx or Maxxx or Maxxxx....

-- Letter befor * can present 0 or more times
SELECT * FROM Users WHERE name REGEX 'Max*'; -- Ma or Max or Maxx or Maxxx or Maxxxx...

-- Range of characters

-- Match numbers
SELECT * FROM Users WHERE email REGEXP '[0-9]'; -- 0 to 9

-- Match letters [] -> range of characters
-- a-z -> a to z, A-Z -> A to Z and 0-9 -> 0 to 9, ne -> n or e
SELECT * FROM Users WHERE name REGEXP 'J[a-z][a-z][ne]';
-- . -> any character
SELECT * FROM Users WHERE name REGEXP 'B.b';

-- ^ -> Start of the string
-- $ -> End of the string
SELECT * FROM Users WHERE name REGEXP '^J[a-z][a-z][ne] $';