-- MySQL Workbench Synchronization
-- Generated: 2017-11-30 22:10
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Christopher Gaydosh

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `nppes` DEFAULT CHARACTER SET utf8 ;

DROP TABLE IF EXISTS `nppes`.`countryCodeRef`;

CREATE TABLE IF NOT EXISTS `nppes`.`countryCodeRef` (
  `countryCode` CHAR(2) NOT NULL,
  `countryName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`countryCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`deactivationReasonRef`;
CREATE TABLE IF NOT EXISTS `nppes`.`deactivationReasonRef` (
  `npiDeactivateReasonCode` VARCHAR(4) NOT NULL,
  `deactivateReasonDescription` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`npiDeactivateReasonCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`entityTypeCodeRef`;
CREATE TABLE IF NOT EXISTS `nppes`.`entityTypeCodeRef` (
  `entityTypeCode` VARCHAR(3) NOT NULL,
  `entityTypeDescription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`entityTypeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`otherProviderIdentifierIssuerCode`;
CREATE TABLE IF NOT EXISTS `nppes`.`otherProviderIdentifierIssuerCode` (
  `typeCode` CHAR(2) NOT NULL,
  `typeDescription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`typeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`provider`;
CREATE TABLE IF NOT EXISTS `nppes`.`provider` (
  `NPI` INT(11) NOT NULL,
  `entityTypeCode` VARCHAR(3) NULL DEFAULT NULL,
  `replacementNpi` VARCHAR(16) NULL DEFAULT NULL,
  `employerIdNum` VARCHAR(11) NULL DEFAULT NULL,
  `orgName` VARCHAR(72) NULL DEFAULT NULL,
  `otherOrgName` VARCHAR(72) NULL DEFAULT NULL,
  `otherOrgNameTypeCode` VARCHAR(3) NULL DEFAULT NULL,
  `providerEnumDate` DATE NULL DEFAULT NULL,
  `lastUpdateDate` DATE NULL DEFAULT NULL,
  `npiDeactivateReasonCode` VARCHAR(4) NULL DEFAULT NULL,
  `npiDeactivateDate` DATE NULL DEFAULT NULL,
  `npiReactivateDate` DATE NULL DEFAULT NULL,
  `providerGenderCode` VARCHAR(7) NULL DEFAULT NULL,
  `authOffLastName` VARCHAR(72) NULL DEFAULT NULL,
  `authOffFirstName` VARCHAR(22) NULL DEFAULT NULL,
  `authOffMiddleName` VARCHAR(22) NULL DEFAULT NULL,
  `authOffTitleOrPosition` VARCHAR(37) NULL DEFAULT NULL,
  `authOffPhoneNumber` VARCHAR(22) NULL DEFAULT NULL,
  `isSoleProprietor` VARCHAR(3) NULL DEFAULT NULL,
  `isOrgSubpart` VARCHAR(3) NULL DEFAULT NULL,
  `parentOrgLBN` VARCHAR(72) NULL DEFAULT NULL,
  `parentOrgTIN` VARCHAR(11) NULL DEFAULT NULL,
  `authOffNamePrefix` VARCHAR(7) NULL DEFAULT NULL,
  `authOffNameSuffix` VARCHAR(7) NULL DEFAULT NULL,
  `authOffCredText` VARCHAR(22) NULL DEFAULT NULL,
  PRIMARY KEY (`NPI`),
  INDEX `fk_provider_entitytypecoderef1_idx` (`entityTypeCode` ASC),
  INDEX `fk_provider_deactivationreasonref1_idx` (`npiDeactivateReasonCode` ASC),
  CONSTRAINT `fk_provider_deactivationReasonRef1`
    FOREIGN KEY (`npiDeactivateReasonCode`)
    REFERENCES `nppes`.`deactivationReasonRef` (`npiDeactivateReasonCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_provider_entityTypeCodeRef1`
    FOREIGN KEY (`entityTypeCode`)
    REFERENCES `nppes`.`entityTypeCodeRef` (`entityTypeCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`providerAddress`;
CREATE TABLE IF NOT EXISTS `nppes`.`providerAddress` (
  `npi` INT(11) NOT NULL,
  `addrType` varchar(64) NOT NULL,
  `firstLine` VARCHAR(128) NULL DEFAULT NULL,
  `secondLine` VARCHAR(128) NULL DEFAULT NULL,
  `city` VARCHAR(32) NULL DEFAULT NULL,
  `state` VARCHAR(16) NULL DEFAULT NULL,
  `postCode` VARCHAR(16) NULL DEFAULT NULL,
  `country` CHAR(2) NULL DEFAULT NULL,
  `telephoneNumber` VARCHAR(16) NULL DEFAULT NULL,
  `faxNumber` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`addrType`, `npi`),
  INDEX `fk_providerAddress_stateCodeRef1_idx` (`state` ASC),
  INDEX `fk_providerAddress_countryCodesRef1_idx` (`country` ASC),
  INDEX `fk_NPI_providerAddress` (`npi` ASC),
  CONSTRAINT `fk_NPI_providerAddress`
    FOREIGN KEY (`npi`)
    REFERENCES `nppes`.`provider` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_providerAddress`
    FOREIGN KEY (`country`)
    REFERENCES `nppes`.`countryCodeRef` (`countryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_providerAddress`
    FOREIGN KEY (`state`)
    REFERENCES `nppes`.`stateCodeRef` (`stateCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`providerLicense`;
CREATE TABLE IF NOT EXISTS `nppes`.`providerLicense` (
  `npi` INT(11) NOT NULL,
  `taxonmyCode` VARCHAR(16) NULL DEFAULT NULL,
  `licenseNum` VARCHAR(24) NOT NULL,
  `licenseNumberStateCode` CHAR(2) NOT NULL,
  `primaryTaxonomySwitch` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`licenseNum`, `npi`, `licenseNumberStateCode`),
  INDEX `fk_NPI_providerLicense` (`npi` ASC),
  CONSTRAINT `fk_NPI_providerLicense`
    FOREIGN KEY (`npi`)
    REFERENCES `nppes`.`provider` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`providerName`;
CREATE TABLE IF NOT EXISTS `nppes`.`providerName` (
  `npi` INT(11) NOT NULL,
  `nameType` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(64) NULL DEFAULT NULL,
  `firstName` VARCHAR(64) NULL DEFAULT NULL,
  `middleName` VARCHAR(45) NULL DEFAULT NULL,
  `namePrefix` VARCHAR(16) NULL DEFAULT NULL,
  `nameSuffix` VARCHAR(16) NULL DEFAULT NULL,
  `credentials` VARCHAR(16) NULL DEFAULT NULL,
  `lastNameTypeCode` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`nameType`, `npi`),
  INDEX `fk_providerName_providerNameTypeRef1_idx` (`lastNameTypeCode` ASC),
  INDEX `npi_UNIQUE` (`npi` ASC),
  CONSTRAINT `fk_NPI_providerName`
    FOREIGN KEY (`npi`)
    REFERENCES `nppes`.`provider` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lastNameTypeCode_providernametyperef`
    FOREIGN KEY (`lastNameTypeCode`)
    REFERENCES `nppes`.`providerNameTypeRef` (`nameTypeCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`providerNameTypeRef`;
CREATE TABLE IF NOT EXISTS `nppes`.`providerNameTypeRef` (
  `nameTypeCode` VARCHAR(8) NOT NULL,
  `nameTypeDescription` VARCHAR(45) NULL DEFAULT NULL,
  `entityNameType` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`nameTypeCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`providerOtherId`;
CREATE TABLE IF NOT EXISTS `nppes`.`providerOtherId` (
  `npi` INT(11) NOT NULL,
  `id` VARCHAR(32) NULL DEFAULT NULL,
  `typeCode` CHAR(2) NULL DEFAULT NULL,
  `State` CHAR(2) NULL DEFAULT NULL,
  `issuer` VARCHAR(128) NULL DEFAULT NULL,
  INDEX `fk_NPI_providerOtherId` (`npi` ASC),
  INDEX `fk_typeCode_otherProviderIdentifiersIssuerCode` (`typeCode` ASC),
  CONSTRAINT `fk_NPI_providerOtherId`
    FOREIGN KEY (`npi`)
    REFERENCES `nppes`.`provider` (`NPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_typeCode_otherProviderIdentifiersIssuerCode`
    FOREIGN KEY (`typeCode`)
    REFERENCES `nppes`.`otherProviderIdentifierIssuerCode` (`typeCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `nppes`.`stateCodeRef`;
CREATE TABLE IF NOT EXISTS `nppes`.`stateCodeRef` (
  `stateCode` VARCHAR(16) NOT NULL,
  `stateName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`stateCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
