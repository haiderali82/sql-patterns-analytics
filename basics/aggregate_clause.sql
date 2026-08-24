CREATE DATABASE school;

USE school;

CREATE DATABASE metaxols;

USE metaxols;

CREATE TABLE SECTION(
id INT PRIMARY KEY,
name VARCHAR(50),
age VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO SECTION(id, name, age, city)
VALUES 
(1, "Haider", 25, "Guj"),
(2, "zunair", 24, "Lhr"),
(3, "Haseeb", 22, "Punjab"),
(4, "Moiz", 25, "KHI");

INSERT INTO SECTION(id, name, age, city)
VALUES 
(5, "AQIB", 19, "Lhr");

SELECT * FROM SECTION;

UPDATE SECTION 
SET age = 26 
WHERE id = 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM SECTION;
DROP TABLE SECTION;

CREATE TABLE EMPLOYEES(
id INT PRIMARY KEY,
name VARCHAR(50),
age VARCHAR(50),
city VARCHAR(50),
salary INT,
CREATEDAT TIMESTAMP
);

ALTER TABLE EMPLOYEES
CHANGE COLUMN CREATEDAT createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

SHOW TABLES;

INSERT INTO EMPLOYEES (id, name, age, city, salary) VALUES
(1, 'azan', '24', 'Lahore', 30000),
(2, 'nouman', '24', 'Lahore', 35000),
(3, 'toba', '26', 'Gujranwala', 32000),
(4, 'Galib', '26', 'Lahore', 40000),
(5, 'Abdul', '22', 'Multan', 20000);

UPDATE EMPLOYEES
SET age = 25
WHERE id = 4;

SELECT * FROM EMPLOYEES
WHERE age >= 21 AND city = "Lahore";

SELECT * FROM EMPLOYEES
WHERE age >= 23 OR city = "Lahore";

SELECT * FROM EMPLOYEES
WHERE city IN("Lahore", "Gujranwala");

SELECT * FROM EMPLOYEES
WHERE city IN("Lahore", "Gujranwala");

SELECT * FROM EMPLOYEES
WHERE name LIKE "A%";

SELECT * FROM EMPLOYEES
WHERE name LIKE "_A%";

SELECT COUNT(city) FROM EMPLOYEES;
SELECT SUM(salary) FROM EMPLOYEES;
SELECT MAX(salary) FROM EMPLOYEES;
SELECT MIN(salary) FROM EMPLOYEES;
SELECT AVG(salary) FROM EMPLOYEES;

SELECT city, COUNT(id) as totalUSERPerDepartment
from EMPLOYEES
GROUP BY city;

SELECT city, COUNT(id) as totalUSERPerDepartment
from EMPLOYEES
GROUP BY city
HAVING totalUSERPerDepartment >= 3;

SELECT city, AVG(Salary) as AVGsalaryPerDepartment
from EMPLOYEES
GROUP BY city;

SELECT city, AVG(Salary) as AVGsalaryPerDepartment
from EMPLOYEES
GROUP BY city
HAVING AVGsalaryPerDepartment > 25000;



-- practice question 

SELECT city, MAX(salary) as max_no_salary
FROM EMPLOYEES
GROUP BY city
ORDER BY max_no_salary DESC;

SELECT city, COUNT(id) as no_of_employees_for_each_city
FROM EMPLOYEES
GROUP BY city
ORDER BY no_of_employees_for_each_city DESC;

SELECT city, AVG(salary) as avg_salary_of_each_city
FROM EMPLOYEES
GROUP BY city
HAVING AVG(salary) > 55000;
