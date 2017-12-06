*****************************************************
CPE 365                                 Alex Dekhtyar
Cal Poly		  		  Computer Science Department
San Luis Obispo                College of Engineering
California                   dekhtyar@csc.calpoly.edu
*****************************************************
		  		NPPES DATASET
                   Version 1.0
                December 05, 2017
*****************************************************
Sources:  list of all registered health care providers
          http://download.cms.gov/nppes/NPI_Files.html
          
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


     - countryCodes.txt     		 			: list of countries
     - deactivationReasonRef.txt   	 			: list of deactivation reasons
     - entityTypeCodeRef.txt    				: list of entity types
     - otherProviderIdentifiersIssuerCode.txt	: list of identifier issuers
	 - otherProvNameTypeCds.txt		 			: list of name types
	 - Provider.txt	     						: list of healthcare providers
	 - ProviderAddress.txt		 			    : list of healthcare providers' addresses
	 - ProviderLicense.txt		 				: list of healthcare providers' licenses 
	 - ProviderName.txt		 					: list of healthcare providers' names
	 - ProviderOtherId.txt		 				: list of healthcare providers' alt. Ids
	 - stateCodes.txt		 					: list of states
	 
	 
 Individual files have the following formats.

**************************************************************************

countryCodes.txt

	countryCode : unique identifier
	countryName : name of country


**************************************************************************

deactivationReasonRef.txt

	reasonCode : Unique Identifier
	reasonDescritpion : description of reason		

**************************************************************************

entityTypeCodeRef.txt

	typeCode 		: unique identifier
	typeDescription : description of entity type 

**************************************************************************

otherProviderIssuerCode.txt

	otherProviderTypeCode		 : unique identifier
	otherProviderTypeDescription : description of provider type

**************************************************************************
**************************************************************************

otherProvNameTypeCds.txt

	nameTypeCode		: unique identifier
	nameTypeDescription : name type description

**************************************************************************
**************************************************************************

provider.txt

	npi					 	: unique provider identitifier
	entityTypeCode		 	: type of provider
	replacementNpi		 	: replacement identifier
	employerIdNum		 	: Employer Identification Number (EIN)
	orgName				 	: name of organization
	otherOrgName		 	: alternate organization name
	otherOrgNameTypeCode 	: type of organization
	providerEnumDate	 	: Provider Enumeration Date
	lastUpdateDate		 	: date last time provider info was updated
	npiDeactivateReasonCode : reason provider was deactivated
	npiDeactivateDate		: date when provider was deactivated
	npiReactivateDate		: date when provider re-registered
	providerGenderCode		: provider gender
	authOffLastName			: authorized official last name
	authOffFirstName		: authorized official first name
	authOffMiddleName		: authorized official middle name
	authOffTitleOrPosition	: authorized official title or position name
	authOffPhoneNumber		: authorized official phone number name
	isSoleProprietor		: is the sole proprieter
	isOrgSubpart			: is part of an organization
	parentOrgLBN			: Provider Organization Subpart Legal Business Name
	parentOrgTIN			: Provider Organization Subpart TIN
	authOffNamePrefix		: Authorized Official Name Prefix Text
	authOffNameSuffix		: Authorized Official Name Suffix Text
	authOffCredText			: Authorized Official Credential Text

**************************************************************************
**************************************************************************

ProviderAddress.txt

	npi				: provider unique identifier
	addrType		: type of address (practice, mailing)
	firstLine		: first line of address
	secondLine		: second line of address
	city			: city
	state			: state
	postCode		: postal code
	country			: country 
	telephoneNumber	: phone number associated with address
	faxNumber		: fax number associated with address
	
**************************************************************************
**************************************************************************

ProviderLicense.txt
	
	npi						: provider unique identifier
	taxonmyCode				: specialty code
	licenseNum				: state medical license
	licenseNumberStateCode	: state provider is licensed in
	primaryTaxonomySwitch	: specialty listed is primary specialty
	
**************************************************************************
**************************************************************************

ProviderName.txt

	npi 			 : provider unique identifier
	nameType		 : name type
	lastName		 : last name of provider
	firstName		 : first name of provider
	middleName		 : middle name of provider
	namePrefix		 : name prefix of provider
	nameSuffix		 : name suffix of provider
	credentails		 : credentials of provider
	lastNameTypeCode : last name type
	
**************************************************************************
**************************************************************************

ProviderOtherId.txt

	npi		 : provider unique identifier
	id		 : alternative identifier for provider
	typeCode : type of identifier
	State	 : state identifier was issued in
	issuer	 : the entity that organization

	
**************************************************************************
**************************************************************************

stateCodes.txt
	
	stateCode	: Unique Identifier
	stateName	: States name
	stateType	: Is it a state or terratory
	
	
**************************************************************************
**************************************************************************

Permission granted to use and distribute this dataset in its current form,
provided this file  is kept unchanged and is distributed together with the
data.

Permission granted to modify and expand this dataset, provided this
file is updated accordingly with new information.

**************************************************************************
**************************************************************************

