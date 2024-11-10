CREATE DATABASE `EXAM`;
USE `EXAM`;

CREATE TABLE `EmployeeDetails` (
    `empID` INT PRIMARY KEY,
    `first_name` VARCHAR(45),
    `last_name` VARCHAR(45),
    `salary` DECIMAL,
    `department` VARCHAR(45),
    `Gender` VARCHAR(45)
);

DESC `EmployeeDetails`;

CREATE TABLE `ProjectDetails` (
    `ProjectID` INT PRIMARY KEY,
    `employeeID` INT,
    `Project_name` VARCHAR(45)
);

DESC `ProjectDetails`;

Insert into `employeeDetails` VALUES
(100,'Rahul','Das','30000','Geology','Male'),
(200,'Anshid','Mohammed','20000','Psychology','Male'),
(300,'Vikash','pk','2000','Geology','Male'),
(400,'Ashish','kp','60000','Health','Male'),
(500,'Nikhil','Das','10000','Mathematics','Male');

SELECT * from `employeedetails`;

Insert into `projectDetails` values
(01,100,'Water_conatmination'),
(02,200,'Mental_health'),
(03,300,'Soil_conatmination'),
(04,400,'Diabetes_control'),
(05,500,'pie_value');

SELECT * from `projectDetails`;
-- ---------------------------------------------------------------------------

-- 1 .
SELECT * FROM `employeedetails`;

-- 2.

SELECT `first_name` FROM `employeedetails`;

-- 3.

-- SELECT e.`first_name`,`last_name` from `employeedetails`as e join ;

-- 4.

SELECT `first_name` FROM `employeeDetails` WHERE `first_name` LIKE '%h';

-- 5.

SELECT DISTINCT `department` FROM `employeeDetails`; 

-- 6.

SELECT max(`SALARY`) FROM `EMPLOYEEDetails`;


-- 7.

SELECT min(`SALARY`) FROM `EMPLOYEEDetails`;

-- 8.

SELECT `First_name` FROM `employeedetails` WHERE `empID` in (300,400,500);

-- 9.

SELECT `First_name` FROM `employeedetails` WHERE `empID` NOT IN (300,400,500);

-- 10.

SELECT 'Hello', `FIRST_NAME` FROM `employeedetails`;

-- 11.

SELECT `first_name`,`last_name`,`salary` FROM `employeedetails` WHERE `salary`<7000;

-- 12.

SELECT `first_name`,`last_name`,`salary` FROM `employeedetails` WHERE `salary` BETWEEN 50000 AND 60000;

-- 13.

SELECT max(`salary`) FROM `EMPLOYEEDetails` where `salary` < 60000;

-- 14.

SELECT `department`,`salary` , sum(salary) FROM `employeedetails`;

-- 16.

SELECT count(department)  from `employeedetails`;

-- 23.

-- B). 15

-- 24.

-- A). THROW ERROR

-- 25.

-- C). 1

-- 26.

-- A). Throw errorS

-- 27.

-- D). VIKAS1

-- 28.

-- D). VIKAS1

-- 29.

-- C). VIKAS

-- 30.

-- A). Throw error 

-- 31.

-- A). Throw error







 
