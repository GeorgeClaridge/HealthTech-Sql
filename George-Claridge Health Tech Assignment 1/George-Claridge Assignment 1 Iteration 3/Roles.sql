USE ContactCare
GO
--CREATE LOGIN
CREATE LOGIN [New_Login] 
	WITH PASSWORD=N'N3wU$3r' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=ContactCare, 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO

--CREATE ROLE
CREATE ROLE Worker;
GO

--CREATE USER
CREATE USER Dale FOR LOGIN [New_Login]
GO

--ADD USER TO ROLE
ALTER ROLE [Worker] ADD MEMBER [Dale]
GO

--ADD ACCESS TO VIEWS AND DATABASE
GRANT SELECT ON [dbo].[Worker] TO [Worker]
GRANT SELECT ON [dbo].[Patient] TO [Worker]
GRANT SELECT ON [dbo].[Contacter] TO [Worker]
GRANT SELECT ON [dbo].[Contact] TO [Worker]
GRANT SELECT ON [dbo].[Carer] TO [Worker]
GRANT SELECT ON [dbo].[Advice] TO [Worker]
GO

--ADD ACCESS FOR WORKER TO UPDATE DATABASES
GRANT UPDATE ON [dbo].[Patient] TO [Worker]
GRANT UPDATE ON [dbo].[Contacter] TO [Worker]
GRANT UPDATE ON [dbo].[Carer] TO [Worker]
GRANT UPDATE ON [dbo].[Contact] TO [Worker]
GRANT UPDATE ON [dbo].[Advice] TO [Worker]

--ADD THE ABILTY TO INSERT NEW CONTACTS
GRANT INSERT ON [dbo].[Patient] TO [Worker]
GRANT INSERT ON [dbo].[Contacter] TO [Worker]
GRANT INSERT ON [dbo].[Carer] TO [Worker]
GRANT INSERT ON [dbo].[Contact] TO [Worker]
GRANT INSERT ON [dbo].[Advice] TO [Worker]

--ADD THE ABILITY TO DELET INFORMATION THEY WOULD NO LONGER NEED
GRANT DELETE ON [dbo].[Patient] TO [Worker]
GRANT DELETE ON [dbo].[Contacter] TO [Worker]
GRANT DELETE ON [dbo].[Carer] TO [Worker]
GRANT DELETE ON [dbo].[Contact] TO [Worker]
GRANT DELETE ON [dbo].[Advice] TO [Worker]

--Patient to view their own data
CREATE LOGIN [New_Patient] 
	WITH PASSWORD=N'N3wU$3r' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=ContactCare, 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO

CREATE USER MarnieCayley FOR LOGIN [New_Patient]
GRANT SELECT ON [dbo].[V_Patient_Information] TO MarnieCayley
GRANT SELECT ON [dbo].[V_Point_Contact] TO MarnieCayley