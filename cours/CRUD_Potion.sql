/* 
CRUD sur les potion 
    Create  - Proc�dure  
        - Titre de la cat�gorie en texte
        - Si la cat�gorie n'existe pas, on l'ajoute � la table
    Update  - Proc�dure 
    Read    - Proc�dure + Fonction Table
    Delete  - Proc�dure 
*/
/***** Delete ******/
CREATE OR ALTER PROCEDURE Potion_D
    @idP int
AS BEGIN
    SET NOCOUNT ON;
    -- on supprime de la table Panier
    DELETE FROM Panier WHERE IdPotion = @idP
    -- on supprime de la table Potion
    DELETE FROM Potion WHERE IdPotion = @idP
END
GO

/***** Create *****/
CREATE OR ALTER PROCEDURE Potion_C
    @Nom    varchar(50)         -- Force +123
  , @Prix   decimal(10, 3)      -- 12.30
  , @Categ  nvarchar(50)        -- Potions de Force
AS
DECLARE
    @IdCateg    INT
BEGIN
    SET NOCOUNT ON;
    -- V�rification si la cat�gorie recue existe
    -- Si elle n'existe pas, on l'ajoute
    IF NOT EXISTS(SELECT Titre FROM Categorie WHERE Titre = @Categ)
        INSERT INTO Categorie (Titre) VALUES (@Categ)

    -- R�cup�rer l'index de la cat�gorie
    SELECT @idCateg = idCategorie FROM Categorie WHERE Titre = @Categ

    -- on ajoute dans la table potion
    INSERT INTO [dbo].[Potion](
        [Nom], [Prix], [IdCategorie]
    ) VALUES (
        @Nom, @Prix, @IdCateg
    )
END
GO

/***** Update ****/
CREATE OR ALTER PROCEDURE Potion_U
    @idP    int
  , @Nom    varchar(50)    = NULL
  , @Prix   decimal(10, 3) = NULL
  , @Categ  nvarchar(50)   = NULL
AS DECLARE
    @idCateg    int
BEGIN
    -- on r�cup�re l'id de la cat�gorie
    SELECT @idCateg = IdCategorie FROM Categorie WHERE Titre = @Categ

    -- on effectue la mise � jour
    UPDATE Potion 
       SET Nom         = ISNULL(@Nom , Nom )       
         , Prix        = ISNULL(@Prix , Prix )      
         , IdCategorie = ISNULL(@idCateg , IdCategorie)
     WHERE IdPotion = @idP

END
GO

/***** Potion_R *****/
CREATE OR ALTER PROCEDURE Potion_R
AS 
BEGIN
    SELECT IdPotion, c.Titre, p.Nom, p.Prix, dbo.PrixTTC( p.Prix, 20) as PrixTTC
      FROM Categorie c left outer join Potion p on p.IdCategorie = c.IdCategorie
END
GO
CREATE OR ALTER FUNCTION fPotion_R ()
RETURNS TABLE AS RETURN
SELECT IdPotion, c.Titre, p.Nom, p.Prix, dbo.PrixTTC( p.Prix, 20) as PrixTTC
    FROM Categorie c left outer join Potion p on p.IdCategorie = c.IdCategorie
GO

SELECT * FROM fPotion_R()