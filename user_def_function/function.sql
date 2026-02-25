USE DB;

-- Scalar Function - Returns a single value
-- DETERMINISTIC - tells MySQL that the function always returns the same result for the same input.
-- If the function is not deterministic, it can return different results for the same input.
-- DELIMITER $$ - used to delimit the start and end of the function

-- 1. Function single parameter
DELIMITER $$

CREATE FUNCTION square_number(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF n < 0 THEN 
        RETURN 0; 
    END IF;
    RETURN n * n;
END $$

DELIMITER ;

SELECT square_number(5);  -- Returns 25
SELECT square_number(-3); -- Returns 0

-- 2. Function with parameters and declare return type
DELIMITER $$

CREATE FUNCTION simple_interest(principal DECIMAL(10,2), years INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE rate DECIMAL(5,2) DEFAULT 5.5;  -- Assign a value like 5.5
    RETURN (principal * years * rate) / 100;
END $$

DELIMITER ;

SELECT simple_interest(1000, 2);  -- Returns 100.00


-- 3. SQL row Function
-- NOT DETERMINISTIC - tells MySQL that the function can return different results for the same input
-- READS SQL DATA - tells MySQL that the function reads data from the database and does not modify it
-- MODIFIES SQL DATA - (Not a good practice use PROCEDURE instead) tells MySQL that the function read/modifies data in the database

DELIMITER $$

CREATE FUNCTION total_orders(cust_id INT) 
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA  
BEGIN
    DECLARE result INT;
    SELECT COUNT(*) INTO result FROM orders WHERE customer_id = cust_id;
    RETURN result;
END $$

DELIMITER ;

SELECT *,total_orders(customer_id) from customers;

-- Drop a function
DROP FUNCTION IF EXISTS simple_interest;