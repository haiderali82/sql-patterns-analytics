CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(50),
department varchar(50)
);

INSERT INTO students(name,department)
VALUES
('Ashar','CS'),
('Shahzain','ENG'),
('Zaroon','MED');

SELECT * FROM students;

CREATE TABLE courses(
id INT AUTO_INCREMENT PRIMARY KEY,
courseName varchar(50),
user_id INT,
FOREIGN KEY (user_id) REFERENCES students(id)
);

SHOW TABLES;

INSERT INTO courses(courseName,user_id)
VALUES
('maths', 1),
('computer', 1),
('physics', 1),
('calculas', 1),
('Urdu', 2),
('English', 2),
('biology', 3);

SELECT * FROM courses;


UPDATE courses
SET courseName = 'EnglishHard 2.0'
WHERE id = 5;

DELETE FROM courses WHERE id = 5;
