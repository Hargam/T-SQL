/* Traitement avec une erreur */
DECLARE 
    @i int
BEGIN
    -- on parcours les nombres de -5 à 5
    SET @i = -6

    WHILE @i < 5
    BEGIN

        PRINT CONCAT('le résultat de 10 / ', @i ,' est : ',  10 / @i )

        SET @i = @i + 1
    END 
END 
GO


/* Traitement mais avec gestion d'erreur */
DECLARE 
    @i int
BEGIN
    -- on parcours les nombres de -5 à 5
    SET @i = -6

    WHILE @i < 5
    BEGIN

        BEGIN TRY
            PRINT CONCAT('le résultat de 10 / ', @i ,' est : ',  10 / @i )
        END TRY 
        BEGIN CATCH
            PRINT CONCAT ( 'On évite la division par ' , @i )
        END CATCH

        SET @i = @i + 1
    END 
END 



/* Autre exemple de gestiond 'erreur sur un insert */
BEGIN 
    BEGIN TRY 
        INSERT INTO MAGICIEN (Email) VALUES ('jlba@csi64.fr') ;  -- un commentaire sur une fin de ligne
    END TRY 
    BEGIN CATCH 
        PRINT 'C''est pas la fête non plus...' ;
    END CATCH 
END


