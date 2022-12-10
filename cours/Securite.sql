/*

CREER UN UTILISATEUR USER1 / Passw0rd1 
    -> Accès en lecture et écriture sur la base de données Atelier
*/
USE MASTER
GO
CREATE LOGIN USER1
  WITH PASSWORD = 'Passw0rd1'
GO
USE Atelier
GO
CREATE USER USER1 FOR LOGIN USER1
ALTER ROLE db_datareader ADD MEMBER USER1
ALTER ROLE db_datawriter ADD MEMBER USER1
GO

/*
CREER UN UTILISATEUR USER2 / Passw0rd2
    -> Aucun accès en lecture et écriture sur la base de données Atelier
    -> Droits d'utilisation des Procedures du CRUD
*/
USE MASTER
GO
CREATE LOGIN USER2
  WITH PASSWORD = 'Passw0rd2'
GO
USE Atelier
GO
CREATE USER USER2 FOR LOGIN USER2
GRANT EXECUTE [dbo].[Magicien_C] ON TO USER1
GRANT EXECUTE [dbo].[Magicien_R] ON TO USER1
GRANT EXECUTE [dbo].[Magicien_U] ON TO USER1
GRANT EXECUTE [dbo].[Magicien_D] ON TO USER1
GO

/*
CREER UN UTILISATEUR USER3 / Passw0rd3
    -> Aucun droits sur la base de données
    -> Modifier les magiciens 

*/
USE MASTER
GO
CREATE LOGIN USER3 WITH PASSWORD = 'Passw0rd3'
GO

USE Atelier
GO
CREATE USER USER3 FOR LOGIN USER3
GRANT UPDATE ON Magicien TO USER3
GRANT SELECT ON Magicien TO USER3
GO
