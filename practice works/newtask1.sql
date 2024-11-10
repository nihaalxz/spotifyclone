CREATE DATABASE `JOIN`;
USE `JOIN`;

CREATE TABLE `salesman` (
    `salesman_id` INT,
    `name` VARCHAR(10),
    `city` VARCHAR(10),
    `commission` FLOAT
);

ALTER TABLE `salesman` change `salesman_id`  `salesman_id` INT UNIQUE AUTO_INCREMENT;

desc `salesman`;


CREATE TABLE `customer` (
    `customer_id` INT,
    `cust_name` VARCHAR(10),
    `city` VARCHAR(10),
    `grade` CHAR,
    `salesman_id` INT
);

ALTER TABLE `customer` change `customer_id`  `customer_id` INT UNIQUE AUTO_INCREMENT;
ALTER TABLE `customer` change `grade`  `grade` INT;
ALTER TABLE `customer` change `cust_name`  `cust_name` VARCHAR(13);

desc `customer`;

CREATE TABLE `orders` (
    `ord_no` INT,
    `purch_amt` FLOAT,
    `ord_date` DATE,
    `customer_id` INT,
    `salesman_id` INT
); 

ALTER TABLE `orders` change `ord_no`  `ord_no` INT UNIQUE AUTO_INCREMENT;

desc `orders`;

USE `JOIN`;
DESC `orders`;

/*
INSERTING DATAS TO TABLE..

INSERT INTO `tbl_name` VALUES(VALUE 1,VALUE 2);
--COLUMN COUNT VALUE COUNT SAME
--VALUE POSITION RESPECTIVE TO COLUMN POSITION
--CANNOT SKIP ANY COLUMNS

INSERT INTO `tbl_name`(COLUMN,COLUMN)VALUES(value,value..);

INSERT INTO `tbl_name`(COLUMN,COLUMN)
VALUES
(value,value..);
(value,value..);
(value,value..);
(value,value..);


INSERT INTO `tbl_name` SELECT * FROM `other_tbl`;

*/



INSERT INTO `salesman`(`salesman_id`,`name`,`city`,`commission`)
VALUES
(5001,'James hoog','New york','0.15'),
(5002,'Nail Knite','Paris','0.13'),
(5005,'Pit Alex','London','0.11'),
(5006,'Mc Lyon','Paris','0.14'),
(5003,'Lauson Hen','','0.12'),
(5007,'Paul Adam','Rome','0.13');

SELECT * FROM `salesman`;

INSERT INTO `customer`(`customer_id`,`cust_name`,`city`,`grade`,`salesman_id`)
VALUES
(3002,'Nick Rima','New York','100','5001'),
(3005,'Graham zusi','California','200','5002'),
(3001,'Brad guzan','London',null,'5005'),
(3004,'Fabian Johns','Paris','300','5006'),
(3007,'Brad Davis','New York','200','5001'),
(3009,'Geoff Camero','Berlin','100','5003'),
(3008,'Julian Green','London','300','5002'),
(3003,'Jozy Altidor','Moscow','200','5007');

INSERT INTO `orders`(`ord_no`,`purch_amt`,`ord_date`,`customer_id`,`salesman_id`)
VALUES
(70001,'150.5','2012-10-05','3005','5002'),
(70009,'270.65','2012-09-10','3001','5005'),
(70002,'65.26','2012-10-05',3002,'5001'),
(70004,'110.5','2012-08-17','3009','5003'),
(70007,'948.5','2012-09-10','3005','5002'),
(70005,'2400.6','2012-07-27','3007','5001'),
(70008,'5760','2012-09-10','3002','5001'),
(70010,'1983.43','2012-10-10','3004','5006'),
(70003,'2480.4','2012-10-10','3009','5003'),
(70012,'250.45','2012-06-27','3008','5002'),
(70011,'75.29','2012-08-17','3003','5007'),
(70013,'3045.6','2012-04-25','3002','5001');

SELECT * FROM `orders`;
SELECT * FROM `customer`;
SELECT * FROM `salesman`;

 -- BASIC QUESTIONS
SELECT * FROM `salesman` where `city`='paris';

SELECT * FROM `customer` where `grade`=200; 




SELECT * FROM `salesman` WHERE `city`='Paris' OR `city`='Rome';

SELECT * FROM `salesman` WHERE `city`in ('Paris','Rome');


/*
operators

  arithmethic
  logic : and or not
  relational
  
in operator
- set of data
- subquery
  
between -range spec
  - (between start AND end)
  - number,date,text
like
  - to filter column data by specified pattern
  
wildcards
 % - single,zero,multiple
 _ -single character
 - - range of single character with specified range *
 ^ - Represnts any not in the brackets *
 
Exists
is null
is not null
any
all 
 
 

*/

