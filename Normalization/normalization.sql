Denormalization:
- The intentional introduction of redundancy to improve read performance at the cost of write complexity. 
- Used in data warehouses (Data lakes) and reporting systems.

Normalization:
- Normalization is the process of reducing the redundancy and inconsistency in the data
- Reduce the complexity of the data
- Avoid anamolies during insert, update, delete in the data


Functional Dependency
If attribute A determines attribute B, we write: A → B

A is the determinant, B is the dependent
Example: StudentID → StudentName (knowing the ID tells you the name)

Types:
- Full Functional Dependency - B depends on the whole composite key, not part of it
Eg: (OrderID, UserID) → Status  (Status depends on the whole composite key)
- Partial Dependency - B depends on only part of a composite key
Eg: (OrderID, ProductID) → OrderDate  (OrderDate depends on only part of the composite key OrderID)
- Transitive Dependency - A → B → C (C depends on B, B depends on A) i.e A → B, B → C then A → C
Eg: StudentID → ZipCode, ZipCode → City, StudentID → City 

Normal Forms

First Normal Form (1NF)
Rules:

- Each column must contain atomic (indivisible) values
- No repeating groups or arrays
- Each row must be unique (have a primary key)

Violation Example:
id  Name   Courses
1   Ravi  Math, Science

Fixed (1NF):
id  Name   Courses
1   Ravi  Math
2   Ravi  Science

Second Normal Form (2NF)
Rules:
- Must be in 1NF
- No partial dependencies (every non-key attribute must depend on the whole primary key)
- Applies only when there is a composite primary key

Violation Example:
StudentID CourseID StudentName CourseName
1           C1        Ravi        Math

Primary Key = (StudentID, CourseID)
StudentName depends only on StudentID → Partial Dependency
CourseName depends only on CourseID → Partial Dependency

Fixed (2NF): Split into:

Student Table: StudentID → StudentName
Course Table: CourseID → CourseName
Enrollment Table: (StudentID, CourseID)


Third Normal Form (3NF)
Rules:

- Must be in 2NF
- No transitive dependencies (non-key attribute must not depend on another non-key attribute)

Violation Example:
StudentID Name  ZipCode   City
1         Ravi  641001   Coimbatore

StudentID → ZipCode → City → Transitive Dependency

Fixed (3NF): Split into:

Student Table: StudentID → Name, ZipCode
Zip Table: ZipCode → City

Boyce-Codd Normal Form (BCNF)
Rules:

- Must be in 3NF
- For every functional dependency A → B, A must be a super key
- Stricter version of 3NF

Violation Example:
Student Subject   Teacher
Ravi     Math     Mr. Kumar

Teacher → Subject (a non-key determines part of the key)
This violates BCNF

Fixed (BCNF): Split into:

TeacherSubject: Teacher → Subject
StudentTeacher: Student → Teacher


Fourth Normal Form (4NF)
Rules:

- Must be in BCNF
- No multi-valued dependencies
- A multi-valued dependency exists when one attribute independently determines multiple values of two other attributes.

Violation Example:
Employee  Skill   Language
Ravi      Java    Tamil
Ravi      Java    English
Ravi      Python  Tamil
Ravi      Python  English

Employee →→ Skill and Employee →→ Language (independently)

Fixed (4NF): Split into:

EmpSkill: Employee, Skill
EmpLanguage: Employee, Language


Fifth Normal Form (5NF) / Project-Join Normal Form (PJNF)
Rules:

- Must be in 4NF
- No join dependencies — a table cannot be decomposed into smaller tables without loss of information
- Ensures lossless-join decomposition
- Handles very complex many-to-many relationships.


Lossless vs Lossy Decomposition

Lossless Decomposition - Original table can be perfectly reconstructed by joining decomposed tables 
Lossy Decomposition - Joining produces extra (spurious) tuples 

