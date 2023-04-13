-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour gaulois
CREATE DATABASE IF NOT EXISTS `gaulois` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gaulois`;

-- Listage de la structure de table gaulois. autoriser_boire
CREATE TABLE IF NOT EXISTS `autoriser_boire` (
  `id_potion` int NOT NULL,
  `id_personnage` int NOT NULL,
  PRIMARY KEY (`id_potion`,`id_personnage`),
  KEY `FK_AUTO_PERSO` (`id_personnage`),
  CONSTRAINT `FK_AUTO_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`),
  CONSTRAINT `FK_AUTO_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. bataille
CREATE TABLE IF NOT EXISTS `bataille` (
  `id_bataille` int NOT NULL AUTO_INCREMENT,
  `nom_bataille` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `date_bataille` date NOT NULL,
  `id_lieu` int NOT NULL,
  PRIMARY KEY (`id_bataille`),
  KEY `FK_BATAILLE_LIEU` (`id_lieu`),
  CONSTRAINT `FK_BATAILLE_LIEU` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. boire
CREATE TABLE IF NOT EXISTS `boire` (
  `id_potion` int NOT NULL,
  `id_personnage` int NOT NULL,
  `date_boire` date NOT NULL,
  `dose_boire` int NOT NULL,
  PRIMARY KEY (`id_potion`,`id_personnage`),
  KEY `FK_BOIRE_PERSO` (`id_personnage`),
  CONSTRAINT `FK_BOIRE_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`),
  CONSTRAINT `FK_BOIRE_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. casque
CREATE TABLE IF NOT EXISTS `casque` (
  `id_casque` int NOT NULL AUTO_INCREMENT,
  `nom_casque` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cout_casque` float NOT NULL,
  `id_type_casque` int NOT NULL,
  PRIMARY KEY (`id_casque`),
  KEY `FK_CASQUE_TYPECASQUE` (`id_type_casque`),
  CONSTRAINT `FK_CASQUE_TYPECASQUE` FOREIGN KEY (`id_type_casque`) REFERENCES `type_casque` (`id_type_casque`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. composer
CREATE TABLE IF NOT EXISTS `composer` (
  `id_potion` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `qte` int NOT NULL,
  PRIMARY KEY (`id_potion`,`id_ingredient`),
  KEY `FK_COMPOSER_INGREDIENT` (`id_ingredient`),
  CONSTRAINT `FK_COMPOSER_INGREDIENT` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_COMPOSER_POTION` FOREIGN KEY (`id_potion`) REFERENCES `potion` (`id_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cout_ingredient` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. lieu
CREATE TABLE IF NOT EXISTS `lieu` (
  `id_lieu` int NOT NULL AUTO_INCREMENT,
  `nom_lieu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. personnage
CREATE TABLE IF NOT EXISTS `personnage` (
  `id_personnage` int NOT NULL AUTO_INCREMENT,
  `nom_personnage` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `adresse_personnage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `image_personnage` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'indisponible.jpg',
  `id_lieu` int NOT NULL,
  `id_specialite` int NOT NULL,
  PRIMARY KEY (`id_personnage`),
  KEY `FK_VILLAGEOIS_LIEU` (`id_lieu`),
  KEY `FK_VILLAGEOIS_SPEC` (`id_specialite`),
  CONSTRAINT `FK_VILLAGEOIS_LIEU` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id_lieu`),
  CONSTRAINT `FK_VILLAGEOIS_SPEC` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. potion
CREATE TABLE IF NOT EXISTS `potion` (
  `id_potion` int NOT NULL AUTO_INCREMENT,
  `nom_potion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_potion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. prendre_casque
CREATE TABLE IF NOT EXISTS `prendre_casque` (
  `id_casque` int NOT NULL,
  `id_personnage` int NOT NULL,
  `id_bataille` int NOT NULL,
  `qte` int NOT NULL,
  PRIMARY KEY (`id_casque`,`id_personnage`,`id_bataille`),
  KEY `FK_PRCSQ_BATAILLE` (`id_bataille`),
  KEY `FK_PRCSQ_PERSO` (`id_personnage`),
  CONSTRAINT `FK_PRCSQ_BATAILLE` FOREIGN KEY (`id_bataille`) REFERENCES `bataille` (`id_bataille`),
  CONSTRAINT `FK_PRCSQ_CASQUE` FOREIGN KEY (`id_casque`) REFERENCES `casque` (`id_casque`),
  CONSTRAINT `FK_PRCSQ_PERSO` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. specialite
CREATE TABLE IF NOT EXISTS `specialite` (
  `id_specialite` int NOT NULL AUTO_INCREMENT,
  `nom_specialite` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table gaulois. type_casque
CREATE TABLE IF NOT EXISTS `type_casque` (
  `id_type_casque` int NOT NULL AUTO_INCREMENT,
  `nom_type_casque` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_type_casque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