select * from `orders` where `purch_amt` BETWEEN 500 and 4000 AND `purch_amt` not in(948.5,1983.44);

SELECT * FROM `salesman` where `name` between 'a' and 'k';

SELECT * from `salesman` where `name` like 'n__i%';


/*
Aggregate fucntions and scalar functions

count();
min();
max();
avg();
sum();
floor();
ceil();
round();
square();
substr();
substring();
format();
length();
mid();
concat();
uppercase();
lowercase();
ucase();
lcase();
replace();

*/

select count( DISTINCT `salesman_id`) from `customer`;

-- Date functions

SELECT now();

SELECT current_date();

SELECT curdate();

SELECT curtime();

SELECT DATE('2017-06-15');

SELECT DAYNAME('2003-07-19');

SELECT MONTHNAME('2003-07-19');

SELECT ucase(monthname(curdate()));

SELECT lcase(monthname(curdate()));

SELECT ADDDATE(curdate(),INTERVAL 5 YEAR);

SELECT date_add(date('2024-03-15'),INTERVAL 5 YEAR);

SELECT datediff('2024-03-15','2023-01-16');

SELECT datediff(curdate(),'2024-03-15');

SELECT date_format(curdate(),'%D,%M,%Y');


-- Aggregate enhancers

-- order by Asec DESC

SELECT * from `salesman` where `commission` >0.12 order by `name`;

SELECT 
    `cust_name`, `name`,s.`city`
FROM
    `salesman` s,
    `customer` c
WHERE
    s.`city` = c.`city`;
    
    
SELECT s.`name`,c.`cust_name` from `salesman` s,`customer`c WHERE s.`salesman_id`=c.`salesman_id`;

SELECT c.`cust_name` from `customer` c,`salesman` s where c.`salesman_id`=s.`salesman_id` AND s.`commission`>0.12;


/*
Write a SQL statement to make a report with customer name, city, order number, order 
date, and order amount in ascending order according to the order date to find that either 
any of the existing customers have placed no order or placed one or more orders. 
*/

CREATE TABLE `DEPARTMENT` (
    `ep_id` INT,
    `dep_name` VARCHAR(10),
    `dep_location` VARCHAR(10)
);

INSERT INTO `department`(`ep_id`,`dep_name`,`dep_location`)
VALUES
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');

SELECT * FROM `DEPARTMENT`;

CREATE TABLE `EMPLOYEES` (
    `emp_id` INT,
    `emp_name`  VARCHAR(10),
    `job_name` VARCHAR(10),
    `manager_id` INT,
    `hire_date` DATE,
    `salary` INT,
    `commission` FLOAT,
    `dep_id` INT
);

ALTER TABLE `employees` change `emp_name`  `emp_name` VARCHAR(10);

INSERT INTO `employees`(`emp_id`,`emp_name`,`job_name`,`manager_id`,`hire_date`, `salary`,`commission`,`dep_id`)
VALUES
(68319,'KAYLING','PRESIDENT',NULL,'1991-11-18',6000,NULL,1001),
(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750,NULL,3001),
(67832,'CLARE','MANAGER',68319,'1991-06-09',2250,NULL,1001),
(65646,'JONAS','MANAGER',68319,'1991-04-02',2957,NULL,2001),
(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100,NULL,2001),
(69062,'FRANK','ANALYST',65646,'1991-12-03',3100,NULL,2001),
(63679,'SANDERINE','CLERK',69062,'1990-12-18',900,NULL,2001),
(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700,400,3001),
(65271,'WADE','SALESMAN',66928,'1991-02-22',1350,600,3001),
(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350,1500,3001),
(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600,0,3001),
(68736,'ADNRES','CLERK',67858,'1997-05-23',1200,NULL,2001),
(69000,'JULIUS','CLERK',66928,'1991-12-03',1050,NULL,3001),
(69324,'MARKER','CLERK',67832,'1992-01-23',1400,NULL,1001);

select *FROM `employees`;

select `job_name`,`salary` from `employees` where `emp_name`='kayling';

CREATE TABLE `SALARY` (
    `grade` INT,
    `min_sal` INT,
    `max_sal` INT
);

insert into `salary`(`grade`,`min_sal`,`max_sal`)
VALUES
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);

-- 1. Write a query in SQL to list the employees with Hire date in the format like February 22, 1991. 
select `emp_name`,date_format(`hire_date`,'%M %D %Y') as `employees`  from `employees`;

