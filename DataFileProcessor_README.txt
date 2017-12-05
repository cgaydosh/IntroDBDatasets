README

This java application will take the data files and transform them into the format that the database is expecting.  This application expects the raw file names to be retained when it is looking for them.  The sample commands below contain the complete listing of files that are required to create the data for the beginner's databases.

This application will attempt to figure out what dataset you are handing it, but it is recommended that the dataSet parameter be used to ensure that the data is being processed properly.

Parameters:

-inputFile = the listing of files to be processed (pipe "|" delimited)
			 Full paths are required when listing files.
			 
-outputFilePath = The fully qualified directory that the output data files will be placed into

-dataSet (optional) = tells the application which dataset is being provided for processing.


Sample Commands for running Data processor (sometimes it throws an error with quotes, sometimes it doesn't if it throws an exception try without quotes or with depending on which case you already tried.)

-- NPPES dataset
java -jar DataFileProcessor.jar -inputFile /Users/Admin/Documents/SeniorProject/NPPESDataset/NPPES_Data_Dissemination_November_2017/npidata_20050523-20171112.csv -outputFilePath /Users/Admin/Documents/SeniorProject/NPPESDataset/NPPESData/ -dataSet NPPES

-- Taxi Trips dataset
java -jar DataFileProcessor.jar -inputFile /Users/Admin/Documents/SeniorProject/TaxiDataSet/SHL_Vehicles_-_TLC_Licensed_Bases_with_SHL_Endorsement.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/TLC_current_medallion_agents__geocoded_.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/Street_Hail_Livery__SHL__Permits.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/Medallion__Vehicles_-_Authorized.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/Street_Hail_Livery__SHL__Drivers_-_Active.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/current_medallion_drivers.csv|/Users/Admin/Documents/SeniorProject/TaxiDataSet/2015_Green_Taxi_Trip_Data.csv -outputFilePath /Users/Admin/Documents/SeniorProject/TaxiDataSet/taxiTripData/ -dataSet Taxi

-- Airports dataset
java -jar DataFileProcessor.jar -inputFile "/Users/Admin/Documents/SeniorProject/AirportsDataset/airport-frequencies.csv|/Users/Admin/Documents/SeniorProject/AirportsDataset/airports.csv|/Users/Admin/Documents/S	eniorProject/AirportsDataset/countries.csv|/Users/Admin/Documents/SeniorProject/AirportsDataset/navaids.csv|/Users/Admin/Documents/SeniorProject/AirportsDataset/regions.csv|/Users/Admin/Documents/SeniorProject/AirportsDataset/runways.csv|/Users/Admin/Documents/SeniorProject/AirportsDataset/preppedForLoad-PlaneSpecs.csv" -outputFilePath "/Users/Admin/Documents/SeniorProject/AirportsDataset/AirportsData/" -dataSet Airports
