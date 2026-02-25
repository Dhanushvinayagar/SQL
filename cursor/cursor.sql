-- Cursor
-- Cursor is a way to iterate over a set of rows in a table.

DELIMITER $$

CREATE PROCEDURE customer_cursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_email VARCHAR(100);
    DECLARE v_name VARCHAR(100);

    -- Declare cursor
    DECLARE cust_cursor CURSOR FOR
        SELECT customer_id, email, name FROM customers;

    -- Handler when no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;

    -- Open cursor
    OPEN cust_cursor;

    read_loop: LOOP
        FETCH cust_cursor INTO v_id, v_email, v_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Example action (display each row)
        SELECT v_id, v_email, v_name;

    END LOOP;

    -- Close cursor
    CLOSE cust_cursor;

END $$

DELIMITER ;

call customer_cursor;