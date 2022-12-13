-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 13 Décembre 2022 à 15:24
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `RH`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `no_employe` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `salaire` int(11) NOT NULL,
  `typecontrat` varchar(20) NOT NULL,
  `fonction` varchar(20) NOT NULL,
  `site` varchar(20) NOT NULL,
  `date_dembauche` date NOT NULL,
  `datedenaissance` date NOT NULL,
  `no_srv` int(11) NOT NULL,
  PRIMARY KEY (`no_employe`),
  KEY `no_srv` (`no_srv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`no_employe`, `nom`, `prenom`, `sexe`, `salaire`, `typecontrat`, `fonction`, `site`, `date_dembauche`, `datedenaissance`, `no_srv`) VALUES
(111, 'Wattson', 'Natalie', 'Feminin', 10000, 'CDD', 'Technicien electrici', '67 Boulevard du Géné', '2019-09-10', '2000-02-15', 123),
(222, 'Smith', 'Caleb', 'Masculin', 6000, 'CDI', 'Développeur Applicat', '6 Allée des pates', '2020-10-12', '1999-05-12', 456);

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `numinterv` int(11) NOT NULL,
  `noprojet` int(11) NOT NULL,
  `no_employer` int(11) NOT NULL,
  `nbheures` int(11) NOT NULL,
  PRIMARY KEY (`numinterv`),
  KEY `noprojet` (`noprojet`,`no_employer`),
  KEY `no_employer` (`no_employer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenir`
--

INSERT INTO `intervenir` (`numinterv`, `noprojet`, `no_employer`, `nbheures`) VALUES
(753, 147, 222, 76),
(951, 258, 111, 48);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `noprojet` int(11) NOT NULL,
  `libelleprojet` varchar(20) NOT NULL,
  `no_srv` int(11) NOT NULL,
  PRIMARY KEY (`noprojet`),
  KEY `no_srv` (`no_srv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`noprojet`, `libelleprojet`, `no_srv`) VALUES
(147, 'Canyon des Rois', 123),
(258, 'Jardins dorés', 456);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `no_srv` int(11) NOT NULL,
  `nomsrv` varchar(20) NOT NULL,
  PRIMARY KEY (`no_srv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`no_srv`, `nomsrv`) VALUES
(123, 'Statique'),
(456, 'Dynamique');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`no_srv`) REFERENCES `service` (`no_srv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`noprojet`) REFERENCES `projet` (`noprojet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`no_employer`) REFERENCES `employe` (`no_employe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`no_srv`) REFERENCES `service` (`no_srv`) ON DELETE CASCADE ON UPDATE CASCADE;
