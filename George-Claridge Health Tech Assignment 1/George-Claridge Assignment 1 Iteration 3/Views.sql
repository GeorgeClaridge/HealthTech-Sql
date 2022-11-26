-- Views ContactCare
-- User George Claridge
USE ContactCare;
GO

--Views

--View All Patient information for role
CREATE VIEW V_Patient_Information
AS

SELECT CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName,[PatientPhone],[DOB]
FROM [dbo].[Patient]
WHERE [PatientFirstName] = 'Marnie' and [PatientLastName] = 'Cayley';
GO

--View Details about a point of Contact
CREATE VIEW V_Point_Contact
AS

--Query People involved for Point of Contact on Marnie Cayley
SELECT [DateOfContact], CONCAT([PatientFirstName], ' ', [PatientLastName]) AS PatientName, CONCAT([ContacterFirstName], ' ', [ContacterLastName]) AS ContacterName,CONCAT([CarerFirstName], ' ', [CarerLastName]) AS CarerName
FROM [dbo].[Contact] INNER JOIN [dbo].[Patient] ON [dbo].[Contact].[PatientID] = [dbo].[Patient].[PatientID]
INNER JOIN [dbo].[Contacter] ON [dbo].[Contact].[ContacterID] = [dbo].[Contacter].[ContacterID]
INNER JOIN [dbo].[Carer] ON [dbo].[Contact].[CarerID] = [dbo].[Carer].[CarerID]
WHERE [PatientFirstName] = 'Marnie' and [PatientLastName] = 'Cayley';
GO
