USE DB;

DESCRIBE Users;

-- id      int     NO      PRI     NULL    auto_increment
-- name    varchar(255)    NO              NULL
-- phone_number    bigint  YES             NULL
-- age     int     NO              NULL
-- email   varchar(255)    NO      UNI     NULL
-- INSERT based on the tables columns sequence
INSERT INTO
    Users
VALUES
    (1, 'Jane', 9876543210, 30, '9G0oq@example.com');

-- INSERT based on the columns names
INSERT INTO
    Users (name, age, email, phone_number)
VALUES
    ('John Doe', 25, 'Q4f9s@example.com', 1234567890);

-- Multiple rows insert
INSERT INTO
    Users (name, age, email, phone_number)
VALUES
    ('Doe', 25, 'S4f9sd@example.com', 1234567890),
    ('Bob Smith', 35, 'FmR2M@example.com', 5555555555);

-- Can skip nyll/default columns
INSERT INTO
    Courses (course_name, academic_year, department)
VALUES
    ('CS', 2022, 'CSE'),
    ('CS', 2023, 'CSE'),
    ('CS', 2024, 'CSE'),
    ('CS', 2025, 'CSE'),
    ('CS', 2026, 'CSE');

-- INSERT records based on table
Create table UserTableCopy LIKE Users;

INSERT INTO
    UserTableCopy (name, age, email, phone_number)
SELECT
    name,
    age,
    email,
    phone_number
FROM
    Users;

-- INSERT IGNORE - to ignore duplicate primary key records
INSERT
    IGNORE INTO Users (id, name, age, email, phone_number)
VALUES
    (
        1,
        'John Doe',
        25,
        'Q4f9swa@example.com',
        1234567890
    );

-- Replace
REPLACE INTO Users (id, name, age, email, phone_number)
VALUES
    (
        1,
        'John Doe',
        25,
        'Q4f9sreplace@example.com',
        1234567890
    );