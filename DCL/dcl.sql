-- Crate Multiple Users
SELECT
    *
FROM
    mysql.user;
-- Create User 
CREATE USER 'user1' @'localhost' IDENTIFIED BY 'password1';

CREATE USER 'user2' @'localhost' IDENTIFIED BY 'password2';

-- SET permissions for one or more users to access a database / tables
-- Grant Privileges
GRANT ALL PRIVILEGES ON DB.* TO 'user1' @'localhost';
GRANT SELECT, INSERT ON employees TO 'user2'@'localhost';

-- Revoke Privileges
REVOKE ALL PRIVILEGES ON DB.* FROM 'user2' @'localhost';

-- Drop User
DROP USER 'user2' @'localhost';