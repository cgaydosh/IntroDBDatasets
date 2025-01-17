-- MySQL Script generated by MySQL Workbench
-- Wed Nov 15 08:22:34 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema taxis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taxis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taxis` DEFAULT CHARACTER SET utf8 ;
USE `taxis` ;

-- -----------------------------------------------------
-- Table `taxis`.`base`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`base` (
  `baseNumber` VARCHAR(16) NOT NULL,
  `Name` VARCHAR(64) NULL DEFAULT NULL,
  `AddressLine1` VARCHAR(64) NULL DEFAULT NULL,
  `City` VARCHAR(32) NULL DEFAULT NULL,
  `State` VARCHAR(4) NULL DEFAULT NULL,
  `zipCode` INT(11) NULL DEFAULT NULL,
  `phoneNumber` VARCHAR(16) NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`baseNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `taxis`.`driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`driver` (
  `licenseNumber` VARCHAR(16) NOT NULL,
  `name` VARCHAR(64) NULL DEFAULT NULL,
  `licenseType` VARCHAR(32) NOT NULL,
  `expirationDate` DATE NULL DEFAULT NULL,
  UNIQUE INDEX `idx_driver_licenseNumber_licenseType` (`licenseNumber` ASC, `licenseType` ASC),
  PRIMARY KEY (`licenseNumber`, `licenseType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `taxis`.`trip_cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`trip_cost` (
  `tripId` INT(11) NOT NULL,
  `storeAndFwdFlag` CHAR(1) NULL DEFAULT NULL,
  `rateCode` INT(11) NULL DEFAULT NULL,
  `fareAmount` DECIMAL(6,2) NULL DEFAULT NULL,
  `extra` DECIMAL(4,2) NULL DEFAULT NULL,
  `MTA_tax` DECIMAL(3,2) NULL DEFAULT NULL,
  `tipAmount` DECIMAL(6,2) NULL DEFAULT NULL,
  `tollsAmount` DECIMAL(5,2) NULL DEFAULT NULL,
  `totalAmount` DECIMAL(6,2) NULL DEFAULT NULL,
  `paymentType` INT(11) NULL DEFAULT NULL,
  `vendorId` INT(11) NULL DEFAULT NULL,
  `improvementSurcharge` DECIMAL(4,2) NULL DEFAULT NULL,
  PRIMARY KEY (`tripId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `taxis`.`trip_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`trip_location` (
  `locationId` INT(11) NOT NULL,
  `pickupLongitude` DOUBLE NULL DEFAULT NULL,
  `pickupLatitude` DOUBLE NULL DEFAULT NULL,
  `dropoffLongitude` DOUBLE NULL DEFAULT NULL,
  `dropOffLatitude` DOUBLE NULL DEFAULT NULL,
  UNIQUE INDEX `idx_trip_location_locationId` (`locationId` ASC),
  PRIMARY KEY (`locationId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `taxis`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`vehicle` (
  `licenseNumber` VARCHAR(16) NOT NULL,
  `registrantName` VARCHAR(64) NULL DEFAULT NULL,
  `licenseExpiration` DATE NULL DEFAULT NULL,
  `licensePlate` VARCHAR(16) NULL DEFAULT NULL,
  `vehicleId` VARCHAR(32) NULL DEFAULT NULL,
  `vehicleType` VARCHAR(8) NULL DEFAULT NULL,
  `modelYear` INT(11) NULL DEFAULT NULL,
  `baseNumber` VARCHAR(16) NULL DEFAULT NULL,
  UNIQUE INDEX `idx_vehicle_licenseNumber` (`licenseNumber` ASC),
  UNIQUE INDEX `idx_vehicle_vehicleId` (`vehicleId` ASC),
  PRIMARY KEY (`licenseNumber`),
  CONSTRAINT `fk_base_baseNumber`
    FOREIGN KEY ()
    REFERENCES `taxis`.`base` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `taxis`.`trip_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxis`.`trip_data` (
  `tripId` INT(11) NOT NULL,
  `driverId` VARCHAR(16) NULL DEFAULT NULL,
  `vehicleId` VARCHAR(32) NULL DEFAULT NULL,
  `locationId` INT(11) NULL DEFAULT NULL,
  `pickupDatetime` DATETIME NULL DEFAULT NULL,
  `dropoffDatetime` DATETIME NULL DEFAULT NULL,
  `passengerCount` INT(11) NULL DEFAULT NULL,
  `tripDistance` DOUBLE NULL DEFAULT NULL,
  `tripType` INT(11) NULL DEFAULT NULL,
  INDEX `idx_trip_data_driverId` (`driverId` ASC),
  INDEX `idx_trip_data_vehicleId` (`vehicleId` ASC),
  INDEX `idx_trip_data_locationId` (`locationId` ASC),
  PRIMARY KEY (`tripId`),
  CONSTRAINT `fk_trip_cost_tripId`
    FOREIGN KEY (`tripId`)
    REFERENCES `taxis`.`trip_cost` (`tripId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trip_location_locationId`
    FOREIGN KEY (`locationId`)
    REFERENCES `taxis`.`trip_location` (`locationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_vehicleId`
    FOREIGN KEY (`vehicleId`)
    REFERENCES `taxis`.`vehicle` (`licenseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_licenseNumber`
    FOREIGN KEY (`driverId`)
    REFERENCES `taxis`.`driver` (`licenseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
