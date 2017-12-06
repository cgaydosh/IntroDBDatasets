*****************************************************
CPE 365                                 Alex Dekhtyar
Cal Poly		  		  Computer Science Department
San Luis Obispo                College of Engineering
California                   dekhtyar@csc.calpoly.edu
*****************************************************
		  		TAXIS DATASET
                   Version 1.0
                December 05, 2017
*****************************************************
Sources:  list of some green taxi trips from 2015
        https://data.cityofnewyork.us/Transportation/2015-Green-Taxi-Trip-Data/n4kn-dy2y
          
          list of medallion vehicles
     https://data.cityofnewyork.us/Transportation/Medallion-Vehicles-Authorized/rhe8-mgbb
     
     	  list of Street Hail Liverly permits
    https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Permits/yhuu-4pt3
          
          list of drivers that posses a Street Hail Liverly permit
	https://data.cityofnewyork.us/Transportation/Street-Hail-Livery-SHL-Drivers-Active/5tub-eh45
	
		  list of drivers that posses a medallion
	https://data.cityofnewyork.us/Transportation/Medallion-Drivers-Active/jb3k-j3gp
	
	      list of bases that have a medallion
	https://data.cityofnewyork.us/Transportation/Yellow-Medallion-Taxicabs-Agents/x9ia-3cjh
******************************************************

This file describes the contents of the NPPES dataset
developed for the CPE 365, Introduction to Databases,
course at Cal Poly.

The dataset contains information about some world airports,
navigational aids and communication frequencies.

General Conventions.

 1. All files in the dataset are pipe delimited (|) files.
 2. First line of each file provides the names of
    columns. Second line may be empty, or may contain
    the first row of the data.
 
  The dataset consists of the following files:


     - taxi_bases.csv     		: list of taxi bases
     - taxi_drivers.csv			: list of taxi drivers
     - taxi_trip_cost.csv   	: list of taxi fare bills
     - taxi_trip_data.csv 		: list of taxi fare data
	 - taxi_trip_locations.csv	: list of taxi fare pickups and drop-offs
	 - taxi_vehicles			: list of vehicles used as taxis
	 
 Individual files have the following formats.

**************************************************************************

taxi_bases.csv

	baseNumber	 : unique Identifier
	Name		 : name of base
	AddressLine1 : street address
	City		 : city
	State		 : state
	zipCode		 : zip code
	phoneNumber	 : phone number for the base
	latitude	 : latitude coordinate where base is located
	longitude	 : longitude coordinate where base is located


**************************************************************************

taxi_drivers.csv

	licenseNumber	: unique identifier for a driver
	name			: driver's name
	licenseType		: is this a medallion or SHL permit
	expirationDate	: when does the license expire

**************************************************************************

taxi_trip_costs.csv

	tripId				 : unique Identifier for trip
	storeAndFwdFlag		 : was the trip reported right away or at a later time
	rateCode			 : the rate the rider was charged
	fareAmount			 : fare amount accrued
	extra				 : any extra charges
	MTA_tax				 : a tax being levied on the riders for taking a taxi
	tipAmount			 : tip amount if using a credit card to pay with
	tollsAmount			 : any tolls that were incurred
	totalAmount			 : total amount paid
	paymentType			 : how did the rider pay
	vendorId			 : fare charge system used in taxi
	improvementSurcharge : surcharge levied on the rider
	
**************************************************************************

taxi_trip_data.csv

	tripId			: Unique identifier for trip
	driverId		: driver's id that drove the taxi
	vehicleId		: vehicle id that was driven in the trip
	locationId		: location id of pickup and drop-off of trip
	pickupDatetime	: time pickup occurred
	dropoffDatetime	: time drop-off occurred 
	passengerCount	: how many riders took the trip
	tripDistance	: how far was the trip
	tripType		: what kind of trip was taken

**************************************************************************
**************************************************************************

taxi_trip_location.csv

	locationId		 : unique identifier for pickups and drop-offs
	pickupLongitude	 : longitude coordinate for pickup
	pickupLatitude	 : latitude coordinate for pickup
	dropoffLongitude : longitude coordinate for drop-off
	dropOffLatitude	 : latitude coordinate for drop-off

**************************************************************************
**************************************************************************

taxi_vehicles.csv

	licenseNumber		: unique Identifier
	registrantName		: name the vehicle is registered under
	licenseExpiration	: when the plates expire
	licensePlate		: license plate number
	vehicleId			: VIN
	vehicleType			: type of vehicle
	modelYear			: year of vehicle manufacture
	baseNumber			: base identifier

**************************************************************************
**************************************************************************

Permission granted to use and distribute this dataset in its current form,
provided this file  is kept unchanged and is distributed together with the
data.

Permission granted to modify and expand this dataset, provided this
file is updated accordingly with new information.

**************************************************************************
**************************************************************************

