-- A trigger is a stored program that automatically executes when a specified event occurs on a table.

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER} {INSERT | UPDATE | DELETE} ON table_name
-- FOR EACH ROW
-- BEGIN
--     -- SQL statements
-- END;

-- NEW - the row that is newly existing due to the trigger
-- OLD - the row that previously existed before the trigger

-- List all triggers
SHOW TRIGGERS;

DELIMITER $$
CREATE TRIGGER age_trigger
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    SET NEW.graduation_year = YEAR(CURDATE()) + 3;
    IF NEW.age >= 18 THEN
        INSERT INTO SENIORS (id, name, age, email, number) VALUES
        (OLD.id, NEW.name, NEW.age, NEW.email, NEW.phone_number);
    END IF;
END $$
DELIMITER ;


-- Drop
DROP TRIGGER IF EXISTS age_trigger;