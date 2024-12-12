-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema schemas_service
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `schemas_service` ;

-- -----------------------------------------------------
-- Schema schemas_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `schemas_service` DEFAULT CHARACTER SET utf8 ;
USE `schemas_service` ;

-- -----------------------------------------------------
-- Table `schemas_service`.`schema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schemas_service`.`schema` ;

CREATE TABLE IF NOT EXISTS `schemas_service`.`schema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `schemas_service`.`amr_parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schemas_service`.`amr_parameters` ;

CREATE TABLE IF NOT EXISTS `schemas_service`.`amr_parameters` (
  `schema_id` INT NOT NULL,
  `amr_count` INT NOT NULL,
  `amr_capacity` INT NOT NULL,
  PRIMARY KEY (`schema_id`),
  CONSTRAINT `fk_amr_parameters_schema`
    FOREIGN KEY (`schema_id`)
    REFERENCES `schemas_service`.`schema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_amr_parameters_schema_idx` ON `schemas_service`.`amr_parameters` (`schema_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `schemas_service`.`workstation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schemas_service`.`workstation` ;

CREATE TABLE IF NOT EXISTS `schemas_service`.`workstation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `schema_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `demand` DECIMAL NOT NULL,
  `x` DECIMAL NOT NULL,
  `y` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_workstation_schema1`
    FOREIGN KEY (`schema_id`)
    REFERENCES `schemas_service`.`schema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_workstation_schema1_idx` ON `schemas_service`.`workstation` (`schema_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `schemas_service`.`transportation_cost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schemas_service`.`transportation_cost` ;

CREATE TABLE IF NOT EXISTS `schemas_service`.`transportation_cost` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `schema_id` INT NOT NULL,
  `from_station_id` INT NOT NULL,
  `to_station_id` INT NOT NULL,
  `cost` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_transportation_cost_schema1`
    FOREIGN KEY (`schema_id`)
    REFERENCES `schemas_service`.`schema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_from_workstation`
    FOREIGN KEY (`from_station_id`)
    REFERENCES `schemas_service`.`workstation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_workstation`
    FOREIGN KEY (`to_station_id`)
    REFERENCES `schemas_service`.`workstation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_transportation_cost_schema1_idx` ON `schemas_service`.`transportation_cost` (`schema_id` ASC) VISIBLE;

CREATE INDEX `fk_from_workstation_idx` ON `schemas_service`.`transportation_cost` (`from_station_id` ASC) VISIBLE;

CREATE INDEX `fk_to_workstation_idx` ON `schemas_service`.`transportation_cost` (`to_station_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
