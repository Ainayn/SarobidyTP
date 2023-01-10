-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 10 Janvier 2023 à 14:50
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bdgestion_des_commandes`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(20) NOT NULL,
  `cat_reference` varchar(20) NOT NULL,
  `cat_remise` varchar(20) NOT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`num_categorie`, `nom_categorie`, `cat_reference`, `cat_remise`) VALUES
(159, 'Kit Camping', 'R123', '50'),
(357, 'Kit Santé', 'R456', '30'),
(826, 'Multimedia', 'F246', '20');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `Client_id` int(11) NOT NULL,
  `Client_civilite` varchar(20) NOT NULL,
  `Client_nom` varchar(20) NOT NULL,
  `Client_prenom` varchar(20) NOT NULL,
  `Client_dep` int(11) NOT NULL,
  `Client_ville` varchar(20) NOT NULL,
  `Numero_de_tel` int(11) NOT NULL,
  PRIMARY KEY (`Client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`Client_id`, `Client_civilite`, `Client_nom`, `Client_prenom`, `Client_dep`, `Client_ville`, `Numero_de_tel`) VALUES
(123456, 'Homme', 'Garcia', 'Tom', 38000, 'Grenoble', 765982145),
(234567, 'Femme', 'Smith', 'Carla', 77453, 'Sivry-Courtry', 625782415),
(345678, 'Femme', 'Leroy', 'Valerie', 92360, 'Meudon', 675254836);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `Com_num` int(11) NOT NULL,
  `Com_date` date NOT NULL,
  `Com_montant` int(11) NOT NULL,
  `Client_id` int(11) NOT NULL,
  `produit_ref` varchar(20) NOT NULL,
  PRIMARY KEY (`Com_num`),
  KEY `Client_id` (`Client_id`),
  KEY `produit_ref` (`produit_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`Com_num`, `Com_date`, `Com_montant`, `Client_id`, `produit_ref`) VALUES
(76543, '2023-01-02', 10, 345678, 'F954'),
(87654, '2022-12-14', 8, 234567, 'A123'),
(98765, '2023-01-10', 30, 123456, 'TC123');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `produit_ref` varchar(20) NOT NULL,
  `produit_nom` varchar(20) NOT NULL,
  `produit_prix` int(11) NOT NULL,
  `produit_poids` int(11) NOT NULL,
  `produit_vues` varchar(20) NOT NULL,
  `produit_stock` int(11) NOT NULL,
  `produit_code` int(11) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  PRIMARY KEY (`produit_ref`),
  KEY `num_categorie` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`produit_ref`, `produit_nom`, `produit_prix`, `produit_poids`, `produit_vues`, `produit_stock`, `produit_code`, `num_categorie`) VALUES
('A123', 'Antibiotique', 8, 0, '2', 80, 4864, 357),
('F954', 'CD Titanic', 10, 0, '12', 300, 8976, 826),
('TC123', 'Tente de Camping', 30, 3, '60', 130, 7865, 159);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `clients` (`Client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`produit_ref`) REFERENCES `produits` (`produit_ref`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`num_categorie`) REFERENCES `categorie` (`num_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;
