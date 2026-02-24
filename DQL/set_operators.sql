

-- For * - number of columns should be same in both queries
-- For select - number of columns should be same in both queries
-- The mentioned column will be selected
-- The name and order of the columns will be same as the first query

-- Union - to combine the result of two queries  
-- Remove duplicate rows

Select * from Users 
UNION 
Select * from Courses;

Select name from Users 
UNION 
Select 'User' as user_name;

-- Union all - to combine the result of two queries
-- Keep duplicate rows
Select * from Users 
UNION ALL 
Select * from Courses;

Select name from Users 
UNION ALL
Select 'User' as user_name;

-- Intersect - to combine the result of two queries
-- Keep only the common rows
Select * from Users 
INTERSECT 
(Select * from Users where name like '%Doe%');

-- Except - to combine the result of two queries
-- Keep only the rows in the first query that are not in the second query
Select * from Users
EXCEPT 
Select * from Users where name like '%Doe%';
