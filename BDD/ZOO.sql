-- Sam BZEZ SQL Dump
-- version 4.7.5
-- http://samirm.e2simplon.fr
--
-- Hôte : localhost
-- Généré le :  jeu. 02 nov. 2017 à 22:01
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ZOO`
--

-- --------------------------------------------------------

--
-- Structure de la table `aliments`
--

CREATE TABLE `aliments` (
  `id_aliments` int(10) NOT NULL,
  `nomAliments` varchar(255) NOT NULL,
  `id_fournisseurs` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `aliments`
--

INSERT INTO `aliments` (`id_aliments`, `nomAliments`, `id_fournisseurs`) VALUES
(1, 'Carcasse bovin', 1),
(2, 'Carcasse vollaile', 1),
(3, 'Carcasse porcine', 1),
(4, 'Souris', 4),
(5, 'Insectes', 4),
(6, 'Larves', 4),
(9, 'Harengs', 3),
(10, 'Sardines', 3),
(11, 'Crustacés', 3),
(12, 'Bambou', 2),
(13, 'Bannanes ', 2),
(14, 'Eucalyptus', 2),
(15, 'Mix de Fruits & Légumes', 2);

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `id_animaux` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `dateNaissance` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id_animaux`, `nom`, `dateNaissance`) VALUES
(1, 'Alligator', '1985-02-03 01:00:00'),
(2, 'Chimpanzé', '1984-02-03 01:00:00'),
(3, 'Éléphant', '2017-11-03 00:00:00'),
(4, 'Girafe', '2016-12-26 00:00:00'),
(5, 'Gorille', '2013-03-26 10:00:00'),
(6, 'Hippopotame', '2005-11-15 04:10:03'),
(7, 'Koala', '2009-11-28 07:00:00'),
(8, 'Lamantin', '2004-02-18 07:20:00'),
(9, 'Orang-outan', '1999-06-28 12:00:00'),
(10, 'Otarie', '2004-05-04 15:10:00'),
(11, 'Panda', '1995-09-28 02:00:00'),
(12, 'Pelican', '2013-01-09 13:37:00'),
(13, 'Rhinocéros', '1992-01-08 14:56:00'),
(14, 'Caméléon', '2014-08-01 04:44:00'),
(15, 'Iguane', '2009-03-07 03:42:00'),
(16, 'Boa', '1999-05-18 18:08:00'),
(17, 'Lion ', '1990-08-01 13:37:00');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id_fournisseurs` int(10) NOT NULL,
  `nomFournisseurs` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id_fournisseurs`, `nomFournisseurs`) VALUES
(1, 'Boucher du coin'),
(2, 'Primeur du secteur'),
(3, 'Poissonnier du quartier'),
(4, 'Animalerie près d\'ici');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id_menus` int(10) NOT NULL,
  `id_repas` int(10) NOT NULL,
  `id_aliments` int(10) NOT NULL,
  `poids` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id_menus`, `id_repas`, `id_aliments`, `poids`) VALUES
(1, 1, 5, 1),
(2, 2, 5, 1),
(3, 3, 5, 1),
(4, 6, 13, 30),
(5, 7, 13, 30),
(6, 18, 15, 150),
(7, 8, 14, 25),
(8, 9, 12, 3),
(9, 9, 15, 5),
(10, 10, 15, 40),
(11, 11, 12, 2),
(12, 14, 14, 50),
(13, 15, 14, 5),
(14, 16, 9, 5),
(15, 16, 10, 5),
(16, 19, 14, 15),
(17, 17, 10, 1),
(18, 17, 9, 1),
(19, 20, 14, 50),
(20, 13, 14, 1),
(21, 12, 15, 1),
(22, 5, 2, 2),
(23, 21, 1, 3),
(24, 21, 3, 3),
(25, 21, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE `repas` (
  `id_repas` int(10) NOT NULL,
  `id_animaux` int(10) NOT NULL,
  `heureRepas` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `repas`
--

INSERT INTO `repas` (`id_repas`, `id_animaux`, `heureRepas`) VALUES
(1, 14, '22:00:00'),
(2, 14, '05:30:00'),
(3, 14, '14:00:00'),
(4, 1, '23:00:00'),
(5, 16, '22:30:00'),
(6, 2, '10:00:00'),
(7, 2, '19:00:00'),
(8, 4, '12:00:00'),
(9, 5, '11:00:00'),
(10, 6, '22:30:00'),
(11, 7, '08:15:00'),
(12, 15, '07:30:00'),
(13, 15, '15:30:00'),
(14, 8, '09:30:00'),
(15, 9, '13:45:00'),
(16, 10, '06:00:00'),
(17, 12, '06:15:00'),
(18, 3, '16:15:00'),
(19, 11, '05:45:00'),
(20, 13, '10:30:00'),
(21, 17, '13:37:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aliments`
--
ALTER TABLE `aliments`
  ADD PRIMARY KEY (`id_aliments`),
  ADD KEY `aliments_fk0` (`id_fournisseurs`);

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`id_animaux`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id_fournisseurs`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menus`),
  ADD KEY `menus_fk0` (`id_repas`),
  ADD KEY `menus_fk1` (`id_aliments`);

--
-- Index pour la table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`id_repas`),
  ADD KEY `repas_fk0` (`id_animaux`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aliments`
--
ALTER TABLE `aliments`
  MODIFY `id_aliments` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `animaux`
--
ALTER TABLE `animaux`
  MODIFY `id_animaux` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id_fournisseurs` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `repas`
--
ALTER TABLE `repas`
  MODIFY `id_repas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aliments`
--
ALTER TABLE `aliments`
  ADD CONSTRAINT `aliments_fk0` FOREIGN KEY (`id_fournisseurs`) REFERENCES `fournisseurs` (`id_fournisseurs`);

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_fk0` FOREIGN KEY (`id_repas`) REFERENCES `repas` (`id_repas`),
  ADD CONSTRAINT `menus_fk1` FOREIGN KEY (`id_aliments`) REFERENCES `aliments` (`id_aliments`);

--
-- Contraintes pour la table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `repas_fk0` FOREIGN KEY (`id_animaux`) REFERENCES `animaux` (`id_animaux`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
