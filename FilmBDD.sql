-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 14 Mai 2017 à 16:01
-- Version du serveur :  5.7.18-0ubuntu0.16.04.1
-- Version de PHP :  7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `FilmBDD`
--

-- --------------------------------------------------------

--
-- Structure de la table `CREER`
--

CREATE TABLE `CREER` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0',
  `DATE_CREATION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `CREER`
--

INSERT INTO `CREER` (`ID_IND`, `ID_SERIE`, `DATE_CREATION`) VALUES
(10, 10, '2008-01-20'),
(10, 11, '2012-10-14'),
(11, 6, '0000-00-00'),
(11, 10, '2008-01-20'),
(11, 11, '2012-10-14'),
(12, 1, '2016-05-11');

-- --------------------------------------------------------

--
-- Structure de la table `EPISODES`
--

CREATE TABLE `EPISODES` (
  `ID_EP` int(4) NOT NULL DEFAULT '0',
  `NOM_EP` varchar(50) DEFAULT NULL,
  `DUREE_EP` int(3) DEFAULT NULL,
  `DATE_EP` date DEFAULT NULL,
  `SUM_EP` varchar(1023) DEFAULT NULL,
  `SAISON_EP` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `EPISODES`
--

INSERT INTO `EPISODES` (`ID_EP`, `NOM_EP`, `DUREE_EP`, `DATE_EP`, `SUM_EP`, `SAISON_EP`, `ID_SERIE`) VALUES
(0, 'Passé décomposé (Days Gone Bye)	', 60, '2010-10-31', NULL, 1, 0),
(1, 'Tripes (Guts)', 60, '2010-11-07', NULL, 1, 0),
(1, 'Vivre libre ou mourir ', 51, '2012-07-15', 'Walter a changé d\'identité. Pour survivre, il doit retrouver les vidéos de Gus et s\'assurer qu\'elles ne tomberont pas entre les mains de Hank. Il lui faut entrer en contact avec Mike, qui est le seul à savoir où sont ces précieux enregistrements. Hélas, la police a déjà saisi les vidéos et les a mises sous scellés...', 1, 7),
(2, 'L\'hiver vient (Winter is Coming)', 60, '2011-04-17', NULL, 0, 1),
(3, 'Sur le ring (Into the Ring)', 60, '2015-04-10', NULL, 0, 2),
(4, 'Cap à l\'ouest', 60, '2013-03-03', NULL, 0, 3),
(5, 'L\'Échiquier politique', 60, '2013-02-01', NULL, 0, 4),
(6, 'L’exil', 60, '2014-03-19', NULL, 0, 5),
(7, 'Cassette 1, Face A', 60, '2017-03-31', NULL, 0, 6),
(10, 'Chute libre', 48, '2008-01-20', 'Episode 1', 1, 10),
(11, '1', 46, '2012-10-14', 'Episode 1', 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `ETRE_DU_GENRE`
--

CREATE TABLE `ETRE_DU_GENRE` (
  `NOM_GENRE` varchar(25) NOT NULL DEFAULT '',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ETRE_DU_GENRE`
--

INSERT INTO `ETRE_DU_GENRE` (`NOM_GENRE`, `ID_SERIE`) VALUES
('Drame', 7),
('Drame', 10),
('Science-Fiction', 10),
('Drame', 11),
('Science-Fiction', 11);

-- --------------------------------------------------------

--
-- Structure de la table `GENRES`
--

