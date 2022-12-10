USE [ATELIER]
GO

/* Suppression des tables au cas où */
 DROP TABLE if exists Panier
 DROP TABLE if exists Potion
 DROP TABLE if exists Magicien
 DROP TABLE if exists Categorie

/* Création des tables dans l'ordre */
CREATE TABLE Magicien(
   IdMagicien INT IDENTITY,
   Nom VARCHAR(50),
   Email VARCHAR(50),
   MotDePasse VARCHAR(50),
   DateNaiss Date
   CONSTRAINT PK_Magicien PRIMARY KEY(IdMagicien),
   CONSTRAINT AK_Magicien UNIQUE(Email)
);

CREATE TABLE Categorie(
   IdCategorie INT IDENTITY,
   Titre VARCHAR(50),
   CONSTRAINT PK_Categorie PRIMARY KEY(IdCategorie)
);

CREATE TABLE Potion(
   IdPotion INT IDENTITY,
   Nom VARCHAR(50),
   Prix DECIMAL(10,3),
   IdCategorie INT NOT NULL,
   CONSTRAINT PK_Potion PRIMARY KEY(IdPotion),
   CONSTRAINT FK_Potion_Categorie FOREIGN KEY(IdCategorie) REFERENCES Categorie(IdCategorie)
);

CREATE TABLE Panier(
   IdMagicien INT,
   IdPotion INT,
   quantite INT,
   CONSTRAINT PK_Panier PRIMARY KEY(IdMagicien, IdPotion),
   CONSTRAINT FK_Panier_Magicien FOREIGN KEY(IdMagicien) REFERENCES Magicien(IdMagicien),
   CONSTRAINT FK_Panier_Potion FOREIGN KEY(IdPotion) REFERENCES Potion(IdPotion)
);

/* Ajout des données dans les tables */
INSERT INTO Categorie 
VALUES ('Potions de Force')
	 , ('Potions de Rapidité')
	 , ('Sirops naturels')
	 , ('Potions d''Invisibilité')
	 , ('Filtres d''amour')
	 , ('Potion d''Invincibilité')

INSERT INTO potion SELECT 'Force +10', 20, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Force'
INSERT INTO potion SELECT 'Force +20', 30, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Force'
INSERT INTO potion SELECT 'Force +30', 40, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Force'
INSERT INTO potion SELECT 'Force +40', 50, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Force'
INSERT INTO potion SELECT 'Force +50', 60, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Force'
INSERT INTO potion SELECT 'Vitesse -10', 12.50, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Rapidité'
INSERT INTO potion SELECT 'Vitesse +10', 22.80, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Rapidité'
INSERT INTO potion SELECT 'Vitesse +20', 36.30, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Rapidité'
INSERT INTO potion SELECT 'Vitesse +30', 42.00, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Rapidité'
INSERT INTO potion SELECT 'Vitesse +40', 54.30, IdCategorie FROM CATEGORIE WHERE Titre = 'Potions de Rapidité'
INSERT INTO potion SELECT 'Pomme', 2.50, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Poire', 2.60, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Pêche', 3.00, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Pastèque', 6.00, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Menthe', 4.10, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Fraise', 2.40, IdCategorie FROM CATEGORIE WHERE Titre = 'Sirops naturels'
INSERT INTO potion SELECT 'Invincibilité 3 Min', 3000, IdCategorie FROM CATEGORIE WHERE Titre = 'Potion d''Invincibilité'
INSERT INTO potion SELECT 'Invincibilité 5 Min', 5000, IdCategorie FROM CATEGORIE WHERE Titre = 'Potion d''Invincibilité'
INSERT INTO potion SELECT 'Invincibilité 10 Min', 10000, IdCategorie FROM CATEGORIE WHERE Titre = 'Potion d''Invincibilité'
INSERT INTO potion SELECT 'Invicibilité 10 jours', 100000, IdCategorie FROM CATEGORIE WHERE Titre = 'Potion d''Invincibilité'
INSERT INTO potion SELECT 'Love at first sight', 123456, IdCategorie FROM CATEGORIE WHERE Titre = 'Filtres d''amour'

/* On ajoute quelques magiciens */
INSERT INTO [dbo].[Magicien](
    [Nom], [Email], [MotDePasse], [DateNaiss]
) VALUES 
  ( 'MERLIN', 'merlin@kamelott.fr', 'abr@c@d@br@', '0800-01-01')
, ( 'Gerard Majax', 'gerard@majax.com', 'pouetpouet', '1943-04-28')
, ( 'David Copperfield', 'd.copperfield@lasvegas.fr', 'dave123', '1956-09-16')
, ( 'Barbapapa', 'papa@barbapapa.com', 'B@rb@m@m@', '1974-10-02')
, ( 'Jean-Loup Bareyre', 'jlba@csi64.fr', 'iLuvSQL', '1978-10-11')
