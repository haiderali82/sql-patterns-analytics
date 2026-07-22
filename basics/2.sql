CREATE DATABASE IF NOT EXISTS Instagramdb;

USE Instagramdb;

CREATE TABLE users(
id INT PRIMARY KEY,
name varchar(50),
city varchar(50),
age INT,
Married BOOLEAN
);

CREATE TABLE posts(
id INT PRIMARY KEY,
userID INT,
context varchar(250)
);

SHOW TABLES;

INSERT INTO users(id,name,city,age,Married)
VALUES(1,'Haider','LHR',26,true),
(2,'Ashar','Guj',27,false),
(3,'Shahzain','LHR',21,false),
(4,'Zaroon','PPT',22,false);

SELECT * FROM users;

INSERT INTO posts(id,userID,context)
VALUES(101,201,"POST1"),
(102,202,"POST2"),
(103,203,"POST3");

SELECT * FROM posts;

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(50),
age INT
);

INSERT INTO employees(name, age)
VALUES("AHMED", "24"),
("Zia", "26");

SELECT * FROM employees;

DROP DATABASE IF EXISTS instagramdb;