delete from taxis.trip_paymentType;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxiPaymentType.csv"
INTO TABLE taxis.trip_paymentType
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.trip_rateCode;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxiRateCodes.csv"
INTO TABLE taxis.trip_rateCode
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.base;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_bases.csv"
INTO TABLE taxis.base
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.driver;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_drivers.csv"
INTO TABLE taxis.driver
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.trip_location;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_Trip_Locations.csv"
INTO TABLE taxis.trip_location
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.trip_cost;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_trip_cost.csv"
INTO TABLE taxis.trip_cost
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.vehicle;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_vehicles.csv"
INTO TABLE taxis.vehicle
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

delete from taxis.trip_data;
LOAD DATA LOCAL INFILE "/Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/taxi_trip_data.csv"
INTO TABLE taxis.trip_data
COLUMNS TERMINATED BY '|'
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES;