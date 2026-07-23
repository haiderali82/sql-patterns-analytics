CREATE DATABASE	school;

USE school;

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(25),
age INT,
department VARCHAR(25),
city VARCHAR(25),
salary INT
);

INSERT INTO employees(name,age,department,city,salary)
VALUES
("ahmed",24,"SE","LHR","80000"),
("zia",24,"SE","LHR","35000"),
("haider",24,"SE","LHR","50000"),
("faizan",24,"BD","LHR","40000");

SELECT * FROM employees;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET age = 26 , city = "GUJ"
WHERE name = 'haider';

ALTER TABLE employees
ADD email VARCHAR(40) DEFAULT "testuser@gmail.com";

ALTER TABLE employees
ADD dob VARCHAR(40);

ALTER TABLE employees
DROP COLUMN dob;

ALTER TABLE employees
RENAME COLUMN id TO employees_id;

ALTER TABLE employees 
RENAME COLUMN name TO fullName;

ALTER TABLE employees
MODIFY COLUMN age VARCHAR(3);

ALTER TABLE employees
RENAME TO schoolEmployees;

SHOW TABLES;

SELECT * FROM schoolEmployees;

RENAME TABLE schoolEmployees TO employees;

SELECT * FROM employees;

ALTER TABLE employees
DROP email;

ALTER TABLE employees
ADD email VARCHAR(50);

ALTER TABLE employees
MODIFY email VARCHAR(40) DEFAULT 'testuser@gmail.com';

SELECT DISTINCT department FROM employees;
