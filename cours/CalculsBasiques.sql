
/* opérations mathématiques basiques */
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
     , ROUND(210.5678 , 0)  [Arrondi à 0 décimales]
     , ROUND(210.5678 , 1)  [Arrondi à 1 décimales]
     , ROUND(210.5678 , 2)  [Arrondi à 1 décimales]
     , ROUND(210.5678 , 3)  [Arrondi à 3 décimales]
     , FLOOR(210.5678)      [Arrondi à l'entier du dessous]
     , CEILING(210.5678)    [Arrondi à l'entier du dessus]
     , ROUND(210.5678 , -2) [Arrondi à 2 chiffres avant la virgule]
     , ROUND(76543210 , -3) [Arrondi au millier]


/* opération sur les chaines de caractères */
SELECT 'Ceci est une PHRASE avec Des CASSES DiFférEnTeS.'   
     , LOWER('Ceci est une PHRASE avec Des CASSES DiFférEnTeS.') [minuscule]
     , UPPER('Ceci est une PHRASE avec Des CASSES DiFférEnTeS.') [MAJUSCULE]

/* Potion d'un mot dans une chaine */
SELECT 'CECI EST UN EXEMPLE POUR TROUVER LA POSITION D''UNE CHAINE'
     , CHARINDEX( 'EXEMPLE', 'CECI EST UN EXEMPLE POUR TROUVER LA POSITION D''UNE CHAINE') AS [Emplacement EXEMPLE]
     , CHARINDEX( 'POSITION', 'ceci est un exemple pour trouver la position d''une chaine') AS [Emplacement Position]

/* concaténation */
SELECT 'ABCD' Chaine1, 'EFGH' Chaine2, 'ABCD' + 'EFGH' [Chaine1 + Chaine2]

SELECT 'ABCD' Chaine1, 123 entier1, 'ABCD' + 123 [Chaine1 + Entier1]

SELECT 'ABCD' Chaine1, 123 entier1, CONCAT('ABCD' , 123 ) [CONCAT Chaine1 + Entier1]

SELECT CONCAT('ABCDE', 123.456, GETDATE(), NULL, '~~#@')  [CONCAT]

/* Opérations sur les dates */
SELECT GETDATE() [Date Heure exécution]
     , CAST(GETDATE() AS date)  [Date de l'évènement]
     , CAST(GETDATE() AS time)  [Heure de l'évènement];

SELECT GETDATE() [Date Heure exécution]
     , YEAR(GETDATE())  [Année]
     , MONTH(GETDATE()) [Mois]     
     , DAY(GETDATE()) [Jour]

SELECT GETDATE() [Date Heure exécution]
     , DATEPART( WEEK, GETDATE())       [Numéro de seamine]
     , DATEPART( HOUR, GETDATE())       [Heure]
     , DATEPART( MINUTE, GETDATE())     [Minutes]
     , DATEPART( SECOND, GETDATE())     [Secondes]
     , DATEPART( WEEKDAY, GETDATE())    [Jour de la semaine]

/* conversion de dates dans différents formats prédéfinis */
SELECT GETDATE()                        [Format ISO]
     , CONVERT(varchar, GETDATE(), 1)   [Format US]
     , CONVERT(varchar, GETDATE(), 2)   [Format ANSI AA.MM.JJ]
     , CONVERT(varchar, GETDATE(), 3)   [Format Anglais/Francais]
     , CONVERT(varchar, GETDATE(), 4)   [Format Allemand]
     , CONVERT(varchar, GETDATE(), 5)   [Format Italien]
     , CONVERT(varchar, GETDATE(), 101)  [Format avec année complète US]
     , CONVERT(varchar, GETDATE(), 102)  [Format avec année complète ANSI AA.MM.JJ]
     , CONVERT(varchar, GETDATE(), 103)  [Format avec année complète Anglais/Francais]
     , CONVERT(varchar, GETDATE(), 104)  [Format avec année complète Allemand]
     , CONVERT(varchar, GETDATE(), 105)  [Format avec année complète Italien]
SELECT GETDATE()                        [Format ISO]
     , CONVERT(varchar, GETDATE(), 6)    [Format de date avec mois en toutes lettres JJ mois AA]
     , CONVERT(varchar, GETDATE(), 7)    [Format de date avec mois en toutes lettres mois, JJ AA]
     , CONVERT(varchar, GETDATE(), 106)  [Format de date avec mois en toutes lettres JJ mois AAAA]
     , CONVERT(varchar, GETDATE(), 107)  [Format de date avec mois en toutes lettres mois, JJ AAAA]
     , CONVERT(varchar, GETDATE(), 8)    [Format HH:MM:SS]

SELECT GETDATE()
     , CONVERT(nvarchar, GETDATE(), 126)  [Format ISO]
     , CONVERT(nvarchar, GETDATE(), 127)  [Format ISO]


