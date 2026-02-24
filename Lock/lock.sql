
-- Lock table course  with READ/WRITE - to prevent other users from reading/modifying the table until the lock is released
LOCK TABLES Courses READ;

SELECT * FROM Courses;

UNLOCK TABLES;