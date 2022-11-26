-- Queries ContactCare
-- User George Claridge
USE ContactCare;
GO

--Query All Patient information
SELECT CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName,[PatientPhone],[DOB]
FROM [dbo].[Patient]
WHERE [PatientFirstName] = 'Marnie' and [PatientLastName] = 'Cayley';
GO

--Query How many patients
SELECT COUNT([PatientID]) AS PatientTotals
FROM [dbo].[Patient]
GO

--Query People involved for Point of Contact on Marnie Cayley
SELECT [DateOfContact], CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName, CONCAT([ContacterFirstName], ' ', [ContacterLastName]) AS ContacterName,CONCAT([CarerFirstName], ' ', [CarerLastName]) AS CarerName
FROM [dbo].[Contact] INNER JOIN [dbo].[Patient] ON [dbo].[Contact].[PatientID] = [dbo].[Patient].[PatientID]
INNER JOIN [dbo].[Contacter] ON [dbo].[Contact].[ContacterID] = [dbo].[Contacter].[ContacterID]
INNER JOIN [dbo].[Carer] ON [dbo].[Contact].[CarerID] = [dbo].[Carer].[CarerID]
GO

--Query Workers Point of contacts
Select CONCAT([WorkerFirstName], ' ', [WorkerLastName]) AS PatientName, [DateOfContact]
FROM [dbo].[Worker] INNER JOIN [dbo].[Contact] ON [dbo].[Worker].[WorkerID] = [dbo].[Contact].[WorkerID]
WHERE [WorkerFirstName] = 'Dale'
GO

--Query Advice Given and Taken
Select [DateOfContact],[AdviceGiven],[AdviceTaken]
FROM [dbo].[Advice] INNER JOIN [dbo].[Contact] ON [dbo].[Advice].[AdviceID] = [dbo].[Contact].[AdviceID]
GO

--Query Workers Point of contacts
Select [WorkerFirstName] , Count([ContactID]) as AmountOfContacts
FROM [dbo].[Worker] INNER JOIN [dbo].[Contact] ON [dbo].[Worker].[WorkerID] = [dbo].[Contact].[WorkerID]
Group by [WorkerFirstName]
GO

