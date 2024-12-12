-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema solutions_service
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `solutions_service` ;

-- -----------------------------------------------------
-- Schema solutions_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `solutions_service` DEFAULT CHARACTER SET utf8 ;
USE `solutions_service` ;

-- -----------------------------------------------------
-- Table `solutions_service`.`solution_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `solutions_service`.`solution_status` ;

CREATE TABLE IF NOT EXISTS `solutions_service`.`solution_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `solutions_service`.`solution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `solutions_service`.`solution` ;

CREATE TABLE IF NOT EXISTS `solutions_service`.`solution` (
  `schema_id` INT NOT NULL,
  `solution_json` TEXT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`schema_id`),
  INDEX `fk_solution_solution_status_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_solution_solution_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `solutions_service`.`solution_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
