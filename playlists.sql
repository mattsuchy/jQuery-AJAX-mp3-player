-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2018 at 04:05 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `playlist`
--

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET hp8 COLLATE hp8_bin NOT NULL,
  `image` varchar(1000) CHARACTER SET hp8 COLLATE hp8_bin NOT NULL,
  `songs` text CHARACTER SET hp8 COLLATE hp8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `image`, `songs`) VALUES
(1, 'First Playlist', 'https://d3l2rivt3pqnj2.cloudfront.net/i/prints/lg/4/3/438767.jpg', '[{\r\n	\"name\": \"They dont care about us\",\r\n	\"url\": \"https://mp3-128.cdn107.com/music/13/53/12/1353126958.mp3\"\r\n}, {\r\n	\"name\": \"Barry White - Youre My First, My Last, My Everything\",\r\n	\"url\": \"https://a.tumblr.com/tumblr_lgeual4Ffl1qa2c94o1.mp3\"\r\n}]'),
(6, 'have a grate day', 'https://cdn7.bigcommerce.com/s-a4w28t94lu/products/75870/images/82862/29807-skyline-backdrop__58244.1492707077.500.500.jpg?c=2', '[{\"name\":\"National Anthem: Togo\",\"url\":\"http:\\/\\/www.noiseaddicts.com\\/samples_1w72b820\\/4275.mp3\"},{\"name\":\"National Anthem: Suriname\",\"url\":\"http:\\/\\/www.noiseaddicts.com\\/samples_1w72b820\\/4266.mp3\"},{\"name\":\"National Anthem: Uganda\",\"url\":\"http:\\/\\/www.noiseaddicts.com\\/samples_1w72b820\\/4280.mp3\"}]'),
(9, 'this is working', 'https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Fimg1.coastalliving.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fimage%2F2012%2F06%2Fbeaches%2F0612_best-beaches-sea-camp-x.jpg', '[{\"name\":\"Brahms Lullaby - flute & piano\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied.mp3\"},{\"name\":\"Brahms Lullaby - piano solo\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied-piano.mp3\"},{\"name\":\"Brahms Lullaby - guitar\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied-guitar.mp3\"}]'),
(12, 'cool 123 cxxcx', 'http://imgs.abduzeedo.com/files/articles/mountain-photography/1318220213_2e3f86afeb.jpg', '[{\"name\":\"They dont care about us\",\"url\":\"https:\\/\\/mp3-128.cdn107.com\\/music\\/13\\/53\\/12\\/1353126958.mp3\"},{\"name\":\"Barry White - Youre My First, My Last, My Everything\",\"url\":\"https:\\/\\/a.tumblr.com\\/tumblr_lgeual4Ffl1qa2c94o1.mp3\"}]'),
(13, 'new 2 12345', 'https://f4.bcbits.com/img/a1385680999_10.jpg', '[{\"name\":\"123\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied.mp3\"},{\"name\":\"234\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied-piano.mp3\"},{\"name\":\"5656\",\"url\":\"https:\\/\\/www.mfiles.co.uk\\/mp3-downloads\\/brahms-lullaby-wiegenlied-guitar.mp3\"}]'),
(14, 'Old and New', 'http://images2.fanpop.com/image/photos/8500000/This-Is-It-CD-Cover-mjs-this-is-it-8559010-500-500.jpg', '[{\"name\":\"SORRY\",\"url\":\"https:\\/\\/freemusicdownloads.world\\/wp-content\\/uploads\\/2017\\/05\\/Justin-Bieber-Sorry-PURPOSE-The-Movement.mp3\"},{\"name\":\"SHAKE IT OFF\",\"url\":\"https:\\/\\/freemusicdownloads.world\\/wp-content\\/uploads\\/2017\\/05\\/Taylor-Swift-Shake-It-Off.mp3\"},{\"name\":\"FIREWORK\",\"url\":\"https:\\/\\/freemusicdownloads.world\\/wp-content\\/uploads\\/2017\\/05\\/Katy-Perry-Firework-Official.mp3\"},{\"name\":\"WANNA BE THAT SONG\",\"url\":\"https:\\/\\/freemusicdownloads.world\\/wp-content\\/uploads\\/2017\\/05\\/Brett-Eldredge-Wanna-Be-That-Song-Official.mp3\"},{\"name\":\"BAD ROMANCE\",\"url\":\"https:\\/\\/freemusicdownloads.world\\/wp-content\\/uploads\\/2017\\/05\\/Beyonc%C3%A9-Single-Ladies-Put-a-Ring-on-It.mp3\"}]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
