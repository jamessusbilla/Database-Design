CREATE DATABASE AMS character set UTF8mb4 collate utf8mb4_bin;
USE AMS;
SET default_storage_engine = INNODB;
CREATE TABLE IF NOT EXISTS Doctor(
	doctorID varchar(6) not null PRIMARY KEY,
	dFirstName nvarchar(40) not null,
	dSurname nvarchar(40) not null,
	office nchar(5),
	address nvarchar(30),
	suburb varchar(15),
	city varchar(15),
	dob date not null
);

CREATE TABLE IF NOT EXISTS Contact(
	doctorID varchar(6),
	contactType ENUM('work-hours','after-hours'),
	phoneNumber varchar(12),
    INDEX(doctorID,phoneNumber)
);

CREATE TABLE IF NOT EXISTS Patient(
	patientID varchar(6) PRIMARY KEY,
	pFirstName nvarchar(40),
	pSurname nvarchar(40),
	roomNumber nchar(4),
	dob date
);

CREATE TABLE IF NOT EXISTS Relative(
	relativeID varchar(6) PRIMARY KEY,
	rFirstName nvarchar(40),
	rSurname nvarchar(40),
	rAddress nvarchar(30),
	rSuburb varchar(15),
	rCity varchar(15),
	contact varchar(12)
);

CREATE TABLE IF NOT EXISTS Visitation(
	visitationID varchar(3) not null primary key,
	patientID varchar(6),
	relativeID varchar(6),
	visitTime timestamp,
	FOREIGN KEY(patientID) REFERENCES Patient(patientID),
	FOREIGN KEY(relativeID) REFERENCES Relative(relativeID)
);

CREATE TABLE IF NOT EXISTS MedicalService(
	servID nchar(3) not null PRIMARY KEY,
	servName varchar(40),
	servType varchar(25),
	servAddress nvarchar(30),
	servSuburb varchar(15),
	servCity varchar(15),
	servContact varchar(12)
);

CREATE TABLE IF NOT EXISTS MedicalRecord(
	conditionID varchar(3) not null PRIMARY KEY,
	medicalCondition varchar(20),
	servID nchar(3),
	FOREIGN KEY(servID) REFERENCES MedicalService(servID)
);

CREATE TABLE IF NOT EXISTS CheckUp(
	checkUpID int not null auto_increment PRIMARY KEY,
	patientID varchar(6),
	doctorID varchar(6),
	conditionID varchar(3),
	time timestamp,
	FOREIGN KEY(patientID) REFERENCES Patient(patientID),
	FOREIGN KEY(doctorID) REFERENCES Doctor(doctorID),	
	FOREIGN KEY(conditionID) REFERENCES MedicalRecord(conditionID)
);

CREATE TABLE IF NOT EXISTS Carer(
	carerID varchar(6) not null PRIMARY KEY,
	cFirstName nvarchar(40),
	cSurname nvarchar(40),
	cContact varchar(12),
	cAddress nvarchar(30),
	cSuburb varchar(15),
	cCity varchar(15),
	dob	date
);

CREATE TABLE IF NOT EXISTS CareLog(
	cLogID nchar(5) not null primary key,
	patientID varchar(6) not null,
	carerID varchar(6) not null,
	date date,
	startTime time,
	endTime time,
	FOREIGN KEY(patientID) REFERENCES Patient(patientID),
	FOREIGN KEY(carerID) REFERENCES Carer(carerID)
);

CREATE TABLE IF NOT EXISTS Activity(
	activityID nvarchar(3) not null PRIMARY KEY,
	activityDescription varchar(50)
);

CREATE TABLE IF NOT EXISTS Skill(
	companionID nchar(6),
	skill varchar(50),
    index(skill)
);

CREATE TABLE IF NOT EXISTS Companion(
	companionID varchar(6) not null PRIMARY KEY,
	firstName nvarchar(40),
	surname nvarchar(40),
	address nvarchar(30),
	suburb varchar(15),
	city varchar(15),
	dob date
);

CREATE TABLE IF NOT EXISTS ActivityLog(
	logID int not null auto_increment PRIMARY KEY,
	activityID nvarchar(3) not null,
	patientID varchar(6) not null,
	companionID varchar(6) not null,
	date date,
	startTime time,
	endTime time,
	FOREIGN KEY(activityID) REFERENCES Activity(activityID),
	FOREIGN KEY(patientID) REFERENCES Patient(patientID),
	FOREIGN KEY(companionID) REFERENCES Companion(companionID)
);

CREATE TABLE IF NOT EXISTS Consent(
	consentID varchar(6),
	consentTime timestamp,
	consentStatus enum('stopped', 'withdrawn', 'given'),
	index(consentID)
);


CREATE TABLE IF NOT EXISTS ConsentDocumentation
(
	consentID varchar(6),
    consentLocation nvarchar(150), -- Storing Link to document files
	consentType enum('written','online'),
    index(consentID,consentLocation)
);
