-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 nov. 2017 à 16:10
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `swat_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

DROP TABLE IF EXISTS `acheteur`;
CREATE TABLE IF NOT EXISTS `acheteur` (
  `id_acheteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_acheteur` varchar(25) DEFAULT NULL,
  `prenom_acheteur` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_acheteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id_acheteur`, `nom_acheteur`, `prenom_acheteur`) VALUES
(1, 'Do', 'John'),
(2, 'Wayne', 'John'),
(3, 'Rambo', 'John');

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `id_droit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_droit`,`id_user`),
  KEY `FK_avoir_id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

DROP TABLE IF EXISTS `demande`;
CREATE TABLE IF NOT EXISTS `demande` (
  `id_demande` int(11) NOT NULL,
  `code_affaire_demande` varchar(9) DEFAULT NULL,
  `libelle_demande` varchar(50) DEFAULT NULL,
  `date_debut_demande` date DEFAULT NULL,
  `date_fin_demande` date DEFAULT NULL,
  `contexte_demande` varchar(150) DEFAULT NULL,
  `details_prestation_demande` varchar(300) DEFAULT NULL,
  `statut_demande` enum('pas répondu','répondu','retenu','pas retenu') DEFAULT NULL,
  `zone_geograpique` varchar(25) DEFAULT NULL,
  `id_interloc_technique` int(11) NOT NULL,
  `id_interet` int(11) NOT NULL,
  `id_acheteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_demande`),
  KEY `FK_Demande_id_interloc_technique` (`id_interloc_technique`),
  KEY `FK_Demande_id_interet` (`id_interet`),
  KEY `FK_Demande_id_acheteur` (`id_acheteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id_demande`, `code_affaire_demande`, `libelle_demande`, `date_debut_demande`, `date_fin_demande`, `contexte_demande`, `details_prestation_demande`, `statut_demande`, `zone_geograpique`, `id_interloc_technique`, `id_interet`, `id_acheteur`) VALUES
(1, '123ABC', 'Modification de la fonction 1', '2017-11-22', '2017-11-30', 'contexte 1', 'détails demande 1', 'pas répondu', 'Le Mans', 2, 1, 1),
(2, 'GEL426', 'demande 2', '2017-11-23', '2017-11-28', 'contexte demande 2', 'détails 2', 'répondu', 'Nantes', 2, 2, 3),
(3, '4FFZLD456', 'Libellé demande 3', '2017-11-25', '2017-11-28', 'contexte demande', 'détails prestation demande', 'retenu', 'Rennes', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `developpeur`
--

DROP TABLE IF EXISTS `developpeur`;
CREATE TABLE IF NOT EXISTS `developpeur` (
  `id_developpeur` int(11) NOT NULL,
  `nom_developpeur` varchar(25) DEFAULT NULL,
  `prenom_developpeur` varchar(25) DEFAULT NULL,
  `competences_developpeur` varchar(300) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_developpeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `developpeur`
--

INSERT INTO `developpeur` (`id_developpeur`, `nom_developpeur`, `prenom_developpeur`, `competences_developpeur`, `cv`) VALUES
(1, 'LEROY', 'Stéphane', 'HTML\r\nJS\r\nCSS', 'http://www.google.fr'),
(2, 'GROS', 'Jean', 'JS', 'http://www.elec-auto.com');

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

DROP TABLE IF EXISTS `droit`;
CREATE TABLE IF NOT EXISTS `droit` (
  `id_droit` int(11) NOT NULL AUTO_INCREMENT,
  `creer` tinyint(1) DEFAULT NULL,
  `editer` tinyint(1) DEFAULT NULL,
  `supprimer` tinyint(1) DEFAULT NULL,
  `repondre` tinyint(1) DEFAULT NULL,
  `consulter` tinyint(1) DEFAULT NULL,
  `id_type_droit` int(11) NOT NULL,
  PRIMARY KEY (`id_droit`),
  KEY `FK_droit_id_type_droit` (`id_type_droit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `droit`
--

