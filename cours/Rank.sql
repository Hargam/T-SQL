/* Ajout de numérotation en fonction du jeu de résultats */
select ROW_NUMBER() OVER(ORDER BY IdCategorie ASC) [Numéro de ligne]
     , RANK()       OVER(ORDER BY IdCategorie ASC) [Rank - Ordre IdCategorie croissant]
     , DENSE_RANK() OVER(ORDER BY IdCategorie ASC) [Ordre IdCategorie croissant]
     , IdCategorie, Nom, Prix
  FROM Potion

SELECT Nom, Prix 
     , ROW_NUMBER() OVER(ORDER BY Prix DESC) [Classement par prix décroissant]
  FROM Potion
 ORDER BY Nom ASC

