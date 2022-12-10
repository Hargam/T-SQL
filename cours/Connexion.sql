/* Vérifier les utilisateurs connectés sur ma base */
select login_name,program_name, database_id
     , DB_NAME(database_id) [Database], host_name 
  from sys.dm_exec_sessions  where is_user_process=1

/* Supprimer les connexions */
use master;
GO
/* Positionne la base de données en MODE SINGLE USER */
ALTER DATABASE Atelier SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
/* repositionner la base de données dans un statut "normal" */
ALTER DATABASE Atelier SET MULTI_USER;
GO
