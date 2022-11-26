-- Title ContactCare
-- User George Claridge
-- Version 3

--DROP TABLE Contact
--DROP TABLE Advice
--DROP TABLE Contacter
--DROP TABLE Patient
--DROP TABLE Carer
--DROP TABLE Worker


CREATE DATABASE  ContactCare;
GO

USE ContactCare;
GO

CREATE TABLE Advice(
AdviceID SMALLINT PRIMARY KEY,
AdviceGiven TEXT,
AdviceTaken TEXT,
);

-- LOAD TEST DATA INTO THE TABLE Advice
insert into Advice values
(1,'Do this','Did This'),
(2,'Dont do that','Did it'),
(3,'Listen to this','Listend');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Advice;
GO

CREATE TABLE Contacter(
ContacterID SMALLINT PRIMARY KEY,
ContacterFirstName VARCHAR(15),
ContacterLastName VARCHAR(15),
ContacterPhone VARCHAR(15),
);

-- LOAD TEST DATA INTO THE TABLE Contacter
insert into Contacter values
(1,'Simon', 'Frampton','0271111111'),
(2,'Peri', 'Duffy','0271111111'),
(3,'Steve', 'Renison','0271111111'),
(4,'Ian', 'Davidson','0271111111'),
(5,'Frank', 'Miles','0271111111')

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Contacter;
GO

CREATE TABLE Carer(
CarerID SMALLINT PRIMARY KEY,
CarerFirstName VARCHAR(15),
CarerLastName VARCHAR(15),
CarerPhone VARCHAR(15),
);

-- LOAD TEST DATA INTO THE TABLE Carer
insert into Carer values
(1,'Caleb', 'Kody','0271111111'),
(2,'Lainey', 'Landyn','0271111111'),
(3,'Burton','Cooper','0271111111'),
(4,'Louie','Turner','0271111111'),
(5,'Evan','Bell','0271111111'),
(6,'Toby','Landen','0271111111');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Carer;
GO

CREATE TABLE Patient(
PatientID SMALLINT PRIMARY KEY,
CarerID SMALLINT
Foreign Key (CarerID) references Carer (CarerID),
PatientFirstName VARCHAR(15),
PatientLastName VARCHAR(15),
PatientPhone VARCHAR(15),
DOB DATE,
PatientAddress VARCHAR(15),
PatientCity VARCHAR(15),
PatientPostCode VARCHAR(4)
);

-- LOAD TEST DATA INTO THE TABLE Patient
insert into Patient values
(1,1,'Marnie', 'Cayley','0271111111','1964-5-18','18 Daniel Street','Christchurch','7873'),
(2,2,'Sharyl', 'Bethel','0271111111','1982-12-17','14 Nobel Road','Auckland','8014'),
(3,3,'Cameron', 'Marshall','0271111111','1993-8-16','5 Baker Road','Wellington','6014'),
(4,4,'Daniel', 'Chris','0271111111','1995-5-12','3 Brendon Street','Christchurch','7874')

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Patient;
GO

CREATE TABLE Worker(
WorkerID SMALLINT PRIMARY KEY,
WorkerFirstName VARCHAR(15),
WorkerLastName VARCHAR(15),
WorkerPhone VARCHAR(20),
);

-- LOAD TEST DATA INTO THE TABLE Patient
insert into Worker values
(1,'Dale','Rody','0271111111'),
(2,'Brian' ,'Brain','0271111111'),
(3,'Edward' ,'Taylor','0271111111'),
(4,'Nicolas' ,'Mason','0271111111')
(5,'Brendon' ,'Baker','0271111111') 

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Worker;
GO

CREATE TABLE Contact(
ContactID SMALLINT PRIMARY KEY,
PatientID SMALLINT,
Foreign Key (PatientID) references Patient (PatientID),
CarerID SMALLINT
Foreign Key (CarerID) references Carer (CarerID),
WorkerID SMALLINT
Foreign Key (WorkerID) references Worker (WorkerID),
AdviceID SMALLINT
Foreign Key (AdviceID) references Advice (AdviceID),
DateOfContact DATE,
ContacterID SMALLINT
Foreign Key (ContacterID) references Contacter (ContacterID),
ContactMethod VARCHAR(15)
);

-- LOAD TEST DATA INTO THE TABLE Contact
insert into Contact values
(1,1,1,1,1,'2018-5-17',1,'E-Mail'),
(2,2,2,1,2,'2021-8-13',2,'Phone'),
(3,1,2,2,3,'2021-7-13',2,'E-Mail'),
(4,3,3,3,4,'2021-9-15',2,'Phone'),
(5,4,4,4,5,'2021-10-12',2,'E-Mail')

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Contact;
GO
