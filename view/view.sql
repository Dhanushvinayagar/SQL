-- create view - it will create a virtual table 
-- Can create any business logic and hide the underlying data from original table

CREATE VIEW user_view AS
SELECT id, name, email
FROM Users;

-- use view
SELECT * FROM user_view;

-- update view
ALTER VIEW user_view AS
SELECT id, name, email,age, phone_number 
FROM Users;


-- insert into view - will insert into the original table
-- update view - will update the original table
-- delete view - will delete the original table

INSERT INTO user_view (id, name, email, age, phone_number)
VALUES (10, 'Max', 'max@example.com',20, 1234567890);

UPDATE user_view
SET name = 'Maxx'
WHERE id = 10;

SELECT * FROM user_view;

DELETE FROM user_view
WHERE id = 10;

-- delete view
DROP VIEW IF EXISTS user_view_1;