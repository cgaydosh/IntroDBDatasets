-- MySQL Script generated by MySQL Workbench
-- Sun Dec  3 21:22:16 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema airports
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airports
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airports` DEFAULT CHARACTER SET utf8 ;
USE `airports` ;

-- -----------------------------------------------------
-- Table `airports`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`countries` (
  `id` INT(11) NOT NULL,
  `code` VARCHAR(8) NOT NULL,
  `name` VARCHAR(64) NULL DEFAULT NULL,
  `continent` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`regions` (
  `id` INT(11) NOT NULL,
  `code` VARCHAR(16) NOT NULL,
  `local_code` VARCHAR(8) NULL DEFAULT NULL,
  `name` VARCHAR(64) NULL DEFAULT NULL,
  `continent` VARCHAR(4) NULL,
  `iso_country` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC),
  INDEX `fk_countries_iso_country_idx` (`iso_country` ASC),
  CONSTRAINT `fk_countries_iso_country`
    FOREIGN KEY (`iso_country`)
    REFERENCES `airports`.`countries` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`airport` (
  `id` INT(11) NOT NULL,
  `ident` VARCHAR(8) NOT NULL,
  `type` VARCHAR(32) NULL DEFAULT NULL,
  `name` VARCHAR(128) NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  `elevation` INT(11) NULL DEFAULT NULL,
  `isoCountry` VARCHAR(8) NULL DEFAULT NULL,
  `isoRegion` VARCHAR(16) NULL DEFAULT NULL,
  `municipality` VARCHAR(32) NULL DEFAULT NULL,
  `scheduledService` VARCHAR(8) NULL DEFAULT NULL,
  `gps_code` VARCHAR(8) NULL DEFAULT NULL,
  `localCode` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `country_ISO_idx` (`isoCountry` ASC),
  INDEX `region_ISO_idx` (`isoRegion` ASC),
  UNIQUE INDEX `ident_UNIQUE` (`ident` ASC),
  CONSTRAINT `country_ISO`
    FOREIGN KEY (`isoCountry`)
    REFERENCES `airports`.`countries` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `region_ISO`
    FOREIGN KEY (`isoRegion`)
    REFERENCES `airports`.`regions` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`airport_frequencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`airport_frequencies` (
  `id` INT(11) NOT NULL,
  `airportRef` INT(11) NOT NULL,
  `airportIdent` VARCHAR(16) NULL DEFAULT NULL,
  `type` VARCHAR(16) NULL DEFAULT NULL,
  `description` VARCHAR(64) NULL DEFAULT NULL,
  `frequency` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`navaids`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`navaids` (
  `id` INT(11) NOT NULL,
  `ident` VARCHAR(8) NULL,
  `name` VARCHAR(128) NULL DEFAULT NULL,
  `type` VARCHAR(8) NULL DEFAULT NULL,
  `frequency_khz` INT(11) NULL DEFAULT NULL,
  `latitude_deg` DOUBLE NULL DEFAULT NULL,
  `longitude_deg` DOUBLE NULL DEFAULT NULL,
  `elevation_ft` INT(11) NULL DEFAULT NULL,
  `iso_country` VARCHAR(4) NULL DEFAULT NULL,
  `magnetic_variation_deg` DOUBLE NULL DEFAULT NULL,
  `usageType` VARCHAR(8) NULL DEFAULT NULL,
  `power` VARCHAR(8) NULL DEFAULT NULL,
  `associated_airport` VARCHAR(8) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_airport_ident_idx` (`associated_airport` ASC),
  INDEX `fk_countries_isoCountry_idx` (`iso_country` ASC),
  CONSTRAINT `fk_countries_isoCountry`
    FOREIGN KEY (`iso_country`)
    REFERENCES `airports`.`countries` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`planes` (
  `Manufacturer` VARCHAR(64) NULL DEFAULT NULL,
  `Model` VARCHAR(128) NULL DEFAULT NULL,
  `engineType` VARCHAR(32) NULL DEFAULT NULL,
  `pwrEachEngine` INT(11) NULL DEFAULT NULL,
  `maxSpeed` INT(11) NULL DEFAULT NULL,
  `cruiseSpeed` INT(11) NULL DEFAULT NULL,
  `stallSpeedDirty` INT(11) NULL DEFAULT NULL,
  `fuelWeight` INT(11) NULL DEFAULT NULL,
  `serviceCeiling` INT(11) NULL DEFAULT NULL,
  `rateOfClimb` INT(11) NULL DEFAULT NULL,
  `takeoffOver50ft` INT(11) NULL DEFAULT NULL,
  `takeoffGroundRun` INT(11) NULL DEFAULT NULL,
  `landingOver50ft` INT(11) NULL DEFAULT NULL,
  `landingGroundRoll` INT(11) NULL DEFAULT NULL,
  `grossWeight` INT(11) NULL DEFAULT NULL,
  `emptyWeight` INT(11) NULL DEFAULT NULL,
  `length` VARCHAR(16) NULL DEFAULT NULL,
  `height` VARCHAR(16) NULL DEFAULT NULL,
  `wingSpan` VARCHAR(16) NULL DEFAULT NULL,
  `Range_NM` INT(11) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airports`.`runways`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airports`.`runways` (
  `id` INT(11) NOT NULL,
  `airportReference` INT(11) NOT NULL,
  `airportIdentifier` VARCHAR(8) NOT NULL,
  `length` INT(11) NULL DEFAULT NULL,
  `width` INT(11) NULL DEFAULT NULL,
  `surfaceType` VARCHAR(32) NULL DEFAULT NULL,
  `lighted` TINYINT(1) NULL DEFAULT NULL,
  `closed` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_runways_airport1`
    FOREIGN KEY (`airportIdentifier`)
    REFERENCES `airports`.`airport` (`ident`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
