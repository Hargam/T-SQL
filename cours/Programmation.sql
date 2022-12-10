/* 
Boucles conditionnelles

Boucle qui va afficher les nombre de 0 à 20

*/
DECLARE
    @i int  -- Déclaration variable @i
BEGIN
    -- Initialisation à la valeur 0
    SET @i = 0

    -- Commence notre boucle : Tant que @i < 20
    WHILE (@i < 20)
    BEGIN
        -- Lorsque @i vaut 7 ou 17 , on affiche un autre message
        IF @i = 7 OR @i = 17
            BEGIN 
                PRINT 'L''index vaut 7'
                PRINT ' ou 17 !'
            END
        ELSE
            BEGIN
                PRINT CONCAT('La valeur de @i est : ', @i)
            END

        -- on ajoute 1 à la valeur de @i
        SET @i = @i + 1

        -- Si on arrive à 12, on sort du while
        IF @i = 12
            BREAK -- On sort de la boucle while
        ELSE
            CONTINUE -- Remonter au niveau du while

        /* Dans la boucle while / en dehors des conditions */
        PRINT 'Combien de fois apparaîtra cette ligne ?'
        Print 'cette ligne est la plus triste au monde ... T_T'

    END 
    -- en dehors de la boucle while
    PRINT CONCAT('C''est fini : ', @i)

END;
GO 

/* utilisation correcte de CONTINUE */
DECLARE 
    @i int
BEGIN
    -- on parcours les nombres de -5 à 5
    SET @i = -6

    WHILE @i < 5
    BEGIN
        SET @i = @i + 1

        IF @i = 0
            CONTINUE 

        PRINT CONCAT('le résultat de 10 / ', @i ,' est : ',  10 / @i )

    END 
END 







