
-- Procedure:
-- A stored procedure (proc) in MySQL is a precompiled set of SQL statements stored in the database and executed on demand.
-- They help with reusability, performance, security, and business logic centralization.
-- It is a collection of SQL statements that can be executed as a single unit.
-- It is a block of code that performs a specific task or set of tasks.

-- DELIMITER $$
-- CREATE PROCEDURE procedure_name (parameter_list)
-- BEGIN
--     -- SQL statements
-- END $$
-- DELIMITER ;

-- CALL procedure_name (argument_list);

-- SHOW PROCS
SHOW PROCEDURE STATUS;

DELIMITER $$

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT * FROM Users;
END $$

DELIMITER ;

CALL GetAllUsers();

DELIMITER $$

CREATE PROCEDURE GetUserById(IN userId INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    SELECT * FROM Users WHERE id = userId;

    WHILE i <= 10 DO
        SELECT i;
        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL GetUserById(1);


-- Drop a procedure
DROP PROCEDURE IF EXISTS GetUserById;