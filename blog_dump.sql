--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_id` (`category_id`),
  CONSTRAINT `article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `article_translation`
--

DROP TABLE IF EXISTS `article_translation`;
CREATE TABLE `article_translation` (
  `acticle_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  KEY `article_translation_id` (`acticle_id`),
  KEY `article_language_id` (`language_id`),
  CONSTRAINT `article_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_translation_id` FOREIGN KEY (`acticle_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `category_translation`
--

DROP TABLE IF EXISTS `category_translation`;
CREATE TABLE `category_translation` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `language_id` (`language_id`),
  KEY `translation_category_id` (`category_id`),
  CONSTRAINT `language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `translation_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tag_to_article`
--

DROP TABLE IF EXISTS `tag_to_article`;
CREATE TABLE `tag_to_article` (
  `acticle_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `article_id` (`acticle_id`),
  CONSTRAINT `article_id` FOREIGN KEY (`acticle_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tag_translation`
--

DROP TABLE IF EXISTS `tag_translation`;
CREATE TABLE `tag_translation` (
  `tag_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  KEY `tag_translation_id` (`tag_id`),
  KEY `tag_language_id` (`language_id`),
  CONSTRAINT `tag_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tag_translation_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
