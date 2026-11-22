-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2026 at 07:39 PM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clarke_jake_php_listing_pages`
--
DROP DATABASE IF EXISTS  `clarke_jake_php_listing_pages`;
CREATE DATABASE  `clarke_jake_php_listing_pages`;
-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `clarke_jake_php_listing_pages`.`books`;
CREATE TABLE IF NOT EXISTS `clarke_jake_php_listing_pages`.`books` (
  `id` int UNSIGNED NOT NULL,
  `book_title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_author` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `book_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `book_synopsis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books_genre`
--

DROP TABLE IF EXISTS `clarke_jake_php_listing_pages`.`books_genre`;
CREATE TABLE IF NOT EXISTS `clarke_jake_php_listing_pages`.`books_genre` (
 `lovecraftian` int NOT NULL,
  `classic` int NOT NULL,
  `post apocalyptic` int NOT NULL,
  `horror` int NOT NULL,
  `steampunk` int NOT NULL,
  `book_id` int UNSIGNED NOT NULL,
   `genre_id` int UNSIGNED NOT NULL,
  CONSTRAINT `genre_books`
  FOREIGN KEY (`book_id`) REFERENCES books(`id`),
  PRIMARY KEY (`genre_id`)
) ENGINE=INNODB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `clarke_jake_php_listing_pages`.`genres`;
CREATE TABLE IF NOT EXISTS `clarke_jake_php_listing_pages`.`genres` (
  `book_id` int UNSIGNED NOT NULL,
  `genre_id` int UNSIGNED NOT NULL,
  CONSTRAINT `genres_books`
  FOREIGN KEY (`book_id`) REFERENCES books(`id`),
  CONSTRAINT `genres_books_genre`
  FOREIGN KEY (`genre_id`) REFERENCES books_genre(`genre_id`)
) ENGINE=INNODB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

INSERT INTO `clarke_jake_php_listing_pages`.`books`(`id`, `book_title`,`book_author`,`book_image`, `book_description`, `book_synopsis`) VALUES
(1, 'The King in Yellow', 'Robert W. Chambers', 'images\king-in-yellow.jpg', 'The King in Yellow is a classic collection of supernatural horror and weird fiction stories by Robert W. Chambers, published in 1895. The book is named after a fictional play that drives readers mad with its revelations of the mysterious realm of Carcosa.', 'The King in Yellow is a short story collection by American writer Robert W. Chambers. The book contains nine short stories and a sequence of poems'),
(2, 'THE ILLIAD', 'HOMER - TRANSLATION BY CAROLINE ALEXANDER', 'images\the-illiad.jpg', 'Soldier and civilian, victor and vanquished, hero and coward, men, women, young, old―The Iliad evokes in poignant, searing detail the fate of every life ravaged by the Battle of Troy. And, as told by Homer, this ancient epic of a particular Bronze Age conflict becomes a sublime and sweeping evocation of the destruction of war throughout the ages.', 'Composed around 730 B.C., Homers Iliad recounts the events of a few momentous weeks in the protracted ten-year military war between the invading Achaeans, or Greeks, and the Trojans in their besieged city of Ilion. From the explosive confrontation between Achilles, the greatest warrior at Troy, and Agamemnon, the inept leader of the Greeks, through to its tragic conclusion, this foundational work of ancient Greek literature explores the abiding, blighting facts of war.'),
(3, 'METRO 2033', 'DMITRY GLUKHOVSKY', 'images\metro-2033.jpg', 'In 2013, a nuclear war forced a large amount of Moscows surviving population to relocate to the citys Metro system in search of refuge. Eventually, communities settled within the underground train stations and developed into independent states over time.  While most of the stations were controlled by the three main factions, some stations formed independent alliances, including the station VDNKh (Exhibition). Within that station, the events of Metro 2033 unfold.', 'Metro 2033 (Russian: Метро 2033) is a 2002 post-apocalyptic fiction novel by Russian author Dmitry Glukhovsky. It is set within the Moscow Metro, where the last survivors hide after a global nuclear holocaust'),
(4, 'THE BURIAL TIDE', 'Neil Sharpson', 'images\the-burial-tide.jpg', 'A woman who cant remember her death. On an eerily quiet island off the coast of Ireland, a woman with no memory claws her way out of her grave and back to life. But not everyone welcomes the return of Mara Fitch.', 'Drawing on the creatures and horrors of Irish folklore, The Burial Tide unearths our darkest truths: how far wed go to win our freedom, and how quickly our desires can become monstrous.'),
(5, 'Lord of Mysteries', 'Cuttlefish That Loves Diving', 'images/lord-of-mysteries.jpg', 'In the storm of steam and machinery, who can achieve the extraordinary? In the fog of history and darkness, who whispers? When Zhou Mingrui wakes up bloody and dazed, he finds himself in a world of guns, factories, airships, and difference engines. But underneath the surface of all this industry, there exists a secret society revolving around potions, divination, sealed artifacts, and much more.', 'As Zhou Mingrui tries to find out what brought him to this place, he quickly learns that mystery is lurking around every corner―and danger is never far behind! This is the legend of the Fool…');

-- INSERT INTO `clarke_jake_php_listing_pages`.`genres`(`book_id`, `genre_id`) VALUES
--    (1, lovecraftian)
--     , (2, classic)
--     , (3, post-apocalyptic)
--     , (4, horror)
--     , (5, steampunk)
--     ;