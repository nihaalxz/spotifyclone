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
CREATE SCHEMA IF NOT EXISTS `lib` DEFAULT CHARACTER SET utf8 ;
USE `lib` ;

-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `publication_year` DATE NULL,
  `copies_owned` INT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE INDEX `book_id_UNIQUE` (`book_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `author_id_UNIQUE` (`author_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`book_author` (
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  UNIQUE INDEX `book_id_UNIQUE` (`book_id` ASC) VISIBLE,
  UNIQUE INDEX `author_id_UNIQUE` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_id_author`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_id_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  
  
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `joined_date` DATE NULL,
  `status` ENUM('Active', 'Inactive') NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `member_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `cart_date` DATE NULL,
  `statuts` ENUM('Active', 'Inactive') NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE INDEX `reservation_id_UNIQUE` (`cart_id` ASC) VISIBLE,
  INDEX `fk_book_id_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_member_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_cart_id`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_cart`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`borrow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`borrow` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `borrow_date` DATE NULL,
  `cart_id` INT NOT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE INDEX `loan_id_UNIQUE` (`borrow_id` ASC) VISIBLE,
  UNIQUE INDEX `book_id_UNIQUE` (`book_id` ASC) VISIBLE,
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE,
  INDEX `fk_cart_id_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_id_borrow`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id_borrow`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_id_borrow`
    FOREIGN KEY (`cart_id`)
    REFERENCES `mydb`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`fine` (
  `fine_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `borrow_id` INT NOT NULL,
  `fine_date` DATE NOT NULL,
  `fine_amount` INT NOT NULL,
  PRIMARY KEY (`fine_id`),
  UNIQUE INDEX `fine_date_UNIQUE` (`fine_id` ASC) VISIBLE,
  UNIQUE INDEX `member_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `loan_id_UNIQUE` (`borrow_id` ASC) VISIBLE,
  CONSTRAINT `fk_userr_id_fine`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_borrow_id_fine`
    FOREIGN KEY (`borrow_id`)
    REFERENCES `mydb`.`borrow` (`borrow_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fine_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`fine_payment` (
  `fine_payment_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `payment_date` DATE NULL,
  `payment_amount` VARCHAR(45) NULL,
  PRIMARY KEY (`fine_payment_id`),
  UNIQUE INDEX `fine_payment_ID_UNIQUE` (`fine_payment_id` ASC) VISIBLE,
  INDEX `fk_member_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id_finepayment`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lib`.`Purchase` (
  `purchase_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `cart_id` INT NOT NULL,
  `Purchase_amount` DECIMAL NOT NULL,
  `Purchase_date` DATE NOT NULL,
  PRIMARY KEY (`purchase_id`),
  UNIQUE INDEX `purchase_id_UNIQUE` (`purchase_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_book_id_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_cart_id_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id_purchase`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_id_purchase`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_id_purchase`
    FOREIGN KEY (`cart_id`)
    REFERENCES `mydb`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`books`
-- -----------------------------------------------------
START TRANSACTION;
USE `lib`;
INSERT INTO `lib`.`books` (`book_id`, `title`, `author`, `category`, `publication_year`, `copies_owned`) 
VALUES 
(1, 'Pride and Prejudice', 'Jane Austen', 'Fiction', '1813-01-23', 3),
(2, 'The Hobbit', 'J.R.R. Tolkien', 'Science Fiction & Fantasy', '1937-09-21', 4),
(3, 'Dune', 'Frank Herbert', 'Science Fiction & Fantasy', '1965-08-01', 7),
(4, 'Gone Girl', 'Gillian Flynn', 'Mystery & Thriller', '2012-06-05', 8),
(5, 'Sherlock Holmes', 'Arthur Conan Doyle', 'Mystery & Thriller', '1887-11-01', 2);
COMMIT;

UPDATE `lib`.`books`
SET `copies_owned` = 5
WHERE `book_id` = 1;

SELECT * from `lib`.`books`;
USE LIB;

SELECT `title` from `lib`.`books`;
-- --

SELECT 
    b.`book_id`, b.`title`, b.`copies_owned`
FROM
    `lib`.`books` b
        JOIN
    `author` a ON a.`author_id` = b.`book_id`;
 
 select * from `author`;
 select * from `books`;
 
 select * from `publisher`;
 
 INSERT INTO `publisher`(`pub_id`,`publisher_name`,`title`,`published_date`,`book_id`)VALUES
 (1,'Dover Publications','Pride and Prejudice','1813-01-23','1'),
(2, 'George Allen & Unwin', 'The Hobbit', '1937-09-21', 2),
(3, 'Chilton Books', 'Dune', '1965-08-01', 3),
(4, 'Crown Publishing Group', 'Gone Girl', '2012-06-05', 4),
(5, 'Ward, Lock & Co.', 'Sherlock Holmes', '1887-11-01', 5);

SELECT 
    b.`title`, b.`category`, p.`publisher_name`, a.`author_name`
FROM
    `books` b
        JOIN
    `publisher` p ON p.`pub_id` = b.`book_id`
        JOIN
    `author` a ON a.`author_id` = b.`book_id`;


 
 
 


