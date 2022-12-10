/* 

Ecrire une procédure avec aucun paramètre et qui écrit 'Bonjour tout le monde'

Ecrire une procédure avec un paramètre et qui écrit 'Bonjour ' + Nom de la personne reçu en paramètre

Ecrire une fonction qui prend un prix, un Taux de TVA et qui renvoit le prix TCC
  
  EXEMPLE:  Prix 100 , TVA  20   -> renvoie 120
 
*/
/* Procédure n°1 */
CREATE OR ALTER PROCEDURE HelloWorld
AS
BEGIN
    PRINT 'Bonjour tout le monde !' ;
END;
GO
/* exemple d'appel */
EXEC HelloWorld
GO

/* Procédure n°2 */
CREATE OR ALTER PROCEDURE Bonjour
    @Nom NVARCHAR(50) = ''
AS BEGIN
    IF @Nom = '' -- Si le param-ètre n'est pas renseigné
        EXEC HelloWorld
    ELSE
        PRINT CONCAT('Hello ' , @Nom, ' !')
END;
GO
/* exemples d'appel */
EXEC Bonjour 
EXEC Bonjour 'Jean-Loup'
EXEC Bonjour @Nom='mes chers elèves'
GO


/* Fonction n°3 */
CREATE OR ALTER Function PrixTTC(
    @PHT    DECIMAL(10, 3) ,    -- 1234567.890
    @TVA    DECIMAL( 5, 2)      -- 123.45
) RETURNS DECIMAL(10, 3) 
AS BEGIN
    DECLARE @TTC DECIMAL(10, 3)
    -- On teste si le taux de TVA est cohérent
    IF @TVA >0 AND @TVA <40
        SET @TTC = @PHT * ( 1 + @TVA / 100 )
    ELSE
        SET @TTC = @PHT

    -- renvoie de la valeur calculée
    RETURN @TTC 
END;
GO

/* exemple d'appel */
SELECT  100 [Prix],  20 [TVA], [dbo].[PrixTTC](  100, 20 ) [Prix TTC]
SELECT 1234 [Prix], 5.5 [TVA], [dbo].[PrixTTC]( 1234, 5.5) [Prix TTC]
GO

SELECT Nom, Prix, dbo.PrixTTC( Prix, 15 ) PrixTTC FROM Potion
GO
