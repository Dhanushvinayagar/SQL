USE DB;

-- INNER JOIN -> to join two tables on a common column with matching values
SELECT * FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id AND o.order_id = 1
JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.name = 'a';

-- LEFT JOIN -> to join two tables and the left table will have all the rows and the right table will have only the matching rows
SELECT * FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
LEFT JOIN order_items oi ON o.order_id = oi.order_id

-- RIGHT JOIN -> to join two tables and the right table will have all the rows and the left table will have only the matching rows
SELECT * FROM 
orders o 
RIGHT JOIN customers c ON c.customer_id = o.customer_id;

-- FULL JOIN -> to join two tables and the left and right table will have all the rows
-- MySQL does not support FULL JOIN 
-- FULL JOIN = LEFT JOIN + RIGHT JOIN

SELECT * FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT * FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Self join -> to join a table with itself
SELECT * FROM customers c1
JOIN customers c2 ON c1.customer_id = c2.customer_id;

-- Cartesian product -> to join two tables without a common column resulting a result with all possible combinations
SELECT * FROM customers c, orders o;