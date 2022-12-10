
/* Suppression des tables au cas ou */
DROP TABLE IF EXISTS TableA
DROP TABLE IF EXISTS TableB
GO

/* Création des tables */
WITH CTE AS ( 
    SELECT 1 id 
    UNION ALL
    SELECT ID + 1 FROM CTE WHERE id < 20)
SELECT Id AS NombreA INTO TableA FROM CTE
GO
WITH CTE AS ( 
    SELECT 1 id 
    UNION ALL
    SELECT ID + 2 FROM CTE WHERE id < 39)
SELECT Id AS NombreB INTO TableB FROM CTE
GO

/* Uniquement les elements qui matchent */
SELECT NombreA, NombreB 
  FROM TableA JOIN TableB ON NombreA = NombreB

/* Tous les elements de A + ceux de B qui matchent */
SELECT NombreA, NombreB 
  FROM TableA LEFT JOIN TableB ON NombreA = NombreB

/* Tous les elements de B + ceux de A qui matchent */
SELECT NombreA, NombreB 
  FROM TableA RIGHT JOIN TableB ON NombreA = NombreB

/* Tous les elements des tables A et B */
SELECT NombreA, NombreB 
  FROM TableA FULL JOIN TableB ON NombreA = NombreB
                   
