/* 
    Cr�er un CRUD sur les magiciens : 
    Ecrire 4 proc�dures/fonctions qui effectuent les op�rations

    C : Create      1
    R : Read        4
    U : Update      3
    D : Delete      2

*/

/***** CREATE *****/
CREATE OR ALTER PROCEDURE dbo.Magicien_C
  @Nom          varchar(50)
, @Email        varchar(50)
, @MotDePasse   varchar(50)
, @DateNaiss    date
AS BEGIN
    -- on teste di le mail existe
    IF EXISTS (SELECT Email FROM Magicien WHERE Email = @EMail)
        PRINT 'Cet Email existe d�j� dans notre base !'
    ELSE
        -- on teste l'age
        IF DATEDIFF(YEAR, @dateNaiss, GETDATE()) < 18
            PRINT 'Il faut �tre majeur pour s''inscrire sur ce site'
        ELSE
            -- on effectue l'insert
            INSERT INTO [dbo].[Magicien]( 
                [Nom], [Email], [MotDePasse], [DateNaiss]
            ) VALUES (
                @Nom, @Email, @MotDePasse, @DateNaiss
            )
END
GO

EXEC Magicien_C 'Circ�', 'circe@olympe.fr', 'telemak4ever', '1000-01-01'
GO

/***** READ Proc�dure et fonction *****/
CREATE OR ALTER PROCEDURE Magicien_R
    @idM INT = NULL
AS BEGIN
   SELECT [Nom], [Email], [DateNaiss]
     FROM [dbo].[Magicien]
    WHERE IdMagicien = @idM OR @idM IS NULL
END
GO

EXEC Magicien_R
EXEC Magicien_R 4
GO

CREATE OR ALTER FUNCTION fMagicien_R(@idM INT = NULL)
RETURNS TABLE AS RETURN
   SELECT [Nom], [Email], [DateNaiss]
     FROM [dbo].[Magicien]
    WHERE IdMagicien = @idM OR @idM IS NULL
GO

SELECT * FROM fMagicien_R(2)
GO

/***** UPDATE *****/
CREATE OR ALTER PROCEDURE Magicien_U
GO


/***** DELETE *****/
CREATE OR ALTER PROCEDURE Magicien_D

EXEC Magicien_D @email = 'circe@olympe.gr'
GO
