-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LAB3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LAB3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LAB3` DEFAULT CHARACTER SET utf8 ;
USE `LAB3` ;

-- -----------------------------------------------------
-- Table `LAB3`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB3`.`CLIENT` (
  `clientID` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NOT NULL,
  `client_address` VARCHAR(55) NOT NULL,
  `client_age` INT NOT NULL,
  PRIMARY KEY (`clientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LAB3`.`POLICY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB3`.`POLICY` (
  `policyID` INT NOT NULL AUTO_INCREMENT,
  `policyType` VARCHAR(55) NOT NULL,
  `policyTerm` VARCHAR(45) NOT NULL,
  `policyLimits` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`policyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LAB3`.`POLICY_LIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LAB3`.`POLICY_LIST` (
  `POLICY_policyID` INT NOT NULL,
  `CLIENT_clientID` INT NOT NULL,
  PRIMARY KEY (`POLICY_policyID`, `CLIENT_clientID`),
  CONSTRAINT `CLIENT_clientID`
    FOREIGN KEY (`POLICY_policyID` , `CLIENT_clientID`)
    REFERENCES `LAB3`.`CLIENT` (`clientID` , `clientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `POLICY_policyID`
    FOREIGN KEY (`POLICY_policyID`)
    REFERENCES `LAB3`.`POLICY` (`policyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
