/*
DDL 
CREATE
*/

/*
To create a database

 CREATE DATABASE db_name;
 
*/

CREATE DATABASE works;

USE works;
SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS works;
SHOW DATABASES;
CREATE DATABASE TEST;
-- DROP DATABASE TEST;

DROP DATABASE IF EXISTS TEST;
USE works;

/*
To create a table

CREATE TABLE `table_name` (
column_name datatype(size) constraints,
column_name datatype(size),
column_name datatype,
constraints

*/
CREATE TABLE `students` (
    `id` INT UNIQUE,
    `name` VARCHAR(30),
    `age` TINYINT CHECK (`age` > 18),
    `result` BOOLEAN DEFAULT 1
);
 
--  DESC `students`;
SHOW TABLES;
SHOW TABLE STATUS;

DROP TABLE `students`;

/* 
For Table alteration

ALTER TABLE `tbl_name` ADD COLUMN.....
ALTER TABLE `tbl_name` MODIFY COLUMN.....
ALTER TABLE `tbl_name` DROP COLUMN.....
ALTER TABLE `tbl_name` CHANGE COLUMN `old_name`  `new_name`.....
ALTER TABLE `tbl_name` RENAME TO `new_tble_name`;

*/

ALTER TABLE `students` ADD COLUMN `mark` int(10) NOT NULL;
ALTER TABLE `students` MODIFY `name` VARCHAR(10);
ALTER TABLE `students` DROP  `result`;
ALTER TABLE `students` ADD  `result` BOOLEAN DEFAULT 1;
ALTER TABLE `students` Change  `mark` `marks` INT;
ALTER TABLE `students` Change  `id` `id` INT UNIQUE AUTO_INCREMENT;


ALTER TABLE `students` RENAME TO `student`;
ALTER TABLE `student` RENAME TO `students`;

USE `WORKS`;

INSERT INTO `students`(`name`,`age`,`marks`,`result`)
VALUES
('AKIL',20,95,1),
('ADARSH',23,93,0),
('ARUN',23,90,0),
('AKASH',21,92,1),
('AADAM',24,96,1);

SELECT * FROM `students`;

/*
TRUNCATE `students`
*/

/*
UPDATE  `tbl_name` SET `COLUMN` =VALUECOLUMN` =VALUE WHERE CONDITION;
*/

UPDATE `students` SET `age`=30 WHERE `id`=2;

-- DELETE FROM `tbl_name` where condition;

DELETE FROM `students` WHERE `name`='aadam';

SELECT `name`,`age`;

-- RESULT SET QUERIES ARE DISPLAYED IN TABULAR FORM

SELECT * ,'PASSED' AS Result from `students`;

SELECT 100*1234 SUM;

SELECT 50 < 100;

SELECT * FROM `students`std,`students`st;

SELECT std.name FROM `students` std,`students` st WHERE std.`id`=st.`id`;

 
