CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    branch VARCHAR(50),
    age INT CHECK (age > 0)
);

-- Insert student records
INSERT INTO student (name, email, branch, age) VALUES
('Rahul', 'rahul@example.com', 'CSE', 22),
('Priya', 'priya@example.com', 'CSE', 20),
('Amit', 'amit@example.com', 'ECE', 21),
('Sneha', 'sneha@example.com', 'CSE', 19),
('Rohan', 'rohan@example.com', 'ME', 23);

-- Read all students
SELECT * FROM student;

-- Update a student's age
UPDATE student SET age = 22 WHERE id = 1;

-- Delete a student
DELETE FROM student WHERE id = 5;

-- Query practice
SELECT * FROM student;
SELECT * FROM student WHERE branch = 'CSE';
SELECT * FROM student WHERE age > 20;
SELECT * FROM student ORDER BY name ASC;
SELECT branch, COUNT(*) AS total_students
FROM student GROUP BY branch;
SELECT MAX(age) AS maximum_age, MIN(age) AS minimum_age
FROM student;
SELECT * FROM student WHERE name LIKE 'A%';
SELECT branch, COUNT(*) AS total_students
FROM student
GROUP BY branch
HAVING COUNT(*) > 2;
