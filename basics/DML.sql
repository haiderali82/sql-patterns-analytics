CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(50),
age INT CHECK(age>18),
city varchar(50) DEFAULT 'LHR'
);

INSERT INTO employees(name,age,city)
VALUES
('Nouman',19, 'GUJ');

INSERT INTO employees(name,age)
VALUES
('uzair',23),
('ahmed',25),
('faizan',26);

SELECT * FROM employees;

CREATE TABLE department(
id INT AUTO_INCREMENT PRIMARY KEY,
dep varchar(50),
salary INT NOT NULL,
employees_id INT NOT NULL,
FOREIGN KEY (employees_id) REFERENCES employees(id)
);

SELECT * FROM department;

INSERT INTO department(dep,salary,employees_id)
VALUES
("HR",3500, 4),
("IT",6000,2),
("IT",7000,3),
("SE",4000,1),
("BD",4000,5);

SET SQL_SAFE_UPDATES = 0;

UPDATE department
SET salary = "50000"
WHERE dep = "HR";

-- because i don't use CASCADE in foreign key-- 

DELETE FROM department WHERE employees_id = 5;
DELETE FROM employees WHERE id = 5;

