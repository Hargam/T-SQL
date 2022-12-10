
/* recup�ration d'information via serveur li� */
SELECT * FROM OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql ')


/* ajout d'informations */
INSERT INTO OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql LIMIT 1;')
 VALUES (NULL, 'Test du 16/11 depuis MSSQL Server')
/* ou - en format optimis� */ 
INSERT INTO OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql;')
 VALUES (NULL, 'Test du 16/11 depuis MSSQL Server')



/* Modification d'information */
UPDATE OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql ')
   SET colonne_mysql = 'MODIFIE DEPUIS SQL SERVER LE 16/11 � 14h57'
 WHERE id = 12
/* */ 
UPDATE OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql WHERE id = 11 ')
   SET colonne_mysql = 'Modifi� � 15h00 depuis MSSQL'


/* Suppression d'information */
DELETE FROM OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql ')
 WHERE id = 11 
/* ou - en format optimis� */
DELETE FROM OPENQUERY( [MYSQL], 'SELECT * FROM essaisql.liste_mysql WHERE id > 11 ')
