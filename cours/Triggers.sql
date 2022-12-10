/* Exercice sur les Triggers */
/* Cr�er une table de suivi pour enregistrer toutes les modifications saisies 
    sur les tables Potion et  Magicien */

/* cr�ation de la table de suivi */
CREATE TABLE [dbo].[Suivi_Modif](
GO

/* Trigger sur les potions */
CREATE OR ALTER TRIGGER ModPotions
ON Potion -- WITH ENCRYPTION /* pour masquer le code du trigger */
FOR INSERT, UPDATE, DELETE
AS
DECLARE
    @valeurs_avant nvarchar(max),
    @valeurs_apres nvarchar(max)
BEGIN
    SET NOCOUNT ON;
    SELECT @valeurs_avant = CONCAT ( ' [IdPotion]:', [IdPotion]
                                   , ' [Nom]:', [Nom]
                                   , ' [Prix]:', [Prix]
                                   , ' [IdCategorie]:', [IdCategorie])
     FROM deleted /* contenu de la table Potion / Valeurs avant la modification ou supprim�es */

    SELECT @valeurs_apres = CONCAT ( ' [IdPotion]:', [IdPotion]
                                   , ' [Nom]:', [Nom]
                                   , ' [Prix]:', [Prix]
                                   , ' [IdCategorie]:', [IdCategorie])
      FROM inserted /* contenu de la table Potion / Valeurs apr�s la modification ou ins�r�es */

    -- ins�rer dans la table suivi_modif
    INSERT INTO [dbo].[Suivi_Modif]( [date_modif], [nom_table]
           , [valeurs_avant], [valeurs_apres], [machine])
     VALUES ( GETDATE(), 'Potion'
           ,@valeurs_avant, @valeurs_apres,SUSER_NAME())

END
GO

DELETE FROM  potion WHERE IdPotion = 22
GO

/* TRIGGER sur les magiciens */
CREATE OR ALTER TRIGGER ModMagicien
ON Magicien AFTER INSERT, UPDATE, DELETE
AS
DECLARE
    @valeurs_avant nvarchar(max),
    @valeurs_apres nvarchar(max)
BEGIN
    SET NOCOUNT ON;
    -- 
    SELECT @valeurs_avant = CONCAT ( ' [IdMagicien]:', [IdMagicien]
                                   , ' [Nom]:', [Nom]
                                   , ' [Email]:', [Email]
                                   , ' [MotDePasse]:', [MotDePasse]
                                   , ' [DateNaiss]:', [DateNaiss])
     FROM deleted /* contenu de la table Magicien / Valeurs avant la modification ou supprim�es */

    SELECT @valeurs_apres = CONCAT ( ' [IdMagicien]:', [IdMagicien]
                                   , ' [Nom]:', [Nom]
                                   , ' [Email]:', [Email]
                                   , ' [MotDePasse]:', [MotDePasse]
                                   , ' [DateNaiss]:', [DateNaiss])
      FROM inserted /* contenu de la table Magicien / Valeurs apr�s la modification ou ins�r�es */

    -- ins�rer dans la table suivi_modif
    INSERT INTO [dbo].[Suivi_Modif]
            ( [date_modif], [nom_table]
            , [valeurs_avant], [valeurs_apres], [machine])
     VALUES ( GETDATE(), 'Magicien'
            , @valeurs_avant, @valeurs_apres,SUSER_NAME())

END
GO

/* Cr�er un trigger qui empechera la suppression d'une potion
  qui fera partie de la cat�gorier "Potion d'Invincibilit�" */
CREATE OR ALTER TRIGGER delPotion
ON Potion INSTEAD OF DELETE 
AS BEGIN
    SET NOCOUNT ON;
    -- R�cup�rer l'index de la cat�gorie "Potion d'Invincibilit�"
    DECLARE @idInv INT
    SELECT @idInv = IdCategorie FROM Categorie WHERE Titre = 'Potion d''Invincibilit�'

    DECLARE @idInvDel int

END
GO

SELECT * FROM potion
DELETE FROM Potion WHERE IdPotion = 20
GO

/* pour d�sactiver et r�activer un trigger */
ALTER TABLE Potion DISABLE TRIGGER delPotion
ALTER TABLE Potion ENABLE TRIGGER delPotion
GO
