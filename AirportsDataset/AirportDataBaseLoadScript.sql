delete from airports.airport_frequencies;
delete from airports.navaids;
delete from airports.runways;
delete from airports.airport;
delete from airports.regions;
delete from airports.countries;

LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportCountry.csv"
INTO TABLE airports.countries
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.countries;

LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportRegions.csv"
INTO TABLE airports.regions
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.regions;

LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportAirports.csv"
INTO TABLE airports.airport
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.airport;

LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportFrequencies.csv"
INTO TABLE airports.airport_frequencies
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.airport_frequencies;


LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportNavaids.csv"
INTO TABLE airports.navaids
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.navaids;


LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/airportsRunway.csv"
INTO TABLE airports.runways
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.runways;

delete from airports.planes;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/AirportsDataset/preppedForLoad-PlaneSpecs.csv"
INTO TABLE airports.planes
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from airports.planes