INSERT INTO `droit` (`id_droit`, `creer`, `editer`, `supprimer`, `repondre`, `consulter`, `id_type_droit`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 0, 0, 0, 1, 1, 3),
(3, 1, 1, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `interet`
--

DROP TABLE IF EXISTS `interet`;
CREATE TABLE IF NOT EXISTS `interet` (
  `id_interet` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_interet` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_interet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interet`
--

INSERT INTO `interet` (`id_interet`, `libelle_interet`) VALUES
(1, 'important'),
(2, 'très important'),
(3, 'stratégique');

-- --------------------------------------------------------

--
-- Structure de la table `interlocuteur_technique`
--

DROP TABLE IF EXISTS `interlocuteur_technique`;
CREATE TABLE IF NOT EXISTS `interlocuteur_technique` (
  `id_interloc_technique` int(11) NOT NULL,
  `nom_interloc_technique` varchar(25) DEFAULT NULL,
  `mail_interloc_technique` varchar(100) DEFAULT NULL,
  `tel_interloc_technique` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_interloc_technique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interlocuteur_technique`
--

INSERT INTO `interlocuteur_technique` (`id_interloc_technique`, `nom_interloc_technique`, `mail_interloc_technique`, `tel_interloc_technique`) VALUES
(1, 'Lannier', 'lannier@gmail.com', 243567844),
(2, 'breton', 'breton@hgmail.com', 244665588);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id_reponse` int(11) NOT NULL,
  `sous_traitant_reponse` tinyint(1) DEFAULT NULL,
  `nb_jours` int(11) DEFAULT NULL,
  `taux_journalier` double DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `id_demande` int(11) NOT NULL,
  PRIMARY KEY (`id_reponse`),
  KEY `FK_reponse_id_demande` (`id_demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `sous_traitant_reponse`, `nb_jours`, `taux_journalier`, `date_debut`, `date_fin`, `id_demande`) VALUES
(1, 0, 12, 200, '2017-11-26', '2017-11-30', 1),
(2, 1, 8, 150, '2017-11-22', '2017-11-30', 2),
(3, 0, 2, 250, '2017-11-26', '2017-11-28', 3);

-- --------------------------------------------------------

--
-- Structure de la table `retenir`
--

DROP TABLE IF EXISTS `retenir`;
CREATE TABLE IF NOT EXISTS `retenir` (
  `id_reponse` int(11) NOT NULL,
  `id_developpeur` int(11) NOT NULL,
  PRIMARY KEY (`id_reponse`,`id_developpeur`),
  KEY `FK_retenir_id_developpeur` (`id_developpeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `retenir`
--

INSERT INTO `retenir` (`id_reponse`, `id_developpeur`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type_droit`
--

DROP TABLE IF EXISTS `type_droit`;
CREATE TABLE IF NOT EXISTS `type_droit` (
  `id_type_droit` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_type_droit` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_type_droit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_droit`
--

INSERT INTO `type_droit` (`id_type_droit`, `libelle_type_droit`) VALUES
(1, 'Admin'),
(2, 'Demande'),
(3, 'Réponse');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant_user` varchar(25) NOT NULL,
  `password_user` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `identifiant_user` (`identifiant_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `identifiant_user`, `password_user`) VALUES
(1, 'admin', 'password'),
(2, 'user1', 'password1'),
(3, 'user2', 'password2');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `FK_avoir_id_droit` FOREIGN KEY (`id_droit`) REFERENCES `droit` (`id_droit`),
  ADD CONSTRAINT `FK_avoir_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `FK_Demande_id_acheteur` FOREIGN KEY (`id_acheteur`) REFERENCES `acheteur` (`id_acheteur`),
  ADD CONSTRAINT `FK_Demande_id_interet` FOREIGN KEY (`id_interet`) REFERENCES `interet` (`id_interet`),
  ADD CONSTRAINT `FK_Demande_id_interloc_technique` FOREIGN KEY (`id_interloc_technique`) REFERENCES `interlocuteur_technique` (`id_interloc_technique`);

--
-- Contraintes pour la table `droit`
--
ALTER TABLE `droit`
  ADD CONSTRAINT `FK_droit_id_type_droit` FOREIGN KEY (`id_type_droit`) REFERENCES `type_droit` (`id_type_droit`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_reponse_id_demande` FOREIGN KEY (`id_demande`) REFERENCES `demande` (`id_demande`);

--
-- Contraintes pour la table `retenir`
--
ALTER TABLE `retenir`
  ADD CONSTRAINT `FK_retenir_id_developpeur` FOREIGN KEY (`id_developpeur`) REFERENCES `developpeur` (`id_developpeur`),
  ADD CONSTRAINT `FK_retenir_id_reponse` FOREIGN KEY (`id_reponse`) REFERENCES `reponse` (`id_reponse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