-- 2 Write a query in SQL to list the employees who does not belong to department 2001.  
select `emp_name`,`dep_id` from `employees` where `dep_id`!=2001;

-- 3 Write a query in SQL to display the unique department with jobs.

SELECT distinct `dep_id`,`dep_name` from `employees` where `job_name`is not null;

-- 4 Write a query in SQL to list the employees who joined before 1991.
select `emp_name`,`hire_date` from `employees` where `hire_date`<'1991-01-01';

-- Write a query in SQL to display the average salaries of all the employees who works as ANALYST.
select `emp_name`,`job_name` from `employees` where `job_name`='ANALYST';

-- Write a query in SQL to list the employees whose salaries are less than 3500.  
select `emp_name` ,`salary`from `employees` where `salary`<3500;

-- ---------------------------------------------JOINS-----------------------------------------------------------
/*
 1)-INNER JOIN
 -- UNION  this takes common values
 
 2)-SELF JOIN
 -- 

*/

SELECT 
    *
FROM
    `customer`;

SELECT 
    e.`emp_name`, e.`job_name`, m.`emp_name`
FROM
    `employees` e
        CROSS JOIN
    `employees` m ON e.`emp_id` = m.`manager_id`;
    
    
-- RIGHT JOIN

-- SELECT `cust_name`

/*
-----------------------------------------------------------------------------STORED PROCEDURES---------------------------------------------------------------------------


A stored procedures is a collection of pre-controlled SQL statementsn stored inside the database.

-- A stored procedure is a set of structured query language 

*/
/*
DELIMITER && -- OR //
CREATE PROCEDURE procedure_name (IN parameter_name DATATYPE,out parameter_name Datatype,INOUT parameter_name Datatype)
BEGIN
Declaration_section;
Executable_section;
END &&
DELIMITER;

call procedure_name();

*/

delimiter //
CREATE PROCEDURE empsalary()
BEGIN
     SELECT * FROM employees WHERE SALARY>2000;
	 SELECT sum(salary) AS Total_Salary FROM employees;
END//
delimiter ;

show procedure status;
show table status;

call empsalary();



DELIMITER &&
CREATE PROCEDURE empin (IN salaryRange int)
BEGIN
select * from employees Where salary > SalaryRange;
select sum(salary) As Total_Salary from employees;
END &&
DELIMITER ;

CALL empin(3000);
CALL empin(2000);
CALL empin(1000);


DELIMITER &&
CREATE PROCEDURE empout (out avg_salary int)
BEGIN
select AVG(salary) into avg_salary from employees;
END &&
DELIMITER ;

-- declare @sum int; -- variable
-- set @sum = 1000;
-- select @sum;



call empout(@avg_salary);

select * from employees where salary>@avg_salary;


DELIMITER &&
CREATE PROCEDURE empinout (INOUT idOnSalary INT)
BEGIN
SELECT emp_id INTO IdOnSalary FROM employees Where salary = IdOnSalary;
END &&
DELIMITER ;

set @salary=1050;

call empinout(@salary);


select @salary;

select @salary as employee_Id;



-- -----------------------------------------TRIGGER----------------------------------------------
/*

-- it is a special type of stored procedure that is invoked
-- automatically in response to an invent. Each trigger is associated with a table which is activated on any DML
-- statement such as INSERT DELETE UPDATE 


*/

CREATE TRIGGER trigger_name trigger_time trigger_event
On table_name for each row
trigger code

delimiter &&
CREATE TRIGGER trigger_name
(AFTER | BEFORE) (INSERT|UPDATE|DELETE)
ON table_name FOR EACH ROW
BEGIN
trigger code
END &&

delimiter ;


/*
Normalisation
It is a design technique that reduces data redundancy and eliminates undesirable characteristics like insertion deletion and update anomalies.
*/

CREATE TABLE `data` ;

/*
id,name,password,email,phone,username,colortheme,socialink,address
*/

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table2` (
  `color_id` INT NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phoneno` INT NULL,
  `table1col` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `colortheme` VARCHAR(45) NULL,
  `socialink` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `color` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_color_idx` (`color` ASC) VISIBLE,
  CONSTRAINT `fk_color`
    FOREIGN KEY (`color`)
    REFERENCES `mydb`.`table2` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `table1`(`id`,`name`,`password`,`email`,`phoneno`,`table1col`,`username`,`colortheme`,`socialink`,`address`,`color`)
VALUES(1,'NIHAAL','12345','nihaal@gmail.com','1234567899',' ','nihaalxz','yellow','https://instagram/nihaalxz.com','mar(h),Perinthalmanna');





