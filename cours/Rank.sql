/* Ajout de num�rotation en fonction du jeu de r�sultats */
select ROW_NUMBER() OVER(ORDER BY IdCategorie ASC) [Num�ro de ligne]
     , RANK()       OVER(ORDER BY IdCategorie ASC) [Rank - Ordre IdCategorie croissant]
     , DENSE_RANK() OVER(ORDER BY IdCategorie ASC) [Ordre IdCategorie croissant]
     , IdCategorie, Nom, Prix
  FROM Potion

SELECT Nom, Prix 
     , ROW_NUMBER() OVER(ORDER BY Prix DESC) [Classement par prix d�croissant]
  FROM Potion
 ORDER BY Nom ASC

