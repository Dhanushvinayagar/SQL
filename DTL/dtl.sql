-- Transaction - a group of SQL statements that are executed as a single unit
-- If one of the statements fails, all the statements in the transaction are rolled back
-- If all of the statements succeeds, then transaction are committed
-- ACID - Atomicity, Consistency, Isolation, Durability 

-- START TRANSACTION - to start a transaction
-- COMMIT - to commit a transaction
-- ROLLBACK - to rollback a transaction
-- SAVEPOINT - to save the any particular state of the transaction

-- Transaction will happen and commit will make it permanent
START TRANSACTION;

UPDATE Users SET age=15;

COMMIT;

-- Transaction will happen and rollback will revert the new changes and old changes will remain
START TRANSACTION;

UPDATE Users SET age=20;

SELECT * FROM Users;

ROLLBACK;

-- Transaction will happen and savepoint will save the state of the transaction 
-- and rollback will revert the new changes and old changes will remain

START TRANSACTION;

INSERT INTO Users (name, age, email, phone_number) VALUES ('Steve', 25, 'steve@example.com', 1234567890);

SAVEPOINT after_insert;

UPDATE Users SET age = 100;

SELECT * FROM Users;
-- Verify the changes and commit the changes in a new transaction 
ROLLBACK TO after_insert;

COMMIT;

