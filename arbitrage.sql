-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 24 mars 2022 à 08:59
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arbitrage`
--

-- --------------------------------------------------------

--
-- Structure de la table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
CREATE TABLE IF NOT EXISTS `arbitre` (
  `num_arbitre` int(11) NOT NULL,
  `nom_arbitre` varchar(50) NOT NULL,
  `prenom_arbitre` varchar(50) NOT NULL,
  `adresse_arbitre` varchar(50) NOT NULL,
  `cp_arbitre` int(11) NOT NULL,
  `ville_arbitre` varchar(50) NOT NULL,
  `date_naiss_arbitre` date NOT NULL,
  `tel_fixe_arbitre` text NOT NULL,
  `tel_port_arbitre` text NOT NULL,
  `mail_arbitre` varchar(50) NOT NULL,
  `num_club` int(11) NOT NULL,
  `num_equipe` int(11) NOT NULL,
  PRIMARY KEY (`num_arbitre`,`num_club`,`num_equipe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `catégorie`
--

DROP TABLE IF EXISTS `catégorie`;
CREATE TABLE IF NOT EXISTS `catégorie` (
  `num_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL,
  `montant_indemnite` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `championnat`
--

DROP TABLE IF EXISTS `championnat`;
CREATE TABLE IF NOT EXISTS `championnat` (
  `num_championnat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_championnat` varchar(50) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  `num_division` int(11) NOT NULL,
  `num_type_championnat` int(11) NOT NULL,
  PRIMARY KEY (`num_championnat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `num_club` int(11) NOT NULL AUTO_INCREMENT,
  `nom_club` varchar(50) NOT NULL,
  PRIMARY KEY (`num_club`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

DROP TABLE IF EXISTS `deplacement`;
CREATE TABLE IF NOT EXISTS `deplacement` (
  `num_arbitre` int(11) NOT NULL,
  `num_salle` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`num_arbitre`,`num_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `num_division` int(11) NOT NULL,
  `nom_division` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `num_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `num_club` int(11) NOT NULL,
  `nom_equipe` varchar(50) NOT NULL,
  `num_championnat` int(11) NOT NULL,
  PRIMARY KEY (`num_equipe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

DROP TABLE IF EXISTS `indisponibilite`;
CREATE TABLE IF NOT EXISTS `indisponibilite` (
  `num_arbitre` int(11) NOT NULL,
  `date_jour` date NOT NULL,
  `code_demi_journee` text NOT NULL,
  PRIMARY KEY (`num_arbitre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `num_match` int(11) NOT NULL AUTO_INCREMENT,
  `num_salle` int(11) NOT NULL,
  `date_match` date NOT NULL,
  `heure_match` int(11) NOT NULL,
  `num_equipe_1` int(11) NOT NULL,
  `num_equipe_2` int(11) NOT NULL,
  `num_equipe_s` int(11) NOT NULL,
  `num_equipe_p` int(11) NOT NULL,
  `montant_depit_p` decimal(10,0) NOT NULL,
  `montant_depit_s` decimal(10,0) NOT NULL,
  PRIMARY KEY (`num_match`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

DROP TABLE IF EXISTS `parametre`;
CREATE TABLE IF NOT EXISTS `parametre` (
  `numero_param` int(11) NOT NULL,
  `montant_km` decimal(10,0) NOT NULL,
  `mail_responsable` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `num_salle` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_salle` varchar(50) NOT NULL,
  PRIMARY KEY (`num_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_championnat`
--

DROP TABLE IF EXISTS `type_championnat`;
CREATE TABLE IF NOT EXISTS `type_championnat` (
  `num_type_championnat` int(11) NOT NULL,
  `nom_type_championat` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
