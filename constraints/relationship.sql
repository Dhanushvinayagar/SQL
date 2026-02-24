USE DB;

-- ONE TO ONE
-- 1:1 relationship between two tables 
-- One record in one table maps to only one record in another table
-- 2 tables - One with a primary key linked to another table as a foreign key with a unique constraint
CREATE TABLE employes_oo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE profiles_oo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    -- UNIQUE enforces one-to-one
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES employes_oo(id)
);

-- ONE TO MANY
-- a 1:n relationship between two tables 
-- One record in one table maps to multiple records in another table
-- 2 tables - One with a primary key linked to another table as a foreign key (no unique constraint)
CREATE TABLE employess_om (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE profiles_om (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES employess(id)
);

-- MANY TO MANY
-- a n:m relationship between two tables 
-- 2 Independent tables with a primary key linked to another table(mapping table) as a foreign key
-- 3 tables - Two tables with a primary key linked to another table as a foreign key (no unique constraint)
CREATE TABLE employess_mm (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE profiles_mm (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bio TEXT
);

CREATE TABLE employess_profiles_mm (
    employess_id INT,
    profiles_id INT,
    PRIMARY KEY (employess_id, profiles_id),
    FOREIGN KEY (employess_id) REFERENCES employess_mm(id),
    FOREIGN KEY (profiles_id) REFERENCES profiles_mm(id)
);