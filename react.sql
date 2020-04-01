-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2020 at 12:27 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `react`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(100) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `ph_no` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `ph_no`, `msg`, `date`) VALUES
(1, 'ABC', 'abc_a@gmail.com', '9876543210', 'Hello World', '2020-03-29 23:18:40'),
(2, 'ABCD', 'abc@gmail.com', '6767676767', 'MSG', '2020-03-29 23:21:06'),
(3, 'ABCDE', 'abcd@gmail.com', '4545454545', 'HELLO GUYS .... JUST A TEST MSG.', '2020-03-29 23:55:47'),
(7, 'ABCDEFGH', 'abcdefgh@gmail.com', '8687587587', 'Hi guys!!!...', '2020-03-31 00:20:52'),
(8, '', '', '', '', '2020-03-31 20:45:40'),
(9, '', '', '', '', '2020-03-31 20:59:03'),
(10, '', '', '', '', '2020-03-31 21:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(100) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(35) NOT NULL,
  `subtitle` text NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `subtitle`, `content`, `img_file`, `date`) VALUES
(1, 'First', 'first-blog-value', 'Just for knowledge', 'This is the first test blog application made using flux and phpmyadmin mysql.Hope i will upload it soon.', 'post-sample-image.jpg', '2020-03-31 22:24:05'),
(2, 'Second', 'second-blog-value', 'Dog ', 'The domestic dog (Canis familiaris when considered a distinct species or Canis lupus familiaris when considered a subspecies of the wolf)[5] is a member of the genus Canis (canines), which forms part of the wolf-like canids,and is the most widely abundant terrestrial carnivore.The dog and the extant gray wolf are sister taxa as modern wolves are not closely related to the wolves that were first domesticated,which implies that the direct ancestor of the dog is extinct.The dog was the first species to be domesticated,and has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes.', 'dog.jpg', '2020-03-31 02:10:32'),
(3, 'Third', 'third-blog-value', 'Cat', 'The cat is similar in anatomy to the other felid species: it has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey. Its night vision and sense of smell are well developed. Cat communication includes vocalizations like meowing, purring, trilling, hissing, growling and grunting as well as cat-specific body language. It is a solitary hunter but a social species. It can hear sounds too faint or too high in frequency for human ears, such as those made by mice and other small mammals. It is a predator that is most active at dawn and dusk.[7] It secretes and perceives pheromones.[8]\r\n\r\nFemale domestic cats can have kittens from spring to late autumn, with litter sizes ranging from two to five kittens.[9] Domestic cats are bred and shown at events as registered pedigreed cats, a hobby known as cat fancy. Failure to control breeding of pet cats by spaying and neutering, as well as abandonment of pets, resulted in large numbers of feral cats worldwide, contributing to the extinction of entire bird species and evoking population control.', 'cat.jpg', '2020-03-31 02:31:43'),
(4, 'Fourth', 'fourth-blog-value', 'Rat', 'The best-known rat species are the black rat (Rattus rattus) and the brown rat (Rattus norvegicus). This group, generally known as the Old World rats or true rats, originated in Asia. Rats are bigger than most Old World mice, which are their relatives, but seldom weigh over 500 grams (1.1 lb) in the wild.[1]\r\n\r\nThe term rat is also used in the names of other small mammals that are not true rats. Examples include the North American pack rats (aka wood rats[2]) and a number of species loosely called kangaroo rats.[2] Rats such as the bandicoot rat (Bandicota bengalensis) are murine rodents related to true rats but are not members of the genus Rattus.\r\n\r\nMale rats are called bucks; unmated females, does, pregnant or parent females, dams; and infants, kittens or pups. A group of rats is referred to as a mischief.[3]\r\n\r\nThe common species are opportunistic survivors and often live with and near humans; therefore, they are known as commensals. They may cause substantial food losses, especially in developing countries.[4] However, the widely distributed and problematic commensal species of rats are a minority in this diverse genus. Many species of rats are island endemics, some of which have become endangered due to habitat loss or competition with the brown, black, or Polynesian rat', 'rat.jpg', '2020-03-31 02:31:43'),
(5, 'Fifth', 'fifth-blog-value', 'Horse', 'The horse (Equus ferus caballus)[2][3] is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BC, and their domestication is believed to have been widespread by 3000 BC. Horses in the subspecies caballus are domesticated, although some domesticated populations live in the wild as feral horses. These feral populations are not true wild horses, as this term is used to describe horses that have never been domesticated, such as the endangered Przewalski\'s horse, a separate subspecies, and the only remaining true wild horse. There is an extensive, specialized vocabulary used to describe equine-related concepts, covering everything from anatomy to life stages, size, colors, markings, breeds, locomotion, and behavior.\r\n\r\nHorses are adapted to run, allowing them to quickly escape predators, possessing an excellent sense of balance and a strong fight-or-flight response. Related to this need to flee from predators in the wild is an unusual trait: horses are able to sleep both standing up and lying down, with younger horses tending to sleep significantly more than adults.[4] Female horses, called mares, carry their young for approximately 11 months, and a young horse, called a foal, can stand and run shortly following birth. Most domesticated horses begin training under a saddle or in a harness between the ages of two and four. They reach full adult development by age five, and have an average lifespan of between 25 and 30 years.', 'horse.jpg', '2020-03-31 02:31:43'),
(6, 'Sixth', 'sixth-blog-value', 'tiger', 'The tiger (Panthera tigris) is the largest species among the Felidae and classified in the genus Panthera. It is most recognisable for its dark vertical stripes on orangish-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar. It is territorial and generally a solitary but social predator, requiring large contiguous areas of habitat, which support its requirements for prey and rearing of its offspring. Tiger cubs stay with their mother for about two years, before they become independent and leave their mother\'s home range to establish their own.\r\n\r\nThe tiger once ranged widely from the Eastern Anatolia Region in the west to the Amur River basin, and in the south from the foothills of the Himalayas to Bali in the Sunda islands. Since the early 20th century, tiger populations have lost at least 93% of their historic range and have been extirpated in Western and Central Asia, from the islands of Java and Bali, and in large areas of Southeast and South Asia and China. Today\'s tiger range is fragmented, stretching from Siberian temperate forests to subtropical and tropical forests on the Indian subcontinent and Sumatra.', 'tiger.jpg', '2020-03-31 02:31:43'),
(11, 'Seventh', 'seventh-blog-value', 'Cow', 'Cows are members of the order Artiodactyla. The order contains even-toed hoofed mammals, and cows have distinctive cloven hooves (derived from the toenails from the middle two digits of each foot). Cows belong to the family Bovidae (hollow-horned ruminants, which also includes antelope, sheep, and goats), subfamily Bovinae (which includes buffaloes and spiral-horned antelope), tribe Bovini (which includes cattle, bison, and yak), and genus Bos—the names of which are all derived from bos, the Latin word for cow.', 'cow.jpg', '2020-04-01 01:36:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
