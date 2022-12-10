
/* op�rations math�matiques basiques */
SELECT 14       [A]
     , 5        [B]
     , 14 + 5   [Addition A + B]   
     , 14 - 5   [Soustraction A - B]
     , 14 * 5   [Multiplication A * B]     
     , 14 / 5   [Division A / B - entier]
     , 14 % 5   [Modulo - Reste de la division de A % B]
     , 14.0 / 5 [Division A / B - float]

/* Les arrondis */
SELECT 210.5678             [Depart]
     , ROUND(210.5678 , 0)  [Arrondi � 0 d�cimales]
     , ROUND(210.5678 , 1)  [Arrondi � 1 d�cimales]
     , ROUND(210.5678 , 2)  [Arrondi � 1 d�cimales]
     , ROUND(210.5678 , 3)  [Arrondi � 3 d�cimales]
     , FLOOR(210.5678)      [Arrondi � l'entier du dessous]
     , CEILING(210.5678)    [Arrondi � l'entier du dessus]
     , ROUND(210.5678 , -2) [Arrondi � 2 chiffres avant la virgule]
     , ROUND(76543210 , -3) [Arrondi au millier]


/* op�ration sur les chaines de caract�res */
SELECT 'Ceci est une PHRASE avec Des CASSES DiFf�rEnTeS.'   
     , LOWER('Ceci est une PHRASE avec Des CASSES DiFf�rEnTeS.') [minuscule]
     , UPPER('Ceci est une PHRASE avec Des CASSES DiFf�rEnTeS.') [MAJUSCULE]

/* Potion d'un mot dans une chaine */
SELECT 'CECI EST UN EXEMPLE POUR TROUVER LA POSITION D''UNE CHAINE'
     , CHARINDEX( 'EXEMPLE', 'CECI EST UN EXEMPLE POUR TROUVER LA POSITION D''UNE CHAINE') AS [Emplacement EXEMPLE]
     , CHARINDEX( 'POSITION', 'ceci est un exemple pour trouver la position d''une chaine') AS [Emplacement Position]

/* concat�nation */
SELECT 'ABCD' Chaine1, 'EFGH' Chaine2, 'ABCD' + 'EFGH' [Chaine1 + Chaine2]

SELECT 'ABCD' Chaine1, 123 entier1, 'ABCD' + 123 [Chaine1 + Entier1]

SELECT 'ABCD' Chaine1, 123 entier1, CONCAT('ABCD' , 123 ) [CONCAT Chaine1 + Entier1]

SELECT CONCAT('ABCDE', 123.456, GETDATE(), NULL, '~~#@')  [CONCAT]

/* Op�rations sur les dates */
SELECT GETDATE() [Date Heure ex�cution]
     , CAST(GETDATE() AS date)  [Date de l'�v�nement]
     , CAST(GETDATE() AS time)  [Heure de l'�v�nement];

SELECT GETDATE() [Date Heure ex�cution]
     , YEAR(GETDATE())  [Ann�e]
     , MONTH(GETDATE()) [Mois]     
     , DAY(GETDATE()) [Jour]

SELECT GETDATE() [Date Heure ex�cution]
     , DATEPART( WEEK, GETDATE())       [Num�ro de seamine]
     , DATEPART( HOUR, GETDATE())       [Heure]
     , DATEPART( MINUTE, GETDATE())     [Minutes]
     , DATEPART( SECOND, GETDATE())     [Secondes]
     , DATEPART( WEEKDAY, GETDATE())    [Jour de la semaine]

/* conversion de dates dans diff�rents formats pr�d�finis */
SELECT GETDATE()                        [Format ISO]
     , CONVERT(varchar, GETDATE(), 1)   [Format US]
     , CONVERT(varchar, GETDATE(), 2)   [Format ANSI AA.MM.JJ]
     , CONVERT(varchar, GETDATE(), 3)   [Format Anglais/Francais]
     , CONVERT(varchar, GETDATE(), 4)   [Format Allemand]
     , CONVERT(varchar, GETDATE(), 5)   [Format Italien]
     , CONVERT(varchar, GETDATE(), 101)  [Format avec ann�e compl�te US]
     , CONVERT(varchar, GETDATE(), 102)  [Format avec ann�e compl�te ANSI AA.MM.JJ]
     , CONVERT(varchar, GETDATE(), 103)  [Format avec ann�e compl�te Anglais/Francais]
     , CONVERT(varchar, GETDATE(), 104)  [Format avec ann�e compl�te Allemand]
     , CONVERT(varchar, GETDATE(), 105)  [Format avec ann�e compl�te Italien]
SELECT GETDATE()                        [Format ISO]
     , CONVERT(varchar, GETDATE(), 6)    [Format de date avec mois en toutes lettres JJ mois AA]
     , CONVERT(varchar, GETDATE(), 7)    [Format de date avec mois en toutes lettres mois, JJ AA]
     , CONVERT(varchar, GETDATE(), 106)  [Format de date avec mois en toutes lettres JJ mois AAAA]
     , CONVERT(varchar, GETDATE(), 107)  [Format de date avec mois en toutes lettres mois, JJ AAAA]
     , CONVERT(varchar, GETDATE(), 8)    [Format HH:MM:SS]

SELECT GETDATE()
     , CONVERT(nvarchar, GETDATE(), 126)  [Format ISO]
     , CONVERT(nvarchar, GETDATE(), 127)  [Format ISO]


