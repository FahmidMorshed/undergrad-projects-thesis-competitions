-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2016 at 05:51 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `environment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`admin_id` int(11) NOT NULL,
  `name` longtext,
  `phone` longtext,
  `address` longtext,
  `email` longtext,
  `password` longtext,
  `role` varchar(10) DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  `area_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `phone`, `address`, `email`, `password`, `role`, `type`, `area_id`) VALUES
(1, 'Mr. Master Admin', '', '', 's@yahoo.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1', 'higher_authority', 100),
(2, 'Mr. Accountant', '017', 'dhk', 'a@yahoo.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1', 'local_authority', 1),
(3, 'Mr manager', '021525566', 'Niketon Dhaka', 'manager@shop.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '6', '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `air_pollution`
--

CREATE TABLE IF NOT EXISTS `air_pollution` (
`air_pollution_id` int(11) NOT NULL,
  `air_pollution_type_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `reason` longtext,
  `action` longtext,
  `solution` longtext,
  `status_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `air_pollution`
--

INSERT INTO `air_pollution` (`air_pollution_id`, `air_pollution_type_id`, `area_id`, `employee_id`, `reason`, `action`, `solution`, `status_id`, `name`) VALUES
(1, 1, NULL, 2, 'Voluptatibus dolore tempore, consequatur voluptas sint deleniti et quo quisquam veniam, totam ut rerum dolores consectetur aliquid delectus, odio illum, exercitationem excepturi eveniet, ipsum, consequatur omnis mollitia reprehenderit, sint ex aspernatur rerum in rerum eius aliquip atque dolor veniam, mollitia minus a ut sed repudiandae recusandae. A quidem consectetur dolore dolore voluptate occaecat quis veniam, elit, unde debitis molestias debitis aut sunt autem expedita ea dolores iusto ut mollitia nobis Nam ea consequatur? Magna veniam.', 'Vitae tempora incididunt nulla amet, duis natus recusandae. Do quia nisi vero magna officiis at.', NULL, 1, 'Amelia Park');

-- --------------------------------------------------------

--
-- Table structure for table `air_pollution_type`
--

CREATE TABLE IF NOT EXISTS `air_pollution_type` (
`air_pollution_type_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `air_pollution_type`
--

INSERT INTO `air_pollution_type` (`air_pollution_type_id`, `type`) VALUES
(1, 'Smoking');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
`area_id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `union_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `block` varchar(256) DEFAULT NULL,
  `people` int(11) NOT NULL,
  `length` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `name`, `union_id`, `admin_id`, `status_id`, `block`, `people`, `length`) VALUES
(1, 'Green hosuseing', 1, 2, 1, 'Bolock a,block b,Block c', 1300, 11),
(2, 'Downtown', NULL, 2, 1, 'fdgfd,fdsfd,dfdf', 1212, 3),
(3, 'BUET', 1, 2, 1, 'A, B, C, D', 5000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
`authority_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone` text,
  `address` longtext,
  `area_id` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `performance` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`authority_id`, `name`, `email`, `password`, `phone`, `address`, `area_id`, `status`, `performance`) VALUES
(1, 'Shariful Hasnine Sabuj', 'sabuj@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '01559144799', '311,suhorwardhy hall,buet', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `awareness`
--

CREATE TABLE IF NOT EXISTS `awareness` (
`awareness_id` int(11) NOT NULL,
  `awareness_type` int(11) NOT NULL,
  `pollution_type_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `description` longtext,
  `time` varchar(200) DEFAULT NULL,
  `title` longtext,
  `focus` longtext,
  `aim` longtext
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awareness`
--

INSERT INTO `awareness` (`awareness_id`, `awareness_type`, `pollution_type_id`, `area_id`, `employee_id`, `description`, `time`, `title`, `focus`, `aim`) VALUES
(1, 1, 1, 3, 1, 'Funding is the act of providing financial resources, usually in the form of money, or other values such as effort or time, to finance a need, program, and project, usually by an organisation or government. Generally, this word is used when a firm uses its internal reserves to satisfy its necessity for cash, while the term ‘financing‘ is used when the firms acquires capital from external sources.[1]\r\n\r\nSources of funding include credit, venture capital, donations, grants, savings, subsidies, and taxes. Fundings such as donations, subsidies, and grants that have no direct requirement for return of investment are described as "soft funding" or "crowdfunding". Funding that facilitates the exchange of equity ownership in a company for capital investment via an online funding portal as per the Jumpstart Our Business Startups Act (alternately, the "JOBS Act of 2012") (U.S.) is known as equity crowdfunding.\r\n\r\nFunds can be allocated for either short-term or long-term purposes', '12/03/2016', 'In economics funds are injected into the market as capital by lenders and taken as loans by borrowers.', 'Sources of funding include credit, venture capital, donations, grants, savings, subsidies, and taxes. Fundings such as donations, subsidies, and grants that have no direct requirement for return of investment are described as "soft funding" or "crowdfunding". Funding that facilitates the exchange of equity ownership in a company for capital investment via an online funding portal as per the Jumpstart Our Business Startups Act (alternately, the "JOBS Act of 2012") (U.S.) is known as equity crowdfunding.\r\n\r\nFunds can be allocated for either short-term or long-term purposes.', ' Funding that facilitates the exchange of equity ownership in a company for capital investment via an online funding portal as per the Jumpstart Our Business Startups Act (alternately, the "JOBS Act of 2012") (U.S.) is known as equity crowdfunding.\r\n\r\nFunds can be allocated for either short-term or long-term purposes.'),
(2, 2, 1, 1, 1, 'A new awareness program for noise reduction in the city area for children safety.', '2016-04-14', 'Save a children. A child needs to be protected against noise.', 'Billboard along the road sides and public squares.', 'Make public aware of the damages that is done for excessive noise.');

-- --------------------------------------------------------

--
-- Table structure for table `awareness_type`
--

CREATE TABLE IF NOT EXISTS `awareness_type` (
`awareness_type_id` int(11) NOT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awareness_type`
--

INSERT INTO `awareness_type` (`awareness_type_id`, `type`) VALUES
(1, 'Environment Law'),
(2, 'Awareness Program');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
`blog_id` int(11) NOT NULL,
  `title` longtext,
  `summary` longtext,
  `description` longtext,
  `motivation` longtext,
  `pollution_type_id` int(11) DEFAULT NULL,
  `date` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `title`, `summary`, `description`, `motivation`, `pollution_type_id`, `date`) VALUES
(1, 'Restriction on the driving of vehicles producing smoke harmful to the environment.- ', '(1) There shall not be driven any vehicle producing smoke which is injurious to health or harmful to the environment. \r\n(2) If the General Manager or any officer authorised by him in this behalf is satisfied that any moving vehicle emits smoke which is injurious to health or harmful to the environment, he may immediately stop and examine the vehicle and may give such directions in respect of anything relating to the examination of the vehicle as he thinks necessary.', 'a) co-ordination with the activities of any authority or institution in relation with the purposes of this Act; \r\nb) prevention of accidents which may cause environmental deterioration or pollution, taking security measures and laying down, and giving directions relating to, remedial measures for such accidents; \r\nc) giving advice or, as the case may be, directions to the persons concerned regarding the eco-friendly use, preservation, transport, import or export of hazardous substances or constituents thereof; \r\nd) investigating and examining information etc. relating to the protection, improvement and pollution of the environment and rendering assistance in such work to any other authority or institution; \r\ne) inspection of any places, premises, plants, machinery, manufactoring or other processes, materials or substances for the purpose of improving the environment and controlling and abating environmental pollution and giving of orders or directions to authorities or persons competent for the prevention, control and abatement of environmental pollution; \r\nf) collection, publication and dissemination of information relating to environmental pollution; \r\ng) giving advice to the Government for the avoidance of such manufactoring processes, matters and articles as may pollute the environment; \r\nh) carrying out programmes for the surveillance of the quality of drinking water and making reports and giving advice or, as the case may be, directions to all persons concerned to maintain the standard of drinking water.', 'f) collection, publication and dissemination of information relating to environmental pollution; ', 1, '12/3/2016'),
(2, 'Quisquam non quo ut aliquip labore suscipit voluptatem, et est, saepe voluptas facere consequatur, hic molestiae sed dolore aperiam laborum eligendi quod sunt, qui ut rerum quo occaecat fugit, est anim architecto et qui non tenetur sed nisi enim mollit fugit, voluptate cillum itaque labore dolorem dolorem dolore est, dolorem exercitation omnis asperiores aut laudantium, libero voluptatibus ipsa, laudantium, nostrum cum iure magni veniam, voluptate fuga.', 'Molestiae reiciendis laudantium, autem quisquam aute consectetur ea adipisicing ullam adipisci eos, ut velit rerum repudiandae libero voluptatem ex autem sed at nemo earum beatae aut commodo quidem consectetur, quo magnam eum in id sit perferendis vero doloremque nihil atque et blanditiis voluptatem.', 'Et et libero aut ullamco consequatur rerum iusto accusantium et fuga. Officia accusantium Nam aliquam.', 'Dolor vel qui duis qui magna a earum ullam eos rerum cupiditate explicabo. Distinctio. Veniam, non veritatis labore quod cupiditate aliquip molestias explicabo. Non exercitation et molestiae ex sunt nisi expedita eaque ea magnam laudantium, ullam aliquid iusto sint, aperiam sed minim autem quos ea enim ut et eos dolore laborum. Voluptas distinctio. Laborum dolorem dignissimos molestiae nihil natus enim assumenda ducimus, obcaecati ipsam deserunt dolore est hic pariatur. Autem accusamus reiciendis nostrum nisi ducimus, in Nam distinctio. Neque aut.', 2, '03/06/2013'),
(3, 'Inventore animi, tenetur esse, veniam, et enim eos, sed corrupti, voluptas nulla.', 'Amet, repudiandae qui temporibus nihil consequuntur eos doloremque laboris excepteur ut quasi ut qui voluptate iusto ex animi, in.', 'Rerum eum ut sed lorem ea nostrud illum, ut illum, id laboris voluptas.', 'Unde proident, nesciunt, ea possimus, eveniet, magna et aperiam consequatur? Officia nisi labore qui asperiores esse eum quibusdam.', 3, '03/03/2012'),
(4, 'Noise bla bla', '2016-04-04 23:36:10', 'bla bla bla...', 'more bla bla...', 3, ''),
(5, 'Inventore animi, tenetur esse, veniam, et enim eos, sed corrupti, voluptas nulla.', 'Amet, repudiandae qui temporibus nihil consequuntur eos doloremque laboris excepteur ut quasi ut qui voluptate iusto ex animi, in.', 'Rerum eum ut sed lorem ea nostrud illum, ut illum, id laboris voluptas.', 'Unde proident, nesciunt, ea possimus, eveniet, magna et aperiam consequatur? Officia nisi labore qui asperiores esse eum quibusdam.', 4, '06/12/2014'),
(6, 'Garbage', 'blaaa...', 'test only', 'test', 4, '03/07/2015');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(11) NOT NULL,
  `category_name` longtext,
  `description` longtext
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`) VALUES
(1, 'Electronics', '0'),
(2, 'Automobile', '0'),
(4, 'Men', '0'),
(5, 'Kids', '0'),
(6, 'Digital Product', NULL),
(7, 'Example Category 2', NULL),
(8, 'Example Category 3', NULL),
(9, 'Example Category 4', NULL),
(10, 'Example Category 5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('351c25f0c14b74376bc27fca4b3fae5e9de19ff1', '::1', 1459601185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393630313138353b74696d657374616d707c693a313435393630313138353b),
('3b4f7b927bfad6934141e1935835a9d343dbb278', '::1', 1459809447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393830373738313b74696d657374616d707c693a313435393830393434373b),
('4119145783c448da44c838624d468b35be76bba3', '::1', 1459527949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393532373934303b74696d657374616d707c693a313435393532373934393b),
('42d546c4f7c16d16fbfb07b5ad2519ce8db8a27e', '::1', 1459794318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393738383830383b74696d657374616d707c693a313435393739343331383b),
('4fe5f9bcd8fb7aacc1e0b5df695f212a8b345159', '::1', 1459871460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393837303337373b74696d657374616d707c693a313435393837313436303b757365725f6e616d657c733a363a227075626c6963223b757365725f69647c733a313a2238223b6c6f67696e7c733a333a22796573223b61646d696e5f6c6f67696e7c733a333a22796573223b61646d696e5f69647c733a313a2232223b617265615f69647c733a313a2231223b61646d696e5f6e616d657c733a31343a224d722e204163636f756e74616e74223b747970657c733a31353a226c6f63616c5f617574686f72697479223b7469746c657c733a353a2261646d696e223b),
('5913196b96bc5ab749fcda3d17972cd4cd668482', '::1', 1459601185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393630313138353b74696d657374616d707c693a313435393630313138353b),
('604821cbcd91ba061a1a07b9a6608e2a18609fcc', '::1', 1459637494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393633303735383b74696d657374616d707c693a313435393633373439343b),
('7bf17fffecdf13ff71b3a4f78f01da80b224ae0f', '::1', 1459528507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393532383530373b74696d657374616d707c693a313435393532383530373b),
('8268d2ba3141849b599d948d9e1c6615505e75b8', '::1', 1459465620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393436353632303b74696d657374616d707c693a313435393436353632303b),
('857162ccca707da4b5f63442303a333af166e380', '::1', 1459465255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393435373936383b74696d657374616d707c693a313435393436343935333b6c6f67696e7c733a333a22796573223b61646d696e5f6c6f67696e7c733a333a22796573223b61646d696e5f69647c733a313a2231223b61646d696e5f6e616d657c733a31363a224d722e204d61737465722041646d696e223b747970657c733a31363a226869676865725f617574686f72697479223b7469746c657c733a353a2261646d696e223b),
('98f4ba97cac5a4d88e76f90ee39ec9f3d610b22a', '::1', 1459869235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393836323930333b74696d657374616d707c693a313435393836393233353b757365725f6e616d657c733a363a227075626c6963223b757365725f69647c733a313a2238223b),
('a33f6ccd48386ace473195cfc679b4eec5a76e67', '::1', 1459614738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393631343638303b74696d657374616d707c693a313435393631343733383b6c6f67696e7c733a333a22796573223b61646d696e5f6c6f67696e7c733a333a22796573223b61646d696e5f69647c733a313a2231223b617265615f69647c733a333a22313030223b61646d696e5f6e616d657c733a31363a224d722e204d61737465722041646d696e223b747970657c733a31363a226869676865725f617574686f72697479223b7469746c657c733a353a2261646d696e223b),
('cf890f8bf9651e1d8c2415f54f87eb2a026cea4b', '::1', 1459711021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393731303437303b74696d657374616d707c693a313435393731313032313b6c6f67696e7c733a333a22796573223b61646d696e5f6c6f67696e7c733a333a22796573223b61646d696e5f69647c733a313a2231223b617265615f69647c733a333a22313030223b61646d696e5f6e616d657c733a31363a224d722e204d61737465722041646d696e223b747970657c733a31363a226869676865725f617574686f72697479223b7469746c657c733a353a2261646d696e223b),
('f03ef956c57ec326e5e7b6caec2a2998899002ed', '::1', 1459800408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435393830303131343b74696d657374616d707c693a313435393830303430383b757365725f6e616d657c733a363a227075626c6963223b757365725f69647c733a313a2238223b);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
`district_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `in_charge` varchar(200) DEFAULT NULL,
  `description` longtext,
  `people` float NOT NULL,
  `length` float NOT NULL,
  `division_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`district_id`, `name`, `in_charge`, `description`, `people`, `length`, `division_id`) VALUES
(1, 'Tongi', 'Fahamid Morshed', 'fdjfgsjgfs fdsvfdjsfdsjfvj fuvdsfdsvfvdsvf fdsjvfdsjfvdsjvf dfdjsfvjdvfdjsv fdsgfdsfgdjgfdfgdf gfdjsfgsdjfgjdfgdjg jfgdsfgdsjfgdgjf', 2323230, 3323230, 1);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
`division_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `in_charge` varchar(200) NOT NULL,
  `length` float NOT NULL,
  `people` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`division_id`, `name`, `description`, `in_charge`, `length`, `people`) VALUES
(1, 'Dhaka', 'A fdsfdsfdsjvfdsv vsdhfdsvfdsvfdsvfds gfjdsfgsdjgfsdjgfjf vjfvdsvfdsjfvdjsvfdsj\r\nfdsfdsfsdfds fdsfdsfdsfds ffdfdsfds dfdsf dfdsf sddfds fdfds fsdfd sf ds fdsf dsf ds fds ff ds fdsfdsf df d ', 'Shariful Hasnine', 23213200, 321321000);

-- --------------------------------------------------------

--
-- Table structure for table `dustbin`
--

CREATE TABLE IF NOT EXISTS `dustbin` (
`dustbin_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `status_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dustbin`
--

INSERT INTO `dustbin` (`dustbin_id`, `area_id`, `employee_id`, `location`, `vehicle_id`, `status_id`) VALUES
(1, 1, 1, 'Dmc corner', 1, '1'),
(2, 1, 1, 'Buet front road', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`employee_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` longtext,
  `area_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `status_id` varchar(200) DEFAULT NULL,
  `payment` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `phone`, `email`, `address`, `area_id`, `employee_type_id`, `status_id`, `payment`) VALUES
(1, 'Azad salam', '01221332323', 'azad@gamil.com', 'dsfdfdf,fdsf,fdsff,fdsfd,111', 1, 1, '2', 12000),
(2, 'Gil Blackwell', '+135-37-4213007', 'susetilu@yahoo.com', '<p>gdfgfgfdg</p>', 2, 1, '1', 100000),
(3, 'Skyler Mcfarland', '+557-35-5518477', 'hizezy@hotmail.com', '<p><br></p>', 1, 1, '1', 12300),
(4, 'Abul Korim', '01722233221', 'abul@yahoo.com', '<p>Uttor badda, Dhaka</p>', 3, 1, '1', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE IF NOT EXISTS `employee_type` (
`employee_type_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`employee_type_id`, `name`, `description`) VALUES
(1, 'garbage', 'nkhrekerew b sdfdsjfds fsdjfdsj f ds fds fsd fsdf ds f'),
(2, 'bus', 'fdsf  dfdsfdfdsf dfdsfdf');

-- --------------------------------------------------------

--
-- Table structure for table `funding`
--

CREATE TABLE IF NOT EXISTS `funding` (
`funding_id` int(11) NOT NULL,
  `pollution_type_id` int(11) DEFAULT NULL,
  `title` longtext,
  `area_id` int(11) DEFAULT NULL,
  `description` longtext,
  `remark` varchar(200) NOT NULL,
  `time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funding`
--

INSERT INTO `funding` (`funding_id`, `pollution_type_id`, `title`, `area_id`, `description`, `remark`, `time`) VALUES
(1, 1, 'In alias temporibus occaecat autem eos animi', 1, '<p><br></p>', 'Running', '13/01/2012'),
(2, 1, 'Et nostrum sed quod quia minima', 1, 'In excepteur quam sequi irure culpa distinctio Dolorum debitis eu', 'Start', '27/11/2014');

-- --------------------------------------------------------

--
-- Table structure for table `garbage_collector`
--

CREATE TABLE IF NOT EXISTS `garbage_collector` (
`garbage_collector_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` longtext,
  `phone` longtext,
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `garbage_collector`
--

INSERT INTO `garbage_collector` (`garbage_collector_id`, `name`, `address`, `phone`, `status_id`) VALUES
(1, 'Arafat garbage collector', '303,sakhari bazar,Dhaka', '01837233733', 1);

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE IF NOT EXISTS `general_settings` (
`general_settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`general_settings_id`, `type`, `value`) VALUES
(1, 'system_name', 'e-Environment Solution'),
(2, 'system_email', 'admin@shop.com'),
(3, 'system_title', 'E-Environment Solution'),
(4, 'address', ''),
(5, 'phone', ''),
(6, 'language', 'english'),
(9, 'terms_conditions', ''),
(10, 'fb_appid', ''),
(11, 'fb_secret', ''),
(12, 'google_languages', '{}'),
(24, 'meta_description', ''),
(25, 'meta_keywords', ''),
(26, 'meta_author', ''),
(27, 'captcha_public', '6LdsXPQSAAAAALRQB-m8Irt6-2_s2t10QsVnndVN'),
(28, 'captcha_private', '6LdsXPQSAAAAAFEnxFqW9qkEU_vozvDvJFV67yho'),
(29, 'application_name', 'Super Shop'),
(30, 'client_id', ''),
(31, 'client_secret', ''),
(32, 'redirect_uri', ''),
(33, 'api_key', ''),
(44, 'contact_about', ''),
(39, 'contact_phone', ''),
(40, 'contact_email', ''),
(41, 'contact_website', ''),
(42, 'footer_text', '<p><br></p>'),
(43, 'footer_category', '["1","2"]'),
(38, 'contact_address', ''),
(45, 'admin_notification_sound', 'no'),
(46, 'admin_notification_volume', '10.00'),
(47, 'privacy_policy', ''),
(48, 'discus_id', 'activeittest'),
(49, 'home_notification_sound', 'ok'),
(50, 'homepage_notification_volume', '10.00'),
(51, 'fb_login_set', 'no'),
(52, 'g_login_set', 'no'),
(53, 'slider', 'no'),
(54, 'revisit_after', '2'),
(55, 'default_member_product_limit', '5'),
(56, 'fb_comment_api', ''),
(57, 'comment_type', 'disqus'),
(58, 'vendor_system', 'ok'),
(59, 'cache_time', '0'),
(60, 'file_folder', 'jfkfkiriwnfjkmskdcsdfas'),
(62, 'slides', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `higher_authority`
--

CREATE TABLE IF NOT EXISTS `higher_authority` (
`higher_authority_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phone` longtext,
  `address` longtext,
  `designation` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
`word_id` int(11) NOT NULL,
  `word` longtext NOT NULL,
  `english` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `Spanish` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Arabic` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `French` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Chinese` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Bangla` longtext
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`word_id`, `word`, `english`, `Spanish`, `Arabic`, `French`, `Chinese`, `Bangla`) VALUES
(1, 'home', 'Home', 'Hogar', 'الصفحة الرئيسية', 'Accueil', '家', NULL),
(2, 'toggle_navigation', 'Toggle Navigation', 'Activar Navegación', 'تبديل للملاحة', 'Basculer la navigation', '切换导航', NULL),
(3, 'our_products', 'Our Products', 'Nuestros Productos', 'منتجاتنا', 'Nos Produits', '我们的产品', NULL),
(4, 'featured_product', 'Featured Product', 'Producto Destacado', 'المنتج المميز', 'Produit En Vedette', '特色产品', NULL),
(5, 'see_more', 'See More', 'Ver Más', 'شاهد المزيد', 'Voir Plus', '查看更多', NULL),
(6, 'contact', 'Contact', 'Contacto', 'اتصال', 'Contact', '联系', NULL),
(7, 'search_product', 'Search Product', 'Buscar Producto', 'البحث عن منتج', 'Recherche produit', '搜索产品', NULL),
(8, 'choose_category', 'Choose Category', 'Escoja una Categoría', 'اختر الفئة', 'Choisissez Catégorie', '选择类别', NULL),
(9, 'choose_sub_category', 'Choose Sub Category', 'Elige categoría Sub', 'اختر الفئة الرئيسية', 'Choisissez Sous catégorie', '选择子类别', NULL),
(10, 'latest_products', 'Latest Products', 'Últimos Productos', 'أحدث المنتجات', 'Derniers produits', '最新产品', NULL),
(11, 'most_sold', 'Most Sold', 'Lo más Vendido', 'الأكثر مبيعا', 'La plupart Vendu', '最畅销的', NULL),
(12, 'most_viewed_products', 'Most Viewed Products', 'Productos más vistas', 'المنتجات الأكثر مشاهدة', 'Produits les plus consultés', '大多数浏览过的产品', NULL),
(13, 'email_address', 'Email Address', 'Dirección De Correo Electrónico', 'عنوان البريد الإلكتروني', 'Adresse e-mail', '电子邮件地址', NULL),
(14, 'subscribe', 'Subscribe', 'Suscribir', 'الاشتراك', 'S''abonner', '订阅', NULL),
(15, 'categories', 'Categories', 'Categorías', 'الفئات', 'Catégories', '分类', NULL),
(16, 'useful_links', 'Useful Links', 'Enlaces Útiles', 'روابط مفيدة', 'Liens Utiles', '相关链接', NULL),
(17, 'all_products', 'All Products', 'Todos Los Productos', 'جميع المنتجات', 'Tous Les Produits', '所有产品', NULL),
(18, 'featured', 'Featured', 'Destacado', 'ظهرت', 'Sélection', '精选', NULL),
(19, 'contact_us', 'Contact Us', 'Contáctenos', 'اتصل بنا', 'Contactez Nous', '联系我们', NULL),
(20, 'phone', 'Phone', 'Teléfono', 'هاتف', 'Téléphone', '电话', NULL),
(21, 'website', 'Website', 'Sitio web', 'الموقع', 'Site Internet', '网站', NULL),
(22, 'email', 'Email', 'Email', 'البريد الإلكتروني', 'Email', '电子邮件', NULL),
(23, 'facebook', 'Facebook', 'Facebook', 'الفيسبوك', 'Facebook', 'Facebook的', NULL),
(24, 'twitter', 'Twitter', 'Gorjeo', 'تغريد', 'Gazouillement', '推特', NULL),
(25, 'google_plus', 'Google Plus', 'Google Plus', 'جوجل بلس', 'Google Plus', '谷歌加', NULL),
(26, 'youtube', 'Youtube', 'Youtube', 'يوتيوب', 'Youtube', 'YouTube的', NULL),
(27, 'all_rights_reserved', 'All Rights Reserved', 'Todos Los Derechos Reservados', 'جميع الحقوق محفوظة', 'Tous Droits Réservés', '版权所有', NULL),
(28, 'terms_&_condition', 'Terms & Condition', 'Términos Y Condiciones', 'الشروط والأحكام', 'Termes &amp; Conditions', '条款及条件', NULL),
(29, 'privacy_policy', 'Privacy Policy', 'Política De Privacidad', 'سياسة الخصوصية', 'Politique de confidentialité', '隐私政策', NULL),
(30, 'product_added_to_cart', 'Product Added To Cart', 'Producto añadido al carrito', 'أضيف المنتج للسلة', 'Produit ajouté au panier', '产品已加入购物车', NULL),
(31, 'added_to_cart', 'Added To Cart', 'Añadido a la cesta', 'تم إضافته للسلة', 'Ajouté au panier', '添加到购物车', NULL),
(32, 'product_quantity_exceed_availability!', 'Product Quantity Exceed Availability!', 'Producto Cantidad Exceed disponibles!', 'المنتج الكمية تتجاوز توافر!', 'Produit Quantité dépassera la disponibilité!', '产品数量超越空房！', NULL),
(33, 'product_already_added_to_cart!', 'Product Already Added To Cart!', 'Ya Producto añadido a la cesta!', 'المنتج أضفت إلى السلة!', 'Produit Déjà ajouté au panier!', '产品已添加到购物车！', NULL),
(34, 'product_added_to_wishlist', 'Product Added To Wishlist', 'Producto añadido a la lista de deseos', 'أضيف المنتج الى قائمه التمني', 'Produit ajouté à la liste', '产品添加到收藏', NULL),
(35, 'added_to_wishlist', 'Added To Wishlist', 'Añadido a Mis Favoritos', 'أضيف الى قائمة الامنيات', 'Ajouté à la liste', '添加到收藏', NULL),
(36, 'adding_to_wishlist..', 'Adding To Wishlist..', 'Agregando a Mis Favoritos ..', 'إضافة إلى قائمة الامنيات ..', 'Ajout dans la liste ..', '添加到收藏..', NULL),
(37, 'product_removed_from_wishlist', 'Product Removed From Wishlist', 'Producto Fuera De Regalos', 'تمت إزالة المنتج من قائمة الامنيات', 'Produit retiré de la liste d''envies', '产品移出收藏', NULL),
(38, 'product_rated_successfully', 'Product Rated Successfully', 'Producto puntuado', 'المنتج تقييمه بنجاح', 'Produit nominale succès', '产品额定成功', NULL),
(39, 'product_rating_failed', 'Product Rating Failed', 'Calificación del producto Falló', 'تقييم المنتج فشل', 'Évaluation du produit Échec', '产品评分失败', NULL),
(40, 'you_already_rated_this_product', 'You Already Rated This Product', 'Ya has puntuado este producto', 'كنت إذا تقييمه هذا المنتج', 'Vous déjà évalué ce produit', '您已经评价过此产品', NULL),
(41, 'working..', 'Working..', 'Trabajo ..', 'العمل ..', 'De travail ..', '工作..', NULL),
(42, 'you_already_subscribed', 'You Already Subscribed', 'Usted ya Suscrito', 'كنت مشتركا بالفعل', 'Vous êtes déjà inscrit', '你已经订阅', NULL),
(43, 'you_subscribed_successfully', 'You Subscribed Successfully', 'Usted Suscrito con éxito', 'كنت قد اشتركت بنجاح', 'Vous avez souscrit avec succès', '您已成功订阅', NULL),
(44, 'you_already_subscribed_thrice_from_this_browser', 'You Already Subscribed Thrice From This Browser', 'Usted ya Suscrito Thrice De Este Browser', 'كنت مشتركا بالفعل ثلاث مرات من هذا المتصفح', 'Vous êtes déjà inscrit trois fois depuis ce navigateur', '你已经订阅三次从这个浏览器', NULL),
(45, 'logging_in..', 'Logging In..', 'Iniciar Sesión ..', 'تسجيل الدخول ..', 'Connexion ..', '在登录..', NULL),
(46, 'you_logged_in_successfully', 'You Logged In Successfully', 'Usted ha entrado en el éxito', 'لقد دخلت بنجاح', 'Vous êtes connecté avec succès', '你登录成功', NULL),
(47, 'login_failed!_try_again!', 'Login Failed! Try Again!', 'Error De Inicio De Sesion! </font><font>Inténtalo De Nuevo!', 'فشل تسجيل الدخول! </font><font>حاول مرة أخرى!', 'Échec De La Connexion! </font><font>Essaye Encore!', '登录失败！</font><font>再试一次！', NULL),
(48, 'submitting..', 'Submitting..', 'Envío de ..', 'تقديم ..', 'Envoi ..', '提交..', NULL),
(49, 'email_sent_successfully', 'Email Sent Successfully', 'Email Enviado Satisfactoriamente', 'البريد الإلكتروني المرسلة بنجاح', 'Courriel envoyé avec succès', '电子邮件发送成功', NULL),
(50, 'email_does_not_exist!', 'Email Does Not Exist!', 'Email no existe!', 'البريد الإلكتروني غير موجود!', 'Email ne existe pas!', '电子邮件不存在！', NULL),
(51, 'email_sending_failed!_try_again', 'Email Sending Failed! Try Again', 'Envío de correo electrónico Error! </font><font>Inténtalo De Nuevo', 'إرسال البريد الإلكتروني فشل! </font><font>حاول مرة أخرى', 'Email envoi a échoué! </font><font>Essaye Encore', '电子邮件发送失败！</font><font>再试一次', NULL),
(52, 'logging_in', 'Logging In', 'Iniciar Sesión', 'تسجيل الدخول', 'Connexion', '在登录', NULL),
(53, 'adding_to_cart..', 'Adding To Cart..', 'Añadiendo al carro ..', 'إضافة إلى السلة ..', 'Ajout au panier ..', '添加到购物车..', NULL),
(54, 'product_removed_from_cart', 'Product Removed From Cart', 'Producto Fuera de la cesta', 'تمت إزالة المنتج من السلة', 'Produit retiré du panier', '产品移出车', NULL),
(55, 'the_field_is_required', 'The Field Is Required', 'El campo es obligatorio', 'مطلوب الميدان', 'Le champ est obligatoire', '该字段是必须的', NULL),
(56, 'logout', 'Logout', 'Cerrar Sesión', 'خروج', 'Se Déconnecter', '登出', NULL),
(57, 'login', 'Login', 'Iniciar Sesión', 'تسجيل الدخول', 'S''identifier', '登录', NULL),
(58, 'register', 'Register', 'Registrarse', 'تسجيل', 'Inscription', '注册', NULL),
(59, 'sign_in', 'Sign In', 'Ingresar', 'تسجيل الدخول', 'S''inscrire', '签到', NULL),
(60, 'do_not_have_account_?_click_', 'Do Not Have Account ? Click ', 'No tiene cuenta? </font><font>Haga clic en', 'ليس لديك حساب؟ </font><font>انقر', 'Ne pas avoir un compte? </font><font>Cliquez', '没有帐户？</font><font>点击', NULL),
(61, 'sign_up', 'Sign Up', 'Contratar', 'سجل', 'Signer', '签字', NULL),
(62, 'add_to_cart', 'Add To Cart', 'Añadir A La Cesta', 'أضف إلى السلة', 'Ajouter Au Panier', '添加到购物车', NULL),
(63, 'to_registration_.', 'To Registration .', 'Para inscripción.', 'إلى التسجيل.', 'Pour inscription.', '登记。', NULL),
(64, 'password', 'Password', 'Contraseña', 'كلمة السر', 'Mot de passe', '密码', NULL),
(65, 'forget_your_password_?', 'Forget Your Password ?', 'Olvidaste Tu Contraseña?', 'نسيت كلمة المرور؟', 'Mot De Passe Oublié?', '忘记密码？', NULL),
(66, 'log_in', 'Log In', 'Iniciar Sesión', 'تسجيل الدخول', 'S''identifier', '登录', NULL),
(67, 'forgot_password', 'Forgot Password', 'Has Olvidado Tu Contraseña', 'نسيت كلمة المرور', 'Mot De Passe Oublié', '忘记密码', NULL),
(68, 'submit', 'Submit', 'Enviar', 'عرض', 'Soumettre', '提交', NULL),
(69, 'close', 'Close', 'Cerrar', 'قريب', 'Fermer', '关闭', NULL),
(70, 'already_signed Up?_click', 'Already Signed Up? Click', 'Ya está inscrito? </font><font>Haga clic en', 'توقيع بالفعل؟ </font><font>انقر', 'Déjà inscrit? </font><font>Cliquez', '已注册？</font><font>点击', NULL),
(71, 'to_login_your_account', 'To Login Your Account', 'Para Entrar Tu Cuenta', 'لتسجيل الدخول إلى حسابك', 'Pour Connexion Votre compte', '要登录您的账户', NULL),
(72, 'confirm_password', 'Confirm Password', 'Confirmar Contraseña', 'تأكيد كلمة السر', 'Confirmez Le Mot De Passe', '确认密码', NULL),
(73, 'your_first_name', 'Your First Name', 'Su Nombre', 'الاسم الأول', 'Ton Prénom', '你的名字', NULL),
(74, 'your_last_name', 'Your Last Name', 'Tu Apellido', 'اسمك الاخير', 'Votre Nom De Famille', '你的姓氏', NULL),
(75, 'address_line_1', 'Address Line 1', 'Dirección Línea 1', 'العنوان سطر 1', 'Adresse 1', '地址第一行', NULL),
(76, 'address_line_2', 'Address Line 2', 'Dirección Línea 2', 'سطر العنوان 2', 'Adresse Ligne 2', '地址行2', NULL),
(77, 'city', 'City', 'Ciudad', 'مدينة', 'Ville', '城市', NULL),
(78, 'ZIP', 'ZIP', 'Postal', 'ZIP', 'Postal', 'ZIP', NULL),
(79, 'password_mismatched', 'Password Mismatched', 'Contraseña Mismatched', 'كلمة المرور غير متطابقة', 'Mot de passe Mismatched', '密码不匹配', NULL),
(80, 'products', 'Products', 'Productos', 'المنتجات', 'Produits', '制品', NULL),
(81, 'filter_by', 'Filter By', 'Filtrado Por', 'تصفية حسب', 'Filtrer Par', '过滤方式', NULL),
(82, 'category', 'Category', 'Categoría', 'فئة', 'Catégorie', '类别', NULL),
(83, 'price', 'Price', 'Precio', 'السعر', 'Prix', '价格', NULL),
(84, 'results', 'Results', 'Resultados', 'النتائج', 'Résultats', '结果', NULL),
(85, 'sign_in_to_your_account', 'Sign In To Your Account', 'Iniciar Sesión En Su Cuenta', 'تسجيل الدخول إلى حسابك', 'Connectez-vous à votre compte', '登录到您的帐户', NULL),
(86, 'forget_password', 'Forget Password', 'Contraseña Olvidada', 'نسيت كلمة المرور', 'Mot De Passe Oublié', '忘记密码', NULL),
(87, 'email_sent_with_new_password!', 'Email Sent With New Password!', 'Correo electrónico enviado con la nueva contraseña!', 'البريد الإلكتروني المرسلة وكلمة المرور الجديدة!', 'Email envoyé avec nouveau mot de passe!', '电子邮件发送的新密码！', NULL),
(88, 'cancelled', 'Cancelled', 'Cancelado', 'إلغاء', 'Annulé', '取消', NULL),
(89, 'this_field_is_required', 'This Field Is Required', 'Este Campo Es Requerido', 'هذه الخانة مطلوبه', 'Ce Champ Est Obligatoire', '这是必填栏', NULL),
(90, 'signing_in...', 'Signing In...', 'Firmar En ...', 'تسجيل الدخول ...', 'Connectez-Vous ...', '登录...', NULL),
(91, 'new_password_sent_to_your_email', 'New Password Sent To Your Email', 'Nueva contraseña enviada a su correo electrónico', 'كلمة السر الجديدة المرسلة إلى البريد الإلكتروني الخاص بك', 'Nouveau mot de passe envoyé à votre e-mail', '发送到您的邮箱新密码', NULL),
(92, 'login_failed!', 'Login Failed!', 'Error De Inicio De Sesion!', 'فشل تسجيل الدخول!', 'Échec De La Connexion!', '登录失败！', NULL),
(93, 'wrong_e-mail_address!_try_again', 'Wrong E-mail Address! Try Again', 'Mail E-mail! </font><font>Inténtalo De Nuevo', 'الخطأ عنوان البريد الإلكتروني! </font><font>حاول مرة أخرى', 'Mauvaise adresse e-mail! </font><font>Essaye Encore', '错误的电子邮件地址！</font><font>再试一次', NULL),
(94, 'login_successful!', 'Login Successful!', 'Inicio de sesión correcto!', 'دخول ناجح!', 'Connexion Réussie!', '登录成功！', NULL),
(95, 'SUCCESS!', 'SUCCESS!', 'ÉXITO!', 'النجاح!', 'SUCCÈS!', '成功了！', NULL),
(96, 'reset_password', 'Reset Password', 'Restablecer La Contraseña', 'إعادة تعيين كلمة المرور', 'Réinitialiser Le Mot De Passe', '重设密码', NULL),
(97, 'visit_home_page', 'Visit Home Page', 'Visita la página de Inicio', 'زيارة الصفحة الرئيسية', 'Visitez la page d''accueil', '访问主页', NULL),
(98, 'profile', 'Profile', 'Perfil', 'الملف الشخصي', 'Profil', '轮廓', NULL),
(99, 'dashboard', 'Dashboard', 'Tablero', 'لوحة القيادة', 'Tableau de bord', '仪表盘', NULL),
(100, '24_hours_stock', '24 Hours Stock', '24 Horas de la', '24 ساعة المالية', '24 Heures Stock', '24小时股票', NULL),
(101, '24_hours_sale', '24 Hours Sale', '24 Horas Venta', '24 ساعة بيع', '24 Heures Vente', '24小时销售', NULL),
(102, '24_hours_destroy', '24 Hours Destroy', '24 Horas Destroy', '24 ساعة تدمير', '24 Heures Destroy', '24小时销毁', NULL),
(103, 'pending_order_map', 'Pending Order Map', 'Orden Pendiente Mapa', 'في انتظار ترتيب خريطة', 'Commande de cartes en attente', '挂单地图', NULL),
(104, 'present_customer_live_on_your_store', 'Present Customer Live On Your Store', 'Presente en Vivo al cliente en su tienda', 'الحالي العملاء يعيشون على مخزن لديك', 'Présent en direct à la clientèle sur votre boutique', '目前客户住在你的店', NULL),
(105, 'category_wise_monthly_stock', 'Category Wise Monthly Stock', 'Categoría Wise Mensual Stock', 'فئة الحكيم المالية الشهرية', 'Catégorie Wise mensuel Stock', '明智类股票月刊', NULL),
(106, 'category_wise_monthly_sale', 'Category Wise Monthly Sale', 'Categoría Wise Mensual Venta', 'الفئة بيع الحكيم شهري', 'Catégorie Wise vente mensuel', '分类明智每月销售', NULL),
(107, 'category_wise_monthly_destroy', 'Category Wise Monthly Destroy', 'Categoría Wise Mensual Destroy', 'تدمير فئة الحكيم شهري', 'Détruisez Catégorie Wise mensuel', '分类明智每月销毁', NULL),
(108, 'category_wise_monthly_grand_profit', 'Category Wise Monthly Grand Profit', 'Categoría Wise Mensual Gran Beneficio', 'فئة الحكيم الشهرية الكبرى الربح', 'Catégorie Wise mensuel de Grand Profit', '分类明智每月利润大', NULL),
(109, 'cost', 'Cost', 'Costo', 'كلفة', 'Coût', '费用', NULL),
(110, 'value', 'Value', 'Valor', 'قيمة', 'Valeur', '值', NULL),
(111, 'loss', 'Loss', 'Pérdida', 'خسارة', 'Perte', '失利', NULL),
(112, 'profit', 'Profit', 'Beneficio', 'ربح', 'Bénéfice', '利润', NULL),
(113, 'sub-category', 'Sub-category', 'Sub-categoría', 'الفئة الفرعية', 'Sous-catégorie', '分类别', NULL),
(114, 'brands', 'Brands', 'Marcas', 'العلامات التجارية', 'Marques', '品牌', NULL),
(115, 'product_stock', 'Product Stock', 'Stock del producto', 'الأسهم المنتج', 'Stock de produits', '产品库存', NULL),
(116, 'sale', 'Sale', 'Venta', 'بيع', 'Vente', '卖', NULL),
(117, 'reports', 'Reports', 'Informes', 'تقارير', 'Rapports', '报告', NULL),
(118, 'product_compare', 'Product Compare', 'Producto Comparar', 'المنتج قارن', 'Produit Comparer', '产品比较', NULL),
(119, 'product_wishes', 'Product Wishes', 'Los deseos del producto', 'التمنيات المنتج', 'Voeux du produit', '产品愿望', NULL),
(120, 'customers', 'Customers', 'Clientes', 'الزبائن', 'Clientèle', '客户', NULL),
(121, 'create_new_page', 'Create New Page', 'Crear nueva página', 'إنشاء صفحة جديدة', 'Créer une page', '创建新页面', NULL),
(122, 'create_slider', 'Create Slider', 'Crear deslizante', 'إنشاء المتزلج', 'Créer Curseur', '创建滑块', NULL),
(123, 'front_settings', 'Front Settings', 'Ajustes delanteros', 'إعدادات الأمامية', 'Réglages avant', '前方设置', NULL),
(124, 'banner_settings', 'Banner Settings', 'Ajustes Banner', 'إعدادات راية', 'Paramètres de Bannière', '横幅设置', NULL),
(125, 'site_settings', 'Site Settings', 'Configuración del sitio', 'إعدادات الموقع', 'Paramètres du site', '网站设置', NULL),
(126, 'staffs', 'Staffs', 'Estados Mayores', 'الموظفين', 'Staffs', '工作人员', NULL),
(127, 'all_staffs', 'All Staffs', 'Todos los Estados Mayores', 'كل الأركان', 'Tous les états-majors', '所有员工', NULL),
(128, 'staff_permissions', 'Staff Permissions', 'Permisos de los funcionarios', 'ضوابط الموظفين', 'Permission de personnel', '工作人员权限', NULL),
(129, 'messaging', 'Messaging', 'Mensajería', 'الرسائل', 'Messagerie', '消息', NULL),
(130, 'newsletters', 'Newsletters', 'Boletines', 'النشرات الإخبارية', 'Bulletins', '简讯', NULL),
(131, 'contact_messages', 'Contact Messages', 'Contacto Mensajes', 'رسائل الاتصال', 'Contacts Messages', '联系信息', NULL),
(132, 'language', 'Language', 'Idioma', 'لغة', 'Langue', '语言', NULL),
(133, 'business_settings', 'Business Settings', 'Configuración de negocio', 'إعدادات التجارية', 'Réglages d''affaires', '商业环境', NULL),
(134, 'manage_admin_profile', 'Manage Admin Profile', 'Administrar perfil de administrador', 'إدارة الملف الشخصي ل admin', 'Gérer un profil administrateur', '管理管理员配置', NULL),
(135, 'SEO_proggres', 'SEO Proggres', 'SEO Proggres', 'SEO Proggres', 'SEO Proggres', 'SEO Proggres', NULL),
(136, 'online_tutorial', 'Online Tutorial', 'Tutorial en línea', 'دروس عبر الإنترنت', 'Didacticiel en ligne', '在线教程', NULL),
(137, 'checkout', 'Checkout', 'Revisa', 'الدفع', 'Check-Out', '查看', NULL),
(138, 'deleted_successfully', 'Deleted Successfully', 'Eliminado correctamente', 'حذف بنجاح', 'Supprimé avec succès', '成功删除', NULL),
(139, 'cancel', 'Cancel', 'Cancelar', 'إلغاء', 'Annuler', '取消', NULL),
(140, 'required', 'Required', 'Necesario', 'مطلوب', 'Requis', '需要', NULL),
(141, 'must_be_a_number', 'Must Be A Number', 'Debe Ser Un Número', 'يجب أن يكون هناك عدد', 'Doit être un nombre', '必须是数字', NULL),
(142, 'must_be_a_valid_email_address', 'Must Be A Valid Email Address', 'Debe ser una dirección de correo electrónico válida', 'يجب أن يكون عنوان بريد إلكتروني صالح', 'Doit être une adresse e-mail valide', '必须是一个有效的E-Mail地址', NULL),
(143, 'save', 'Save', 'Guardar', 'حفظ', 'Sauvegarder', '保存', NULL),
(144, 'product_published!', 'Product Published!', 'Producto Publicado!', 'المنتج النشر!', 'Publié produit!', '产品发布！', NULL),
(145, 'product_unpublished!', 'Product Unpublished!', 'Producto Inédito!', 'المنتج غير منشورة!', 'Produit inédit!', '产品未公布！', NULL),
(146, 'product_featured!', 'Product Featured!', 'Producto Destacado!', 'منتج مميز!', 'Produit vedette!', '产品特色！', NULL),
(147, 'product_unfeatured!', 'Product Unfeatured!', 'Sin rasgos producto!', 'Unfeatured المنتج!', 'Unfeatured produit!', '产品Unfeatured！', NULL),
(148, 'slider_published!', 'Slider Published!', 'Deslizador Publicado!', 'المنزلق نشر!', 'Publié curseur!', '滑块发布！', NULL),
(149, 'slider_unpublished!', 'Slider Unpublished!', 'Deslizador Inédito!', 'التمرير غير منشورة!', 'Curseur inédit!', '滑块未公布！', NULL),
(150, 'page_published!', 'Page Published!', 'Página Publicado!', 'الصفحة نشر!', 'Publié page!', '网页发布！', NULL),
(151, 'page_unpublished!', 'Page Unpublished!', 'Página Inédito!', 'الصفحة غير منشورة!', 'Page inédite!', '页面未公布！', NULL),
(152, 'notification_sound_enabled!', 'Notification Sound Enabled!', 'Notificación de sonido activado!', 'الإخطار الصوت المتعددة!', 'Notification sonore activé!', '通知启用声音！', NULL),
(153, 'notification_sound_disabled!', 'Notification Sound Disabled!', 'Notificación de sonido discapacitados!', 'الإخطار الصوت معطل!', 'Notification sonore handicapés!', '通知声音残疾人！', NULL),
(154, 'google_login_enabled!', 'Google Login Enabled!', 'Google Login Habilitado!', 'جوجل الدخول ممكن!', 'Google Connexion activé!', '谷歌登录启用！', NULL),
(155, 'google_login_disabled!', 'Google Login Disabled!', 'Google Acceso de minusválidos!', 'جوجل تسجيل الدخول معطل!', 'Google Login Disabled!', '谷歌禁用登录！', NULL),
(156, 'facebook_login_enabled!', 'Facebook Login Enabled!', 'Facebook Login Habilitado!', 'الفيسبوك تسجيل الدخول ممكن!', 'Facebook Connexion activé!', 'Facebook的登录启用！', NULL),
(157, 'facebook_login_disabled!', 'Facebook Login Disabled!', 'Facebook Login discapacitados!', 'الفيسبوك تسجيل الدخول معطل!', 'Facebook Login Disabled!', 'Facebook的登录禁用！', NULL),
(158, 'paypal_payment_disabled!', 'Paypal Payment Disabled!', 'El pago de PayPal habilitado!', 'باي بال الدفع معطل!', 'Paiement Paypal désactivé!', '支付宝付款禁用！', NULL),
(159, 'paypal_payment_enabled!', 'Paypal Payment Enabled!', 'El pago de PayPal Habilitado!', 'باي بال الدفع المتعددة!', 'Paiement Paypal activé!', 'Paypal支付启用！', NULL),
(160, 'manage_categories', 'Manage Categories', 'Gestionar Categorías', 'إدارة الفئات', 'Gérer Les Catégories', '管理类别', NULL),
(161, 'add_category', 'Add Category', 'Guardar Categoría', 'إضافة فئة', 'Ajouter Catégorie', '添加类别', NULL),
(162, 'successfully_added!', 'Successfully Added!', 'Con éxito Añadido!', 'واضاف بنجاح!', 'Ajouté avec succès!', '添加成功！', NULL),
(163, 'create_category', 'Create Category', 'Crear categoría', 'إنشاء الفئة', 'Créer une catégorie', '创建类别', NULL),
(164, 'no', 'No', 'No', 'لا', 'Non', '没有', NULL),
(165, 'name', 'Name', 'Nombre', 'اسم', 'Nom', '名字', NULL),
(166, 'options', 'Options', 'Opciones', 'خيارات', 'Options', '选项', NULL),
(167, 'manage_sub_categories', 'Manage Sub Categories', 'Administrar Sub Categorías', 'إدارة الفئات الفرعية', 'Gérer Sous-catégories', '管理子分类', NULL),
(168, 'add_sub-category', 'Add Sub-category', 'Añadir Sub-categoría', 'إضافة فئة الفرعية', 'Ajouter Sous-catégorie', '添加子类别', NULL),
(169, 'create_sub_category', 'Create Sub Category', 'Crear Subcategoría', 'إنشاء التصنيف الفرعي', 'Créez Sous catégorie', '创建子类别', NULL),
(170, 'sub_category', 'Sub Category', 'Sub Categoría', 'التصنيف الفرعي', 'Sous catégorie', '子类别', NULL),
(171, 'manage_brands', 'Manage Brands', 'Administrar las marcas', 'إدارة العلامات التجارية', 'Gérer Marques', '管理品牌', NULL),
(172, 'add_brand', 'Add Brand', 'Añadir Marca', 'إضافة العلامة التجارية', 'Ajouter Marque', '添加品牌', NULL),
(173, 'create_brand', 'Create Brand', 'Crear Marca', 'إنشاء العلامة التجارية', 'Créer Marque', '创建品牌', NULL),
(174, 'logo', 'Logo', 'Logo', 'الشعار', 'Logo', '徽标', NULL),
(175, 'brand', 'Brand', 'Marca', 'علامة تجارية', 'Marque', '牌', NULL),
(176, 'manage_product', 'Manage Product', 'Manejo de Producto', 'إدارة المنتج', 'Gérer produit', '管理产品', NULL),
(177, 'add_product', 'Add Product', 'Añadir Producto', 'إضافة منتج', 'Ajouter un produit', '添加产品', NULL),
(178, 'create_product', 'Create Product', 'Crear Producto', 'إنشاء المنتج', 'Créez produit', '创建产品', NULL),
(179, 'back_to_product_list', 'Back To Product List', 'Volver al listado de productos', 'الرجوع إلى قائمة المنتجات', 'Retour à la liste de produit', '返回产品列表', NULL),
(180, 'image', 'Image', 'Imagen', 'صورة', 'Image', '图像', NULL),
(181, 'title', 'Title', 'Título', 'عنوان', 'Titre', '称号', NULL),
(182, 'current_quantity', 'Current Quantity', 'Cantidad actual', 'الكمية الحالية', 'Quantité actuelle', '电流量', NULL),
(183, 'publish', 'Publish', 'Publicar', 'نشر', 'Publier', '发布', NULL),
(184, 'product', 'Product', 'Producto', 'المنتج', 'Produit', '产品', NULL),
(185, 'quantity', 'Quantity', 'Cantidad', 'كمية', 'Quantité', '数量', NULL),
(186, 'sale Price', 'Sale Price', 'Precio De Venta', 'سعر البيع', 'Prix ​​De Vente', '销售价格', NULL),
(187, 'creation Date', 'Creation Date', 'Fecha De Creacion', 'تاريخ الإنشاء', 'Date De Création', '创建日期', NULL),
(188, 'manage_banner', 'Manage Banner', 'Administrar Banner', 'إدارة راية', 'Gérer Bannière', '管理横幅', NULL),
(189, 'homepage', 'Homepage', 'Página principal', 'الصفحة الرئيسية', 'Page d''accueil', '主页', NULL),
(190, 'category_page', 'Category Page', 'Categoría Página', 'الفئة الصفحة', 'Catégorie page', '分类页', NULL),
(191, 'featured_page', 'Featured Page', 'Página Destacado', 'صفحة مميزة', 'Vedette page', '推荐页面', NULL),
(192, 'after_slider', 'After Slider', 'Después deslizante', 'بعد المتزلج', 'Après Curseur', '后滑块', NULL),
(193, 'select_banner_image', 'Select Banner Image', 'Seleccionar Imagen del Anuncio', 'حدد راية صورة', 'Sélectionnez Banner Image', '选择横幅图片', NULL),
(194, 'link', 'Link', 'Enlace', 'صلة', 'Lien', '链接', NULL),
(195, 'updating..', 'Updating..', 'Actualizando ..', 'تحديث ..', 'Mise à jour ..', '更新..', NULL),
(196, 'settings_updated!', 'Settings Updated!', 'Ajustes Actualizado!', 'الإعدادات المحدثة!', 'Paramètres Mise à jour!', '设置更新！', NULL),
(197, 'update', 'Update', 'Actualización', 'التحديث', 'Mise À Jour', '更新', NULL),
(198, 'after_featured', 'After Featured', 'Después destacados', 'بعد مميزة', 'Après vedette', '精选后', NULL),
(199, 'after_search', 'After Search', 'Después de Búsqueda', 'بعد البحث', 'Après Recherche', '经过搜索', NULL),
(200, 'after_category', 'After Category', 'Después Categoría', 'بعد الفئة', 'Après Catégorie', '分类后，', NULL),
(201, 'after_latest', 'After Latest', 'Después reciente', 'بعد آخر', 'Après Dernières', '经过最新', NULL),
(202, 'after_popular', 'After Popular', 'Después populares', 'بعد الشعبية', 'Après populaire', '之后人气', NULL),
(203, 'after_most_viewed', 'After Most Viewed', 'After Most Viewed', 'بعد الأكثر مشاهدة', 'Après plus consultés', '最受欢迎之后', NULL),
(204, 'after_filters', 'After Filters', 'Después de Filtros', 'بعد الفلاتر', 'Après Filtres', '经过过滤器', NULL),
(205, 'after_most_sold', 'After Most Sold', 'Después de más vendidos', 'بعد الأكثر مبيعا', 'Après les plus vendus', '最畅销的后', NULL),
(206, 'banner_published!', 'Banner Published!', 'Banner Publicado!', 'راية نشر!', 'Bannière Publié!', '横幅发布！', NULL),
(207, 'banner_unpublished!', 'Banner Unpublished!', 'Banner Inédito!', 'راية غير منشورة!', 'Bannière inédit!', '未公布的旗帜！', NULL),
(208, 'manage_site', 'Manage Site', 'Administrar sitio', 'إدارة الموقع', 'Gérer le site', '管理网站', NULL),
(209, 'general_settings', 'General Settings', 'Configuración General', 'الإعدادات العامة', 'Réglages Généraux', '常规设置', NULL),
(210, 'favicon', 'Favicon', 'Favicon', 'فافيكون', 'Favicon', '网站图标', NULL),
(211, 'social_media', 'Social Media', 'Medio Social', 'وسائل التواصل الاجتماعي', 'Médias Sociaux', '社交媒体', NULL),
(212, 'social_login_configuaration', 'Social Login Configuaration', 'Social Acceso de configuaration', 'تسجيل الدخول الاجتماعي Configuaration', 'Social Connexion configuaration', '社会登录Configuaration', NULL),
(213, 'product_comment_settings', 'Product Comment Settings', 'Configuración de producto Comentario', 'إعدادات المنتج تعليق', 'Produit Commentez Paramètres', '商品评论设置', NULL),
(214, 'SEO', 'SEO', 'SEO', 'SEO', 'SEO', '搜索引擎优化', NULL),
(215, 'captcha_settings', 'Captcha Settings', 'Ajustes Captcha', 'إعدادات CAPTCHA', 'Paramètres Captcha', '验证码设置', NULL),
(216, 'home_page', 'Home Page', 'Home Page', 'الصفحة الرئيسية', 'Page d''accueil', '主页', NULL),
(217, 'contact_page', 'Contact Page', 'Página de contacto', 'صفحة الاتصال', 'Page de contact', '联系方式页面', NULL),
(218, 'footer', 'Footer', 'Pie de página', 'تذييل', 'Pied de page', '页脚', NULL),
(219, 'system_name', 'System Name', 'Nombre del sistema', 'اسم النظام', 'Name System', '系统名称', NULL),
(220, 'system_email', 'System Email', 'Sistema de Correo', 'نظام البريد الإلكتروني', 'Système Email', '电子邮件系统', NULL),
(221, 'system_title', 'System Title', 'Sistema Título', 'نظام العنوان', 'Système Titre', '系统标题', NULL),
(222, 'admin_notification_sound', 'Admin Notification Sound', 'Sonido de notificación de administración', 'مشرف صوت الإعلام', 'Administrateur notification sonore', '管理员通知声音', NULL),
(223, 'admin_notification_volume', 'Admin Notification Volume', 'Volumen de Notificación de administración', 'مشرف إعلام حجم', 'Administrateur volume de la notification', '管理员通知音量', NULL),
(224, 'Volume_:_', 'Volume : ', 'Volumen: ', 'الصوت: ', 'Volume: ', '体积： ', NULL),
(225, 'homepage_notification_sound', 'Homepage Notification Sound', 'Notificación de sonido Página de inicio', 'الصفحة الرئيسية صوت الإعلام', 'Page d''accueil de notification sonore', '首页通知声音', NULL),
(226, 'homepage_notification_volume', 'Homepage Notification Volume', 'Volumen Notificación Homepage', 'الصفحة الرئيسية إعلام حجم', 'Page d''accueil Volume de notification', '首页通知音量', NULL),
(227, 'saving', 'Saving', 'Ahorro', 'إنقاذ', 'Économie', '节约', NULL),
(228, 'home_category', 'Home Category', 'Inicio Categoría', 'home الفئة', 'Accueil Catégorie', '首页分类', NULL),
(229, 'home_brands', 'Home Brands', 'Inicio Marcas', 'الرئيسية ماركات', 'Accueil Marques', '家居品牌', NULL),
(230, 'manage_category_page', 'Manage Category Page', 'Administrar Categoría Página', 'إدارة الفئة الصفحة', 'Gérer Catégorie page', '管理分类页', NULL),
(231, 'side_bar_position', 'Side Bar Position', 'Barra lateral Posición', 'الجانب بار الوظيفة', 'Side Bar Position', '边栏位置', NULL),
(232, 'upload_logo', 'Upload Logo', 'Subir Logo', 'تحميل الشعار', 'Upload Logo', '上传徽标', NULL),
(233, 'drop_logos_to_upload', 'Drop Logos To Upload', 'Caída Logos Para Sube', 'إسقاط شعارات لتحميل', 'Déposez Logos Pour télécharger', '降标志上传', NULL),
(234, 'or_click_to_pick_manually', 'Or Click To Pick Manually', 'O Haga clic para seleccionar manualmente', 'أو انقر لاختيار يدويا', 'Ou Cliquez sur pour choisir manuellement', '或点击手动选择', NULL),
(235, 'all_logos', 'All Logos', 'Todos los logos', 'كل الشعارات', 'Tous les Logos', '所有徽标', NULL),
(236, 'select_logo', 'Select Logo', 'Seleccione Logo', 'حدد الشعار', 'Sélectionnez Logo', '选择标识', NULL),
(237, 'place', 'Place', 'Lugar', 'مكان', 'Endroit', '地方', NULL),
(238, 'admin_logo', 'Admin Logo', 'Logo de administración', 'المشرف الشعار', 'Administrateur Logo', '管理员标识', NULL),
(239, 'successfully_selected!', 'Successfully Selected!', 'Con éxito seleccionada!', 'مختارة بنجاح!', 'Sélectionné avec succès!', '成功入选！', NULL),
(240, 'change', 'Change', 'Cambio', 'تغيير', 'Changement', '变化', NULL),
(241, 'homepage_header_logo', 'Homepage Header Logo', 'Página de inicio Logo Cabecera', 'الصفحة الرئيسية رأس الشعار', 'Accueil Logo Header', '首页页眉徽标', NULL),
(242, 'homepage_footer_logo', 'Homepage Footer Logo', 'Página de inicio Pie de página Logo', 'الصفحة الرئيسية تذييل شعار', 'Accueil Footer Logo', '网页页脚徽标', NULL),
(243, 'select_favicon', 'Select Favicon', 'Seleccione Favicon', 'حدد فافيكون', 'Sélectionnez Favicon', '选择网站图标', NULL),
(244, 'social_links', 'Social Links', 'Enlaces Sociales', 'الروابط الاجتماعية', 'Liens sociaux', '社会联系', NULL),
(245, 'discus_settings', 'Discus Settings', 'Ajustes Discus', 'إعدادات رمي ​​القرص', 'Réglages Discus', '铁饼设置', NULL),
(246, 'discus_ID', 'Discus ID', 'Discus ID', 'رمي القرص ID', 'Discus ID', '七彩ID', NULL),
(247, 'facebook_login_settings', 'Facebook Login Settings', 'Facebook Entrar Configuración', 'الفيسبوك تسجيل الدخول إعدادات', 'Facebook Paramètres de connexion', 'Facebook的登录设置', NULL),
(248, 'status', 'Status', 'Estado', 'حالة', 'Statut', '状态', NULL),
(249, 'google+_login_settings', 'Google+ Login Settings', 'Google+ Entrar Configuración', 'في Google+ الدخول إعدادات', 'Google+ Paramètres de connexion', 'Google+的登录设置', NULL),
(250, 'public_key', 'Public Key', 'Clave Pública', 'المفتاح العام', 'À clé publique', '公钥', NULL),
(251, 'private_key', 'Private Key', 'Clave Privada', 'مفتاح خاص', 'Clé privée', '私钥', NULL),
(252, 'manage_search_engine_optimization', 'Manage Search Engine Optimization', 'Administrar la optimización del Search Engine', 'إدارة محرك البحث الأمثل', 'Gérer Search Engine Optimization', '管理搜索引擎优化', NULL),
(253, 'keywords', 'Keywords', 'Palabras clave', 'الكلمات المفتاحية', 'Mots-clés', '关键词', NULL),
(254, 'author', 'Author', 'Autor', 'مؤلف', 'Auteur', '笔者', NULL),
(255, 'description', 'Description', 'Descripción', 'وصف', 'Description', '描述', NULL),
(256, 'contact_address', 'Contact Address', 'Dirección De Contacto', 'عنوان الإتصال', 'Adresse De Contact', '联系地址', NULL),
(257, 'contact_phone', 'Contact Phone', 'Teléfono De Contacto', 'الاتصال الهاتف', 'Numéro Du Contact', '联系电话', NULL),
(258, 'contact_email', 'Contact Email', 'Email De Contacto', 'تواصل بالبريد الاكتروني', 'Email Du Contact', '联系人电子邮件', NULL),
(259, 'contact_website', 'Contact Website', 'Contacto Sitio web', 'الإتصال الموقع', 'Contact Site', '联系网站', NULL),
(260, 'contact_about', 'Contact About', 'Contacto Acerca', 'الاتصال عن', 'Contactez-propos', '联系关于', NULL),
(261, 'footer_category', 'Footer Category', 'Pie de página Categoría', 'تذييل الفئة', 'Pied de page Catégorie', '页脚类别', NULL),
(262, 'footer_text', 'Footer Text', 'Texto De Pie De Página', 'تذييل النص', 'Pied de texte', '页脚文本', NULL),
(263, 'really_want_to_delete_this_logo?', 'Really Want To Delete This Logo?', 'Realmente desea eliminar este logotipo?', 'حقا تريد حذف هذا الشعار؟', 'Vraiment de vouloir supprimer ce logo?', '真的要删除这个标志？', NULL),
(264, 'manage_languages', 'Manage Languages', 'Administrar Idiomas', 'إدارة اللغات', 'Gérer les langues', '管理语言', NULL),
(265, 'add_language', 'Add Language', 'Agregar idioma', 'إضافة اللغة', 'Ajouter une langue', '添加语言', NULL),
(266, 'add_new_word', 'Add New Word', 'Añadir nueva palabra', 'إضافة جديد وورد', 'Ajout d''un mot', '添加新词', NULL),
(267, 'really_want_to_delete_this_language?', 'Really Want To Delete This Language?', 'Realmente desea eliminar este idioma?', 'حقا تريد حذف هذه اللغة؟', 'Vraiment de vouloir supprimer cette langue?', '真的要删除这种语言？', NULL),
(268, 'saving..', 'Saving..', 'Ahorrar ..', 'إنقاذ ..', 'Enregistrement ..', '节能..', NULL),
(269, 'delete_language', 'Delete Language', 'Eliminar Idioma', 'حذف اللغة', 'Supprimer Langue', '删除语言', NULL),
(270, 'select_language', 'Select Language', 'Seleccione Idioma', 'اختار اللغة', 'Choisir La Langue', '选择语言', NULL),
(271, 'word', 'Word', 'Palabra', 'كلمة', 'Mot', '字', NULL),
(272, 'translation', 'Translation', 'Traducción', 'ترجمة', 'Traduction', '翻译', NULL),
(273, 'updated!', 'Updated!', 'Actualizado!', 'تحديث!', 'Mise à jour!', '更新！', NULL),
(274, 'really_want_to_delete_this_word?', 'Really Want To Delete This Word?', 'Realmente desea eliminar esta Palabra?', 'حقا تريد حذف هذه الكلمة؟', 'Vraiment de vouloir supprimer cette Parole?', '真的要删除这个字？', NULL),
(275, 'delete', 'Delete', 'Borrar', 'حذف', 'Effacer', '删除', NULL),
(276, 'translate', 'Translate', 'Traducir', 'ترجم', 'Traduire', '翻译', NULL),
(277, 'save_all', 'Save All', 'Salvar A Todos', 'احفظ الكل', 'Sauver Tous', '保存全部', NULL),
(278, 'manage_profile', 'Manage Profile', 'Administrar perfil', 'إدارة الملف', 'Gérer le profil', '管理个人资料', NULL),
(279, 'manage_details', 'Manage Details', 'Administrar Detalles', 'إدارة تفاصيل', 'Gérer Détails', '管理细则', NULL),
(280, 'address', 'Address', 'Dirección', 'عنوان', 'Adresse', '地址', NULL),
(281, 'profile_updated!', 'Profile Updated!', 'Perfil Actualizado!', 'يتم تجديد!', 'Profil Mis À Jour!', '个人资料已更新！', NULL),
(282, 'update_profile', 'Update Profile', 'Actualización Del Perfil', 'تحديث الملف', 'Mettre À Jour Le Profil', '更新个人资料', NULL),
(283, 'change_password', 'Change Password', 'Cambiar La Contraseña', 'تغيير كلمة المرور', 'Changer Le Mot De Passe', '更改密码', NULL),
(284, 'current_password', 'Current Password', 'Contraseña Actual', 'كلمة السر الحالية', 'Mot De Passe Actuel', '当前密码', NULL),
(285, 'new_password*', 'New Password*', 'Nueva Contraseña *', 'كلمة سر جديدة *', 'Nouveau Mot De Passe *', '新密码*', NULL),
(286, 'password_updated!', 'Password Updated!', 'Contraseña Actualizada!', 'كلمة التحديث!', 'Mot de passe Mise à jour!', '密码更新！', NULL),
(287, 'update_password', 'Update Password', 'Actualizar contraseña', 'تحديث كلمة المرور', 'Mise à jour le mot de passe', '更新密码', NULL),
(288, 'incorrect_password!', 'Incorrect Password!', 'Contraseña Incorrecta!', 'كلمة المرور غير صحيحة!', 'Mot De Passe Incorrect!', '密码不正确！', NULL),
(289, 'manage_business_settings', 'Manage Business Settings', 'Administrar configuración de negocio', 'إدارة إعدادات الشركة', 'Gérer les paramètres commerciaux', '管理业务设置', NULL),
(290, 'paypal_payment', 'Paypal Payment', 'Pago Paypal', 'باي بال الدفع', 'Paiement Paypal', '支付宝付款', NULL),
(291, 'paypal_email', 'Paypal Email', 'E-Mail De Paypal', 'باي بال البريد الإلكتروني', 'Paypal Email', '贝宝电子邮件', NULL),
(292, 'paypal_account_type', 'Paypal Account Type', 'PayPal Tipo de cuenta', 'باي بال نوع الحساب', 'Type de compte Paypal', '贝宝账户类型', NULL),
(293, 'currency_name', 'Currency Name', 'Nombre moneda', 'اسم العملة', 'Nom de la devise', '货币名称', NULL),
(294, 'currency_symbol', 'Currency Symbol', 'Símbolo de moneda', 'رمز العملة', 'Symbole monétaire', '货币符号', NULL),
(295, 'shipping_cost_type', 'Shipping Cost Type', 'Envios Tipo Costo', 'تكلفة الشحن نوع', 'Frais de port Type de coût', '运费类型', NULL),
(296, 'product_wise', 'Product Wise', 'Sabio Producto', 'المنتج الحكيم', 'Wise Produit', '产品智者', NULL),
(297, 'fixed', 'Fixed', 'Fijo', 'ثابت', 'Fixé', '固定', NULL),
(298, 'shipping_cost_(If_fixed)', 'Shipping Cost (If Fixed)', 'El coste de envío (Si Fijo)', 'تكلفة الشحن (إذا كان ثابت)', 'Coût de l''expédition (Si fixe)', '运费（如果固定）', NULL),
(299, 'shipment_info', 'Shipment Info', 'Envío Info', 'شحنة معلومات', 'Infos expédition', '出货信息', NULL),
(300, 'FAQs', 'FAQs', 'Preguntas frecuentes', 'أسئلة وأجوبة', 'FAQs', '常见问题解答', NULL),
(301, 'question', 'Question', 'Pregunta', 'سؤال', 'Question', '题', NULL),
(302, 'answer', 'Answer', 'Respuesta', 'إجابة', 'Répondre', '答案', NULL),
(303, 'add_more_FAQs', 'Add More FAQs', 'Añadir Más preguntas frecuentes', 'إضافة المزيد من أسئلة وأجوبة', 'Ajouter Plus de FAQ', '添加更多常见问题解答', NULL),
(304, 'send_newsletter', 'Send Newsletter', 'Enviar Newsletter', 'إرسال النشرة الإخبارية', 'Envoyer lettre', '发送新闻', NULL),
(305, 'e-mails_(users)', 'E-mails (users)', 'Correos electrónicos (usuarios)', 'رسائل البريد الإلكتروني (المستخدمين)', 'E-mails (utilisateurs)', '电子邮件（用户）', NULL),
(306, 'e-mails_(subscribers)', 'E-mails (subscribers)', 'Correos electrónicos (usuarios registrados)', 'رسائل البريد الإلكتروني (مشترك)', 'E-mails (abonnés)', '电子邮件（用户）', NULL),
(307, 'from_:_email_address', 'From : Email Address', 'De: Dirección de correo electrónico', 'من: عنوان البريد الإلكتروني', 'De: Adresse électronique', '来自：电子邮件地址', NULL),
(308, 'newsletter_subject', 'Newsletter Subject', 'Boletín Asunto', 'النشرة الموضوع', 'Lettre Sujet', '时事主题', NULL),
(309, 'newsletter_content', 'Newsletter Content', 'Boletín de contenido', 'النشرة المحتوى', 'Bulletin contenu', '通讯内容', NULL),
(310, 'sending', 'Sending', 'Enviando', 'إرسال', 'Envoi', '发出', NULL),
(311, 'sent!', 'Sent!', 'Enviado!', 'أرسلت!', 'Envoyé!', '发送！', NULL),
(312, 'send', 'Send', 'Enviar', 'إرسال', 'Envoyer', '发送', NULL),
(313, 'subject', 'Subject', 'Tema', 'موضوع', 'Sujet', '学科', NULL),
(314, 'date', 'Date', 'Fecha', 'تاريخ', 'Date', '日期', NULL),
(315, 'message', 'Message', 'Mensaje', 'رسالة', 'Message', '信息', NULL),
(316, 'date_time', 'Date Time', 'Fecha Y Hora', 'التاريخ الوقت', 'Date Heure', '日期时间', NULL),
(317, 'reply', 'Reply', 'Responder', 'رد', 'Répondre', '回复', NULL),
(318, 'manage_staffs', 'Manage Staffs', 'Administrar Estados Mayores', 'إدارة الأركان', 'Gérer Staffs', '管理职员', NULL),
(319, 'add_staff', 'Add Staff', 'Añadir Staff', 'إضافة للموظفين', 'Ajouter personnel', '增加员工', NULL),
(320, 'create_admin', 'Create Admin', 'Crear administración', 'إنشاء الادارية', 'Créer Administrateur', '创建管理员', NULL),
(321, 'role', 'Role', 'Papel', 'دور', 'Rôle', '角色', NULL),
(322, 'edit_admin', 'Edit Admin', 'Editar administración', 'تحرير المشرف', 'Modifier Administrateur', '编辑管理', NULL),
(323, 'successfully_edited!', 'Successfully Edited!', 'Editado con éxito!', 'حرره بنجاح!', 'Edité avec succès!', '编辑成功！', NULL),
(324, 'edit', 'Edit', 'Editar', 'تحرير', 'Éditer', '编辑', NULL),
(325, 'sddress', 'Sddress', 'Sddress', 'Sddress', 'Sddress', 'Sddress', NULL),
(326, 'Manage_roles', 'Manage Roles', 'Administrar funciones', 'إدارة الأدوار', 'Gérer les rôles', '管理角色', NULL),
(327, 'add_role', 'Add Role', 'Añadir Rol', 'إضافة دور', 'Ajouter un rôle', '添加角色', NULL),
(328, 'create_role', 'Create Role', 'Crear Rol', 'إنشاء دور', 'Créer un rôle', '创建角色', NULL),
(329, 'back_to_role_list', 'Back To Role List', 'Volver a la lista Rol', 'الرجوع إلى قائمة دور', 'Retour à la liste de Rôle', '返回角色列表', NULL),
(330, 'edit_role', 'Edit Role', 'Editar Papel', 'تحرير الدور', 'Modifier Rôle', '编辑角色', NULL),
(331, 'really_want_to_delete_this?', 'Really Want To Delete This?', 'Realmente desea eliminar este?', 'حقا تريد حذف هذا؟', 'Vraiment de vouloir supprimer ce?', '真的要删除吗？', NULL),
(332, 'manage_slider', 'Manage Slider', 'Administrar deslizante', 'إدارة المتزلج', 'Gérer Curseur', '管理滑块', NULL),
(333, 'slider_list', 'Slider List', 'Lista deslizante', 'قائمة المنزلق', 'Liste curseur', '滑块名单', NULL),
(334, 'slider_serial', 'Slider Serial', 'Serial deslizante', 'المنزلق المسلسل', 'Curseur de série', '滑盖系列', NULL),
(335, 'successfully_serialized!', 'Successfully Serialized!', 'Con éxito Serialized!', 'تسلسل بنجاح!', 'Sérialisé succès!', '成功连载！', NULL),
(336, 'ID', 'ID', 'Identificación', 'الهوية', 'ID', 'ID', NULL),
(337, 'manage_page', 'Manage Page', 'Administrar Página', 'إدارة الصفحة', 'Gérer la page', '管理页面', NULL),
(338, 'add_page', 'Add Page', 'Añadir Página', 'أضف الصفحة', 'Ajouter une page', '添加页面', NULL),
(339, 'create_page', 'Create Page', 'Crear Página', 'انشئ صفحة', 'Créer Une Page', '创建页', NULL),
(340, 'back_to_page_list', 'Back To Page List', 'Volver a la lista Página', 'الرجوع إلى قائمة الصفحة', 'Retour à la liste de la page', '返回页面列表', NULL),
(341, 'page_name', 'Page Name', 'Nombre De La Página', 'اسم الصفحة', 'Nom de la page', '页面名称', NULL),
(342, 'page', 'Page', 'Página', 'صفحة', 'Page', '页面', NULL),
(343, 'sale_price', 'Sale Price', 'Precio De Venta', 'سعر البيع', 'Prix ​​De Vente', '销售价格', NULL),
(344, 'creation_date', 'Creation Date', 'Fecha De Creacion', 'تاريخ الإنشاء', 'Date De Création', '创建日期', NULL),
(345, 'page_title', 'Page Title', 'Título De La Página', 'عنوان الصفحة', 'Titre De La Page', '页面标题', NULL),
(346, 'parmalink', 'Parmalink', 'Parmalink', 'Parmalink', 'Parmalink', 'Parmalink', NULL),
(347, 'tags', 'Tags', 'Etiquetas', 'الكلمات', 'Mots clés', '标签', NULL),
(348, 'number_of_page_parts', 'Number Of Page Parts', 'Número de las partes Page', 'عدد الأجزاء الصفحة', 'Nombre de pages Pièces', '页零件数量', NULL),
(349, 'lets_start_to_create_your_page', 'Lets Start To Create Your Page', 'Vamos a empezar a crear su página', 'يتيح البدء في إنشاء الصفحة الخاصة بك', 'Permet de commencer à créer votre page', '让我们开始创建你的页面', NULL),
(350, 'parts', 'Parts', 'Partes', 'أجزاء', 'Parties', '零件', NULL),
(351, 'reset', 'Reset', 'Reajustar', 'إعادة تعيين', 'Réinitialiser', '重置', NULL),
(352, 'upload', 'Upload', 'Subir', 'تحميل', 'Télécharger', '上传', NULL),
(353, 'select_size', 'Select Size', 'Selecciona El Tamaño', 'حدد الحجم', 'Sélectionnez La Taille', '选择尺寸', NULL),
(354, 'one-fourth', 'One-fourth', 'Un cuarto', 'ربع', 'Un quart', '四分之一', NULL),
(355, 'one-third', 'One-third', 'Un tercio', 'ثلث', 'Un tiers', '三分之一', NULL),
(356, 'half', 'Half', 'Mitad', 'نصف', 'Moitié', '半', NULL),
(357, 'two-third', 'Two-third', 'Dos tercios', 'ثلثي', 'Deux tiers', '三分之二', NULL),
(358, 'three-fourth', 'Three-fourth', 'Tres cuartos', 'ثلاثة أرباع', 'Trois-quatrième', '三十四', NULL),
(359, 'full', 'Full', 'Completo', 'كامل', 'Complet', '满', NULL),
(360, 'select_type', 'Select Type', 'Seleccionar tipo', 'حدد نوع', 'Sélectionner le type', '选择类型', NULL),
(361, 'content', 'Content', 'Contenido', 'محتوى', 'Contenu', '内容', NULL),
(362, 'widget', 'Widget', 'Widget', 'القطعة', 'Widget', '小工具', NULL);
INSERT INTO `language` (`word_id`, `word`, `english`, `Spanish`, `Arabic`, `French`, `Chinese`, `Bangla`) VALUES
(363, 'most_viewed', 'Most Viewed', 'Más Vistos', 'الأكثر مشاهدة', 'Le Plus Regardé', '最受关注', NULL),
(364, 'not_more_than_4_columns!', 'Not More Than 4 Columns!', 'No más de 4 columnas!', 'لا يزيد على 4 أعمدة!', 'Pas plus de 4 colonnes!', '不超过4列！', NULL),
(365, 'category_name', 'Category Name', 'Nombre De La Categoría', 'اسم التصنيف', 'Nom De Catégorie', '分类名称', NULL),
(366, 'edit_category', 'Edit Category', 'Editar categoría', 'تحرير الفئة', 'Modifier une catégorie', '编辑类别', NULL),
(367, 'sub-category_name', 'Sub-category Name', 'Sub-categoría Nombre', 'الفئة الفرعية اسم', 'Sous-catégorie Nom', '子类别名称', NULL),
(368, 'edit_sub-category', 'Edit Sub-category', 'Editar Sub-categoría', 'تحرير التصنيف الفرعى-', 'Modifier la sous-catégorie', '编辑子类别', NULL),
(369, 'brand_name', 'Brand Name', 'Nombre De La Marca', 'اسم العلامة التجارية', 'Marque', '品牌', NULL),
(370, 'brand_logo', 'Brand Logo', 'Logotipo De La Marca', 'شعار العلامة التجارية', 'Logo De La Marque', '品牌标识', NULL),
(371, 'select_brand_logo', 'Select Brand Logo', 'Seleccionar logo de la marca', 'حدد شعار العلامة التجارية', 'Sélectionnez une marque Logo', '选择品牌标识', NULL),
(372, 'edit_brand', 'Edit Brand', 'Editar Marca', 'تحرير العلامة التجارية', 'Modifier Marque', '编辑品牌', NULL),
(373, 'product_title', 'Product Title', 'Título del producto', 'عنوان المنتج', 'Titre du produit', '产品名称', NULL),
(374, 'unit', 'Unit', 'Unidad', 'وحدة', 'Unité', '单元', NULL),
(375, 'unit_(e.g._kg,_pc_etc.)', 'Unit (e.g. Kg, Pc Etc.)', 'Unidad (por ejemplo Kg, ordenador, etc.)', 'وحدة (مثلا كلغ، والكمبيوتر الخ.)', 'Unité (ex Kg, ordinateur, etc.)', '单位（如斤，PC等设备）', NULL),
(376, 'purchase_price', 'Purchase Price', 'Precio De Compra', 'سعر الشراء', 'Prix ​​D''Achat', '购买价格', NULL),
(377, 'shipping_cost', 'Shipping Cost', 'Costo De Envío', 'تكلفة الشحن', 'Frais De Port', '运输费', NULL),
(378, 'product_tax', 'Product Tax', 'Fiscal Producto', 'الضريبة المنتج', 'Impôt sur le produit', '产品税', NULL),
(379, 'product_discount', 'Product Discount', 'Descuento del producto', 'الخصم المنتج', 'Remise de produit', '产品折扣', NULL),
(380, 'images', 'Images', 'Imágenes', 'الصور', 'Images', '图片', NULL),
(381, 'choose_file', 'Choose File', 'Elija El Archivo', 'اختر ملف', 'Choisissez Fichier', '选择文件', NULL),
(382, 'color', 'Color', 'Color', 'اللون', 'Couleur', '颜色', NULL),
(383, 'add_more_colors', 'Add More Colors', 'Añadir más colores', 'إضافة المزيد من الألوان', 'Ajouter plus de couleurs', '添加更多颜色', NULL),
(384, 'if_you_need_more_field_for_your_product_,_please_click_here_for_more...', 'If You Need More Field For Your Product , Please Click Here For More...', 'Si necesita más campo para su producto, por favor haga clic aquí para Más ...', 'إذا كنت بحاجة إلى المزيد من الميدان للمنتج الخاص بك، الرجاء انقر هنا للمزيد ...', 'Si vous désirez plus de terrain pour votre produit, S''il vous plaît Cliquez ici pour plus ...', '如果你需要更多的现场为您的产品，请点击这里查看更多...', NULL),
(385, 'add_more_fields', 'Add More Fields', 'Añadir más campos', 'إضافة المزيد من الحقول', 'Ajouter d''autres champs', '添加更多的字段', NULL),
(386, 'product_has_been_uploaded!', 'Product Has Been Uploaded!', 'Producto se ha cargado!', 'المنتج قد تم إيداع!', 'Produit a été téléchargé!', '产品已上传！', NULL),
(387, 'field_name', 'Field Name', 'Nombre Del Campo', 'اسم الحقل', 'Nom De Domaine', '字段名称', NULL),
(388, 'field_value', 'Field Value', 'Campo Valor', 'قيمة الحقل', 'Champ Valeur', '字段值', NULL),
(389, 'out_of_stock', 'Out Of Stock', 'Agotado', 'إنتهى من المخزن', 'Rupture De Stock', '缺货', NULL),
(390, 'view_product', 'View Product', 'Ver Producto', 'عرض المنتج', 'Voir le produit', '查看产品', NULL),
(391, 'successfully_viewed!', 'Successfully Viewed!', 'Visto éxito!', 'مشاهدة بنجاح!', 'Vu succès!', '成功查看！', NULL),
(392, 'view', 'View', 'Vista', 'عرض', 'Vue', '视图', NULL),
(393, 'view_discount', 'View Discount', 'Ver descuento', 'عرض الخصم', 'Voir Discount', '查看折扣', NULL),
(394, 'viewing_discount!', 'Viewing Discount!', 'Viendo el descuento!', 'عرض خصم!', 'Regarde un rabais!', '查看折扣！', NULL),
(395, 'discount', 'Discount', 'Descuento', 'خصم', 'Remise', '折扣', NULL),
(396, 'add_product_quantity', 'Add Product Quantity', 'Añadir Producto Cantidad', 'إضافة منتج الكمية', 'Ajouter Produit Quantité', '添加产品数量', NULL),
(397, 'quantity_added!', 'Quantity Added!', 'Cantidad añadida!', 'الكمية المضافة!', 'Quantité Ajouté!', '添加量！', NULL),
(398, 'stock', 'Stock', 'Valores', 'الأوراق المالية', 'Stock', '股票', NULL),
(399, 'reduce_product_quantity', 'Reduce Product Quantity', 'Reducir Producto Cantidad', 'تقليل كمية المنتج', 'Réduire Produit Quantité', '减少产品数量', NULL),
(400, 'quantity_reduced!', 'Quantity Reduced!', 'Cantidad rebajado!', 'كمية خفض!', 'Quantité réduit!', '数量减少！', NULL),
(401, 'destroy', 'Destroy', 'Destruir', 'هدم', 'Détruire', '破坏', NULL),
(402, 'edit_product', 'Edit Product', 'Editar Producto', 'تحرير المنتج', 'Modifier le produit', '编辑产品', NULL),
(403, 'rate', 'Rate', 'Tarifa', 'معدل', 'Taux', '率', NULL),
(404, 'total', 'Total', 'Total', 'مجموع', 'Total', '总', NULL),
(405, 'reason_note', 'Reason Note', 'Motivo Nota', 'السبب ملاحظة', 'Raison Remarque', '原因说明', NULL),
(406, 'manage_your_product_stock', 'Manage Your Product Stock', 'Administre su stock del producto', 'إدارة الأسهم الخاصة بك المنتج', 'Gérer votre produit Stock', '管理你的产品库存', NULL),
(407, 'destroy_product_entry', 'Destroy Product Entry', 'Destruye Entrada Producto', 'تدمير دخول المنتج', 'Détruisez Entrée produit', '销毁产品入境', NULL),
(408, 'add_stock_entry_taken!', 'Add Stock Entry Taken!', 'Añadir Tomado de la entrada Stock!', 'إضافة المحصلة دخول سوق الأسهم!', 'Ajouter Stock Entrée pris!', '添加股票输入上当受骗！', NULL),
(409, 'add_product_stock', 'Add Product Stock', 'Añadir stock del producto', 'إضافة منتج المالية', 'Ajouter le produit Stock', '添加产品库存', NULL),
(410, 'destroy_entry_taken!', 'Destroy Entry Taken!', 'Destruye Tomado de entrada!', 'تدمير المحصلة الدخول!', 'Détruisez Entrée pris!', '摧毁条目获取！', NULL),
(411, 'create_stock', 'Create Stock', 'Crear archivo', 'إنشاء البورصة', 'Créer Stock', '创建库存', NULL),
(412, 'entry_type', 'Entry Type', 'Tipo de entrada', 'نوع الدخول', 'Type d''entrée', '条目类型', NULL),
(413, 'note', 'Note', 'Nota', 'ملاحظة', 'Note', '注意', NULL),
(414, 'added_quantity_will_be_reduced.', 'Added Quantity Will Be Reduced.', 'Cantidad añadida será reducido.', 'وأضاف الكمية ستنخفض.', 'Ajouté Quantité sera réduite.', '加入数量将减少。', NULL),
(415, 'manage_sale', 'Manage Sale', 'Administrar Venta', 'إدارة بيع', 'Gérer Vente', '销售管理', NULL),
(416, 'sale_code', 'Sale Code', 'Venta Código', 'بيع مدونة', 'Vente code', '销售守则', NULL),
(417, 'buyer', 'Buyer', 'Comprador', 'مشتر', 'Acheteur', '买主', NULL),
(418, 'delivery_status', 'Delivery Status', 'Estado De Entrega', 'حالة التسليم', 'Statut De Livraison', '交货状态', NULL),
(419, 'payment_status', 'Payment Status', 'Estado De Pago', 'حالة السداد', 'Statut De Paiement', '付款状态', NULL),
(420, 'sales', 'Sales', 'Ventas', 'مبيعات', 'Ventes', '销售', NULL),
(421, 'choose_your_slider_style', 'Choose Your Slider Style', 'Elija su estilo deslizante', 'اختيار المتزلج طريقتك', 'Choisissez votre style Slider', '选择您的滑盖造型', NULL),
(422, 'play', 'Play', 'Jugar', 'لعب', 'Jouer', '玩', NULL),
(423, 'choose', 'Choose', 'Escoger', 'اختار', 'Choisir', '选择', NULL),
(424, 'enter_preview', 'Enter Preview', 'Introduzca Prevista', 'أدخل معاينة', 'Entrez Aperçu', '进入预览', NULL),
(425, 'creating_slider..', 'Creating Slider..', 'Crear deslizante ..', 'خلق المتزلج ..', 'Création curseur ..', '创建滑块..', NULL),
(426, 'slider_added!', 'Slider Added!', 'Deslizador Agregado', 'المنزلق واضاف!', 'Curseur Ajouté!', '滑块增加！', NULL),
(427, 'select_background_image', 'Select Background Image', 'Seleccione la imagen de fondo', 'اختر صورة الخلفية', 'Sélectionnez l''image de fond', '选择背景图片', NULL),
(428, 'select_image', 'Select Image', 'Seleccionar Imagen', 'اختر صورة', 'Sélectionner l''image', '选择图片', NULL),
(429, 'font-color', 'Font-color', 'Color de fuente', 'لون الخط', 'Couleur de police', '字体颜色', NULL),
(430, 'background_color', 'Background Color', 'Color De Fondo', 'لون الخلفية', 'Couleur De Fond', '背景颜色', NULL),
(431, 'clean', 'Clean', 'Limpio', 'نظيف', 'Propre', '清洁', NULL),
(432, 'slider_serial_saved!', 'Slider Serial Saved!', 'Slider Guardados de serie!', 'المنزلق المسلسل المحفوظ!', 'Curseur série Saved!', '滑盖系列救了！', NULL),
(433, 'permissions', 'Permissions', 'Permisos', 'أذونات', 'Autorisations', '权限', NULL),
(434, 'off', 'Off', 'Apagado', 'بعيدا', 'De', '离', NULL),
(435, 'add_to_wishlist', 'Add To Wishlist', 'Añadir A La Lista De Deseos', 'اضف الى قائمة الامنيات', 'Ajouter À La Liste De Souhaits', '添加到收藏', NULL),
(436, 'our_available_brands', 'Our Available Brands', 'Nuestras Marcas disponibles', 'علاماتنا التجارية المتاحة', 'Nos Marques disponibles', '我们现有的品牌', NULL),
(437, 'product_color_options', 'Product Color Options', 'Opciones de color Producto', 'خيارات المنتج اللون', 'options de couleur de produit', '产品颜色选项', NULL),
(438, 'add_colors', 'Add Colors', 'Añadir colores', 'إضافة الألوان', 'Ajouter des couleurs', '添加颜色', NULL),
(439, 'preview', 'Preview', 'Preestreno', 'معاينة', 'Aperçu', '预习', NULL),
(440, 'related_products', 'Related Products', 'Productos Relacionados', 'المنتجات ذات الصلة', 'Produits Connexes', '相关产品', NULL),
(441, 'full_description', 'Full Description', 'Descripción Completa', 'الوصف الكامل', 'Description Complète', '完整说明', NULL),
(442, 'additional_specification', 'Additional Specification', 'Especificación adicional', 'مواصفات إضافية', 'Spécification Supplémentaire', '其他规格', NULL),
(443, 'reviews', 'Reviews', 'Opiniones', 'التعليقات', 'Avis', '点评', NULL),
(444, 'add_to wishlist', 'Add To Wishlist', 'Añadir A La Lista De Deseos', 'اضف الى قائمة الامنيات', 'Ajouter À La Liste De Souhaits', '添加到收藏', NULL),
(445, 'featured_products', 'Featured Products', 'Productos Destacados', 'منتجات مميزة', 'Produits Présentés', '特色产品', NULL),
(446, 'our_contacts', 'Our Contacts', 'Nuestros Contactos', 'دليل المنسوبين', 'Nos Contacts', '我们的联系方式', NULL),
(447, 'about_us', 'About Us', 'Sobre Nosotros', 'عنا', 'A Propos De Nous', '关于我们', NULL),
(448, 'get_in_touch', 'Get In Touch', 'Ponerse En Contacto', 'الحصول على اتصال', 'Entrer en contact', '保持联系', NULL),
(449, 'contacts_form', 'Contacts Form', 'Contactos Formulario', 'اتصالات نموذج', 'Formulaire de contacts', '联系表格', NULL),
(450, 'e-mail', 'E-mail', 'Email', 'البريد الإلكتروني', 'Email', '电子邮件', NULL),
(451, 'sending..', 'Sending..', 'Enviando ..', 'إرسال ..', 'Envoi ..', '正在发送。', NULL),
(452, 'send_message:', 'Send Message:', 'Enviar Mensaje:', 'أرسل رسالة:', 'Envoyer Le Message:', '发信息：', NULL),
(453, 'message_sent!', 'Message Sent!', 'Mensaje Enviado!', 'تم إرسال الرسالة!', 'Message Envoyé!', '消息已发送！', NULL),
(454, 'incorrect_captcha!', 'Incorrect Captcha!', 'Captcha Incorrecto!', 'كلمة التحقق غير صحيح!', 'Captcha Incorrecte!', '验证码不正确！', NULL),
(455, 'my_profile', 'My Profile', 'Mi Perfil', 'ملفي الشخصي', 'Mon Profil', '我的简历', NULL),
(456, 'personal_information', 'Personal Information', 'Información Personal', 'معلومات شخصية', 'Information Personnelle', '个人信息', NULL),
(457, 'total_purchase', 'Total Purchase', 'Compra total', 'إجمالي شراء', 'Total Achat', '总购买', NULL),
(458, 'last_7_days', 'Last 7 Days', 'Últimos 7 días', 'اخر 7 ايام', 'Les 7 derniers jours', '最近7天', NULL),
(459, 'last_30_days', 'Last 30 Days', 'Últimos 30 Días', 'اخر 30 يوم', '30 derniers jours', '最后30天', NULL),
(460, 'wished_products', 'Wished Products', 'Productos deseados', 'المنتجات تمنى', 'Produits souhaité', '希望产品', NULL),
(461, 'user_since', 'User Since', 'Usuario desde', 'المستخدم منذ', 'Utilisateur depuis', '用户自', NULL),
(462, 'last_login', 'Last Login', 'Último Acceso', 'آخر تسجيل دخول', 'Dernière Connexion', '上次登录', NULL),
(463, 'purchase_history', 'Purchase History', 'Historial De Compras', 'تاريخ شراء', 'Historique D''Achat', '购买记录', NULL),
(464, 'wishlist', 'Wishlist', 'Lista', 'مفضلة', 'Liste', '心愿', NULL),
(465, 'edit_info', 'Edit Info', 'Editar información', 'تحرير معلومات', 'Modifier les informations', '编辑信息', NULL),
(466, 'invoice', 'Invoice', 'Factura', 'فاتورة', 'Facture', '发票', NULL),
(467, 'availability', 'Availability', 'Disponibilidad', 'توفر', 'Disponibilité', '可用性', NULL),
(468, 'purchase', 'Purchase', 'Compra', 'شراء', 'Achat', '购买', NULL),
(469, 'remove', 'Remove', 'Quitar', 'إزالة', 'Supprimer', '拆除', NULL),
(470, 're-write your_first_name', 'Re-write Your First Name', 'Vuelva a escribir su nombre', 'إعادة كتابة الاسم الأول', 'Re-écrire Votre Prénom', '重新写你的名字', NULL),
(471, 're-write your_last_name', 'Re-write Your Last Name', 'Vuelva a escribir su apellido', 'إعادة كتابة الاسم الأخير', 'Re-écrire Votre Nom', '重新写你的姓', NULL),
(472, 're-write_your_phone_number', 'Re-write Your Phone Number', 'Vuelva a escribir su número de teléfono', 'إعادة كتابة رقم الهاتف الخاص بك', 'Re-écrire votre numéro de téléphone', '重新写你的电话号码', NULL),
(473, 'ZIP_Code', 'ZIP Code', 'Código postal', 'الرمز البريدي', 'Code postal', '邮政编码', NULL),
(474, 'city_name', 'City Name', 'Nombre De La Ciudad', 'اسم المدينة', 'Nom De La Ville', '城市的名字', NULL),
(475, 'your_skype_id', 'Your Skype Id', 'Tu Identificacion De Skype', 'رقم سكايب الخاص بك', 'Votre Identifiant Skype', '你的Skype帐号', NULL),
(476, 'your_facebook_profile_link', 'Your Facebook Profile Link', 'Su perfil de Facebook Enlace', 'الخاص بك الفيسبوك ملف الموقع', 'Votre profil Facebook Lien', '你的Facebook个人资料链接', NULL),
(477, 'your_google+_profile_link', 'Your Google+ Profile Link', 'Su Google+ Enlace', 'في + Google ملف الموقع', 'Votre profil Google+ Lien', '您的Google+个人资料链接', NULL),
(478, 'browse', 'Browse', 'Explorar', 'تصفح', 'Feuilleter', '浏览', NULL),
(479, 'update_info', 'Update Info', 'Actualizar Información', 'تحديث معلومات', 'Information De Mise À Jour', '更新信息', NULL),
(480, 'enter_your_current_password', 'Enter Your Current Password', 'Introduce Tu Contraseña Actual', 'أدخل كلمة المرور الحالية', 'Entrer Votre Mot De Passe Actuel', '输入当前的密码', NULL),
(481, 'new_password', 'New Password', 'Nueva Contraseña', 'كلمة سر جديدة', 'Nouveau Mot De Passe', '新密码', NULL),
(482, 'enter_your_new_password', 'Enter Your New Password', 'Ingrese su nueva contraseña', 'أدخل كلمة المرور الجديدة', 'Entrez votre nouveau mot de passe', '输入新密码', NULL),
(483, 'confirm_new_password', 'Confirm New Password', 'Confirmar Nueva Contraseña', 'تأكيد كلمة السر الجديدة', 'Confirmer Le Nouveau Mot De Passe', '确认新密码', NULL),
(484, 're-enter_your_new_password', 'Re-enter Your New Password', 'Vuelva a introducir su nueva contraseña', 'إعادة إدخال كلمة المرور الجديدة', 'Re-entrez votre nouveau mot de passe', '重新输入新密码', NULL),
(485, 'save_password', 'Save Password', 'Guardar Contraseña', 'حفظ كلمة المرور', 'Enregistrer Le Mot De Passe', '保存密码', NULL),
(486, 'incorrect_password', 'Incorrect Password', 'Contraseña Incorrecta', 'كلمة المرور غير صحيحة', 'Mot De Passe Incorrect', '密码不正确', NULL),
(487, 'terms_conditions', 'Terms Conditions', 'Términos Y Condiciones', 'الشروط والأحكام', 'Termes Et Conditions', '条款细则', NULL),
(488, 'give_a_rating', 'Give A Rating', 'Give A Clasificación', 'إعطاء تقييم', 'Donner une note', '给予评级', NULL),
(489, 'tax', 'Tax', 'Impuesto', 'ضريبة', 'Impôt', '税', NULL),
(490, 'shipping', 'Shipping', 'Envío', 'الشحن', 'Livraison', '送货', NULL),
(491, 'grand_total', 'Grand Total', 'Gran Total', 'المجموع الإجمالي', 'Total', '累计', NULL),
(492, 'empty_cart', 'Empty Cart', 'Vaciar el carro', 'فارغة سلة', 'Panier Vide', '清空购物车', NULL),
(493, 'added_to wishlist', 'Added To Wishlist', 'Añadido a Mis Favoritos', 'أضيف الى قائمة الامنيات', 'Ajouté à la liste', '添加到收藏', NULL),
(494, 'available', 'Available', 'Disponible', 'متاح', 'Disponible', '可用的', NULL),
(495, 'remove_from_wishlist', 'Remove From Wishlist', 'Quitar de la lista', 'إزالة من قائمة الامنيات', 'Supprimer de la Liste', '从收藏中删除', NULL),
(496, 'my_cart', 'My Cart', 'Mi Carrito', 'سلة التسوق', 'Mon panier', '我的购物车', NULL),
(497, 'shopping_cart', 'Shopping Cart', 'Carrito De Compras', 'عربة التسوق', 'Panier', '购物车', NULL),
(498, 'review_&_edit_your_product', 'Review & Edit Your Product', 'Revisión y edición de su producto', 'مراجعة وتحرير منتجك', 'Consulter et modifier votre produit', '审查和编辑你的产品', NULL),
(499, 'qty', 'Qty', 'Cantidad', 'الكمية', 'Quantité', '数量', NULL),
(500, 'option', 'Option', 'Opción', 'خيار', 'Option', '选项', NULL),
(501, 'shipping_info', 'Shipping Info', 'Información De Envío', 'معلومات الشحن', 'Info Livraison', '航运信息', NULL),
(502, 'shipping_and_address_info', 'Shipping And Address Info', 'Envío y Dirección Info', 'الشحن وعنوان معلومات', 'Adresse d''expédition et Infos', '航运及地址信息', NULL),
(503, 'shipping_address', 'Shipping Address', 'Dirección De Envío', 'عنوان الشحن', 'Adresse De Livraison', '邮寄地址', NULL),
(504, 'first_name', 'First Name', 'Nombre', 'الاسم الأول', 'Prénom', '名字', NULL),
(505, 'last_name', 'Last Name', 'Apellido', 'اسم العائلة', 'Nom De Famille', '姓', NULL),
(506, 'zip/postal_code', 'Zip/postal Code', 'Postal / Código Postal', 'الرمز البريدي / الرمز البريدي', 'Zip / code postal', '邮编/邮政编码', NULL),
(507, 'payment', 'Payment', 'Pago', 'دفع', 'Paiement', '付款', NULL),
(508, 'select_payment_method', 'Select Payment Method', 'Seleccione el método de pago', 'اختر طريقة الدفع', 'Sélectionnez la méthode de paiement', '请选择支付方式', NULL),
(509, 'choose_a_payment_method', 'Choose A Payment Method', 'Elija un método de pago', 'اختيار طريقة الدفع', 'Choisissez une méthode de paiement', '选择付款方式', NULL),
(510, 'frequently_asked_questions', 'Frequently Asked Questions', 'Preguntas Frecuentes', 'أسئلة مكررة', 'Questions Fréquemment Posées', '经常问的问题', NULL),
(511, 'subtotal', 'Subtotal', 'Total parcial', 'حاصل الجمع', 'Total', '小计', NULL),
(512, 'invoice_paper', 'Invoice Paper', 'Papel Factura', 'فاتورة ورقة', 'Papier facture', '发票纸', NULL),
(513, 'invoice_no', 'Invoice No', 'Factura No', 'رقم الفاتورة', 'NumFacture', '发票号码', NULL),
(514, 'client_information:', 'Client Information:', 'Información Del Cliente:', 'معلومات العميل:', 'Renseignements sur le client:', '客户资料：', NULL),
(515, 'first_name:', 'First Name:', 'Nombre:', 'الاسم الأول:', 'Prénom:', '名字：', NULL),
(516, 'last_name:', 'Last Name:', 'Apellido:', 'اسم العائلة:', 'Nom De Famille:', '姓：', NULL),
(517, 'city_:', 'City :', 'Ciudad:', 'مدينة:', 'Ville:', '城市：', NULL),
(518, 'peyment_details_:', 'Peyment Details :', 'Peyment Detalles:', 'PEYMENT تفاصيل:', 'Peyment Détails:', 'Peyment详细信息：', NULL),
(519, 'payment_status_:', 'Payment Status :', 'Estado De Pago:', 'حالة السداد:', 'Statut De Paiement:', '付款状态：', NULL),
(520, 'payment_method_:', 'Payment Method :', 'Forma De Pago:', 'طريقة الدفع:', 'Mode de paiement:', '付款方式：', NULL),
(521, 'payment_invoice', 'Payment Invoice', 'Factura De Pago', 'دفع الفاتورة', 'Paiement de facture', '付款发票', NULL),
(522, 'item', 'Item', 'Artículo', 'العنصر', 'Article', '项目', NULL),
(523, 'unit_cost', 'Unit Cost', 'Costo Unitario', 'تكلفة الوحدة', 'Coût Unitaire', '单价', NULL),
(524, 'sub_total_amount', 'Sub Total Amount', 'Sub Total Importe', 'جنوب المبلغ الكلي لل', 'Sous Montant total', '小计金额', NULL),
(525, 'print', 'Print', 'Impresión', 'طباعة', 'Impression', '打印', NULL),
(526, 'manage_users', 'Manage Users', 'Administrar usuarios', 'إدارة المستخدمين', 'Gérer les utilisateurs', '管理用户', NULL),
(527, 'view_profile', 'View Profile', 'Ver Perfil', 'الملف الشخصي', 'Voir Le Profil', '查看资料', NULL),
(528, 'users', 'Users', 'Usuarios', 'المستخدمين', 'Utilisateurs', '用户', NULL),
(529, 'product_sale_comparison', 'Product Sale Comparison', 'Comparación de productos Venta', 'مقارنة بيع المنتج', 'Comparaison de vente de produit', '产品销售比较', NULL),
(530, 'product_sale_comparison_report', 'Product Sale Comparison Report', 'Venta de productos ¡Comparar Reportar', 'المنتج بيع مقارنة تقرير', 'Vente de produit Rapport de comparaison', '产品销售比较报告', NULL),
(531, 'get_stock_report', 'Get Stock Report', 'Obtén Stock Reportar', 'الحصول على الأوراق المالية تقرير', 'Obtenez Stock Rapport', '获取库存报告', NULL),
(532, 'delivery_payment', 'Delivery Payment', 'Entrega Pago', 'تسليم الدفع', 'Livraison Paiement', '货到付款', NULL),
(533, 'invoice_no:', 'Invoice No:', 'Factura No:', 'رقم الفاتورة:', 'NO FACTURE:', '发票号码：', NULL),
(534, 'date_:', 'Date :', 'Fecha:', 'تاريخ:', 'Date:', '日期：', NULL),
(535, 'client_information', 'Client Information', 'Información Del Cliente', 'معلومات العميل', 'Renseignements sur le client', '客户信息', NULL),
(536, 'payment_detail', 'Payment Detail', 'Detalle de Pago', 'دفع التفاصيل', 'Paiement Détail', '付款明细', NULL),
(537, 'payment_method', 'Payment Method', 'Forma De Pago', 'طريقة الدفع', 'Mode de paiement', '付款方式', NULL),
(538, 'payment_date', 'Payment Date', 'Día De Pago', 'تاريخ الدفع', 'Date De Paiement', '支付日期', NULL),
(539, 'zipcode', 'Zipcode', 'Código Postal', 'الرمز البريدي', 'Code Postal', '邮政编码', NULL),
(540, 'marker_location', 'Marker Location', 'Marcador de ubicación', 'علامة الموقع', 'Marker Localisation', '标记位置', NULL),
(541, 'payment_details', 'Payment Details', 'Detalles Del Pago', 'تفاصيل الدفع', 'Détails de paiement', '付款详情', NULL),
(542, 'reduced_quantity_will_be_added.', 'Reduced Quantity Will Be Added.', 'Cantidad reducida se añadirán.', 'انخفاض الكمية ستضاف.', 'Quantité réduite seront ajoutés.', '减少数量将增加。', NULL),
(543, 'monetary_loss', 'Monetary Loss', 'Resultado Monetario', 'فقدان النقدي', 'Perte monétaire', '金钱损失', NULL),
(544, 'details_of', 'Details Of', 'Detalles De', 'تفاصيل', 'Détails de', '详细信息', NULL),
(545, 'tag', 'Tag', 'Etiqueta', 'بطاقة', 'Balise', '标签', NULL),
(546, 'colors', 'Colors', 'Colores', 'الألوان', 'Couleurs', '颜色', NULL),
(547, 'user', 'User', 'Usuario', 'المستخدم', 'Utilisateur', '用户', NULL),
(548, 'phone_number', 'Phone Number', 'Número Telefónico', 'رقم الهاتف', 'numéro de téléphone', '电话号码', NULL),
(549, 'view_contact_message', 'View Contact Message', 'Ver contacto Mensaje', 'عرض طرق الاتصال رسالة', 'Voir Contact Message', '查看联系信息', NULL),
(550, 'view_message', 'View Message', 'Ver Mensaje', 'إرسال رسالة خاصة إلى', 'Voir le message', '查看留言', NULL),
(551, 'message_from', 'Message From', 'Mensaje De', 'رسالة من', 'Message De', '从消息', NULL),
(552, 'date_&_time', 'Date & Time', 'Fecha Y Hora', 'التاريخ والوقت', 'Date et heure', '日期时间', NULL),
(553, 'reply_contact_message', 'Reply Contact Message', 'Responder Contacto Mensaje', 'رد الاتصال رسالة', 'Répondre Contact Message', '回复留言联系', NULL),
(554, 'successfully_replied!', 'Successfully Replied!', 'Respondió con éxito!', 'أجاب بنجاح!', 'Répondit succès!', '成功作答！', NULL),
(555, 'reply_message', 'Reply Message', 'Responder Mensaje', 'الرد رسالة', 'Message De Réponse', '回复留言', NULL),
(556, 'view_original_message', 'View Original Message', 'Ver mensaje original', 'عرض الرسالة الأصلية', 'Voir Original Message', '查看原始消息', NULL),
(557, 'new_word', 'New Word', 'Palabra Nueva', 'كلمة جديدة', 'Nouveau Mot', '新词', NULL),
(558, 'already_exists!', 'Already Exists!', 'Ya Existe!', 'موجود بالفعل!', 'Existe Déjà!', '已经存在！', NULL),
(559, 'language_name', 'Language Name', 'Nombre de Idioma', 'اسم اللغة', 'Nom de la langue', '语言名称', NULL),
(560, 'new_language', 'New Language', 'Nuevo Idioma', 'لغة جديدة', 'Nouvelle Langue', '新的语言', NULL),
(561, 'do_you_really_want_to_delete_this_language?', 'Do You Really Want To Delete This Language?', '¿Realmente desea eliminar este idioma?', 'هل حقا تريد حذف هذه اللغة؟', 'Êtes-vous sûr de vouloir supprimer cette langue?', '你真的要删除这个语言？', NULL),
(562, 'unknown_user', 'Unknown User', 'Usuario Desconocido', 'مجهول العضو', 'Utilisateur Inconnu', '未知用户', NULL),
(563, 'slider_enabled!', 'Slider Enabled!', 'Deslizador Habilitado!', 'المنزلق ممكن!', 'Curseur activé!', '滑块启用！', NULL),
(564, 'slider_disabled!', 'Slider Disabled!', 'Deslizador discapacitados!', 'التمرير معطل!', 'Curseur handicapés!', '滑块残疾人！', NULL),
(565, 'cash_payment_enabled!', 'Cash Payment Enabled!', 'Pago Dinero en efectivo habilitado!', 'الدفع نقدا تمكين!', 'Paiement en espèces activé!', '现金支付启用！', NULL),
(566, 'cash_payment_disabled!', 'Cash Payment Disabled!', 'Pago Dinero en efectivo habilitado!', 'الدفع نقدا معطل!', 'Paiement en espèces désactivé!', '现金付款禁用！', NULL),
(567, 'slider', 'Slider', 'Deslizador', 'المنزلق', 'Curseur', '滑块', NULL),
(568, 'cash_payment', 'Cash Payment', 'Pago al contado', 'دفع نقدا', 'Paiement en espèces', '现金支付', NULL),
(569, 'revisit_after', 'Revisit After', 'Revisar Después', 'إعادة النظر بعد', 'Revoir Après', '回访后', NULL),
(570, 'days', 'Days', 'Días', 'أيام', 'Jours', '天', NULL),
(571, 'you_registered_successfully', 'You Registered Successfully', 'Usted registrado correctamente', 'كنت مسجل بنجاح', 'Vous enregistré avec succès', '你成功注册', NULL),
(572, 'registration_failed!_try_again!', 'Registration Failed! Try Again!', '¡Registro fallido! </font><font>¡Inténtalo de nuevo!', 'فشل في التسجيل! </font><font>حاول مرة أخرى!', 'Échec de l''enregistrement! </font><font>Essaye encore!', '注册失败！</font><font>再试一次！', NULL),
(573, 'registering..', 'Registering..', 'Registrando ..', 'تسجيل ..', 'Enregistrement ..', '注册..', NULL),
(574, 'you_logged_out_successfully', 'You Logged Out Successfully', 'Usted cerrado la sesión con éxito', 'قمت بتسجيل بنجاح', 'Vous vous êtes connecté avec succès', '您已注销成功', NULL),
(575, 'stripe_payment', 'Stripe Payment', 'Raya Pago', 'شريط الدفع', 'Stripe paiement', '条纹付款', NULL),
(576, 'stripe_secret_key', 'Stripe Secret Key', 'Raya clave secreta', 'شريط سر مفتاح', 'Stripe Secret Key', '条纹秘密钥匙', NULL),
(577, 'stripe_publishable_key', 'Stripe Publishable Key', 'Raya Publicable clave', 'شريط للنشر مفتاح', 'Stripe Publiable clé', '条纹可发布重点', NULL),
(578, 'your_card_details_verified!', 'Your Card Details Verified!', 'Su Tarjeta detalles verificado!', 'بطاقتك تفاصيل التحقق!', 'Votre carte Détails Vérifié!', '您的信用卡资料验证！', NULL),
(579, 'pay_with_stripe', 'Pay With Stripe', 'Pagará con la raya', 'دفع مع الشريط', 'Payez à rayures', '支付随着条纹', NULL),
(580, 'color_schemes', 'Color Schemes', 'Combinaciones de colores', 'أنظمة الألوان', 'Jeux de couleurs', '配色方案', NULL),
(581, 'header_color', 'Header Color', 'Cabecera color', 'رأس اللون', 'Header couleur', '标题颜色', NULL),
(582, 'footer_color', 'Footer Color', 'Pie de página en color', 'تذييل اللون', 'Pied de couleur', '页脚颜色', NULL),
(583, 'select', 'Select', 'Seleccionar', 'اختار', 'Sélectionner', '选择', NULL),
(584, 'cart_emptied', 'Cart Emptied', 'Cesta Vaciado', 'عربة أفرغ', 'Panier Vidé', '购物车清空', NULL),
(585, 'header/footer_color_scheme', 'Header/footer Color Scheme', 'Encabezado / pie de página Esquema de color', 'رأس / تذييل نظام الألوان', 'En-tête / pied de page Color Scheme', '页眉/页脚配色方案', NULL),
(586, 'header_/_footer_scheme', 'Header / Footer Scheme', 'Encabezado Pie de página Esquema /', 'رأس / تذييل مخطط', 'Tête / pied Scheme', '页眉/页脚计划', NULL),
(587, 'choode_your_scheme', 'Choode Your Scheme', 'Choode Su Esquema', 'Choode مخطط لديك', 'Choode Votre Scheme', 'Choode你的计划', NULL),
(588, 'edit_page', 'Edit Page', 'Editar Página', 'تعديل الصفحة', 'Modifier la page', '编辑页面', NULL),
(589, 'ddd', 'Ddd', 'Ddd', 'DDD', 'Ddd', 'DDD', NULL),
(590, 'page_code', 'Page Code', 'Página de códigos', 'كود الصفحة', 'Code Page', '页面代码', NULL),
(591, 'page_tags', 'Page Tags', 'Página Etiquetas', 'الصفحة الكلمات', 'Page Tags', '标签页', NULL),
(592, 'column', 'Column', 'Columna', 'عمود', 'Colonne', '柱', NULL),
(593, 'gg', 'Gg', 'Gg', 'زز', 'Gg', 'GG', NULL),
(594, 'if_you_need_more_choice_options_for_your_product_,please_click_here.', 'If You Need More Choice Options For Your Product ,please Click Here.', 'Si usted necesita más opciones de elección para su producto, por favor haga clic aquí.', 'إذا كنت بحاجة إلى المزيد من الخيارات الخيارات للمنتج الخاص بك، الرجاء الضغط هنا.', 'Si vous souhaitez plus d''options choix pour votre produit, s''il vous plaît Cliquez ici.', '如果您需要更多的选择选项，为您的产品，请点击这里。', NULL),
(595, 'add_option', 'Add Option', 'Añadir Opción', 'إضافة خيار', 'Ajouter une option', '添加选项', NULL),
(596, 'customer_input_title', 'Customer Input Title', 'Cliente Título de entrada', 'العميل إدخال عنوان', 'Entrée client Titre', '顾客输入标题', NULL),
(597, 'add_options_for_choice', 'Add Options For Choice', 'Agregar opciones para la opción', 'إضافة خيارات للاختيار', 'Ajouter des Options For Choice', '添加选项供选择', NULL),
(598, 'add_customer_input_options', 'Add Customer Input Options', 'Añadir Opciones de entrada del cliente', 'إضافة خيارات الإدخال العملاء', 'Ajouter Options d''entrée à la clientèle', '添加用户输入选项', NULL),
(599, 'if_you_need_more_choice_options_for_customers_of_this_product_,please_click_here.', 'If You Need More Choice Options For Customers Of This Product ,please Click Here.', 'Si usted necesita más opciones de elección para los clientes de este producto, por favor haga clic aquí.', 'إذا كنت بحاجة إلى المزيد من الخيارات الخيارات للعملاء من هذا المنتج، يرجى النقر هنا.', 'Si vous souhaitez plus d''options choix pour les clients de ce produit, s''il vous plaît Cliquez ici.', '如果您需要更多的选择方式供客户选择本产品，请点击这里。', NULL),
(600, 'option_name', 'Option Name', 'Nombre de la opción', 'الخيار اسم', 'Nom de l''option', '选项​​名称', NULL),
(601, 'product_details', 'Product Details', 'Detalles Del Producto', 'تفاصيل المنتج', 'Détails du produit', '产品详情', NULL),
(602, 'business_details', 'Business Details', 'Detalles del negocio', 'تفاصيل العمل', 'Détails d''affaires', '业务细节', NULL),
(603, 'customer_choice_options', 'Customer Choice Options', 'Opciones de elección de los clientes', 'خيارات اختيار العملاء', 'Options choix du client', '客户选择选项', NULL),
(604, 'choose_one', 'Choose One', 'Elige uno', 'اختر واحدا', 'Choisissez-en un', '选一个', NULL),
(605, 'choices', 'Choices', 'Elecciones', 'الخيارات', 'Choix', '选择', NULL),
(606, 'change_choices', 'Change Choices', 'Cambiar opciones', 'تغيير خيارات', 'Changer choix', '更改选择', NULL),
(607, 'coupon_discount', 'Coupon Discount', 'Cupón de Descuento', 'خصم القسيمة', 'Coupon de réduction', '优惠券折扣', NULL),
(608, 'discount_coupon', 'Discount Coupon', 'Cupón de descuento', 'خصم القسيمة', 'Coupon de réduction', '优惠券', NULL),
(609, 'manage_coupons', 'Manage Coupons', 'Administrar Cupones', 'إدارة كوبونات', 'Gérer Coupons', '管理优惠券', NULL),
(610, 'add_coupon', 'Add Coupon', 'Añadir Cupón', 'إضافة القسيمة', 'Ajouter Coupon', '添加优惠券', NULL),
(611, 'create_coupon', 'Create Coupon', 'Crear Cupón', 'إنشاء القسيمة', 'Créer Coupon', '创建优惠券', NULL),
(612, 'coupon', 'Coupon', 'Cupón', 'كوبون', 'Coupon', '优惠券', NULL),
(613, 'coupon_title', 'Coupon Title', 'Cupón Título', 'قسيمة العنوان', 'Coupon Titre', '优惠券标题', NULL),
(614, 'valid_till', 'Valid Till', 'Válido hasta', 'صالحة ل', 'Valable Pour', '有效期至', NULL),
(615, 'coupon_discount_for', 'Coupon Discount For', 'Cupón Descuento Para', 'كوبون خصم ل', 'Coupon de réduction Pour', '优惠券折扣', NULL),
(616, 'discount_type', 'Discount Type', 'Tipo de descuento', 'نوع الخصم', 'Type de remise', '量贩式', NULL),
(617, 'discount_value', 'Discount Value', 'Valor Descuento', 'قيمة الخصم', 'Valeur Remise', '贴现值', NULL),
(618, 'coupon_logo', 'Coupon Logo', 'Cupón Logo', 'قسيمة الشعار', 'Coupon Logo', '优惠券标志', NULL),
(619, 'select_coupon_logo', 'Select Coupon Logo', 'Seleccione Cupón Logo', 'حدد القسيمة الشعار', 'Sélectionnez Coupon Logo', '选择优惠券标志', NULL),
(620, 'code', 'Code', 'Código', 'رمز', 'Code', '代码', NULL),
(621, 'added_by', 'Added By', 'Añadido por', 'اضيف بواسطة', 'Ajouté par', '通过添加', NULL),
(622, 'coupon_code', 'Coupon Code', 'Código Promocional', 'رمز القسيمة', 'Code Promo', '优惠券代码', NULL),
(623, 'edit_coupon', 'Edit Coupon', 'Editar Cupón', 'تحرير القسيمة', 'Modifier Coupon', '编辑优惠券', NULL),
(624, 'coupon_discount_on', 'Coupon Discount On', 'Cupón de descuento en las', 'كوبون خصم على', 'Coupon de réduction Sur', '优惠券折扣', NULL),
(625, 'coupon_already_activated', 'Coupon Already Activated', 'Cupón sido activado', 'القسيمة إذا المنشط', 'Coupon déjà activé', '优惠券已激活', NULL),
(626, 'applying..', 'Applying..', 'Aplicando ..', 'تطبيق ..', 'Application ..', '应用..', NULL),
(627, 'coupon_not_valid', 'Coupon Not Valid', 'Cupón no válido', 'القسيمة غير صالح', 'Coupon non valide', '优惠券无效', NULL),
(628, 'coupon_discount_successful', 'Coupon Discount Successful', 'Cupón Descuento Exitosa', 'قسيمة الخصم الناجح', 'Coupon de réduction réussie', '优惠券折扣成功', NULL),
(629, 'apply_coupon', 'Apply Coupon', 'Aplicar cupón', 'تطبيق القسيمة', 'Appliquer Coupon', '申请优惠券', NULL),
(630, 'coupon_discount_activated', 'Coupon Discount Activated', 'Cupón Descuento Activado', 'خصم القسيمة المنشط', 'Bon de réduction Activé', '优惠券折扣激活', NULL),
(631, 'enabled!', 'Enabled!', 'Habilitado!', 'تمكين!', 'Enabled!', '启用！', NULL),
(632, 'disabled!', 'Disabled!', 'Habilitado!', 'معاق!', 'Désactivé!', '残疾人！', NULL),
(633, 'be_a_seller', 'Be A Seller', 'Sea Un Vendedor', 'يكون البائع', 'Soyez un vendeur', '成为一个卖家', NULL),
(634, 'already_a_seller?', 'Already A Seller?', '¿Ya es usted vendedor?', 'إذا كنت بائع؟', 'Déjà un vendeur?', '已经是卖家？', NULL),
(635, 'click', 'Click', 'Haga clic en', 'انقر', 'Cliquez', '点击', NULL),
(636, 'company', 'Company', 'Empresa', 'شركة', 'Entreprise', '公司', NULL),
(637, 'display_name', 'Display Name', 'Mostrar nombre', 'اسم العرض', 'Afficher un nom', '显示名称', NULL),
(638, 'vendors', 'Vendors', 'Los vendedores', 'الباعة', 'Les vendeurs', '厂商', NULL),
(639, 'manage_vendors', 'Manage Vendors', 'Administrar proveedores', 'إدارة الباعة', 'Gérer vendeurs', '管理供应商', NULL),
(640, 'total_sale', 'Total Sale', 'Venta total', 'إجمالي بيع', 'Total Vente', '总销售额', NULL),
(641, 'vendor', 'Vendor', 'Vendedor', 'بائع', 'Fournisseur', '供应商', NULL),
(642, 'due_amount', 'Due Amount', 'Cantidad a pagar', 'المبلغ المستحق', 'Montant dû', '到期金额', NULL),
(643, 'pay', 'Pay', 'Pagar', 'دفع', 'Payer', '付', NULL),
(644, 'membership_type', 'Vendorship Type', 'Tipo Vendorship', 'نوع Vendorship', 'Type de Vendorship', 'Vendorship类型', NULL),
(645, 'create_membership', 'Create Vendorship', 'Crear Vendorship', 'إنشاء Vendorship', 'Créer Vendorship', '创建Vendorship', NULL),
(646, 'membership', 'Vendorship', 'Vendorship', 'Vendorship', 'Vendorship', 'Vendorship', NULL),
(647, 'timespan', 'Timespan', 'Espacio de tiempo', 'المدى الزمني', 'Timespan', '时间跨度', NULL),
(648, 'add_membership', 'Add Vendorship', 'Añadir Vendorship', 'إضافة Vendorship', 'Ajouter Vendorship', '添加Vendorship', NULL),
(649, 'edit_membership', 'Edit Vendorship', 'Editar Vendorship', 'تحرير Vendorship', 'Modifier Vendorship', '编辑Vendorship', NULL),
(650, 'for', 'For', 'Por', 'إلى', 'Pour', '为', NULL),
(651, 'maximum_products', 'Maximum Products', 'Productos Máximos', 'المنتجات القصوى', 'Produits maximum', '最大产品', NULL),
(652, 'lifetime', 'Lifetime', 'Vida', 'حياة', 'Durée de vie', '一生', NULL),
(653, 'manage_vendor_profile', 'Manage Vendor Profile', 'Administrar perfil de proveedor', 'إدارة بائع الشخصي', 'Gérer Profil vendeur', '管理供应商档案', NULL),
(654, 'settings', 'Settings', 'Ajustes', 'الإعدادات', 'Paramètres', '设置', NULL),
(655, 'contact_message', 'Contact Message', 'Contacto Mensaje', 'الاتصال رسالة', 'Contact Message', '联系方式留言', NULL),
(656, 'choose_product', 'Choose Product', 'Elija Producto', 'اختيار المنتج', 'Choisissez un produit', '选择产品', NULL),
(657, 'full_invoice', 'Full Invoice', 'Factura completa', 'الفاتورة كاملة', 'Facture complet', '全部发票', NULL),
(658, 'invoice_for', 'Invoice For', 'Para Factura', 'فاتورة ل', 'Facture de', '发票', NULL),
(659, 'admin', 'Admin', 'Administración', 'المشرف', 'Administrateur', '管理员', NULL),
(660, 'account_not_approved._wait_for_approval.', 'Account Not Approved. Wait For Approval.', 'Cuenta No Aprobado. </font><font>Esperar la aprobación.', 'الحساب غير المعتمدة. </font><font>الانتظار للحصول على الموافقة.', 'Compte non approuvé. </font><font>Attendre l''approbation.', '帐户不获批准。</font><font>等待审批。', NULL),
(661, 'payment_stat', 'Payment Stat', 'Stat Pago', 'دفع ستات', 'Paiement Stat', '支付统计', NULL),
(662, 'total_sold', 'Total Sold', 'Total Vendido', 'إجمالي تباع', 'Vendu total', '累计售出', NULL),
(663, 'paid_by_customer', 'Paid By Customer', 'Pagado por el cliente', 'التي يدفعها العملاء', 'Payé par le client', '支付客户', NULL),
(664, 'paid_to_vendor', 'Paid To Vendor', 'Pagado a proveedor', 'دفعت إلى بائع', 'Payé au fournisseur', '支付给供应商', NULL),
(665, 'due_to_vendor', 'Due To Vendor', 'Debido a proveedor', 'ونظرا إلى البائع', 'En raison de vendeur', '由于供应商', NULL),
(666, 'vendor_home', 'Vendor Home', 'Vendedor Inicio', 'بائع الصفحة الرئيسية', 'Fournisseur Accueil', '供应商首页', NULL),
(667, 'vendor_homepage', 'Vendor Homepage', 'Vendedor Homepage', 'بائع الصفحة الرئيسية', 'Accueil du vendeur', '供应商首页', NULL),
(668, 'after_vendor_featured', 'After Vendor Featured', 'Después de proveedores destacados', 'بعد بائع مميزة', 'Après vendeur vedette', '供应商精选后', NULL),
(669, 'vendor_notification_sound', 'Vendor Notification Sound', 'Vendedor sonido de notificación', 'بائع إعلام الصوت', 'Notification vendeur sonore', '供应商通知声音', NULL),
(670, 'vendor_notification_volume', 'Vendor Notification Volume', 'Vendedor volumen Notificación', 'بائع إعلام حجم', 'Fournisseur notification Volume', '供应商的通知音量', NULL),
(671, 'vendor_logo', 'Vendor Logo', 'Vendedor Logo', 'بائع الشعار', 'Vendor Logo', '销售商标志', NULL),
(672, 'vendor_images', 'Vendor Images', 'Imágenes de proveedores', 'صور بائع', 'Images fournisseurs', '供应商形象', NULL),
(673, 'select_banner', 'Select Banner', 'Seleccione Banner', 'حدد شعار', 'Sélectionnez Bannière', '选择旗帜', NULL),
(674, 'manage_payment_receiving_settings', 'Manage Payment Receiving Settings', 'Administrar configuración de recepción de pago', 'إدارة إعدادات الدفع الاستلام', 'Gérer les paramètres de réception de paiements', '管理的收款设置', NULL),
(675, 'select_product', 'Select Product', 'Seleccionar producto', 'حدد المنتج', 'Sélectionner un produit', '选择产品', NULL),
(676, 'pay_vendor', 'Pay Vendor', 'Vendedor Paga', 'دفع البائع', 'Pay vendeur', '支付供应商', NULL),
(677, 'cash_on_delivery_to_vendor', 'Cash On Delivery To Vendor', 'Pago contra entrega al proveedor', 'نقدا عند التسليم لبائع', 'Cash On Delivery Pour fournisseur', '货到付款到供应商', NULL),
(678, 'due', 'Due', 'Debido', 'بسبب', 'Dû', '应有', NULL),
(679, 'partially_paid', 'Partially Paid', 'Parcialmente Pagado', 'دفعت جزئيا', 'Partiellement payé', '部分支付', NULL),
(680, 'fully_paid', 'Fully Paid', 'Totalmente pagado', 'مدفوع بالكامل', 'Entièrement payé', '缴足', NULL),
(681, 'total_cash_on_delivery_to_vendor', 'Total Cash On Delivery To Vendor', 'Total activos líquidos en el envío a Vendor', 'مجموع نقدا عند التسليم لالبائع', 'Total en espèces sur la livraison à vendeur', '总货到付款到供应商', NULL),
(682, 'paid_cash_on_delivery_to_vendor', 'Paid Cash On Delivery To Vendor', 'Pagado Pago contra entrega al proveedor', 'تدفع نقدا عند التسليم لبائع', 'Payés par contre remboursement au fournisseur', '支付货到付款到供应商', NULL),
(683, 'by_admin', 'By Admin', 'Por Admin', 'من طرف Admin', 'Par admin', '由Admin', NULL),
(684, 'cash_on_delivery', 'Cash On Delivery', 'Pago contra entrega', 'الدفع عند التسليم', 'Paiement À La Livraison', '货到付款', NULL),
(685, 'upgrade', 'Upgrade', 'Modernización', 'تطوير', 'Améliorer', '提升', NULL),
(686, 'choose_membership', 'Choose Vendorship', 'Elija Vendorship', 'اختيار Vendorship', 'Choisissez Vendorship', '选择Vendorship', NULL),
(687, 'details', 'Details', 'Detalles', 'تفاصيل', 'Détails', '详细信息', NULL),
(688, 'method', 'Method', 'Método', 'طريقة', 'Méthode', '方法', NULL),
(689, 'maximum_product', 'Maximum Product', 'Máximo Producto', 'الحد الأقصى المنتج', 'Produit maximum', '最大产品', NULL),
(690, 'default', 'Default', 'Defecto', 'افتراضي', 'Par défaut', '默认', NULL),
(691, 'free', 'Free', 'Gratis', 'حر', 'Libre', '自由', NULL),
(692, 'manage_membership_settings', 'Manage Vendorship Settings', 'Administrar configuración Vendorship', 'إدارة إعدادات Vendorship', 'Gérer les paramètres Vendorship', '管理Vendorship设置', NULL),
(693, 'upgrade_membership', 'Upgrade Vendorship', 'Actualiza Vendorship', 'ترقية Vendorship', 'Améliorez Vendorship', '升级Vendorship', NULL),
(694, 'about', 'About', 'Sobre', 'حول', 'Sur', '大约', NULL),
(695, 'paid_by_customers', 'Paid By Customers', 'Pagado por los clientes', 'يدفعها العملاء', 'Payés par les clients', '支付的客户', NULL),
(696, 'due_from_admin', 'Due From Admin', 'Debido De admin', 'بسبب من المسؤول', 'En raison par Admin', '由于从管理员', NULL),
(697, 'membership_expiration', 'Vendorship Expiration', 'Vencimiento Vendorship', 'Vendorship انتهاء الصلاحية', 'Vendorship Expiration', 'Vendorship过期', NULL),
(698, 'membership_details', 'Vendorship Details', 'Vendorship Detalles', 'Vendorship تفاصيل', 'Vendorship Détails', 'Vendorship详细', NULL),
(699, 'amount', 'Amount', 'Cantidad', 'كمية', 'Quantité', '量', NULL),
(700, 'cash', 'Cash', 'Efectivo', 'نقد', 'Argent comptant', '现金', NULL),
(701, 'paypal', 'Paypal', 'PayPal', 'باي بال', 'Paypal', '支付宝', NULL),
(702, 'str ipe', 'Str Ipe', 'Str Ipe', 'شارع بورصة البترول الدولية', 'Str Ipe', '海峡蚁', NULL),
(703, 'stripe', 'Stripe', 'Raya', 'شريط', 'Stripe', '条纹', NULL),
(704, 'products_of', 'Products Of', 'Artículos de', 'منتجات', 'Produits De', '产品', NULL),
(705, 'all_vendors', 'All Vendors', 'Todos los vendedores', 'جميع الباعة', 'Tous les vendeurs', '所有厂商', NULL),
(706, 'all_categories', 'All Categories', 'Todas Las Categorías', 'جميع الفئات', 'Toutes Catégories', '所有类别', NULL),
(707, 'after_filter', 'After Filter', 'Después de Filtro', 'بعد تصفية', 'Après Filtre', '过滤后', NULL),
(708, 'sitemap_link', 'Sitemap Link', 'Mapa del sitio Enlace', 'رابط خريطة الموقع', 'Plan du site Lien', '地图链接', NULL),
(709, 'social_network_reach', 'Social Network Reach', 'Red de Alcance Social', 'شبكة ريتش الاجتماعية', 'Réseau portée sociale', '社会网络覆盖', NULL),
(710, 'alexa_traffic_metrics', 'Alexa Traffic Metrics', 'Alexa Traffic Métrica', 'اليكسا المرور القياسات', 'Alexa Traffic Metrics', 'Alexa的流量指标', NULL),
(711, 'alexa_traffic_graphs', 'Alexa Traffic Graphs', 'Alexa Traffic Gráficos', 'اليكسا المرور الرسوم البيانية', 'Alexa Traffic Graphiques', 'Alexa的流量图', NULL),
(712, 'search_index', 'Search Index', 'Buscar Índice', 'مؤشر البحث', 'Recherche Index', '搜索索引', NULL),
(713, 'alexa_traffic_rank', 'Alexa Traffic Rank', 'Alexa ranking de tráfico', 'رتبة اليكسا المرور', 'Alexa Traffic Rank', 'Alexa排名', NULL),
(714, 'your_email_address', 'Your Email Address', 'Tu Correo Electrónico', 'بريدك الإلكتروني', 'Votre adresse E-mail', '您的电子邮件地址', NULL),
(715, 'uploaded_maximum_products', 'Uploaded Maximum Products', 'Subida Productos Máximos', 'منتجات محملة الأقصى', 'Téléchargées produits maximum', '上传的最大产品', NULL),
(716, 'payment_settings', 'Payment Settings', 'Ajustes de Pago', 'إعدادات الدفع', 'Réglages de paiement', '付款设置', NULL),
(717, 'my_packages', 'My Packages', 'Mis Paquetes', 'بلدي الحزم', 'Mes Forfaits', '我的包', NULL),
(718, 'registration_successful!', 'Registration Successful!', '¡Registro exitoso!', 'نجاح عملية التسجيل!', 'Inscription réussi!', '注册成功！', NULL),
(719, 'please_check_your_email_inbox', 'Please Check Your Email Inbox', 'Por favor revise su bandeja de entrada de correo electrónico', 'يرجى التحقق من بريدك الالكتروني', 'S''il vous plaît vérifier votre boite email', '请检查您的电子邮件收件箱', NULL);
INSERT INTO `language` (`word_id`, `word`, `english`, `Spanish`, `Arabic`, `French`, `Chinese`, `Bangla`) VALUES
(720, 'visit_my_homepage', 'Visit My Homepage', 'Visita Mi Página de Inicio', 'زيارتي الصفحة الرئيسية', 'Visitez ma page d''accueil', '访问我的主页', NULL),
(721, 'next', 'Next', 'Siguiente', 'التالى', 'Suivant', '下一个', NULL),
(722, 'previous', 'Previous', 'Anterior', 'سابق', 'Précédent', '上一页', NULL),
(723, 'total_uploaded_products', 'Total Uploaded Products', 'Total Productos subidos', 'مجموع المنتجات حملت', 'Total des Produits téléchargées', '共上传产品', NULL),
(724, 'uploaded_published_products', 'Uploaded Published Products', 'Productos Publicados Subida', 'منتجات محملة المنشورة', 'Produits téléchargées Publié', '上传发布产品', NULL),
(725, 'already_uploaded_maximum_products!', 'Already Uploaded Maximum Products!', 'Ya cargados Productos Máximo!', 'تم الرفع بالفعل منتجات الأقصى!', 'Déjà téléchargé produits maximum!', '已上传最高的产品！', NULL),
(726, 'upgrade_your_membership', 'Upgrade Your Vendorship', 'Actualiza Tu Vendorship', 'ترقية Vendorship لديك', 'Améliorez votre Vendorship', '升级你的Vendorship', NULL),
(727, 'membership_payments', 'Vendorship Payments', 'Pagos Vendorship', 'المدفوعات Vendorship', 'Paiements de Vendorship', 'Vendorship付款', NULL),
(728, 'manage_membership_payments', 'Manage Vendorship Payments', 'Administrar Pagos Vendorship', 'إدارة المدفوعات Vendorship', 'Gérer les paiements Vendorship', '管理Vendorship付款', NULL),
(729, 'upgraded_membership', 'Upgraded Vendorship', 'Vendorship actualizado', 'Vendorship ترقية', 'Vendorship amélioré', '升级Vendorship', NULL),
(730, 'view_payment_details', 'View Payment Details', 'Ver los detalles del pago', 'عرض تفاصيل الدفع', 'Voir les détails de paiement', '查看付款明细', NULL),
(731, 'confirm_payment', 'Confirm Payment', 'Confirmar Pago', 'تأكيد الدفع', 'Confirmer le paiement', '确认付款', NULL),
(732, 'datetime', 'Datetime', 'Fecha y hora', 'التاريخ والوقت', 'Datetime', '日期时间', NULL),
(733, 'membership_to_upgrade', 'Vendorship To Upgrade', 'Vendorship Para actualizar', 'Vendorship لترقية', 'Vendorship Pour mettre à niveau', 'Vendorship升级', NULL),
(734, 'paid', 'Paid', 'Pagado', 'دفع', 'Payé', '付费', NULL),
(735, 'check_details', 'Check Details', 'Compruebe Detalles', 'تحقق من التفاصيل', 'Consultez les détails', '查看详情', NULL),
(736, 'type', 'Type', 'Tipo', 'اكتب', 'Type', '类型', NULL),
(737, 'none', 'None', 'Ninguno', 'لا شيء', 'Aucun', '无', NULL),
(738, 'facebook_comment', 'Facebook Comment', 'Facebook comentario', 'الفيسبوك تعليق', 'Facebook Commentaire', 'Facebook的评论', NULL),
(739, 'disqus_comment', 'Disqus Comment', 'Disqus comentario', 'هارد تعليق', 'Disqus Commentaire', 'DISQUS评论', NULL),
(740, 'fb_comment_id', 'Fb Comment Id', 'Fb Comentario Id', 'أف ب تعليق رقم', 'Fb Id Commentaire', 'FB注释ID', NULL),
(741, 'seal', 'Seal', 'Foca', 'ختم', 'Joint', '密封', NULL),
(742, 'membership_seal', 'Vendorship Seal', 'Vendorship Seal', 'Vendorship الختم', 'Seal Vendorship', 'Vendorship密封', NULL),
(743, 'select_membership_seal', 'Select Vendorship Seal', 'Seleccione Vendorship Seal', 'حدد Vendorship الختم', 'Sélectionnez Seal Vendorship', '选择Vendorship密封', NULL),
(744, 'vendor_list', 'Vendor List', 'Lista de proveedores', 'قائمة بائع', 'Liste de fournisseurs', '供应商列表', NULL),
(745, 'vendorship_timesapn', 'Vendorship Timesapn', 'Vendorship Timesapn', 'Vendorship Timesapn', 'Vendorship Timesapn', 'Vendorship Timesapn', NULL),
(746, 'remaining', 'Remaining', 'Restante', 'المتبقية', 'Restant', '剩余', NULL),
(747, 'my_products', 'My Products', 'Mis Productos', 'منتجاتي', 'Mes produits', '我的产品', NULL),
(748, 'product_list', 'Product List', 'Lista de productos', 'قائمة المنتجات', 'Liste de produits', '产品列表', NULL),
(749, 'vendor_registration', 'Vendor Registration', 'Proveedores Directorio', 'التسجيل بائع', 'Enregistrement des fournisseurs', '供应商登记', NULL),
(750, 'customer_login', 'Customer Login', 'Acceso del cliente', 'دخول العملاء', 'Connexion client', '客户登录', NULL),
(751, 'customer_registration', 'Customer Registration', 'Registro Clientes', 'التسجيل العملاء', 'Inscription à la clientèle', '客户注册', NULL),
(752, 'pending_vendors', 'Pending Vendors', 'Los vendedores pendientes', 'الباعة في انتظار', 'Les vendeurs en attente', '待供应商', NULL),
(753, 'vendor_stattistics', 'Vendor Stattistics', 'Vendedor Stattistics', 'بائع Stattistics', 'Fournisseur Stattistics', '供应商Stattistics', NULL),
(754, 'notification_email_sent_to_vendor!', 'Notification Email Sent To Vendor!', 'Notificación por correo electrónico enviado a vendedor!', 'إشعار البريد الإلكتروني المرسلة إلى البائع!', 'Courriel de notification envoyé au vendeur!', '通知邮件发送给供应商！', NULL),
(755, 'vendor_approval', 'Vendor Approval', 'Aprobación de proveedores', 'بائع الموافقة', 'Approbation du vendeur', '供应商认证', NULL),
(756, 'approval', 'Approval', 'Aprobación', 'موافقة', 'Approbation', '审批', NULL),
(757, 'approve', 'Approve', 'Aprobar', 'الموافقة', 'Approuver', '赞成', NULL),
(758, 'postpone', 'Postpone', 'Posponer', 'تأجيل', 'Reporter', '延期', NULL),
(759, 'vendor_system', 'Vendor System', 'Sistema Vendor', 'نظام بائع', 'Système du vendeur', '供应商体系', NULL),
(760, 'our_vendors', 'Our Vendors', 'Nuestros proveedores', 'الباعة لدينا', 'Nos fournisseurs', '我们的供应商', NULL),
(761, 'homepage_cache_time', 'Homepage Cache Time', 'Página de caché Tiempo', 'الصفحة الرئيسية الكاش الوقت', 'Page d''accueil Cache Temps', '首页缓存时间', NULL),
(762, 'search_for', 'Search For', 'Buscar', 'بحث عن', 'Rechercher', '搜索', NULL),
(763, 'total_vendors', 'Total Vendors', 'Los vendedores totales', 'مجموع الباعة', 'Nombre de fournisseurs', '总供应商', NULL),
(764, 'Sample Page', 'Sample Page', 'Página de Ejemplo', 'عينة الصفحة', 'Page d''exemple', '示例页面', NULL),
(765, 'vendorship_timespan', 'Vendorship Timespan', 'Vendorship Timespan', 'Vendorship زمنية', 'Vendorship Timespan', 'Vendorship时间跨度', NULL),
(766, 'blog', 'Blog', 'Blog', 'مدونة', 'Blog', '博客', NULL),
(767, 'all_blogs', 'All Blogs', 'Todos los blogs', 'كل المدونات', 'Tous les blogs', '所有博客', NULL),
(768, 'all_blog_categories', 'All Blog Categories', 'Todas las Categorías del blog', 'جميع أقسام المدونة', 'Tous blog Catégories', '所有博客分类', NULL),
(769, 'manage_blog', 'Manage Blog', 'Administrar Blog', 'إدارة المدونة', 'Gérer Blog', '管理博客', NULL),
(770, 'add_blog', 'Add Blog', 'Añadir Blog', 'إضافة المدونة', 'Ajouter Blog', '加入博客', NULL),
(771, 'create_blog', 'Create Blog', 'Crear Blog', 'إنشاء مدونة', 'Créer un blog', '创建博客', NULL),
(772, 'back_to_blog_list', 'Back To Blog List', 'Volver a la lista de blogs', 'العودة إلى قائمة المدونة', 'Retour à la liste Blog', '返回博客列表', NULL),
(773, 'edit_blog', 'Edit Blog', 'Editar Blog', 'تحرير المدونة', 'Modifier Blog', '编辑博客', NULL),
(774, 'add_blog_category', 'Add Blog Category', 'Añadir Blog Categoría', 'إضافة المدونة الفئة', 'Ajouter Blog Catégorie', '加入博客类别', NULL),
(775, 'create_blog_category', 'Create Blog Category', 'Crear Blog Categoría', 'إنشاء مدونة الفئة', 'Créer un blog Catégorie', '创建博客类别', NULL),
(776, 'edit_blog_category', 'Edit Blog Category', 'Editar Blog Categoría', 'تحرير المدونة الفئة', 'Modifier Blog Catégorie', '编辑博客类别', NULL),
(777, 'blog_category', 'Blog Category', 'Blog Categoría', 'بلوق الفئة', 'Blog Catégorie', '博客类别', NULL),
(778, 'blog_details', 'Blog Details', 'Blog detalles', 'تفاصيل بلوق', 'Détails blog', '博客详细', NULL),
(779, 'blog_title', 'Blog Title', 'Titulo de Blog', 'عنوان المدونة', 'Titre du Blog', '博客标题', NULL),
(780, 'summery', 'Summery', 'Estival', 'صيفي', 'D''été', '综述', NULL),
(781, 'blog_has_been_uploaded!', 'Blog Has Been Uploaded!', 'Blog se ha cargado!', 'بلوق تم تحميل!', 'Blog a été téléchargé!', '博客已经上传！', NULL),
(782, 'blog_categories', 'Blog Categories', 'Categorías del blog', 'بلوق الفئات', 'Blog Catégories', '博客分类', NULL),
(783, 'downloadable_product_folder_name', 'Downloadable Product Folder Name', 'Carpeta Descargable Productos', 'تحميل المنتج اسم المجلد', 'Téléchargeable produit Nom du dossier', '可下载的产品文件夹名称', NULL),
(784, 'product_is_a_file', 'Product Is A File', 'Producto es un archivo', 'المنتج هو ملف', 'Produit est un fichier', '产品是一个文件', NULL),
(785, 'video', 'Video', 'Vídeo', 'فيديو', 'Vidéo', '视频', NULL),
(786, 'audio', 'Audio', 'Audio', 'سمعي', 'Acoustique', '音频', NULL),
(787, 'software', 'Software', 'Software', 'البرمجيات', 'Logiciels', '软体', NULL),
(788, 'etc.', 'Etc.', 'Etcétera', 'إلخ', 'Etc.', '等等。', NULL),
(789, 'product_file', 'Product File', 'Archivo de productos', 'ملف المنتج', 'Fiche produit', '产品文件', NULL),
(790, 'compressed', 'Compressed', 'Comprimido', 'مضغوط', 'Comprimé', '压缩', NULL),
(791, 'quick_view', 'Quick View', 'Vista rápida', 'نظرة سريعة', 'Aperçu', '快速浏览', NULL),
(792, 'compare', 'Compare', 'Comparar', 'قارن', 'Comparer', '比', NULL),
(793, 'todays_deal', 'Todays Deal', 'Trato de hoy', 'صفقة اليوم', 'Todays affaire', '今天的交易', NULL),
(794, 'product_added_to_compared', 'Product Added To Compared', 'Producto añadido a la comparación', 'وأضاف المنتج لمقارنة', 'Produit ajouté à la comparaison', '产品加入对比', NULL),
(795, 'compared', 'Compared', 'Comparado', 'مقارنة', 'Comparé', '相比', NULL),
(796, 'product_removed_from_compare', 'Product Removed From Compare', 'Producto eliminadas del Comparar', 'إزالة المنتجات من قارن', 'Produit retiré du comparateur', '产品移出比较', NULL),
(797, 'compare_category_full', 'Compare Category Full', 'Comparar Categoría Completo', 'قارن الفئة كامل', 'Comparez Catégorie complet', '比较分类全部', NULL),
(798, 'product_already_added_to_compare', 'Product Already Added To Compare', 'Producto Ya agregación a la comparación', 'المنتج أضفت إلى قارن', 'Produit Déjà ajouté à comparer', '产品已添加到比较', NULL),
(799, 'reset_compare_list', 'Reset Compare List', 'Restablecer la lista de comparación', 'إعادة تعيين قائمة قارن', 'Réinitialiser la liste de comparaison', '复位比较列表', NULL),
(800, 'back_to_home', 'Back To Home', 'De vuelta a casa', 'الرجوع إلى الصفحة الرئيسية', 'De retour à la maison', '返回首页', NULL),
(801, 'latest_blogs', 'Latest Blogs', 'Últimos Blogs', 'أحدث المدونات', 'Derniers Blogs', '最新博客', NULL),
(802, 'wish', 'Wish', 'Deseos', 'أتمنى', 'Souhaiter', '希望', NULL),
(803, 'wished', 'Wished', 'Deseado', 'تمنى', 'Souhaité', '希望', NULL),
(804, 'wishing..', 'Wishing..', 'Deseando..', 'متمنيا ..', 'Souhaitant ..', '许愿..', NULL),
(805, 'unvailable', 'Unvailable', 'Unvailable', 'أونفيلبل', 'Unvailable', 'Unvailable', NULL),
(806, 'today''s_deal', 'Today''s Deal', 'La oferta de hoy', 'صفقة اليوم', 'Aujourd''hui, Deal', '今日团购', NULL),
(807, 'digital_product', 'Digital Product', 'Digital Producto', 'المنتج الرقمي', 'Digitals', '数字产品', NULL),
(808, 'update_product_file', 'Update Product File', 'Actualizar archivo de Producto', 'تحديث ملف المنتج', 'Mise à jour Fiche produit', '更新产品文件', NULL),
(809, 'maximum_size', 'Maximum Size', 'Tamaño máximo', 'الحد الأقصى لحجم', 'Taille maximale', '最大尺寸', NULL),
(810, 'text', 'Text', 'Texto', 'نص', 'Texte', '正文', NULL),
(811, 'downloads', 'Downloads', 'Descargas', 'التحميلات', 'Téléchargements', '下载', NULL),
(812, 'download', 'Download', 'Descargar', 'تحميل', 'Télécharger', '下载', NULL),
(813, 'download_permission_denied', 'Download Permission Denied', 'Descargar Permiso denegado', 'تحميل الإذن مرفوض', 'Télécharger Autorisation refusée', '下载权限被拒绝', NULL),
(814, 'product_in_todays_deal!', 'Product In Todays Deal!', 'Producto en el actual Deal!', 'المنتج في هذه الأيام صفقة!', 'Produit Dans Todays Deal!', '产品在今天的交易！', NULL),
(815, 'product_removed_from_todays_deal!', 'Product Removed From Todays Deal!', 'Producto eliminadas del de hoy Deal!', 'المنتج إزالتها من هذه الأيام صفقة!', 'Produit retiré du Todays Deal!', '产品中删除从今天的交易！', NULL),
(816, 'vendor_locator', 'Vendor Locator', 'Localizador de proveedores', 'بائع محدد', 'Localisateur de vendeur', '销售商定位器', NULL),
(817, 'store_locator', 'Store Locator', 'Localizador de tiendas', 'فروعنا', 'Localisateur de magasin', '新店', NULL),
(818, 'search_vendors', 'Search Vendors', 'Buscar proveedores', 'الباعة بحث', 'Les fournisseurs de recherche', '搜索厂商', NULL),
(819, 'go', 'Go', 'Irse', 'اذهب', 'Aller', '走', NULL),
(820, 'search_vendor_by_title,_location,_address_etc.', 'Search Vendor By Title, Location, Address Etc.', 'Búsqueda de proveedores por Título, ubicación, dirección, etc.', 'البحث البائعين حسب العنوان، الموقع، عنوان إلخ', 'Recherche vendeur par titre, Lieu, adresse, etc.', '搜索供应商通过标题，地点，地址等', NULL),
(821, 'search_product_by_title,_description_etc.', 'Search Product By Title, Description Etc.', 'Búsqueda de productos por Título, Descripción Etc.', 'البحث عن منتج حسب العنوان، الوصف إلخ', 'Recherche de produits par Titre, Description Etc.', '产品搜索按标题，描述等，', NULL),
(822, 'top_slides', 'Top Slides', 'Top Diapositivas', 'أعلى الشرائح', 'Top Diapositives', '小刀架', NULL),
(823, 'manage_slidess', 'Manage Slidess', 'Administrar Slidess', 'إدارة Slidess', 'Gérer Slidess', '管理Slidess', NULL),
(824, 'add_slides', 'Add Slides', 'Añadir Diapositivas', 'إضافة الشرائح', 'Ajouter Diapositives', '添加幻灯片', NULL),
(825, 'create_slides', 'Create Slides', 'Crear diapositivas', 'إنشاء الشرائح', 'Création de diapositives', '创建幻灯片', NULL),
(826, 'edit_slides', 'Edit Slides', 'Editar Diapositivas', 'تحرير الشرائح', 'Modifier les diapositives', '编辑幻灯片', NULL),
(827, 'slides', 'Slides', 'Diapositivas', 'الشرائح', 'Diapositives', '幻灯片', NULL),
(828, 'slider_settings', 'Slider Settings', 'Configurar deslizador', 'إعدادات المنزلق', 'Réglages Slider', '滑块设置', NULL),
(829, 'layer_slider', 'Layer Slider', 'Capa deslizante', 'طبقة المتزلج', 'Curseur Layer', '层滑块', NULL),
(830, 'category_menu_slider', 'Category Menu Slider', 'Categoría Menú deslizante', 'فئة القائمة المتزلج', 'Catégorie Menu Curseur', '分类菜单滑块', NULL),
(831, 'quick', 'Quick', 'Rápida', 'سريع', 'Vite', '速', NULL),
(832, 'slides_name', 'Slides Name', 'Nombre Diapositivas', 'اسم الشرائح', 'Nom Diapositives', '幻灯片名称', NULL),
(833, 'slides_logo', 'Slides Logo', 'Diapositivas Logo', 'الشرائح الشعار', 'Diapositives Logo', '幻灯片徽标', NULL),
(834, 'select_slides_logo', 'Select Slides Logo', 'Seleccione Diapositivas Logo', 'حدد الشرائح الشعار', 'Sélectionnez Diapositives Logo', '选择幻灯片徽标', NULL),
(835, 'manage_top_slides', 'Manage Top Slides', 'Administrar Top Diapositivas', 'إدارة الشرائح الأعلى', 'Gérer Top Diapositives', '管理小刀架', NULL),
(836, 'slider_on_/_off', 'Slider On / Off', 'Control deslizante de encendido / apagado', 'المنزلق تشغيل / إيقاف', 'Curseur On / Off', '滑开/关', NULL),
(837, 'most_viewed_blogs', 'Most Viewed Blogs', 'Más Vistas Blogs', 'الأكثر مشاهدة المدونات', 'Meilleurs affichages Blogs', '最多查看博客', NULL),
(838, 'choose_a+product', 'Choose A+product', 'Elija un producto +', 'اختيار المنتج +', 'Choisissez un produit +', '选择A +产品', NULL),
(839, 'choose_a_product', 'Choose A Product', 'Elija un producto', 'اختر المنتج', 'Choisissez un produit', '选择一个产品', NULL),
(840, 'activate', 'Activate', 'Activar', 'تفعيل', 'Activer', '激活', NULL),
(841, 'select_slide_banner', 'Select Slide Banner', 'Seleccione Banner Slide', 'حدد شعار الشريحة', 'Sélectionnez Bannière de diapositives', '选择幻灯片旗帜', NULL),
(842, 'downloading...', 'Downloading...', 'Descargando ...', 'تحميل ...', 'Téléchargement ...', '下载...', NULL),
(843, 'reporter', 'Reporter', NULL, NULL, NULL, NULL, NULL),
(844, 'manage_reporter', 'Manage Reporter', NULL, NULL, NULL, NULL, NULL),
(845, 'add_reporter', 'Add Reporter', NULL, NULL, NULL, NULL, NULL),
(846, 'create_reporter', 'Create Reporter', NULL, NULL, NULL, NULL, NULL),
(847, 'back_to_reporter_list', 'Back To Reporter List', NULL, NULL, NULL, NULL, NULL),
(848, 'reporter_name', 'Reporter Name', NULL, NULL, NULL, NULL, NULL),
(849, 'reporter_title', 'Reporter Title', NULL, NULL, NULL, NULL, NULL),
(850, 'number_of_reporter_parts', 'Number Of Reporter Parts', NULL, NULL, NULL, NULL, NULL),
(851, 'lets_start_to_create_your_reporter', 'Lets Start To Create Your Reporter', NULL, NULL, NULL, NULL, NULL),
(852, 'edit_reporter', 'Edit Reporter', NULL, NULL, NULL, NULL, NULL),
(853, 'reporter_code', 'Reporter Code', NULL, NULL, NULL, NULL, NULL),
(854, 'reporter_tags', 'Reporter Tags', NULL, NULL, NULL, NULL, NULL),
(855, 'reporter_designation', 'Reporter Designation', NULL, NULL, NULL, NULL, NULL),
(856, 'reporter_phone', 'Reporter Phone', NULL, NULL, NULL, NULL, NULL),
(857, 'reporter_email', 'Reporter Email', NULL, NULL, NULL, NULL, NULL),
(858, 'reporter_address', 'Reporter Address', NULL, NULL, NULL, NULL, NULL),
(859, 'manage_widget', 'Manage Widget', NULL, NULL, NULL, NULL, NULL),
(860, 'add_widget', 'Add Widget', NULL, NULL, NULL, NULL, NULL),
(861, 'create_widget', 'Create Widget', NULL, NULL, NULL, NULL, NULL),
(862, 'back_to_widget_list', 'Back To Widget List', NULL, NULL, NULL, NULL, NULL),
(863, 'widget_name', 'Widget Name', NULL, NULL, NULL, NULL, NULL),
(864, 'widget_title', 'Widget Title', NULL, NULL, NULL, NULL, NULL),
(865, 'detail', 'Detail', NULL, NULL, NULL, NULL, NULL),
(866, 'position', 'Position', NULL, NULL, NULL, NULL, NULL),
(867, 'widget_designation', 'Widget Designation', NULL, NULL, NULL, NULL, NULL),
(868, 'widget_phone', 'Widget Phone', NULL, NULL, NULL, NULL, NULL),
(869, 'widget_email', 'Widget Email', NULL, NULL, NULL, NULL, NULL),
(870, 'widget_address', 'Widget Address', NULL, NULL, NULL, NULL, NULL),
(871, 'widget_type', 'Widget Type', NULL, NULL, NULL, NULL, NULL),
(872, 'widget_detail', 'Widget Detail', NULL, NULL, NULL, NULL, NULL),
(873, 'widget_position', 'Widget Position', NULL, NULL, NULL, NULL, NULL),
(874, 'widget_status', 'Widget Status', NULL, NULL, NULL, NULL, NULL),
(875, 'edit_widget', 'Edit Widget', NULL, NULL, NULL, NULL, NULL),
(876, 'menu', 'Menu', NULL, NULL, NULL, NULL, NULL),
(877, 'manage_menu', 'Manage Menu', NULL, NULL, NULL, NULL, NULL),
(878, 'add_menu', 'Add Menu', NULL, NULL, NULL, NULL, NULL),
(879, 'create_menu', 'Create Menu', NULL, NULL, NULL, NULL, NULL),
(880, 'back_to_menu_list', 'Back To Menu List', NULL, NULL, NULL, NULL, NULL),
(881, 'menu_title', 'Menu Title', NULL, NULL, NULL, NULL, NULL),
(882, 'menu_type', 'Menu Type', NULL, NULL, NULL, NULL, NULL),
(883, 'menu_detail', 'Menu Detail', NULL, NULL, NULL, NULL, NULL),
(884, 'menu_status', 'Menu Status', NULL, NULL, NULL, NULL, NULL),
(885, 'edit_menu', 'Edit Menu', NULL, NULL, NULL, NULL, NULL),
(886, 'poll', 'Poll', NULL, NULL, NULL, NULL, NULL),
(887, 'manage_poll', 'Manage Poll', NULL, NULL, NULL, NULL, NULL),
(888, 'add_poll', 'Add Poll', NULL, NULL, NULL, NULL, NULL),
(889, 'create_poll', 'Create Poll', NULL, NULL, NULL, NULL, NULL),
(890, 'back_to_poll_list', 'Back To Poll List', NULL, NULL, NULL, NULL, NULL),
(891, 'poll_question', 'Poll Question', NULL, NULL, NULL, NULL, NULL),
(892, 'poll_option', 'Poll Option', NULL, NULL, NULL, NULL, NULL),
(893, 'poll_status', 'Poll Status', NULL, NULL, NULL, NULL, NULL),
(894, 'poll_options', 'Poll Options', NULL, NULL, NULL, NULL, NULL),
(895, 'edit_poll', 'Edit Poll', NULL, NULL, NULL, NULL, NULL),
(896, 'news', 'News', NULL, NULL, NULL, NULL, NULL),
(897, 'manage_news', 'Manage News', NULL, NULL, NULL, NULL, NULL),
(898, 'add_news', 'Add News', NULL, NULL, NULL, NULL, NULL),
(899, 'create_news', 'Create News', NULL, NULL, NULL, NULL, NULL),
(900, 'back_to_news_list', 'Back To News List', NULL, NULL, NULL, NULL, NULL),
(901, 'news_question', 'News Question', NULL, NULL, NULL, NULL, NULL),
(902, 'news_options', 'News Options', NULL, NULL, NULL, NULL, NULL),
(903, 'news_status', 'News Status', NULL, NULL, NULL, NULL, NULL),
(904, 'manage_video', 'Manage Video', NULL, NULL, NULL, NULL, NULL),
(905, 'add_video', 'Add Video', NULL, NULL, NULL, NULL, NULL),
(906, 'create_video', 'Create Video', NULL, NULL, NULL, NULL, NULL),
(907, 'back_to_video_list', 'Back To Video List', NULL, NULL, NULL, NULL, NULL),
(908, 'video_title', 'Video Title', NULL, NULL, NULL, NULL, NULL),
(909, 'video_type', 'Video Type', NULL, NULL, NULL, NULL, NULL),
(910, 'video_link', 'Video Link', NULL, NULL, NULL, NULL, NULL),
(911, 'video_status', 'Video Status', NULL, NULL, NULL, NULL, NULL),
(912, 'edit_video', 'Edit Video', NULL, NULL, NULL, NULL, NULL),
(913, 'useful_link', 'Useful Link', NULL, NULL, NULL, NULL, NULL),
(914, 'manage_useful_link', 'Manage Useful Link', NULL, NULL, NULL, NULL, NULL),
(915, 'add_useful_link', 'Add Useful Link', NULL, NULL, NULL, NULL, NULL),
(916, 'create_useful_link', 'Create Useful Link', NULL, NULL, NULL, NULL, NULL),
(917, 'back_to_useful_link_list', 'Back To Useful Link List', NULL, NULL, NULL, NULL, NULL),
(918, 'summary', 'Summary', NULL, NULL, NULL, NULL, NULL),
(919, 'useful_link_title', 'Useful Link Title', NULL, NULL, NULL, NULL, NULL),
(920, 'useful_link_summary', 'Useful Link Summary', NULL, NULL, NULL, NULL, NULL),
(921, 'useful_link_link', 'Useful Link Link', NULL, NULL, NULL, NULL, NULL),
(922, 'edit_useful_link', 'Edit Useful Link', NULL, NULL, NULL, NULL, NULL),
(923, 'useful_link_status', 'Useful Link Status', NULL, NULL, NULL, NULL, NULL),
(924, 'gallery', 'Gallery', NULL, NULL, NULL, NULL, NULL),
(925, 'manage_gallery', 'Manage Gallery', NULL, NULL, NULL, NULL, NULL),
(926, 'add_gallery', 'Add Gallery', NULL, NULL, NULL, NULL, NULL),
(927, 'create_gallery', 'Create Gallery', NULL, NULL, NULL, NULL, NULL),
(928, 'back_to_gallery_list', 'Back To Gallery List', NULL, NULL, NULL, NULL, NULL),
(929, 'gallery_title', 'Gallery Title', NULL, NULL, NULL, NULL, NULL),
(930, 'gallery_status', 'Gallery Status', NULL, NULL, NULL, NULL, NULL),
(931, 'edit_gallery', 'Edit Gallery', NULL, NULL, NULL, NULL, NULL),
(932, 'news_title', 'News Title', NULL, NULL, NULL, NULL, NULL),
(933, 'news_summary', 'News Summary', NULL, NULL, NULL, NULL, NULL),
(934, 'news_description', 'News Description', NULL, NULL, NULL, NULL, NULL),
(935, 'news_date', 'News Date', NULL, NULL, NULL, NULL, NULL),
(936, 'news_admin', 'News Admin', NULL, NULL, NULL, NULL, NULL),
(937, 'news_speciality', 'News Speciality', NULL, NULL, NULL, NULL, NULL),
(938, 'edit_news', 'Edit News', NULL, NULL, NULL, NULL, NULL),
(939, 'menu_summary', 'Menu Summary', NULL, NULL, NULL, NULL, NULL),
(940, 'menu_description', 'Menu Description', NULL, NULL, NULL, NULL, NULL),
(941, 'user_link_summary', 'User Link Summary', NULL, NULL, NULL, NULL, NULL),
(942, 'news_detail', 'News Detail', NULL, NULL, NULL, NULL, NULL),
(943, 'page1', 'Page1', NULL, NULL, NULL, NULL, NULL),
(944, 'page2', 'Page2', NULL, NULL, NULL, NULL, NULL),
(945, 'page3', 'Page3', NULL, NULL, NULL, NULL, NULL),
(946, 'home1', 'Home1', NULL, NULL, NULL, NULL, NULL),
(947, 'news_image', 'News Image', NULL, NULL, NULL, NULL, NULL),
(948, 'select_news_image', 'Select News Image', NULL, NULL, NULL, NULL, NULL),
(949, 'speciality', 'Speciality', NULL, NULL, NULL, NULL, NULL),
(950, 'manage_speciality', 'Manage Speciality', NULL, NULL, NULL, NULL, NULL),
(951, 'add_speciality', 'Add Speciality', NULL, NULL, NULL, NULL, NULL),
(952, 'create_speciality', 'Create Speciality', NULL, NULL, NULL, NULL, NULL),
(953, 'back_to_speciality_list', 'Back To Speciality List', NULL, NULL, NULL, NULL, NULL),
(954, 'edit_speciality', 'Edit Speciality', NULL, NULL, NULL, NULL, NULL),
(955, 'speciality_title', 'Speciality Title', NULL, NULL, NULL, NULL, NULL),
(956, 'page4', 'Page4', NULL, NULL, NULL, NULL, NULL),
(957, 'page5', 'Page5', NULL, NULL, NULL, NULL, NULL),
(958, 'Employee managment', 'Employee Managment', NULL, NULL, NULL, NULL, NULL),
(959, 'authority managment', 'Authority Managment', NULL, NULL, NULL, NULL, NULL),
(960, 'Mass people', 'Mass People', NULL, NULL, NULL, NULL, NULL),
(961, 'Area managment', 'Area Managment', NULL, NULL, NULL, NULL, NULL),
(962, 'Union', 'Union', NULL, NULL, NULL, NULL, NULL),
(963, 'upzila', 'Upzila', NULL, NULL, NULL, NULL, NULL),
(964, 'distrcit', 'Distrcit', NULL, NULL, NULL, NULL, NULL),
(965, 'division', 'Division', NULL, NULL, NULL, NULL, NULL),
(966, 'upazila', 'Upazila', NULL, NULL, NULL, NULL, NULL),
(967, 'report managment', 'Report Managment', NULL, NULL, NULL, NULL, NULL),
(968, 'Area wise report', 'Area Wise Report', NULL, NULL, NULL, NULL, NULL),
(969, 'pollution wise report', 'Pollution Wise Report', NULL, NULL, NULL, NULL, NULL),
(970, 'complain wise report', 'Complain Wise Report', NULL, NULL, NULL, NULL, NULL),
(971, 'initiative', 'Initiative', NULL, NULL, NULL, NULL, NULL),
(972, 'Environment law', 'Environment Law', NULL, NULL, NULL, NULL, NULL),
(973, 'Funding', 'Funding', NULL, NULL, NULL, NULL, NULL),
(974, 'Awareness', 'Awareness', NULL, NULL, NULL, NULL, NULL),
(975, 'research', 'Research', NULL, NULL, NULL, NULL, NULL),
(976, 'complain Box', 'Complain Box', NULL, NULL, NULL, NULL, NULL),
(977, 'Punishment list', 'Punishment List', NULL, NULL, NULL, NULL, NULL),
(978, 'Site settings & Others', 'Site Settings & Others', NULL, NULL, NULL, NULL, NULL),
(979, 'manage_union', 'Manage Union', NULL, NULL, NULL, NULL, NULL),
(980, 'add_union', 'Add Union', NULL, NULL, NULL, NULL, NULL),
(981, 'create_union', 'Create Union', NULL, NULL, NULL, NULL, NULL),
(982, 'back_to_union_list', 'Back To Union List', NULL, NULL, NULL, NULL, NULL),
(983, 'manage_upazila', 'Manage Upazila', NULL, NULL, NULL, NULL, NULL),
(984, 'add_upazila', 'Add Upazila', NULL, NULL, NULL, NULL, NULL),
(985, 'create_upazila', 'Create Upazila', NULL, NULL, NULL, NULL, NULL),
(986, 'back_to_upazila_list', 'Back To Upazila List', NULL, NULL, NULL, NULL, NULL),
(987, 'district', 'District', NULL, NULL, NULL, NULL, NULL),
(988, 'manage_district', 'Manage District', NULL, NULL, NULL, NULL, NULL),
(989, 'add_district', 'Add District', NULL, NULL, NULL, NULL, NULL),
(990, 'create_district', 'Create District', NULL, NULL, NULL, NULL, NULL),
(991, 'back_to_district_list', 'Back To District List', NULL, NULL, NULL, NULL, NULL),
(992, 'district_question', 'District Question', NULL, NULL, NULL, NULL, NULL),
(993, 'district_options', 'District Options', NULL, NULL, NULL, NULL, NULL),
(994, 'district_status', 'District Status', NULL, NULL, NULL, NULL, NULL),
(995, 'manage_division', 'Manage Division', NULL, NULL, NULL, NULL, NULL),
(996, 'add_division', 'Add Division', NULL, NULL, NULL, NULL, NULL),
(997, 'create_division', 'Create Division', NULL, NULL, NULL, NULL, NULL),
(998, 'back_to_division_list', 'Back To Division List', NULL, NULL, NULL, NULL, NULL),
(999, 'manage_employee', 'Manage Employee', NULL, NULL, NULL, NULL, NULL),
(1000, 'add_employee', 'Add Employee', NULL, NULL, NULL, NULL, NULL),
(1001, 'create_employee', 'Create Employee', NULL, NULL, NULL, NULL, NULL),
(1002, 'back_to_employee_list', 'Back To Employee List', NULL, NULL, NULL, NULL, NULL),
(1003, 'employee_question', 'Employee Question', NULL, NULL, NULL, NULL, NULL),
(1004, 'employee_options', 'Employee Options', NULL, NULL, NULL, NULL, NULL),
(1005, 'employee_status', 'Employee Status', NULL, NULL, NULL, NULL, NULL),
(1006, 'employee', 'Employee', NULL, NULL, NULL, NULL, NULL),
(1007, 'manage_authority', 'Manage Authority', NULL, NULL, NULL, NULL, NULL),
(1008, 'add_authority', 'Add Authority', NULL, NULL, NULL, NULL, NULL),
(1009, 'create_authority', 'Create Authority', NULL, NULL, NULL, NULL, NULL),
(1010, 'back_to_authority_list', 'Back To Authority List', NULL, NULL, NULL, NULL, NULL),
(1011, 'authority_question', 'Authority Question', NULL, NULL, NULL, NULL, NULL),
(1012, 'authority_options', 'Authority Options', NULL, NULL, NULL, NULL, NULL),
(1013, 'authority_status', 'Authority Status', NULL, NULL, NULL, NULL, NULL),
(1014, 'authority', 'Authority', NULL, NULL, NULL, NULL, NULL),
(1015, 'manage_public', 'Manage Public', NULL, NULL, NULL, NULL, NULL),
(1016, 'add_public', 'Add Public', NULL, NULL, NULL, NULL, NULL),
(1017, 'create_public', 'Create Public', NULL, NULL, NULL, NULL, NULL),
(1018, 'back_to_public_list', 'Back To Public List', NULL, NULL, NULL, NULL, NULL),
(1019, 'public_question', 'Public Question', NULL, NULL, NULL, NULL, NULL),
(1020, 'public_options', 'Public Options', NULL, NULL, NULL, NULL, NULL),
(1021, 'public_status', 'Public Status', NULL, NULL, NULL, NULL, NULL),
(1022, 'public', 'Public', NULL, NULL, NULL, NULL, NULL),
(1023, 'manage_area_report', 'Manage Area Report', NULL, NULL, NULL, NULL, NULL),
(1024, 'add_area_report', 'Add Area Report', NULL, NULL, NULL, NULL, NULL),
(1025, 'create_area_report', 'Create Area Report', NULL, NULL, NULL, NULL, NULL),
(1026, 'back_to_area_report_list', 'Back To Area Report List', NULL, NULL, NULL, NULL, NULL),
(1027, 'manage_law', 'Manage Law', NULL, NULL, NULL, NULL, NULL),
(1028, 'add_law', 'Add Law', NULL, NULL, NULL, NULL, NULL),
(1029, 'create_law', 'Create Law', NULL, NULL, NULL, NULL, NULL),
(1030, 'back_to_law_list', 'Back To Law List', NULL, NULL, NULL, NULL, NULL),
(1031, 'law_question', 'Law Question', NULL, NULL, NULL, NULL, NULL),
(1032, 'law_options', 'Law Options', NULL, NULL, NULL, NULL, NULL),
(1033, 'law_status', 'Law Status', NULL, NULL, NULL, NULL, NULL),
(1034, 'law', 'Law', NULL, NULL, NULL, NULL, NULL),
(1035, 'manage_funding', 'Manage Funding', NULL, NULL, NULL, NULL, NULL),
(1036, 'add_funding', 'Add Funding', NULL, NULL, NULL, NULL, NULL),
(1037, 'create_funding', 'Create Funding', NULL, NULL, NULL, NULL, NULL),
(1038, 'back_to_funding_list', 'Back To Funding List', NULL, NULL, NULL, NULL, NULL),
(1039, 'manage_awareness', 'Manage Awareness', NULL, NULL, NULL, NULL, NULL),
(1040, 'add_awareness', 'Add Awareness', NULL, NULL, NULL, NULL, NULL),
(1041, 'create_awareness', 'Create Awareness', NULL, NULL, NULL, NULL, NULL),
(1042, 'back_to_awareness_list', 'Back To Awareness List', NULL, NULL, NULL, NULL, NULL),
(1043, 'manage_research', 'Manage Research', NULL, NULL, NULL, NULL, NULL),
(1044, 'add_research', 'Add Research', NULL, NULL, NULL, NULL, NULL),
(1045, 'create_research', 'Create Research', NULL, NULL, NULL, NULL, NULL),
(1046, 'back_to_research_list', 'Back To Research List', NULL, NULL, NULL, NULL, NULL),
(1047, 'manage_review', 'Manage Review', NULL, NULL, NULL, NULL, NULL),
(1048, 'add_review', 'Add Review', NULL, NULL, NULL, NULL, NULL),
(1049, 'create_review', 'Create Review', NULL, NULL, NULL, NULL, NULL),
(1050, 'back_to_review_list', 'Back To Review List', NULL, NULL, NULL, NULL, NULL),
(1051, 'manage_punishment', 'Manage Punishment', NULL, NULL, NULL, NULL, NULL),
(1052, 'add_punishment', 'Add Punishment', NULL, NULL, NULL, NULL, NULL),
(1053, 'create_punishment', 'Create Punishment', NULL, NULL, NULL, NULL, NULL),
(1054, 'back_to_punishment_list', 'Back To Punishment List', NULL, NULL, NULL, NULL, NULL),
(1055, 'punishment_question', 'Punishment Question', NULL, NULL, NULL, NULL, NULL),
(1056, 'punishment_options', 'Punishment Options', NULL, NULL, NULL, NULL, NULL),
(1057, 'punishment_status', 'Punishment Status', NULL, NULL, NULL, NULL, NULL),
(1058, 'punishment', 'Punishment', NULL, NULL, NULL, NULL, NULL),
(1059, 'Area managment fdsbfdsmfdsfmdsvvf', 'Area Managment Fdsbfdsmfdsfmdsvvf', NULL, NULL, NULL, NULL, NULL),
(1060, 'ldashboard', 'Ldashboard', NULL, NULL, NULL, NULL, NULL),
(1061, 'garbage managment', 'Garbage Managment', NULL, NULL, NULL, NULL, NULL),
(1062, 'dustbin', 'Dustbin', NULL, NULL, NULL, NULL, NULL),
(1063, 'vehicle', 'Vehicle', NULL, NULL, NULL, NULL, NULL),
(1064, 'route', 'Route', NULL, NULL, NULL, NULL, NULL),
(1065, 'garbage_collector', 'Garbage Collector', NULL, NULL, NULL, NULL, NULL),
(1066, 'water_pollution', 'Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1067, 'water_pollution_type', 'Water Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1068, 'Water pollution', 'Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1069, 'air pollution', 'Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1070, 'air_pollution', 'Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1071, 'air_pollution_type', 'Air Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1072, 'noisy_point', 'Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1073, 'noisy_point_type', 'Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1074, 'noisy_pollution', 'Noisy Pollution', NULL, NULL, NULL, NULL, NULL),
(1075, 'awareness_question', 'Awareness Question', NULL, NULL, NULL, NULL, NULL),
(1076, 'awareness_options', 'Awareness Options', NULL, NULL, NULL, NULL, NULL),
(1077, 'awareness_status', 'Awareness Status', NULL, NULL, NULL, NULL, NULL),
(1078, 'length', 'Length', NULL, NULL, NULL, NULL, NULL),
(1079, 'people', 'People', NULL, NULL, NULL, NULL, NULL),
(1080, 'in_charge', 'In Charge', NULL, NULL, NULL, NULL, NULL),
(1081, 'view_division', 'View Division', NULL, NULL, NULL, NULL, NULL),
(1082, 'successfully_view!', 'Successfully View!', NULL, NULL, NULL, NULL, NULL),
(1083, 'serial', 'Serial', NULL, NULL, NULL, NULL, NULL),
(1084, 'Division Detail', 'Division Detail', NULL, NULL, NULL, NULL, NULL),
(1085, 'edit_district', 'Edit District', NULL, NULL, NULL, NULL, NULL),
(1086, 'view district', 'View District', NULL, NULL, NULL, NULL, NULL),
(1087, 'view_upazila', 'View Upazila', NULL, NULL, NULL, NULL, NULL),
(1088, 'upzila Detail', 'Upzila Detail', NULL, NULL, NULL, NULL, NULL),
(1089, 'Upazila Detail', 'Upazila Detail', NULL, NULL, NULL, NULL, NULL),
(1090, 'edit_union', 'Edit Union', NULL, NULL, NULL, NULL, NULL),
(1091, 'chairman', 'Chairman', NULL, NULL, NULL, NULL, NULL),
(1092, 'length(km)', 'Length(km)', NULL, NULL, NULL, NULL, NULL),
(1093, 'view_union', 'View Union', NULL, NULL, NULL, NULL, NULL),
(1094, 'Local area', 'Local Area', NULL, NULL, NULL, NULL, NULL),
(1095, 'manage_area', 'Manage Area', NULL, NULL, NULL, NULL, NULL),
(1096, 'add_area', 'Add Area', NULL, NULL, NULL, NULL, NULL),
(1097, 'create_area', 'Create Area', NULL, NULL, NULL, NULL, NULL),
(1098, 'back_to_area_list', 'Back To Area List', NULL, NULL, NULL, NULL, NULL),
(1099, 'block', 'Block', NULL, NULL, NULL, NULL, NULL),
(1100, 'edit_area', 'Edit Area', NULL, NULL, NULL, NULL, NULL),
(1101, 'view_area', 'View Area', NULL, NULL, NULL, NULL, NULL),
(1102, 'successfully_viwed!', 'Successfully Viwed!', NULL, NULL, NULL, NULL, NULL),
(1103, 'District Detail', 'District Detail', NULL, NULL, NULL, NULL, NULL),
(1104, 'Area Detail', 'Area Detail', NULL, NULL, NULL, NULL, NULL),
(1105, 'area_name', 'Area Name', NULL, NULL, NULL, NULL, NULL),
(1106, 'area_people', 'Area People', NULL, NULL, NULL, NULL, NULL),
(1107, 'area_length', 'Area Length', NULL, NULL, NULL, NULL, NULL),
(1108, 'area_block', 'Area Block', NULL, NULL, NULL, NULL, NULL),
(1109, 'area_status', 'Area Status', NULL, NULL, NULL, NULL, NULL),
(1110, 'area', 'Area', NULL, NULL, NULL, NULL, NULL),
(1111, 'edit_authority', 'Edit Authority', NULL, NULL, NULL, NULL, NULL),
(1112, 'edit_employee', 'Edit Employee', NULL, NULL, NULL, NULL, NULL),
(1113, 'Working type', 'Working Type', NULL, NULL, NULL, NULL, NULL),
(1114, 'view_employee', 'View Employee', NULL, NULL, NULL, NULL, NULL),
(1115, 'successfully_edview!', 'Successfully Edview!', NULL, NULL, NULL, NULL, NULL),
(1116, 'employee_name', 'Employee Name', NULL, NULL, NULL, NULL, NULL),
(1117, 'employee_phone', 'Employee Phone', NULL, NULL, NULL, NULL, NULL),
(1118, 'employee_email', 'Employee Email', NULL, NULL, NULL, NULL, NULL),
(1119, 'employee_address', 'Employee Address', NULL, NULL, NULL, NULL, NULL),
(1120, 'employee_payment', 'Employee Payment', NULL, NULL, NULL, NULL, NULL),
(1121, 'employee_type', 'Employee Type', NULL, NULL, NULL, NULL, NULL),
(1122, 'age', 'Age', NULL, NULL, NULL, NULL, NULL),
(1123, 'national id', 'National Id', NULL, NULL, NULL, NULL, NULL),
(1124, 'view_public', 'View Public', NULL, NULL, NULL, NULL, NULL),
(1125, 'blog_question', 'Blog Question', NULL, NULL, NULL, NULL, NULL),
(1126, 'blog_options', 'Blog Options', NULL, NULL, NULL, NULL, NULL),
(1127, 'blog_status', 'Blog Status', NULL, NULL, NULL, NULL, NULL),
(1128, 'edit_law', 'Edit Law', NULL, NULL, NULL, NULL, NULL),
(1129, 'law name', 'Law Name', NULL, NULL, NULL, NULL, NULL),
(1130, 'pollution_type_id', 'Pollution Type Id', NULL, NULL, NULL, NULL, NULL),
(1131, 'remark', 'Remark', NULL, NULL, NULL, NULL, NULL),
(1132, 'pollution_type', 'Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1133, 'edit_funding', 'Edit Funding', NULL, NULL, NULL, NULL, NULL),
(1134, 'view_funding', 'View Funding', NULL, NULL, NULL, NULL, NULL),
(1135, 'funding_question', 'Funding Question', NULL, NULL, NULL, NULL, NULL),
(1136, 'funding_options', 'Funding Options', NULL, NULL, NULL, NULL, NULL),
(1137, 'funding_status', 'Funding Status', NULL, NULL, NULL, NULL, NULL),
(1138, 'funding_title', 'Funding Title', NULL, NULL, NULL, NULL, NULL),
(1139, 'funding_description', 'Funding Description', NULL, NULL, NULL, NULL, NULL),
(1140, 'funding_remark', 'Funding Remark', NULL, NULL, NULL, NULL, NULL),
(1141, 'edit_awareness', 'Edit Awareness', NULL, NULL, NULL, NULL, NULL),
(1142, 'view_awareness', 'View Awareness', NULL, NULL, NULL, NULL, NULL),
(1143, 'time', 'Time', NULL, NULL, NULL, NULL, NULL),
(1144, 'area_id', 'Area Id', NULL, NULL, NULL, NULL, NULL),
(1145, 'Pollution type', 'Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1146, 'aim', 'Aim', NULL, NULL, NULL, NULL, NULL),
(1147, 'focus', 'Focus', NULL, NULL, NULL, NULL, NULL),
(1148, 'awareness_title', 'Awareness Title', NULL, NULL, NULL, NULL, NULL),
(1149, 'news_focus', 'News Focus', NULL, NULL, NULL, NULL, NULL),
(1150, 'news_aim', 'News Aim', NULL, NULL, NULL, NULL, NULL),
(1151, 'awareness_focus', 'Awareness Focus', NULL, NULL, NULL, NULL, NULL),
(1152, 'awareness_aim', 'Awareness Aim', NULL, NULL, NULL, NULL, NULL),
(1153, 'awareness_description', 'Awareness Description', NULL, NULL, NULL, NULL, NULL),
(1154, 'punishment_type', 'Punishment Type', NULL, NULL, NULL, NULL, NULL),
(1155, 'action', 'Action', NULL, NULL, NULL, NULL, NULL),
(1156, 'edit_punishment', 'Edit Punishment', NULL, NULL, NULL, NULL, NULL),
(1157, 'view_punishment', 'View Punishment', NULL, NULL, NULL, NULL, NULL),
(1158, 'Punishment type', 'Punishment Type', NULL, NULL, NULL, NULL, NULL),
(1159, 'punishmnet_description', 'Punishmnet Description', NULL, NULL, NULL, NULL, NULL),
(1160, 'punishmnet_action', 'Punishmnet Action', NULL, NULL, NULL, NULL, NULL),
(1161, 'punishment_date', 'Punishment Date', NULL, NULL, NULL, NULL, NULL),
(1162, 'edit_review', 'Edit Review', NULL, NULL, NULL, NULL, NULL),
(1163, 'view_review', 'View Review', NULL, NULL, NULL, NULL, NULL),
(1164, 'review_question', 'Review Question', NULL, NULL, NULL, NULL, NULL),
(1165, 'review_options', 'Review Options', NULL, NULL, NULL, NULL, NULL),
(1166, 'review_status', 'Review Status', NULL, NULL, NULL, NULL, NULL),
(1167, 'review', 'Review', NULL, NULL, NULL, NULL, NULL),
(1168, 'Type of complain', 'Type Of Complain', NULL, NULL, NULL, NULL, NULL),
(1169, 'solution', 'Solution', NULL, NULL, NULL, NULL, NULL),
(1170, 'news_solution', 'News Solution', NULL, NULL, NULL, NULL, NULL),
(1171, 'review_remark', 'Review Remark', NULL, NULL, NULL, NULL, NULL),
(1172, 'view_blog', 'View Blog', NULL, NULL, NULL, NULL, NULL),
(1173, 'motivation', 'Motivation', NULL, NULL, NULL, NULL, NULL),
(1174, 'blog_summary', 'Blog Summary', NULL, NULL, NULL, NULL, NULL),
(1175, 'blog_description', 'Blog Description', NULL, NULL, NULL, NULL, NULL),
(1176, 'blog_motivation', 'Blog Motivation', NULL, NULL, NULL, NULL, NULL),
(1177, 'bloging_date', 'Bloging Date', NULL, NULL, NULL, NULL, NULL),
(1178, 'manage_noisy_point', 'Manage Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1179, 'add_noisy_point', 'Add Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1180, 'create_noisy_point', 'Create Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1181, 'back_to_noisy_point_list', 'Back To Noisy Point List', NULL, NULL, NULL, NULL, NULL),
(1182, 'edit_noisy_point', 'Edit Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1183, 'noisy_point_question', 'Noisy Point Question', NULL, NULL, NULL, NULL, NULL),
(1184, 'noisy_point_options', 'Noisy Point Options', NULL, NULL, NULL, NULL, NULL),
(1185, 'noisy_point_name', 'Noisy Point Name', NULL, NULL, NULL, NULL, NULL),
(1186, 'noisy_point_reason', 'Noisy Point Reason', NULL, NULL, NULL, NULL, NULL),
(1187, 'noisy_point_action', 'Noisy Point Action', NULL, NULL, NULL, NULL, NULL),
(1188, 'view_noisy_point', 'View Noisy Point', NULL, NULL, NULL, NULL, NULL),
(1189, 'noisy point type', 'Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1190, 'reason', 'Reason', NULL, NULL, NULL, NULL, NULL),
(1191, 'manage_noisy_point_type', 'Manage Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1192, 'add_noisy_point_type', 'Add Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1193, 'create_noisy_point_type', 'Create Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1194, 'back_to_noisy_point_type_list', 'Back To Noisy Point Type List', NULL, NULL, NULL, NULL, NULL),
(1195, 'edit_noisy_point_type', 'Edit Noisy Point Type', NULL, NULL, NULL, NULL, NULL),
(1196, 'noisy_point_type_type', 'Noisy Point Type Type', NULL, NULL, NULL, NULL, NULL),
(1197, 'manage_air_pollution_type', 'Manage Air Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1198, 'add_air_pollution_type', 'Add Air Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1199, 'create_air_pollution_type', 'Create Air Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1200, 'back_to_air_pollution_type_list', 'Back To Air Pollution Type List', NULL, NULL, NULL, NULL, NULL),
(1201, 'edit_air_pollution_type', 'Edit Air Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1202, 'air_pollution_type_type', 'Air Pollution Type Type', NULL, NULL, NULL, NULL, NULL),
(1203, 'manage_water_pollution_type', 'Manage Water Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1204, 'add_water_pollution_type', 'Add Water Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1205, 'create_water_pollution_type', 'Create Water Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1206, 'back_to_water_pollution_type_list', 'Back To Water Pollution Type List', NULL, NULL, NULL, NULL, NULL),
(1207, 'edit_water_pollution_type', 'Edit Water Pollution Type', NULL, NULL, NULL, NULL, NULL),
(1208, 'water_pollution_type_type', 'Water Pollution Type Type', NULL, NULL, NULL, NULL, NULL),
(1209, 'manage_water_pollution', 'Manage Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1210, 'add_water_pollution', 'Add Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1211, 'create_water_pollution', 'Create Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1212, 'back_to_water_pollution_list', 'Back To Water Pollution List', NULL, NULL, NULL, NULL, NULL),
(1213, 'water_pollution_name', 'Water Pollution Name', NULL, NULL, NULL, NULL, NULL),
(1214, 'water_pollution_reason', 'Water Pollution Reason', NULL, NULL, NULL, NULL, NULL),
(1215, 'water_pollution_action', 'Water Pollution Action', NULL, NULL, NULL, NULL, NULL),
(1216, 'edit_water_pollution', 'Edit Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1217, 'view_water_pollution', 'View Water Pollution', NULL, NULL, NULL, NULL, NULL),
(1218, 'manage_air_pollution', 'Manage Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1219, 'add_air_pollution', 'Add Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1220, 'create_air_pollution', 'Create Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1221, 'back_to_air_pollution_list', 'Back To Air Pollution List', NULL, NULL, NULL, NULL, NULL),
(1222, 'air_pollution_name', 'Air Pollution Name', NULL, NULL, NULL, NULL, NULL),
(1223, 'air_pollution_reason', 'Air Pollution Reason', NULL, NULL, NULL, NULL, NULL),
(1224, 'air_pollution_action', 'Air Pollution Action', NULL, NULL, NULL, NULL, NULL),
(1225, 'edit_air_pollution', 'Edit Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1226, 'view_air_pollution', 'View Air Pollution', NULL, NULL, NULL, NULL, NULL),
(1227, 'manage_vehicle', 'Manage Vehicle', NULL, NULL, NULL, NULL, NULL),
(1228, 'add_vehicle', 'Add Vehicle', NULL, NULL, NULL, NULL, NULL),
(1229, 'create_vehicle', 'Create Vehicle', NULL, NULL, NULL, NULL, NULL),
(1230, 'back_to_vehicle_list', 'Back To Vehicle List', NULL, NULL, NULL, NULL, NULL),
(1231, 'edit_vehicle', 'Edit Vehicle', NULL, NULL, NULL, NULL, NULL),
(1232, 'vehicle_name', 'Vehicle Name', NULL, NULL, NULL, NULL, NULL),
(1233, 'manage_dustbin', 'Manage Dustbin', NULL, NULL, NULL, NULL, NULL),
(1234, 'add_dustbin', 'Add Dustbin', NULL, NULL, NULL, NULL, NULL),
(1235, 'create_dustbin', 'Create Dustbin', NULL, NULL, NULL, NULL, NULL),
(1236, 'back_to_dustbin_list', 'Back To Dustbin List', NULL, NULL, NULL, NULL, NULL),
(1237, 'location', 'Location', NULL, NULL, NULL, NULL, NULL),
(1238, 'employee_id', 'Employee Id', NULL, NULL, NULL, NULL, NULL),
(1239, 'vehicle_id', 'Vehicle Id', NULL, NULL, NULL, NULL, NULL),
(1240, 'status_id', 'Status Id', NULL, NULL, NULL, NULL, NULL),
(1241, 'edit_dustbin', 'Edit Dustbin', NULL, NULL, NULL, NULL, NULL),
(1242, 'view_dustbin', 'View Dustbin', NULL, NULL, NULL, NULL, NULL),
(1243, 'dustib_location', 'Dustib Location', NULL, NULL, NULL, NULL, NULL),
(1244, 'vehicle_location', 'Vehicle Location', NULL, NULL, NULL, NULL, NULL),
(1245, 'manage_route', 'Manage Route', NULL, NULL, NULL, NULL, NULL),
(1246, 'add_route', 'Add Route', NULL, NULL, NULL, NULL, NULL),
(1247, 'create_route', 'Create Route', NULL, NULL, NULL, NULL, NULL),
(1248, 'back_to_route_list', 'Back To Route List', NULL, NULL, NULL, NULL, NULL),
(1249, 'latitude', 'Latitude', NULL, NULL, NULL, NULL, NULL),
(1250, 'longitude', 'Longitude', NULL, NULL, NULL, NULL, NULL),
(1251, 'view_route', 'View Route', NULL, NULL, NULL, NULL, NULL),
(1252, 'edit_route', 'Edit Route', NULL, NULL, NULL, NULL, NULL),
(1253, 'route_name', 'Route Name', NULL, NULL, NULL, NULL, NULL),
(1254, 'route_latitude', 'Route Latitude', NULL, NULL, NULL, NULL, NULL),
(1255, 'route_longitude', 'Route Longitude', NULL, NULL, NULL, NULL, NULL),
(1256, 'manage_garbage_collector', 'Manage Garbage Collector', NULL, NULL, NULL, NULL, NULL),
(1257, 'add_garbage_collector', 'Add Garbage Collector', NULL, NULL, NULL, NULL, NULL),
(1258, 'create_garbage_collector', 'Create Garbage Collector', NULL, NULL, NULL, NULL, NULL),
(1259, 'back_to_garbage_collector_list', 'Back To Garbage Collector List', NULL, NULL, NULL, NULL, NULL),
(1260, 'garbage_collector_name', 'Garbage Collector Name', NULL, NULL, NULL, NULL, NULL),
(1261, 'garbage_collector_phone', 'Garbage Collector Phone', NULL, NULL, NULL, NULL, NULL),
(1262, 'garbage_collector_address', 'Garbage Collector Address', NULL, NULL, NULL, NULL, NULL),
(1263, 'edit_garbage_collector', 'Edit Garbage Collector', NULL, NULL, NULL, NULL, NULL),
(1264, 'law_name', 'Law Name', NULL, NULL, NULL, NULL, NULL),
(1265, 'registers', 'Registers', NULL, NULL, NULL, NULL, NULL),
(1266, 'inbox', 'Inbox', NULL, NULL, NULL, NULL, NULL),
(1267, 'my_area', 'My Area', NULL, NULL, NULL, NULL, NULL),
(1268, 'post_a_feedback', 'Post A Feedback', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `law`
--

CREATE TABLE IF NOT EXISTS `law` (
`law_id` int(11) NOT NULL,
  `pollution_type_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `law`
--

INSERT INTO `law` (`law_id`, `pollution_type_id`, `title`, `time`, `description`) VALUES
(1, 1, 'The Environment (Protection) Act ', '12/02/2016', 'a) co-ordination with the activities of any authority or institution in relation with the purposes of this Act; \r\nb) prevention of accidents which may cause environmental deterioration or pollution, taking security measures and laying down, and giving directions relating to, remedial measures for such accidents; \r\nc) giving advice or, as the case may be, directions to the persons concerned regarding the eco-friendly use, preservation, transport, import or export of hazardous substances or constituents thereof; \r\nd) investigating and examining information etc. relating to the protection, improvement and pollution of the environment and rendering assistance in such work to any other authority or institution; \r\ne) inspection of any places, premises, plants, machinery, manufactoring or other processes, materials or substances for the purpose of improving the environment and controlling and abating environmental pollution and giving of orders or directions to authorities or persons competent for the prevention, control and abatement of environmental pollution; \r\nf) collection, publication and dissemination of information relating to environmental pollution; \r\ng) giving advice to the Government for the avoidance of such manufactoring processes, matters and articles as may pollute the environment; \r\nh) carrying out programmes for the surveillance of the quality of drinking water and making reports and giving advice or, as the case may be, directions to all persons concerned to maintain the standard of drinking water.'),
(2, 2, 'The Environment (Protection) Rules ', '17/01/2016', 'a) co-ordination with the activities of any authority or institution in relation with the purposes of this Act; \r\nb) prevention of accidents which may cause environmental deterioration or pollution, taking security measures and laying down, and giving directions relating to, remedial measures for such accidents; \r\nc) giving advice or, as the case may be, directions to the persons concerned regarding the eco-friendly use, preservation, transport, import or export of hazardous substances or constituents thereof; \r\nd) investigating and examining information etc. relating to the protection, improvement and pollution of the environment and rendering assistance in such work to any other authority or institution; \r\ne) inspection of any places, premises, plants, machinery, manufactoring or other processes, materials or substances for the purpose of improving the environment and controlling and abating environmental pollution and giving of orders or directions to authorities or persons competent for the prevention, control and abatement of environmental pollution; \r\nf) collection, publication and dissemination of information relating to environmental pollution; \r\ng) giving advice to the Government for the avoidance of such manufactoring processes, matters and articles as may pollute the environment; \r\nh) carrying out programmes for the surveillance of the quality of drinking water and making reports and giving advice or, as the case may be, directions to all persons concerned to maintain the standard of drinking water.');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`news_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` longtext NOT NULL,
  `description` longtext NOT NULL,
  `date` varchar(200) NOT NULL,
  `admin` longtext NOT NULL,
  `speciality_id` varchar(500) NOT NULL DEFAULT '[]',
  `category_id` varchar(200) NOT NULL,
  `view_count` int(11) NOT NULL,
  `reporter_id` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `image` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `summary`, `description`, `date`, `admin`, `speciality_id`, `category_id`, `view_count`, `reporter_id`, `status`, `image`) VALUES
(15, 'Impedit rerum vel assumenda aut consequat Et harum officiis labore quia', 'Quia quo dolor mollit velit voluptatem voluptate eiusmod qui lorem proident, ducimus, nulla non consequatur? Ipsa, excepteur neque impedit, accusantium nesciunt, aliquip repudiandae repudiandae et quos quaerat minus laborum. At et tenetur id.', 'Ut ad cum sunt, quibusdam velit incididunt eius ab duis perferendis eius doloremque et natus quaerat sit similique nostrud dolore voluptatum aut qui sunt magnam numquam debitis sint facere esse rerum alias ipsa, dolorem accusamus consectetur ut provident, et quaerat recusandae. Eveniet, possimus, cumque ut commodo laboris.', '1983-10-26', 'Commodi voluptate cum non doloribus nostrum qui et tempora et', '["1","2"]', '7', 0, '3', 1, ''),
(16, 'Eum officia magnam esse eu reprehenderit explicabo Fugit dolor aut quaerat commodi ea quia dolor dolorum aliquam ullamco doloribus dignissimos', 'Eius et quidem illo vel tempor incididunt eiusmod facere rerum enim magni labore dolorem dignissimos quidem pariatur? Rerum fuga. Quos commodo lorem exercitationem ea quas dolor cupiditate neque ut qui laborum. Dolorem praesentium qui ullam adipisci reprehenderit consequatur? Adipisicing ea ducimus, ipsam ratione aliquip rem quod eiusmod aut ipsum necessitatibus reiciendis enim nihil officiis tempore, et sit, quidem ex sit facilis veritatis fuga. Ullam sequi aliqua. Recusandae. Quasi soluta nobis est explicabo. Culpa, doloremque et omnis et inventore excepturi quae inventore dolorem sit.', 'Molestiae occaecat mollit dolorem quis qui obcaecati quidem perspiciatis, quisquam qui similique sit repudiandae qui perferendis aut at in in in enim veniam, minus corrupti, esse vel eum vel reprehenderit anim dolore aspernatur sunt, qui rerum tempora dolor minus porro officiis minima labore et fugiat, in incidunt, minim id voluptatem, doloribus quasi qui aut eius praesentium minima nobis laudantium, iure incidunt, ipsum labore pariatur? Nam aute facilis quidem et sit aperiam.', '1985-09-02', 'Quos est nisi omnis delectus reprehenderit sit culpa nemo voluptate amet ullam', '["1","4"]', '5', 0, '2', 1, ''),
(17, 'Quaerat possimus voluptatem consequatur Autem reiciendis maxime illo do labore ex voluptatem aut eligendi quas consectetur est modi', 'Quod minima ad labore voluptate ab et deserunt culpa, sed voluptatum hic autem quod ut enim aut debitis voluptatem.', 'Autem ut autem sunt, et aut dolores fuga. Voluptate et occaecat est et qui saepe necessitatibus maxime quam minima do error molestias voluptatem deleniti nihil eos sit sint eiusmod sit, dolores mollitia veniam.', '2015-06-25', 'Enim fugiat commodo non eum et sapiente qui optio animi tenetur voluptatibus obcaecati debitis ex', '["1","2"]', '2', 0, '1', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `noisy_point`
--

CREATE TABLE IF NOT EXISTS `noisy_point` (
`noisy_point_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `noisy_point_type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `reason` longtext,
  `action` longtext,
  `employee_id` int(11) DEFAULT NULL,
  `complain` longtext
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noisy_point`
--

INSERT INTO `noisy_point` (`noisy_point_id`, `name`, `area_id`, `noisy_point_type_id`, `status_id`, `reason`, `action`, `employee_id`, `complain`) VALUES
(1, 'Tongi mor traffic signal', 1, 3, 1, 'Reason is a libertarian monthly print magazine covering politics, culture, and ideas through a provocative mix of news, analysis, commentary, and reviews.\r\n?Hit & Run Blog - ?ReasonTV - ?The Did-Something Candidate - ?Staff', 'Reason is a libertarian monthly print magazine covering politics, culture, and ideas through a provocative mix of news, analysis, commentary, and reviews.\r\n?Hit & Run Blog - ?ReasonTV - ?The Did-Something Candidate - ?Staff', 1, NULL),
(3, 'Colette George', NULL, 2, 2, 'Autem sequi aut blanditiis id, nostrud est sunt, magnam eveniet, molestias in quaerat autem molestiae iste laboriosam, qui laborum perspiciatis, est ex est iusto odio inventore aliqua. Voluptates quod duis et iure quos delectus, illo dolorem veritatis omnis ut odit rerum non nihil incidunt, ullamco et laudantium, ex dolor quidem accusamus sapiente qui labore alias assumenda autem dolore voluptas hic culpa, unde id debitis excepturi ipsum distinctio. Odit maiores porro minus iure voluptate dolor.', 'Eos quasi aut voluptatem. Officia fugiat aut sunt et et enim nemo natus commodi delectus, architecto consequat. Et nemo iure consequatur? Quam quia Nam facere rerum aut molestias qui earum rerum cum voluptas cupiditate consequatur, voluptatum et at consequat. Exercitationem impedit, do quaerat molestias adipisci minima exercitationem nemo ipsum totam ut consequat. Eos, excepturi voluptate sequi dolore esse blanditiis ratione aliquam fugit, aut et quo dolores vitae consequat.', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `noisy_point_type`
--

CREATE TABLE IF NOT EXISTS `noisy_point_type` (
`noisy_point_type_id` int(11) NOT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noisy_point_type`
--

INSERT INTO `noisy_point_type` (`noisy_point_type_id`, `type`) VALUES
(1, 'School'),
(2, 'Hospital'),
(3, 'Signal'),
(4, 'Field');

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `poll_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `options` longtext NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pollution_type`
--

CREATE TABLE IF NOT EXISTS `pollution_type` (
`pollution_type_id` int(11) NOT NULL,
  `type` varchar(110) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pollution_type`
--

INSERT INTO `pollution_type` (`pollution_type_id`, `type`) VALUES
(1, 'Water Pollution'),
(2, 'Air Pollution'),
(3, 'Sound Pollution'),
(4, 'Garbage Pollution');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
`property_id` int(11) NOT NULL,
  `property_name` varchar(100) NOT NULL,
  `division` varchar(50) NOT NULL,
  `full_address` varchar(100) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `available_from` date NOT NULL,
  `owner_id` int(11) NOT NULL,
  `detail_description` mediumtext NOT NULL,
  `view_count` int(100) NOT NULL DEFAULT '0',
  `avg_rating` int(11) NOT NULL DEFAULT '0',
  `property_type` varchar(255) NOT NULL DEFAULT 'house'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_name`, `division`, `full_address`, `bedrooms`, `rent`, `keywords`, `available_from`, `owner_id`, `detail_description`, `view_count`, `avg_rating`, `property_type`) VALUES
(1, 'Charles Garrett', 'barisal', 'Numquam occaecat iure et officia ipsum cum ut nemo consectetur exercitation et quae dolor', 2500, 2500, 'Inventore voluptatem Non consequatur assumenda aut et facere', '2000-03-31', 1, '', 18, 7, 'house'),
(2, 'sevenhill', 'rangpur', 'Minim quas rerum pariatur Porro', 2, 20000, 'Ad maxime minim maiores mollitia cillum consequatur Dolor ipsum nihil quis perspiciatis perferendis ', '2007-01-01', 1, 'A nice house on the hilly regions. Built with care...', 53, 6, 'apartment'),
(3, 'Eleanor Hancock', 'rajshahi', 'Dolores et occaecat voluptatem quis aspernatur rerum aut similique eum eaque', 0, 0, 'Libero necessitatibus veniam incididunt nisi similique et', '1988-03-11', 1, 'Inventore voluptate nostrud aliquam in quam dignissimos autem doloribus vitae quo minima qui.', 20, 0, 'house'),
(4, 'Shaeleigh Hurst', 'barisal', 'Odio reprehenderit nobis eiusmod amet ipsa minim consequatur Laboriosam dolorem aut ipsum ea quam', 0, 0, 'Officiis nobis qui provident minim qui', '2005-08-03', 3, 'Sed hic veniam, dolore magna adipisci velit, corporis quisquam recusandae. Voluptas.', 1, 0, 'villa'),
(5, 'Hector Miranda', 'chittagong', 'Reprehenderit labore eaque repellendus Natus expedita mollitia at sit velit natus qui iusto dolore c', 0, 0, 'Veritatis odio animi aut velit quis consequatur hic et corporis et non voluptatem alias et consectet', '2010-06-10', 1, 'Tempore, animi, tempora est asperiores asperiores eu aliquip deleniti soluta et sint qui rem beatae ea tenetur enim asperiores enim.', 10, 8, 'house'),
(6, 'Jamalia Obrien', 'rajshahi', 'Eum molestias dignissimos porro lorem est consequatur Esse dolor laborum voluptatem id laudantium et', 0, 0, 'Sit molestias alias aliquid est qui ut quaerat natus voluptates assumenda non consequat Perferendis', '2012-12-24', 1, 'Velit repudiandae exercitationem et nulla et assumenda dolorem cumque anim excepturi.', 5, 0, 'other'),
(7, 'August Wolf', 'rangpur', 'Magni explicabo Commodi omnis blanditiis reprehenderit quae doloribus et voluptatum sunt sed quod do', 3, 91, 'Aperiam rerum laboris ipsum ad facere occaecat sit voluptatem Voluptatem enim sed totam Nam', '1980-01-08', 4, 'Laboris sint, error quos sunt deserunt sit, ea excepturi amet, sit.', 0, 0, 'house'),
(8, 'August Wolf', 'rangpur', 'Magni explicabo Commodi omnis blanditiis reprehenderit quae doloribus et voluptatum sunt sed quod do', 3, 91, 'Aperiam rerum laboris ipsum ad facere occaecat sit voluptatem Voluptatem enim sed totam Nam', '1980-01-08', 4, 'Laboris sint, error quos sunt deserunt sit, ea excepturi amet, sit.', 0, 0, 'house'),
(9, 'Jin Farmer', 'rajshahi', 'Dolor eos quis voluptatum vel recusandae Omnis sed obcaecati cupidatat mollit minim facere doloribus', 12, 67, 'Est voluptatum voluptatum ex rerum iusto esse hic explicabo Sunt rem eos ad', '1997-04-17', 4, 'In non adipisicing ducimus, non eiusmod tempora voluptatem non saepe est quaerat ut quam.', 0, 0, 'house'),
(10, 'Colleen Alvarez', 'rajshahi', 'Voluptatem tenetur nulla reprehenderit inventore laudantium proident excepteur quo nulla sit earum o', 0, 2, 'Quos exercitationem est obcaecati vel et eos dolore aut tempora pariatur Accusamus dignissimos labor', '2007-05-09', 4, 'Sit, Nam minim sit, rem amet, magna qui non quam velit consequatur? Sed nostrud.', 0, 0, 'house'),
(11, 'Nicholas Page', 'barisal', 'Ut eum sed aliquam delectus sunt repellendus Laborum Facere', 2, 1000, 'Eaque qui nisi dolores sint sed velit exercitation voluptatibus dolore quia laboris nemo voluptas', '2000-09-21', 4, 'Eos, laudantium, molestias autem cumque nesciunt, aut ullamco aut nulla unde sunt ad et eos architecto tempora quibusdam temporibus.', 1, 0, 'house'),
(12, 'Caleb Harvey', 'barisal', 'Nisi illo nulla repudiandae consectetur voluptatem Laborum deserunt sit autem minim tenetur exercita', 3, 34000, 'Non consectetur amet deleniti recusandae Dolor fugiat ea aperiam', '2013-01-17', 4, 'Expedita voluptate nihil quo labore eos, quos velit explicabo. Aut consequat. Ratione labore et.', 0, 0, 'villa'),
(13, 'Hakeem James', 'mymensingh', 'Sint delectus voluptatum nostrum vel laborum Do cumque doloremque temporibus aut in saepe autem quis', 4, 34555, 'Pariatur Nemo totam repellendus Ut', '1996-03-26', 4, 'Qui ut tempore, culpa, sit, hic cum sint laborum. Rerum molestiae dolorem laudantium, iste sapiente illum, molestiae ab.', 0, 0, 'house'),
(14, 'Hakeem James', 'mymensingh', 'Sint delectus voluptatum nostrum vel laborum Do cumque doloremque temporibus aut in saepe autem quis', 4, 34555, 'Pariatur Nemo totam repellendus Ut', '1996-03-26', 4, 'Qui ut tempore, culpa, sit, hic cum sint laborum. Rerum molestiae dolorem laudantium, iste sapiente illum, molestiae ab.', 0, 0, 'house'),
(15, 'George Castaneda', 'sylhet', 'Dolores et voluptatem ea quam consequuntur possimus sit officia totam', 4, 234000, 'Nostrum ea perferendis dolorem cumque velit proident', '1988-02-26', 4, 'Libero est, quidem accusantium ad facere non et alias impedit, iure eos.', 137, 7, 'house'),
(16, 'George Castaneda', 'sylhet', 'Dolores et voluptatem ea quam consequuntur possimus sit officia totam', 4, 234000, 'Nostrum ea perferendis dolorem cumque velit proident', '1988-02-26', 4, 'Libero est, quidem accusantium ad facere non et alias impedit, iure eos.', 0, 0, 'house'),
(17, 'George Castaneda', 'sylhet', 'Dolores et voluptatem ea quam consequuntur possimus sit officia totam', 4, 234000, 'Nostrum ea perferendis dolorem cumque velit proident', '1988-02-26', 4, 'Libero est, quidem accusantium ad facere non et alias impedit, iure eos.', 0, 0, 'house'),
(18, 'Alfonso Sawyer', 'dhaka', 'In nemo qui incidunt omnis velit quas laborum', 3, 45678, 'Adipisicing non ea pariatur Obcaecati culpa commodi rerum ea in eos nesciunt sit doloremque providen', '2015-01-08', 4, 'Optio, corporis dolore exercitationem irure dolore Nam a ratione dolore commodi mollitia voluptatum voluptatum.', 3, 7, 'other'),
(19, 'Amelia Lindsey', 'rajshahi', 'Quisquam quia illo est dolorem reiciendis minus atque dolore libero sed id irure', 2, 10000, 'Id nostrud nisi a facere nobis ea ea', '1999-03-10', 2, 'Saepe aspernatur aut dolor quia culpa, ea laboriosam, iure obcaecati eos pariatur. Nostrud et.', 32, 9, 'house'),
(20, 'Ulric Roy', 'dhaka', 'Anim quas tempor eveniet nihil excepturi illo in voluptates', 2, 10000, 'Suscipit dolore quis doloribus quidem facilis laborum Ex ea doloremque voluptate non', '1991-07-05', 2, 'Dolor exercitation veritatis omnis duis elit, omnis soluta odit rem aut inventore quaerat ipsum.', 1, 0, 'studio_apartment'),
(21, 'Britanney Cardenas', 'mymensingh', 'Tempora dolor natus debitis enim esse', 3, 3000, 'Anim autem duis nihil unde eiusmod distinctio Consequatur Minima sed explicabo Reiciendis ipsum exce', '1989-07-20', 2, 'Delectus, commodo culpa, optio, nulla qui aut aliquid aperiam ex non consequat. Quod laborum vitae doloribus consectetur, et distinctio.', 2, 7, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `public`
--

CREATE TABLE IF NOT EXISTS `public` (
`public_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `n_id` varchar(1100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public`
--

INSERT INTO `public` (`public_id`, `email`, `name`, `n_id`, `age`, `area_id`, `phone`, `password`) VALUES
(1, '', 'Jasir chowdhury', '214748364712321', 23, 1, '2147483647', '1234'),
(2, 'qetaqatyga@hotmail.com', 'Jana Joyner', '1232333233', NULL, 2, '01867775535', '1234'),
(3, 'pimoqocyr@hotmail.com', 'Lesley Love', '102211332202112', 26, 2, '01723232388', '1234'),
(4, 'tewuqajov@hotmail.com', 'Ciaran Matthews', '123131300022', 20, 3, '01912332233', '1234'),
(5, 'muly@gmail.com', 'Emerson Palmer', '12121212121212', 27, 1, '01872333222', '1234'),
(6, 'pygasi@hotmail.com', 'Eaton Moss', '21301301030123', 28, 3, '01882882222', '1234'),
(7, 'zufy@gmail.com', 'Jack Cleveland', '21212333232323', 29, 3, '01722233223', '1234'),
(8, 'public@yahoo.com', 'public', '123212344323', 30, 3, '01876444554', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `public_comment`
--

CREATE TABLE IF NOT EXISTS `public_comment` (
`public_comment_id` int(11) NOT NULL,
  `law_id` int(11) DEFAULT NULL,
  `awareness_id` int(11) DEFAULT NULL,
  `funding_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `pollution_type_id` int(11) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `comment` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `punishment`
--

CREATE TABLE IF NOT EXISTS `punishment` (
`punishment_id` int(11) NOT NULL,
  `pollution_type_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `action` longtext NOT NULL,
  `date` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punishment`
--

INSERT INTO `punishment` (`punishment_id`, `pollution_type_id`, `area_id`, `employee_id`, `description`, `action`, `date`) VALUES
(1, 1, 1, 1, 'Funding is the act of providing financial resources, usually in the form of money, or other values such as effort or time, to finance a need, program, and project, usually by an organisation or government. Generally, this word is used when a firm uses its internal reserves to satisfy its necessity for cash, while the term ‘financing‘ is used when the firms acquires capital from external sources.[1]\r\n\r\nSources of funding include credit, venture capital, donations, grants, savings, subsidies, and taxes. Fundings such as donations, subsidies, and grants that have no direct requirement for return of investment are described as "soft funding" or "crowdfunding". Funding that facilitates the exchange of equity ownership in a company for capital investment via an online funding portal as per the Jumpstart Our Business Startups Act (alternately, the "JOBS Act of 2012") (U.S.) is known as equity crowdfunding.\r\n\r\nFunds can be allocated for either short-term or long-term purposes.', 'Funding is the act of providing financial resources, usually in the form of money, or other values such as effort or time, to finance a need, program, and project, usually by an organisation or government. Generally, this word is used when a firm uses its internal reserves to satisfy its necessity for cash, while the term ‘financing‘ is used when the firms acquires capital from external sources.[1]\r\n', '20/3/2015'),
(2, 1, 1, 1, '', 'Quis ad facilis et qui qui qui omnis in vero sequi animi, et quas nulla ipsa, exercitation ut ut vel est commodo velit, doloremque aspernatur non praesentium dolor in et ad necessitatibus pariatur. Ut quae alias quasi ducimus, quam repudiandae amet, nulla provident, Nam tenetur qui aut voluptas sed accusantium quae odit ut dolorem libero dolorum aut illum, eveniet, ex veritatis voluptates aut saepe cumque ullamco.', '2006-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `punishment_type`
--

CREATE TABLE IF NOT EXISTS `punishment_type` (
`punishment_type_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punishment_type`
--

INSERT INTO `punishment_type` (`punishment_type_id`, `type`) VALUES
(1, 'Water pollution'),
(2, 'Air pollution');

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE IF NOT EXISTS `research` (
`research_id` int(11) NOT NULL,
  `filed` varchar(200) DEFAULT NULL,
  `description` longtext,
  `status` varchar(200) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
`review_id` int(11) NOT NULL,
  `pollution_type_id` int(11) DEFAULT NULL,
  `description` longtext,
  `solution` longtext,
  `area_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `pollution_type_id`, `description`, `solution`, `area_id`, `employee_id`, `public_id`, `remark`, `title`, `date`) VALUES
(1, 1, 'Hackathon are globally recognized marathon coding events. Hackathon is a gathering where programmers collaboratively code in an extreme manner over a short period of time.Developers, innovators and designers join hackathons in teams of 5 people generally to build innovative prototype to solve some given problems sets. Hackathons are ultimate exhibition of skills for developers.', 'Hackathon are globally recognized marathon coding events. Hackathon is a gathering where programmers collaboratively code in an extreme manner over a short period of time.Developers, innovators and designers join hackathons in teams of 5 people generally to build innovative prototype to solve some given problems sets. Hackathons are ultimate exhibition of skills for developers.', 3, 1, 1, 'Done', 'Water Pllution in dhamrai', '0000-00-00'),
(2, 0, 'Libero adipisci dolore officiis blanditiis aperiam nisi non voluptatem neque corporis omnis dolores voluptatem quia.', NULL, 2, NULL, 8, NULL, 'Sunt proident sunt deserunt dolorum et distinctio Quas aliquam ad laboris aut sit eos ut non sit culpa', '0000-00-00'),
(3, 1, 'Ab voluptatum do pariatur? Sit, quidem fugiat corrupti, facilis molestiae sit, anim.', NULL, 3, NULL, 8, NULL, 'Non fugiat non et qui sapiente eius incidunt dolore voluptatum neque beatae sunt maiores', '0000-00-00'),
(4, 4, 'Aut sed sed enim eligendi quos consequatur? Omnis est rerum earum et vel in magni labore autem sed voluptate.', NULL, 3, NULL, 8, NULL, 'Dignissimos blanditiis provident nesciunt nesciunt suscipit', 'Tue Apr, 2016 - 09:47 pm'),
(5, 4, 'Vel culpa, cupiditate dolorem deserunt et sed in adipisci dolor inventore.', NULL, 3, NULL, 8, NULL, 'Eligendi voluptates sed hic tenetur consectetur eligendi aliquam ullam nisi architecto in veniam eius distinctio Enim rem aut', '05 Apr, 2016 - 09:48 pm'),
(6, 1, 'Similique ratione mollit proident, doloremque mollitia est quia esse amet, nostrum voluptatem vel sequi tempor deleniti magna mollitia id.', NULL, 2, NULL, 8, NULL, 'Cillum quis laudantium illo tempor exercitationem', '05 Apr, 2016 - 09:49 pm'),
(7, 3, 'Ipsa, magna quia sunt, accusamus quasi at velit, aliqua. Dolore sit et voluptatem, ducimus, sed illum, ipsam in.', NULL, 2, NULL, 8, NULL, 'Test Feedback', '05 Apr, 2016 - 09:50 pm');

-- --------------------------------------------------------

--
-- Table structure for table `review_type`
--

CREATE TABLE IF NOT EXISTS `review_type` (
`review_type_id` int(11) NOT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`role_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`, `permission`, `description`) VALUES
(1, 'master', '', 'Master Admin. Adds Admin. Provides account roles.'),
(5, 'Product Manager', '["13","17","21","37","41","45","49"]', 'Manages Products'),
(4, 'Accountant', '["9","13","17","21"]', 'Accountancy and Support'),
(6, 'Manager', '["5","13","29","33","37","41","57","63"]', 'Manager of Active Super shop');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
`route_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `name`, `area_id`, `latitude`, `longitude`) VALUES
(1, 'fuller road', 1, '23.810332', '90.412518'),
(2, 'Mirpur road', 1, '23.810332', '90.412518');

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE IF NOT EXISTS `speciality` (
`speciality_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `codename` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speciality`
--

INSERT INTO `speciality` (`speciality_id`, `title`, `position`, `codename`) VALUES
(1, 'Editor''s Pick', 'Left', NULL),
(2, 'Slider News', 'Right', NULL),
(3, 'Weekley News', '', NULL),
(4, 'Monthly News', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
`status_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `name`) VALUES
(1, 'fine'),
(2, 'dangerous');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
`subscribe_id` int(11) NOT NULL,
  `email` varchar(600) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ui_settings`
--

CREATE TABLE IF NOT EXISTS `ui_settings` (
`ui_settings_id` int(11) NOT NULL,
  `type` longtext,
  `value` longtext
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ui_settings`
--

INSERT INTO `ui_settings` (`ui_settings_id`, `type`, `value`) VALUES
(1, 'side_bar_pos', NULL),
(2, 'latest_item_div', NULL),
(3, 'most_popular_div', NULL),
(4, 'most_view_div', NULL),
(5, 'filter_div', 'on'),
(6, 'admin_login_logo', '18'),
(7, 'admin_nav_logo', '18'),
(8, 'home_top_logo', '16'),
(9, 'home_bottom_logo', '2'),
(10, 'home_category', '["1","2","3","6"]'),
(11, 'fav_ext', 'png'),
(12, 'side_bar_pos_category', 'right'),
(13, 'home_brand', '["1","2","3","4","5","6"]'),
(14, 'footer_color', NULL),
(15, 'header_color', 'green');

-- --------------------------------------------------------

--
-- Table structure for table `union`
--

CREATE TABLE IF NOT EXISTS `union` (
`union_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `chairman` varchar(200) NOT NULL,
  `length` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `union`
--

INSERT INTO `union` (`union_id`, `name`, `description`, `chairman`, `length`, `people`, `upazila_id`) VALUES
(1, '2no Bariyadhala Union parisod', 'fsdfdsvfd fjvdsjfvdsfds jdvfdsjvfdsvfjsd fvdsjfvsdjvfsd jfvdsfvdsfv jfvsfvdsvfsj', 'Abuduss Sattar', 223, 23131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `upazila`
--

CREATE TABLE IF NOT EXISTS `upazila` (
`upazila_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `in_charge` varchar(200) DEFAULT NULL,
  `length` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upazila`
--

INSERT INTO `upazila` (`upazila_id`, `name`, `description`, `in_charge`, `length`, `people`, `district_id`) VALUES
(1, 'Turag', 'dfsdfdsf jdsfjdsvfjdsvf  fdjsfdsj fds fgdsjfgsdjgfjsdgf dgfjdsfgjdsgf dgfdjsgfdsjg\r\nfdsfdsfds dfdsfds  fdsfds fdsfds f', 'Mahfuz Al hasan', 1212, 32323, 1);

-- --------------------------------------------------------

--
-- Table structure for table `useful_link`
--

CREATE TABLE IF NOT EXISTS `useful_link` (
`useful_link_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` longtext NOT NULL,
  `link` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useful_link`
--

INSERT INTO `useful_link` (`useful_link_id`, `title`, `summary`, `link`) VALUES
(1, 'Eos temporibus in nisi quidem qui natus eu in et debitis', 'In non sint accusantium maxime voluptate harum nesciunt molestiae', 'Anim et ut quibusdam fugiat ut saepesdfdsfdsfdsfdsfdsfdsfdfd'),
(2, 'Dolorem laborum aut lorem exercitationem est voluptatem', 'Nill &nbsp; um, velit minima.', 'Aut magni fugiat exercitation occaecat elit ducimus modi sint aliquip cumque in');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `username` longtext,
  `surname` varchar(100) DEFAULT NULL,
  `email` longtext,
  `phone` longtext,
  `address1` longtext,
  `address2` longtext,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `langlat` varchar(100) DEFAULT NULL,
  `password` longtext,
  `last_login` varchar(50) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `surname`, `email`, `phone`, `address1`, `address2`, `city`, `zip`, `langlat`, `password`, `last_login`) VALUES
(1, 'Mr. Customer', 'Boy', 'customer@shop.com', '(88) 090 0938', 'Dhaka', 'Bangladesh', 'Dhaka', '1212', '(12.44819535767321, 76.66826244013669)', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1444986151');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
`vehicle_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `route_id` varchar(110) DEFAULT NULL,
  `status_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `name`, `employee_id`, `route_id`, `status_id`) VALUES
(1, 'X garbage vehicle', 1, '1', '1'),
(2, 'Rongdhonu', 3, '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `water_pollution`
--

CREATE TABLE IF NOT EXISTS `water_pollution` (
`water_pollution_id` int(11) NOT NULL,
  `water_pollution_type_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `reason` longtext,
  `action` longtext,
  `complain` longtext,
  `status_id` int(200) DEFAULT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `water_pollution`
--

INSERT INTO `water_pollution` (`water_pollution_id`, `water_pollution_type_id`, `area_id`, `employee_id`, `reason`, `action`, `complain`, `status_id`, `name`) VALUES
(1, 1, NULL, 1, 'Delectus, necessitatibus aut omnis sunt, nihil omnis alias dolore in autem voluptate ea ea est dolore fugit, eu atque non culpa, dolorem sunt, provident, est quis velit, in dolorem aut minus ut non est culpa, eum voluptatem, elit, lorem omnis placeat, corporis deserunt.', 'Quaerat illum, illum, corporis perspiciatis, ea quia qui sed commodi nesciunt, aliquip aut eveniet, dicta reprehenderit, natus ipsa, perferendis odio iure ut dolor sed veniam, maiores iure velit, aliquid iste eos, ut exercitationem quidem ipsum, veniam, voluptate rerum reprehenderit, nulla magna tenetur fugiat autem pariatur. Sit voluptate adipisicing dolores dolor autem sequi adipisicing qui similique autem nihil laborum. Eveniet, officiis officia consequatur? Et quisquam voluptatem, quam nesciunt, quae illo id, minim velit sit perferendis porro ipsa, aspernatur aliquid proident, animi, ipsam pariatur. Non.', NULL, 1, 'Jin Ortiz');

-- --------------------------------------------------------

--
-- Table structure for table `water_pollution_type`
--

CREATE TABLE IF NOT EXISTS `water_pollution_type` (
`water_pollution_type_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `water_pollution_type`
--

INSERT INTO `water_pollution_type` (`water_pollution_type_id`, `type`) VALUES
(1, 'Human filt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `air_pollution`
--
ALTER TABLE `air_pollution`
 ADD PRIMARY KEY (`air_pollution_id`);

--
-- Indexes for table `air_pollution_type`
--
ALTER TABLE `air_pollution_type`
 ADD PRIMARY KEY (`air_pollution_type_id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
 ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
 ADD PRIMARY KEY (`authority_id`);

--
-- Indexes for table `awareness`
--
ALTER TABLE `awareness`
 ADD PRIMARY KEY (`awareness_id`);

--
-- Indexes for table `awareness_type`
--
ALTER TABLE `awareness_type`
 ADD PRIMARY KEY (`awareness_type_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
 ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
 ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
 ADD PRIMARY KEY (`division_id`);

--
-- Indexes for table `dustbin`
--
ALTER TABLE `dustbin`
 ADD PRIMARY KEY (`dustbin_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
 ADD PRIMARY KEY (`employee_type_id`);

--
-- Indexes for table `funding`
--
ALTER TABLE `funding`
 ADD PRIMARY KEY (`funding_id`);

--
-- Indexes for table `garbage_collector`
--
ALTER TABLE `garbage_collector`
 ADD PRIMARY KEY (`garbage_collector_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
 ADD PRIMARY KEY (`general_settings_id`);

--
-- Indexes for table `higher_authority`
--
ALTER TABLE `higher_authority`
 ADD PRIMARY KEY (`higher_authority_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
 ADD PRIMARY KEY (`word_id`);

--
-- Indexes for table `law`
--
ALTER TABLE `law`
 ADD PRIMARY KEY (`law_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `noisy_point`
--
ALTER TABLE `noisy_point`
 ADD PRIMARY KEY (`noisy_point_id`);

--
-- Indexes for table `noisy_point_type`
--
ALTER TABLE `noisy_point_type`
 ADD PRIMARY KEY (`noisy_point_type_id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
 ADD PRIMARY KEY (`poll_id`);

--
-- Indexes for table `pollution_type`
--
ALTER TABLE `pollution_type`
 ADD PRIMARY KEY (`pollution_type_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
 ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `public`
--
ALTER TABLE `public`
 ADD PRIMARY KEY (`public_id`);

--
-- Indexes for table `public_comment`
--
ALTER TABLE `public_comment`
 ADD PRIMARY KEY (`public_comment_id`);

--
-- Indexes for table `punishment`
--
ALTER TABLE `punishment`
 ADD PRIMARY KEY (`punishment_id`);

--
-- Indexes for table `punishment_type`
--
ALTER TABLE `punishment_type`
 ADD PRIMARY KEY (`punishment_type_id`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
 ADD PRIMARY KEY (`research_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
 ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `review_type`
--
ALTER TABLE `review_type`
 ADD PRIMARY KEY (`review_type_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
 ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
 ADD PRIMARY KEY (`speciality_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
 ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
 ADD PRIMARY KEY (`subscribe_id`);

--
-- Indexes for table `ui_settings`
--
ALTER TABLE `ui_settings`
 ADD PRIMARY KEY (`ui_settings_id`);

--
-- Indexes for table `union`
--
ALTER TABLE `union`
 ADD PRIMARY KEY (`union_id`);

--
-- Indexes for table `upazila`
--
ALTER TABLE `upazila`
 ADD PRIMARY KEY (`upazila_id`);

--
-- Indexes for table `useful_link`
--
ALTER TABLE `useful_link`
 ADD PRIMARY KEY (`useful_link_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
 ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `water_pollution`
--
ALTER TABLE `water_pollution`
 ADD PRIMARY KEY (`water_pollution_id`);

--
-- Indexes for table `water_pollution_type`
--
ALTER TABLE `water_pollution_type`
 ADD PRIMARY KEY (`water_pollution_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `air_pollution`
--
ALTER TABLE `air_pollution`
MODIFY `air_pollution_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `air_pollution_type`
--
ALTER TABLE `air_pollution_type`
MODIFY `air_pollution_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `authority`
--
ALTER TABLE `authority`
MODIFY `authority_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `awareness`
--
ALTER TABLE `awareness`
MODIFY `awareness_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `awareness_type`
--
ALTER TABLE `awareness_type`
MODIFY `awareness_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
MODIFY `division_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dustbin`
--
ALTER TABLE `dustbin`
MODIFY `dustbin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
MODIFY `employee_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `funding`
--
ALTER TABLE `funding`
MODIFY `funding_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `garbage_collector`
--
ALTER TABLE `garbage_collector`
MODIFY `garbage_collector_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
MODIFY `general_settings_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `higher_authority`
--
ALTER TABLE `higher_authority`
MODIFY `higher_authority_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
MODIFY `word_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1269;
--
-- AUTO_INCREMENT for table `law`
--
ALTER TABLE `law`
MODIFY `law_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `noisy_point`
--
ALTER TABLE `noisy_point`
MODIFY `noisy_point_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `noisy_point_type`
--
ALTER TABLE `noisy_point_type`
MODIFY `noisy_point_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pollution_type`
--
ALTER TABLE `pollution_type`
MODIFY `pollution_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `public`
--
ALTER TABLE `public`
MODIFY `public_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `public_comment`
--
ALTER TABLE `public_comment`
MODIFY `public_comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `punishment`
--
ALTER TABLE `punishment`
MODIFY `punishment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `punishment_type`
--
ALTER TABLE `punishment_type`
MODIFY `punishment_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `research`
--
ALTER TABLE `research`
MODIFY `research_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `review_type`
--
ALTER TABLE `review_type`
MODIFY `review_type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `speciality`
--
ALTER TABLE `speciality`
MODIFY `speciality_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
MODIFY `subscribe_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ui_settings`
--
ALTER TABLE `ui_settings`
MODIFY `ui_settings_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `union`
--
ALTER TABLE `union`
MODIFY `union_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `upazila`
--
ALTER TABLE `upazila`
MODIFY `upazila_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `useful_link`
--
ALTER TABLE `useful_link`
MODIFY `useful_link_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `water_pollution`
--
ALTER TABLE `water_pollution`
MODIFY `water_pollution_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `water_pollution_type`
--
ALTER TABLE `water_pollution_type`
MODIFY `water_pollution_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