CREATE TABLE `GENRES` (
  `NOM_GENRE` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `GENRES`
--

INSERT INTO `GENRES` (`NOM_GENRE`) VALUES
('Action'),
('Aventure'),
('Comédie'),
('Drame'),
('Fantaisie'),
('Romance'),
('Science-fiction'),
('Tous');

-- --------------------------------------------------------

--
-- Structure de la table `INDIVIDUS`
--

CREATE TABLE `INDIVIDUS` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `NOM_IND` varchar(25) DEFAULT NULL,
  `PREN_IND` varchar(25) DEFAULT NULL,
  `CREATEUR` char(1) DEFAULT '-',
  `PRODUCTEUR` char(1) DEFAULT '-',
  `ACTEUR` char(1) DEFAULT '-',
  `REALISATEUR` char(1) DEFAULT '-',
  `DATE_NAISS` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `INDIVIDUS`
--

INSERT INTO `INDIVIDUS` (`ID_IND`, `NOM_IND`, `PREN_IND`, `CREATEUR`, `PRODUCTEUR`, `ACTEUR`, `REALISATEUR`, `DATE_NAISS`) VALUES
(0, ' Lee Cranston', 'Bryan', 'X', 'X', '-', '-', NULL),
(10, 'Gilligan', 'Vince', 'X', '-', '-', '-', NULL),
(11, 'Tokunaga', 'Yuichi', 'X', '-', '-', '-', NULL),
(12, 'Uda', 'Manabu', '-', 'X', '-', '-', '2017-05-14'),
(13, 'Hayafune', 'Kaeko', '-', 'X', '-', '-', NULL),
(14, 'Cranston', 'Bryan', '-', '-', 'X', '-', NULL),
(15, 'Gunn', 'Anna', '-', '-', 'X', '-', NULL),
(16, 'Gould', 'Peter', '-', '-', '-', 'X', NULL),
(17, 'Johnson', 'Mark', '-', '-', '-', 'X', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `JOUER`
--

CREATE TABLE `JOUER` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `ID_EP` int(4) NOT NULL DEFAULT '0',
  `SAISON_EP` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `JOUER`
--

INSERT INTO `JOUER` (`ID_IND`, `ID_EP`, `SAISON_EP`, `ID_SERIE`) VALUES
(14, 10, 1, 10),
(15, 10, 1, 10),
(14, 11, 1, 11),
(15, 11, 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `MESSAGES`
--

CREATE TABLE `MESSAGES` (
  `ID_MSG` int(4) NOT NULL DEFAULT '0',
  `PSEUDO` varchar(25) DEFAULT NULL,
  `ID_SERIE` int(4) DEFAULT NULL,
  `TITRE_MSG` varchar(50) DEFAULT NULL,
  `TXT_MSG` varchar(1024) DEFAULT NULL,
  `DATE_MSG` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `NOTER_EPISODES`
--

CREATE TABLE `NOTER_EPISODES` (
  `PSEUDO` varchar(25) NOT NULL DEFAULT '',
  `ID_EP` int(4) NOT NULL DEFAULT '0',
  `SAISON_EP` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0',
  `NOTE_NE` int(2) DEFAULT NULL,
  `CMT_NE` varchar(255) DEFAULT NULL,
  `DATE_NE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `NOTER_EPISODES`
--

INSERT INTO `NOTER_EPISODES` (`PSEUDO`, `ID_EP`, `SAISON_EP`, `ID_SERIE`, `NOTE_NE`, `CMT_NE`, `DATE_NE`) VALUES
('', 10, 1, 10, 10, 'super', '2017-05-03 14:42:20'),
('', 11, 1, 11, 10, 'super', '2017-05-03 14:42:20'),
('Papa', 10, 1, 10, 6, 'pas mal', '2017-05-10 19:56:17'),
('ss', 10, 1, 10, 8, 'bien', '2017-05-03 14:42:20'),
('ss', 11, 1, 11, 8, 'bien', '2017-05-03 14:42:20');

-- --------------------------------------------------------

--
-- Structure de la table `NOTER_SERIES`
--

CREATE TABLE `NOTER_SERIES` (
  `PSEUDO` varchar(25) NOT NULL DEFAULT '',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0',
  `NOTE_NS` int(2) DEFAULT NULL,
  `CMT_NS` varchar(255) DEFAULT NULL,
  `DATE_NS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `NOTER_SERIES`
--

INSERT INTO `NOTER_SERIES` (`PSEUDO`, `ID_SERIE`, `NOTE_NS`, `CMT_NS`, `DATE_NS`) VALUES
('', 10, 10, 'super', '2017-05-03 14:42:09'),
('', 11, 10, 'super', '2017-05-03 14:42:09'),
('ali', 10, NULL, NULL, '2017-05-03 14:42:09'),
('azerr', 0, NULL, NULL, '2017-05-03 14:42:09'),
('azerr', 10, NULL, NULL, '2017-05-03 14:42:09'),
('Papa', 10, NULL, NULL, '2017-05-03 14:42:09'),
('ss', 10, 8, 'bien', '2017-05-03 14:42:09'),
('ss', 11, 8, 'bien', '2017-05-03 14:42:09'),
('titi', 5, 6, 'ok', '2017-05-03 14:42:09'),
('titi', 10, 2, 'rfrff', '2017-05-03 14:42:09');

-- --------------------------------------------------------

--
-- Structure de la table `PHOTO_INDIVIDU`
--

CREATE TABLE `PHOTO_INDIVIDU` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `URL` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `PHOTO_INDIVIDU`
--

INSERT INTO `PHOTO_INDIVIDU` (`ID_IND`, `URL`) VALUES
(10, 'img/Vince_Gilligan.jpg'),
(11, 'img/tokunaga_yuichi.jpg'),
(12, 'http://cdn.mydramalist.info/images/people/23934.jpg'),
(13, 'img/hayafune_kaeko.jpg'),
(14, 'img/Bryan_Cranston.jpg'),
(15, 'img/Anna_Gunn.jpg'),
(16, 'img/Peter_Gould.jpg'),
(17, 'img/johnson_mark.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `PHOTO_SERIE`
--

CREATE TABLE `PHOTO_SERIE` (
  `ID_SERIE` int(4) NOT NULL DEFAULT '0',
  `URL` varchar(200) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `PHOTO_SERIE`
--

INSERT INTO `PHOTO_SERIE` (`ID_SERIE`, `URL`) VALUES
(0, 'http://images.affiches-et-posters.com//albums/3/4130/4130-affiche-serie-tv-the-walking-dead.jpg'),
(0, 'https://lh3.googleusercontent.com/-BTCuzkTaUaM/AAAAAAAAAAI/AAAAAAAADB8/gSU34UNhz7M/photo.jpg'),
(1, 'http://marvelll.fr/wp-content/uploads/2014/06/game-of-thrones-saison-4-poster.jpg'),
(1, 'https://lh4.googleusercontent.com/-XRgsbNo6R4g/AAAAAAAAAAI/AAAAAAAAF1Q/f5xscN3KNLQ/photo.jpg'),
(2, 'https://i.annihil.us/u/prod/marvel/i/mg/8/f0/55141acf4ba76/standard_fantastic.jpg'),
(3, 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Vikings_logo.png'),
(4, 'http://external-images.premiere.fr/var/premiere/storage/images/series/house-of-cards-us-2554460/38447439-4-fre-FR/House-of-Cards-US.jpg'),
(5, 'https://upload.wikimedia.org/wikipedia/en/6/6c/Logo_of_the_100.jpg'),
(6, 'http://www.gstatic.com/tv/thumb/tvbanners/13762579/p13762579_b_v8_aa.jpg'),
(7, 'http://images.amcnetworks.com/amc.com/wp-content/uploads/2010/12/breaking-bad-S5-400x600-compressedV1.jpg'),
(10, 'https://media.senscritique.com/media/000006469472/source_big/Breaking_Bad.jpg'),
(11, 'img/tokyo_airport.jpg'),
(12, 'http://fr.web.img5.acsta.net/c_160_214/pictures/16/10/25/14/34/023324.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `PRODUIRE`
--

CREATE TABLE `PRODUIRE` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `PRODUIRE`
--

INSERT INTO `PRODUIRE` (`ID_IND`, `ID_SERIE`) VALUES
(12, 1),
(13, 1),
(12, 10),
(13, 10);

-- --------------------------------------------------------

--
-- Structure de la table `REALISER`
--

CREATE TABLE `REALISER` (
  `ID_IND` int(4) NOT NULL DEFAULT '0',
  `ID_EP` int(4) NOT NULL DEFAULT '0',
  `SAISON_EP` int(4) NOT NULL DEFAULT '0',
  `ID_SERIE` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `REALISER`
--

INSERT INTO `REALISER` (`ID_IND`, `ID_EP`, `SAISON_EP`, `ID_SERIE`) VALUES
(16, 10, 1, 10),
(17, 10, 1, 10),
(16, 11, 1, 11),
(17, 11, 1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `REPONSES`
--

CREATE TABLE `REPONSES` (
  `ID_RPS` int(4) NOT NULL DEFAULT '0',
  `PSEUDO` varchar(25) DEFAULT NULL,
  `ID_MSG` int(4) DEFAULT NULL,
  `TXT_RPS` varchar(1024) DEFAULT NULL,
  `DATE_RPS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `SERIES`
--

CREATE TABLE `SERIES` (
  `ID_SERIE` int(4) NOT NULL DEFAULT '0',
  `TITRE_SERIE` varchar(25) DEFAULT NULL,
  `ANNEE_SERIE` int(11) DEFAULT NULL,
  `PAYS_SERIE` varchar(25) DEFAULT NULL,
  `SUM_SERIE` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `SERIES`
--

INSERT INTO `SERIES` (`ID_SERIE`, `TITRE_SERIE`, `ANNEE_SERIE`, `PAYS_SERIE`, `SUM_SERIE`) VALUES
(0, 'The Walking Dead', 2010, 'USA', 'The Walking Dead est une série télévisée d\'horreur / dramatique américaine, adaptée par Frank Darabont et Robert Kirkman, créateur de la bande dessinée du même nom.'),
(1, 'Game of Thrones', 2011, 'USA', 'Game of Thrones, également désignée par le titre français de l\'œuvre romanesque dont elle est adaptée, Le Trône de fer, est une série télévisée américaine médiéval-fantastique créée par David Benioff et D. B.'),
(2, 'Daredevil', 2015, 'USA', ''),
(3, 'Vikings', 2013, 'USA', ''),
(4, 'House of Cards', 2013, 'USA', ''),
(5, 'The 100', 2014, 'USA', ''),
(6, '13 Reasons Why ', 2017, 'USA', ''),
(7, 'Breaking Bad', 2008, 'USA', 'Walter White, 50 ans, est professeur de chimie dans un lycée du Nouveau-Mexique. Pour subvenir aux besoins de Skyler, sa femme enceinte, et de Walt Junior, son fils handicapé, il est obligé de travailler doublement. Son quotidien déjà morose devient carrément noir lorsqu\'il apprend qu\'il est atteint d\'un incurable cancer des poumons. Les médecins ne lui donnent pas plus de deux ans à vivre. Pour réunir rapidement beaucoup d\'argent afin de mettre sa famille à l\'abri, Walter ne voit plus qu\'une solution : mettre ses connaissances en chimie à profit pour fabriquer et vendre du crystal meth, une drogue de synthèse qui rapporte beaucoup. Il propose à Jesse, un de ses anciens élèves devenu un petit dealer de seconde zone, de faire équipe avec lui. Le duo improvisé met en place un labo itinérant dans un vieux camping-car. Cette association inattendue va les entraîner dans une série de péripéties tant comiques que pathétiques.'),
(10, 'Breaking Bad', 2008, 'Etats-Unis', 'Walter White, 50 ans, est professeur de chimie dans un lycée du Nouveau-Mexique. Pour subvenir aux besoins de Skyler, sa femme enceinte, et de Walt Junior, son fils handicapé, il est obligé de travailler doublement.'),
(11, 'Tokyo Airport', 2012, 'Japon', 'Shinoda Kaori travaillait dans le personnel au sol de la compagnie aérienne Japan Airlines à l\'aéroport international de Haneda, mais elle décide un jour de devenir contrôleuse aérienne. Lorsqu\'elle fait ses débuts au simulateur sous la supervision de sa tutrice Takeuchi Yumi, Shinoda a tendance parfois à privilégier un tant soit peu le rendement sur la sécurité, pourtant priorité absolue dans son nouveau métier. Cependant à force de persévérance et d\'observation, Shinoda va corriger ses défauts et parvenir à obtenir officiellement le droit de travailler dans la tour de contrôle de Haneda. Mais le plus dur est encore à venir.'),
(12, 'The defenders', 2017, 'USA', 'Adaptation du comic book Marvel homonyme, réunissant Daredevil, Luke Cage, Iron Fist et Jessica Jones.');

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEURS`
--

CREATE TABLE `UTILISATEURS` (
  `PSEUDO` varchar(25) NOT NULL DEFAULT '',
  `PWD` varchar(30) DEFAULT NULL,
  `DATE_INSC` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SEXE` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `UTILISATEURS`
--

INSERT INTO `UTILISATEURS` (`PSEUDO`, `PWD`, `DATE_INSC`, `SEXE`) VALUES
('', 'az', '2017-05-03 13:46:06', 'H'),
('alba', '', '2017-05-05 09:51:22', NULL),
('ali', 'ali', '2017-05-14 10:46:29', 'F'),
('aze', 'aze', '2017-05-14 10:35:48', 'F'),
('azer', 'azer', '2017-05-14 10:38:38', 'F'),
('azerr', 'azerr', '2017-05-14 10:45:24', 'M'),
('dfgdf', '38d7355701b6f3760ee49852904319', '2017-05-04 09:38:12', 'M'),
('hjhj', '', '2017-05-05 09:34:43', NULL),
('iio', '01e3d9f68cc930879f6ae87528759f', '2017-05-04 09:21:16', 'M'),
('kiki', 'kirrWKl4qskeg', '2017-05-04 08:06:56', NULL),
('lol', 'fgergq', '2017-05-05 09:54:13', 'F'),
('Papa', '', '2013-09-22 14:19:43', 'H'),
('qsd', 'qsd', '2017-05-04 07:13:04', 'H'),
('root', 'root', '2017-05-14 10:25:46', 'M'),
('ss', 'qs', '2017-05-03 14:35:07', 'M'),
('test', 'ttt', '2017-05-07 17:59:33', 'M'),
('titi', 'toto', '2017-05-05 12:09:36', NULL),
('ty', 'uihij', '2017-05-05 09:36:07', 'H'),
('tyui', 'apmk', '2017-05-05 09:35:49', 'H');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `CREER`
--
ALTER TABLE `CREER`
  ADD PRIMARY KEY (`ID_IND`,`ID_SERIE`),
  ADD KEY `FK_CREER_SERIES` (`ID_SERIE`);

--
-- Index pour la table `EPISODES`
--
ALTER TABLE `EPISODES`
  ADD PRIMARY KEY (`ID_EP`,`SAISON_EP`,`ID_SERIE`),
  ADD KEY `FK_EPISODE_SERIES` (`ID_SERIE`);

--
-- Index pour la table `ETRE_DU_GENRE`
--
ALTER TABLE `ETRE_DU_GENRE`
  ADD PRIMARY KEY (`NOM_GENRE`,`ID_SERIE`),
  ADD KEY `FK_EDG_SERIES` (`ID_SERIE`);

--
-- Index pour la table `GENRES`
--
ALTER TABLE `GENRES`
  ADD PRIMARY KEY (`NOM_GENRE`);

--
-- Index pour la table `INDIVIDUS`
--
ALTER TABLE `INDIVIDUS`
  ADD PRIMARY KEY (`ID_IND`);

--
-- Index pour la table `JOUER`
--
ALTER TABLE `JOUER`
  ADD PRIMARY KEY (`ID_IND`,`ID_EP`,`SAISON_EP`,`ID_SERIE`),
  ADD KEY `FK_JOUER_EPISODE` (`ID_EP`,`SAISON_EP`,`ID_SERIE`);

--
-- Index pour la table `MESSAGES`
--
ALTER TABLE `MESSAGES`
  ADD PRIMARY KEY (`ID_MSG`),
  ADD KEY `FK_MSG_UTILI` (`PSEUDO`),
  ADD KEY `FK_MSG_SERIE` (`ID_SERIE`);

--
-- Index pour la table `NOTER_EPISODES`
--
ALTER TABLE `NOTER_EPISODES`
  ADD PRIMARY KEY (`PSEUDO`,`ID_EP`,`SAISON_EP`,`ID_SERIE`),
  ADD KEY `FK_NE_EP` (`ID_EP`,`SAISON_EP`,`ID_SERIE`);

--
-- Index pour la table `NOTER_SERIES`
--
ALTER TABLE `NOTER_SERIES`
  ADD PRIMARY KEY (`PSEUDO`,`ID_SERIE`),
  ADD KEY `FK_NS_SERIE` (`ID_SERIE`);

--
-- Index pour la table `PHOTO_INDIVIDU`
--
ALTER TABLE `PHOTO_INDIVIDU`
  ADD PRIMARY KEY (`ID_IND`,`URL`);

--
-- Index pour la table `PHOTO_SERIE`
--
ALTER TABLE `PHOTO_SERIE`
  ADD PRIMARY KEY (`ID_SERIE`,`URL`);

--
-- Index pour la table `PRODUIRE`
--
ALTER TABLE `PRODUIRE`
  ADD PRIMARY KEY (`ID_IND`,`ID_SERIE`),
  ADD KEY `FK_PRODUIRE_SERIES` (`ID_SERIE`);

--
-- Index pour la table `REALISER`
--
ALTER TABLE `REALISER`
  ADD PRIMARY KEY (`ID_IND`,`ID_EP`,`SAISON_EP`,`ID_SERIE`),
  ADD KEY `FK_REALISER_EPISODE` (`ID_EP`,`SAISON_EP`,`ID_SERIE`);

--
-- Index pour la table `REPONSES`
--
ALTER TABLE `REPONSES`
  ADD PRIMARY KEY (`ID_RPS`),
  ADD KEY `FK_RPS_UTILI` (`PSEUDO`),
  ADD KEY `FK_RPS_SERIE` (`ID_MSG`);

--
-- Index pour la table `SERIES`
--
ALTER TABLE `SERIES`
  ADD PRIMARY KEY (`ID_SERIE`);

--
-- Index pour la table `UTILISATEURS`
--
ALTER TABLE `UTILISATEURS`
  ADD PRIMARY KEY (`PSEUDO`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `CREER`
--
ALTER TABLE `CREER`
  ADD CONSTRAINT `FK_CREER_INDIVIDUS` FOREIGN KEY (`ID_IND`) REFERENCES `INDIVIDUS` (`ID_IND`),
  ADD CONSTRAINT `FK_CREER_SERIES` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`);

--
-- Contraintes pour la table `EPISODES`
--
ALTER TABLE `EPISODES`
  ADD CONSTRAINT `FK_EPISODE_SERIES` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`);

--
-- Contraintes pour la table `ETRE_DU_GENRE`
--
ALTER TABLE `ETRE_DU_GENRE`
  ADD CONSTRAINT `FK_EDG_GENRES` FOREIGN KEY (`NOM_GENRE`) REFERENCES `GENRES` (`NOM_GENRE`),
  ADD CONSTRAINT `FK_EDG_SERIES` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`);

--
-- Contraintes pour la table `JOUER`
--
ALTER TABLE `JOUER`
  ADD CONSTRAINT `FK_JOUER_EPISODE` FOREIGN KEY (`ID_EP`,`SAISON_EP`,`ID_SERIE`) REFERENCES `EPISODES` (`ID_EP`, `SAISON_EP`, `ID_SERIE`),
  ADD CONSTRAINT `FK_JOUER_INDIVIDUS` FOREIGN KEY (`ID_IND`) REFERENCES `INDIVIDUS` (`ID_IND`);

--
-- Contraintes pour la table `MESSAGES`
--
ALTER TABLE `MESSAGES`
  ADD CONSTRAINT `FK_MSG_SERIE` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`),
  ADD CONSTRAINT `FK_MSG_UTILI` FOREIGN KEY (`PSEUDO`) REFERENCES `UTILISATEURS` (`PSEUDO`);

--
-- Contraintes pour la table `NOTER_EPISODES`
--
ALTER TABLE `NOTER_EPISODES`
  ADD CONSTRAINT `FK_NE_EP` FOREIGN KEY (`ID_EP`,`SAISON_EP`,`ID_SERIE`) REFERENCES `EPISODES` (`ID_EP`, `SAISON_EP`, `ID_SERIE`),
  ADD CONSTRAINT `FK_NE_UTILI` FOREIGN KEY (`PSEUDO`) REFERENCES `UTILISATEURS` (`PSEUDO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `NOTER_SERIES`
--
ALTER TABLE `NOTER_SERIES`
  ADD CONSTRAINT `FK_NS_SERIE` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`),
  ADD CONSTRAINT `FK_NS_UTILI` FOREIGN KEY (`PSEUDO`) REFERENCES `UTILISATEURS` (`PSEUDO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `PHOTO_INDIVIDU`
--
ALTER TABLE `PHOTO_INDIVIDU`
  ADD CONSTRAINT `FK_PHOTO_INDIVIDU` FOREIGN KEY (`ID_IND`) REFERENCES `INDIVIDUS` (`ID_IND`);

--
-- Contraintes pour la table `PHOTO_SERIE`
--
ALTER TABLE `PHOTO_SERIE`
  ADD CONSTRAINT `FK_PHOTO_SERIE` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`);

--
-- Contraintes pour la table `PRODUIRE`
--
ALTER TABLE `PRODUIRE`
  ADD CONSTRAINT `FK_PRODUIRE_INDIVIDUS` FOREIGN KEY (`ID_IND`) REFERENCES `INDIVIDUS` (`ID_IND`),
  ADD CONSTRAINT `FK_PRODUIRE_SERIES` FOREIGN KEY (`ID_SERIE`) REFERENCES `SERIES` (`ID_SERIE`);

--
-- Contraintes pour la table `REALISER`
--
ALTER TABLE `REALISER`
  ADD CONSTRAINT `FK_REALISER_EPISODE` FOREIGN KEY (`ID_EP`,`SAISON_EP`,`ID_SERIE`) REFERENCES `EPISODES` (`ID_EP`, `SAISON_EP`, `ID_SERIE`),
  ADD CONSTRAINT `FK_REALISER_INDIVIDUS` FOREIGN KEY (`ID_IND`) REFERENCES `INDIVIDUS` (`ID_IND`);

--
-- Contraintes pour la table `REPONSES`
--
ALTER TABLE `REPONSES`
  ADD CONSTRAINT `FK_RPS_SERIE` FOREIGN KEY (`ID_MSG`) REFERENCES `MESSAGES` (`ID_MSG`),
  ADD CONSTRAINT `FK_RPS_UTILI` FOREIGN KEY (`PSEUDO`) REFERENCES `UTILISATEURS` (`PSEUDO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
