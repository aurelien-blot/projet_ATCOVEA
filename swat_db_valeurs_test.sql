-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 nov. 2017 à 16:12
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

CREATE TABLE IF NOT EXISTS `avoir` (
  `id_droit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_droit`,`id_user`),
  KEY `FK_avoir_id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id_demande`, `code_affaire_demande`, `libelle_demande`, `date_debut_demande`, `date_fin_demande`, `contexte_demande`, `details_prestation_demande`, `statut_demande`, `zone_geograpique`, `id_interloc_technique`, `id_interet`, `id_acheteur`) VALUES
(1, '123ABC', 'Modification de la fonction 1', '2017-11-22', '2017-11-30', 'contexte 1', 'détails demande 1', 'pas répondu', 'Le Mans', 2, 1, 1),
(2, 'GEL426', 'demande 2', '2017-11-23', '2017-11-28', 'contexte demande 2', 'détails 2', 'répondu', 'Nantes', 2, 2, 3),
(3, '4FFZLD456', 'Libellé demande 3', '2017-11-25', '2017-11-28', 'contexte demande', 'détails prestation demande', 'retenu', 'Rennes', 1, 1, 1);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `developpeur`
--

INSERT INTO `developpeur` (`id_developpeur`, `nom_developpeur`, `prenom_developpeur`, `competences_developpeur`, `cv`) VALUES
(1, 'LEROY', 'Stéphane', 'HTML\r\nJS\r\nCSS', 'http://www.google.fr'),
(2, 'GROS', 'Jean', 'JS', 'http://www.elec-auto.com');

-- --------------------------------------------------------


--
-- Déchargement des données de la table `droit`
--

INSERT INTO `droit` (`id_droit`, `creer`, `editer`, `supprimer`, `repondre`, `consulter`, `id_type_droit`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 0, 0, 0, 1, 1, 3),
(3, 1, 1, 0, 0, 0, 2);

-- --------------------------------------------------------


--
-- Déchargement des données de la table `interet`
--

INSERT INTO `interet` (`id_interet`, `libelle_interet`) VALUES
(1, 'important'),
(2, 'très important'),
(3, 'stratégique');

-- --------------------------------------------------------


--
-- Déchargement des données de la table `interlocuteur_technique`
--

INSERT INTO `interlocuteur_technique` (`id_interloc_technique`, `nom_interloc_technique`, `mail_interloc_technique`, `tel_interloc_technique`) VALUES
(1, 'Lannier', 'lannier@gmail.com', 243567844),
(2, 'breton', 'breton@hgmail.com', 244665588);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_reponse`, `sous_traitant_reponse`, `nb_jours`, `taux_journalier`, `date_debut`, `date_fin`, `id_demande`) VALUES
(1, 0, 12, 200, '2017-11-26', '2017-11-30', 1),
(2, 1, 8, 150, '2017-11-22', '2017-11-30', 2),
(3, 0, 2, 250, '2017-11-26', '2017-11-28', 3);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `retenir`
--

INSERT INTO `retenir` (`id_reponse`, `id_developpeur`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `type_droit`
--

INSERT INTO `type_droit` (`id_type_droit`, `libelle_type_droit`) VALUES
(1, 'Admin'),
(2, 'Demande'),
(3, 'Réponse');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `identifiant_user`, `password_user`) VALUES
(1, 'admin', 'password'),
(2, 'user1', 'password1'),
(3, 'user2', 'password2');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
