/* 
    Créer un CRUD sur les magiciens : 
    Ecrire 4 procédures/fonctions qui effectuent les opérations

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
        PRINT 'Cet Email existe déjà dans notre base !'
    ELSE
        -- on teste l'age
        IF DATEDIFF(YEAR, @dateNaiss, GETDATE()) < 18
            PRINT 'Il faut être majeur pour s''inscrire sur ce site'
        ELSE
            -- on effectue l'insert
            INSERT INTO [dbo].[Magicien]( 
                [Nom], [Email], [MotDePasse], [DateNaiss]
            ) VALUES (
                @Nom, @Email, @MotDePasse, @DateNaiss
            )
END
GO

EXEC Magicien_C 'Circé', 'circe@olympe.fr', 'telemak4ever', '1000-01-01'
GO

/***** READ Procédure et fonction *****/
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
CREATE OR ALTER PROCEDURE Magicien_U	  @IdMagicien	int,	  @Nom			varchar(50) = NULL,      @Email		varchar(50) = NULL,      @MotDePasse	varchar(50) = NULL,      @DateNaiss	date		= NULLASBEGIN	SET NOCOUNT ON;	IF NOT EXISTS (SELECT idMagicien FROM Magicien WHERE IdMagicien = @IdMagicien)		PRINT 'Ce magicien n''existe pas !'	ELSE        IF EXISTS(SELECT Email FROM Magicien WHERE Email = @Email AND IdMagicien <> @IdMagicien)            PRINT 'Un autre magicien existe avec cet email'        ELSE		    BEGIN			    UPDATE Magicien 			       SET Nom			= ISNULL( @Nom			, Nom )				     , Email		= ISNULL( @Email		, Email)				     , MotDePasse	= ISNULL( @MotDePasse	, MotDePasse)				     , DateNaiss	= ISNULL( @DateNaiss 	, DateNaiss)			     WHERE IdMagicien = @IdMagicien ;		    ENDENDGOSELECT * FROM MagicienEXEC Magicien_U @idMagicien = 17, @Email = 'circe@olympe.gr'
GO


/***** DELETE *****/
CREATE OR ALTER PROCEDURE Magicien_D	@idMagicien INT = NULL,	@Email NVARCHAR(50) = NULLAS BEGIN	-- on vérifie si on a bien un paramètre	IF @idMagicien IS NULL AND @Email IS NULL		PRINT 'Il faut renseigner au moins un paramètre !'	ELSE		-- au moins un paramètre est renseigné		IF @idMagicien IS NULL			-- on vérifie si l'email existe dans notre base			IF EXISTS(SELECT Email FROM Magicien WHERE Email = @Email)				DELETE FROM Magicien WHERE Email = @Email			ELSE				PRINT 'Cet email n''existe pas dans notre  base'		ELSE 			-- on vérifie si l'identifiant existe dans notre base			IF EXISTS(SELECT IdMAgicien FROM MAgicien WHERE idMagicien = @idMagicien)				DELETE FROM Magicien WHERE IdMagicien = @idMagicien			ELSE				PRINT 'Cet identifiant n''existe pas dans notre base'ENDGO

EXEC Magicien_D @email = 'circe@olympe.gr'
GO

