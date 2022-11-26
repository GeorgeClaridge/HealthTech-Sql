-- Queries ContactCare
-- User George Claridge
USE ContactCare;
GO

--Query All Patient information
SELECT CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName,[PatientPhone],[DOB]
FROM [dbo].[Patient]
WHERE [PatientFirstName] = 'Marnie' and [PatientLastName] = 'Cayley';
GO

--Query All Worker information
Select CONCAT([WorkerFirstName], ' ', [WorkerLastName]) AS WorkerName,[WorkerPhone]
FROM [dbo].[Worker]
WHERE [WorkerFirstName] = 'Dale' and [WorkerLastName] = 'Rody';
GO

--Query All Contacter information
Select CONCAT([ContacterFirstName], ' ', [ContacterLastName]) AS ContacterName,[ContacterPhone]
FROM [dbo].[Contacter]
WHERE [ContacterFirstName] = 'Simon' and [ContacterLastName] = 'Frampton';
GO

Select *
FROM [dbo].[Contacter]
GO

--Query How many Patients
SELECT COUNT([PatientID]) AS PatientTotals
FROM [dbo].[Patient]
GO

--Query How many Contacters
SELECT COUNT([ContacterID]) AS ContacterTotals
FROM [dbo].[Contacter]
GO

--Query How many Workers
SELECT COUNT([WorkerID]) AS WorkerTotals
FROM [dbo].[Worker]
GO

--Query List Of Workers
SELECT [WorkerFirstName], [WorkerLastName]
FROM [dbo].[Worker]
GO

--Query List Of Patients
SELECT [PatientFirstName], [PatientLastName]
FROM [dbo].[Patient]
GO

--Query List Of Contacters
SELECT [ContacterFirstName], [ContacterLastName]
FROM [dbo].[Contacter]
GO

--How Many Contacts Have They Done 
SELECT COUNT([ContactID]) AS ContactTotals
FROM [dbo].[Contact]
GO

--Query People involved for Point of Contact on Marnie Cayley
SELECT [DateOfContact], CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName, CONCAT([ContacterFirstName], ' ', [ContacterLastName]) AS ContacterName,CONCAT([CarerFirstName], ' ', [CarerLastName]) AS CarerName
FROM [dbo].[Contact] INNER JOIN [dbo].[Patient] ON [dbo].[Contact].[PatientID] = [dbo].[Patient].[PatientID]
INNER JOIN [dbo].[Contacter] ON [dbo].[Contact].[ContacterID] = [dbo].[Contacter].[ContacterID]
INNER JOIN [dbo].[Carer] ON [dbo].[Contact].[CarerID] = [dbo].[Carer].[CarerID]
GO

--Query Workers Point of contacts
SELECT CONCAT([WorkerFirstName], ' ', [WorkerLastName]) AS PatientName, [DateOfContact]
FROM [dbo].[Worker] INNER JOIN [dbo].[Contact] ON [dbo].[Worker].[WorkerID] = [dbo].[Contact].[WorkerID]
WHERE [WorkerFirstName] = 'Dale'
GO

--Query Advice Given and Taken
SELECT [DateOfContact],[AdviceGiven],[AdviceTaken]
FROM [dbo].[Advice] INNER JOIN [dbo].[Contact] ON [dbo].[Advice].[AdviceID] = [dbo].[Contact].[AdviceID]
GO

--Query How many contacts has a worker done
SELECT [WorkerFirstName] , Count([ContactID]) as AmountOfContacts
FROM [dbo].[Worker] INNER JOIN [dbo].[Contact] ON [dbo].[Worker].[WorkerID] = [dbo].[Contact].[WorkerID]
Group by [WorkerFirstName]
GO

--Query Who cares for a patient
SELECT CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName, CONCAT([CarerFirstName], ' ', [CarerLastName]) AS CarerName
FROM [dbo].[Patient] INNER JOIN [dbo].[Carer] ON [dbo].[Carer].CarerID = [dbo].[Patient].CarerID
GO 

--Query Where Patient lives
SELECT CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName, CONCAT([PatientAddress], ' ', [PatientCity], ' ',[PatientPostCode]) AS PatientFullAddress
FROM [dbo].[Patient]
WHERE [PatientFirstName] = 'Marnie' and [PatientLastName] = 'Cayley';
GO