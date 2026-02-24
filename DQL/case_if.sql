-- Kind of like a switch statement

SELECT name,
       CASE 
           WHEN age < 18 THEN 'Minor'
           WHEN age >= 18 THEN 'Adult'
       END AS age_group
FROM Users;

-- Multiple conditions
SELECT name,
       CASE 
           WHEN age < 18 THEN 'Minor'
           WHEN age >= 18 AND age <= 60 THEN 'Adult'
           WHEN age > 60 THEN 'Senior'
           ELSE 'Unknown'
       END AS age_group
FROM Users;

-- Order by - can be used with order by condition then 
SELECT name, age
FROM Users
ORDER BY
    CASE
        WHEN age < 20 THEN 1
        WHEN age BETWEEN 22 AND 60 THEN 2
        ELSE 3
    END,
    age;


-- IF statement
SELECT name,
       IF(age < 18, 'Minor', 'Adult') AS age_group
FROM Users;

-- Multiple conditions
SELECT name,
       IF(age < 18, 'Minor', IF(age >= 18 AND age <= 60, 'Adult', 'Senior')) AS age_group
FROM Users;