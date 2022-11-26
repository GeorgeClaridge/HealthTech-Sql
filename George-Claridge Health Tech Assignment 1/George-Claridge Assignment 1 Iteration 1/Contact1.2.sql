-- Title ContactCare
-- User George Claridge
-- Version 1.2

DROP TABLE Advice
DROP TABLE Contacter
DROP TABLE Carer
DROP TABLE Patient
DROP TABLE Worker
DROP TABLE Contact

CREATE DATABASE  ContactCare;
GO

USE ContactCare;
GO

CREATE TABLE Advice(
AdviceID INT PRIMARY KEY,
AdviceGiven VARCHAR(130),
AdviceTaken VARCHAR(130),
);

-- LOAD TEST DATA INTO THE TABLE Advice
insert into Advice values
(1,'Simon Frampton','0271111111'),
(2,'Peri Duffy','0271111111'),
(3,'Steve Renison','0271111111');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Advice;
GO

CREATE TABLE Contacter(
ContacterID INT PRIMARY KEY,
ContacterFirstName VARCHAR(30),
ContacterLastName VARCHAR(30),
ContacterPhone VARCHAR(20),
);

-- LOAD TEST DATA INTO THE TABLE Contacter
insert into Contacter values
(1,'Simon', 'Frampton','0271111111'),
(2,'Peri', 'Duffy','0271111111'),
(3,'Steve', 'Renison','0271111111');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Contacter;
GO

CREATE TABLE Carer(
CarerID INT PRIMARY KEY,
CarerFirstName VARCHAR(30),
CarerLastName VARCHAR(30),
CarerPhone VARCHAR(20),
);

-- LOAD TEST DATA INTO THE TABLE Carer
insert into Carer values
(1,'Caleb', 'Kody','0271111111'),
(2,'Lainey', 'Landyn','0271111111'),
(3,'Burton','Cooper','0271111111');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Carer;
GO

CREATE TABLE Patient(
PatientID INT PRIMARY KEY,
CarerID INT
Foreign Key (CarerID) references Carer (CarerID),
PatientFirstName VARCHAR(30),
PatientLastName VARCHAR(30),
PatientPhone VARCHAR(20),
DOB DATE,
);

-- LOAD TEST DATA INTO THE TABLE Patient
insert into Patient values
(1,1,'Marnie', 'Cayley','0271111111','1964-5-18'),
(2,2,'Sharyl', 'Bethel','0271111111','1982-12-17')


-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Patient;
GO

CREATE TABLE Worker(
WorkerID INT PRIMARY KEY,
WorkerFirstName VARCHAR(30),
WorkerLastName VARCHAR(30),
WorkerPhone VARCHAR(20),
);

-- LOAD TEST DATA INTO THE TABLE Patient
insert into Worker values
(1,'Dale','Rody','0271111111'),
(2,'Brian' ,'Brain','0271111111')


-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Worker;
GO

CREATE TABLE Contact(
ContactID INT PRIMARY KEY,
PatientID INT,
Foreign Key (PatientID) references Patient (PatientID),
CarerID INT
Foreign Key (CarerID) references Carer (CarerID),
WorkerID INT
Foreign Key (WorkerID) references Worker (WorkerID),
AdviceID INT
Foreign Key (AdviceID) references Advice (AdviceID)
);

-- LOAD TEST DATA INTO THE TABLE Contact
insert into Contact values
(1,1,1,1,1),
(2,2,2,1,2)


-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Contact;
GO