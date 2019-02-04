-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee` DEFAULT CHARACTER SET utf8 ;
USE `employee` ;

-- -----------------------------------------------------
-- Table `employee`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employee`.`employees` (
  `EmpID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `EmpCode` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `Salary` INT(11) NOT NULL,
  PRIMARY KEY (`EmpID`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

USE `employee` ;

-- -----------------------------------------------------
-- procedure employeeAddOrEdit
-- -----------------------------------------------------

DELIMITER $$
USE `employee`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employeeAddOrEdit`(
IN _EmpID INT,
IN _Name varchar(45),
IN _EmpCode varchar(45),
IN _Salary INT
)
BEGIN

	IF _EmpID = 0 THEN
		INSERT INTO employees(Name,EmpCode,Salary)
		VALUES(_Name,_EmpCode,_Salary);
		
		SET _EmpID = LAST_INSERT_ID();
    
	ELSE
		UPDATE employees
        SET
		Name = _Name,
		EmpCode = _EmpCode,
		Salary = _Salary
		WHERE EmpID = _EmpID;
	END IF;
        
    SELECT _EmpID AS 'EmpID';

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
