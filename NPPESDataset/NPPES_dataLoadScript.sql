delete from nppes.providerOtherId;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/ProviderOtherId.txt' 
INTO TABLE nppes.providerOtherId
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.entityTypeCodeRef;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/entityTypeCodeRef.txt' 
INTO TABLE nppes.entityTypeCodeRef 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.deactivationReasonRef;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/deactivationReasonRef.txt' 
INTO TABLE nppes.deactivationReasonRef 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.provider;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/Provider.txt' 
INTO TABLE nppes.Provider 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


delete from nppes.providerName;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/ProviderName.txt' 
INTO TABLE nppes.providerName
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.providerAddress;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/ProviderAddress.txt' 
INTO TABLE nppes.providerAddress
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.countryCodeRef;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/countryCodes.txt' 
INTO TABLE nppes.countryCodeRef 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.otherProviderIdentifierIssuerCode;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/otherProviderIdentifierIssuerCode.txt' 
INTO TABLE nppes.otherProviderIdentifierIssuerCode 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.providerNameTypeRef;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/otherProvNameTypeCds.txt' 
INTO TABLE nppes.providerNameTypeRef 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.stateCodeRef;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/stateCodes.txt' 
INTO TABLE nppes.stateCodeRef 
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from nppes.temp_providerLicense;
LOAD DATA LOCAL INFILE '/Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/ProviderLicense.txt' 
INTO TABLE nppes.temp_providerLicense
FIELDS TERMINATED BY '|' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

