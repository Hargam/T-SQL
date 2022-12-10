/* Exercice sur les Triggers */
/* Créer une table de suivi pour enregistrer toutes les modifications saisies 
    sur les tables Potion et  Magicien */

/* création de la table de suivi */
CREATE TABLE [dbo].[Suivi_Modif](	[id_suivi_modif] int IDENTITY(1,1) NOT NULL,	[date_modif]     datetime NULL,	[nom_table]      nvarchar(50) NULL,	[valeurs_avant]  nvarchar(max) NULL,	[valeurs_apres]  nvarchar(max) NULL,	[machine]        nvarchar(50) NULL, CONSTRAINT [PK_Suivi_Modif] PRIMARY KEY CLUSTERED (	[id_suivi_modif] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
     FROM deleted /* contenu de la table Potion / Valeurs avant la modification ou supprimées */

    SELECT @valeurs_apres = CONCAT ( ' [IdPotion]:', [IdPotion]
                                   , ' [Nom]:', [Nom]
                                   , ' [Prix]:', [Prix]
                                   , ' [IdCategorie]:', [IdCategorie])
      FROM inserted /* contenu de la table Potion / Valeurs après la modification ou insérées */

    -- insérer dans la table suivi_modif
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
     FROM deleted /* contenu de la table Magicien / Valeurs avant la modification ou supprimées */

    SELECT @valeurs_apres = CONCAT ( ' [IdMagicien]:', [IdMagicien]
                                   , ' [Nom]:', [Nom]
                                   , ' [Email]:', [Email]
                                   , ' [MotDePasse]:', [MotDePasse]
                                   , ' [DateNaiss]:', [DateNaiss])
      FROM inserted /* contenu de la table Magicien / Valeurs après la modification ou insérées */

    -- insérer dans la table suivi_modif
    INSERT INTO [dbo].[Suivi_Modif]
            ( [date_modif], [nom_table]
            , [valeurs_avant], [valeurs_apres], [machine])
     VALUES ( GETDATE(), 'Magicien'
            , @valeurs_avant, @valeurs_apres,SUSER_NAME())

END
GO

/* Créer un trigger qui empechera la suppression d'une potion
  qui fera partie de la catégorier "Potion d'Invincibilité" */
CREATE OR ALTER TRIGGER delPotion
ON Potion INSTEAD OF DELETE 
AS BEGIN
    SET NOCOUNT ON;
    -- Récupérer l'index de la catégorie "Potion d'Invincibilité"
    DECLARE @idInv INT
    SELECT @idInv = IdCategorie FROM Categorie WHERE Titre = 'Potion d''Invincibilité'

    DECLARE @idInvDel int    SELECT @idInvDel = IdCategorie from deleted    If @idInv != @idInvDel         DELETE FROM Potion WHERE IdPotion IN (select IdPotion FROM deleted)

END
GO

SELECT * FROM potion
DELETE FROM Potion WHERE IdPotion = 20
GO

/* pour désactiver et réactiver un trigger */
ALTER TABLE Potion DISABLE TRIGGER delPotion
ALTER TABLE Potion ENABLE TRIGGER delPotion
GO

