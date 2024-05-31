-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2024 at 10:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Divyanshu', 'divyanshudd07@gmail.com', 'admin', '70a2c391f9be170ea6d527dc0b209d2a', '2024-05-29 19:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblbookings`
--

CREATE TABLE `tblbookings` (
  `id` int(11) NOT NULL,
  `BookingId` bigint(12) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `EventId` int(11) DEFAULT NULL,
  `NumberOfMembers` int(11) DEFAULT NULL,
  `UserRemark` mediumtext DEFAULT NULL,
  `AdminRemark` mediumtext DEFAULT NULL,
  `UserCancelRemark` mediumtext DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT current_timestamp(),
  `BookingStatus` varchar(100) DEFAULT NULL,
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbookings`
--

INSERT INTO `tblbookings` (`id`, `BookingId`, `UserId`, `EventId`, `NumberOfMembers`, `UserRemark`, `AdminRemark`, `UserCancelRemark`, `BookingDate`, `BookingStatus`, `LastUpdationDate`) VALUES
(6, 120258618, 3, 16, 3, 'Books 3 tickets please', 'Tickets are booked for the events. Thank You. Enjoy', NULL, '2024-05-30 07:50:21', 'Confirmed', '2024-05-30 07:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `CategoryDescription` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `CategoryDescription`, `CreationDate`, `UpdationDate`, `IsActive`) VALUES
(6, 'Music Concert', 'Live performances by bands, solo artists, and orchestras, spanning genres from classical to contemporary.', '2024-05-30 07:04:25', NULL, '1'),
(7, 'Theater and Performing Arts', 'Live stage performances including plays, musicals, dance shows, and comedy acts.\r\n', '2024-05-30 07:05:04', NULL, '1'),
(8, 'Conferences and Seminars', 'Professional and educational gatherings for knowledge sharing, networking, and professional development across various industries.\r\n', '2024-05-30 07:05:34', NULL, '1'),
(9, 'Workshops and Classes', 'Interactive sessions where participants can learn new skills, engage in hands-on activities, and gain practical experience.\r\n', '2024-05-30 07:05:49', NULL, '1'),
(10, 'Sports and Fitness', 'Events focused on physical activity, including competitive sports, marathons, fitness classes, and outdoor adventures.', '2024-05-30 07:06:08', NULL, '1'),
(11, 'Festivals and Fairs', 'Large-scale, often multi-day events celebrating culture, food, music, arts, and more, typically featuring multiple attractions and activities.\r\n', '2024-05-30 07:06:21', NULL, '1'),
(12, 'Exhibitions and Trade Shows', 'Events where businesses and artists display products and services, often featuring booths, presentations, and networking opportunities.\r\n', '2024-05-30 07:06:47', NULL, '1'),
(13, 'Charity and Fundraisers', 'Events organized to raise funds and awareness for charitable causes, including galas, auctions, and community runs.', '2024-05-30 07:06:59', NULL, '1'),
(14, 'Technology and Innovation', 'Events focused on the latest technological advancements, including hackathons, product launches, and tech expos.', '2024-05-30 07:07:15', NULL, '1'),
(15, 'Virtual Events', 'Online events that can be attended remotely, including webinars, virtual conferences, online workshops, and live streams.', '2024-05-30 07:08:12', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblevents`
--

CREATE TABLE `tblevents` (
  `id` int(11) NOT NULL,
  `CategoryId` char(10) DEFAULT NULL,
  `SponserId` char(10) DEFAULT NULL,
  `EventName` varchar(255) DEFAULT NULL,
  `EventDescription` mediumtext DEFAULT NULL,
  `EventStartDate` date DEFAULT NULL,
  `EventEndDate` date DEFAULT NULL,
  `EventLocation` varchar(255) DEFAULT NULL,
  `EventImage` varchar(255) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblevents`
--

INSERT INTO `tblevents` (`id`, `CategoryId`, `SponserId`, `EventName`, `EventDescription`, `EventStartDate`, `EventEndDate`, `EventLocation`, `EventImage`, `PostingDate`, `LastUpdationDate`, `IsActive`) VALUES
(7, '6', '4', 'Summer Jam Fest', 'A three-day live music festival featuring an incredible lineup of popular bands and solo artists. Experience the energy of live performances with genres ranging from rock and pop to indie and electronic music. Enjoy food trucks, merchandise stalls, and an unforgettable festival atmosphere under the stars.', '2024-07-10', '2024-07-12', 'Jawaharlal Nehru Stadium, New Delhi, India', 'f3bab5da4908d232015dd2458e365f12.jpg', '2024-05-30 07:29:54', NULL, 1),
(8, '7', '5', 'Broadway Extravaganza', 'Immerse yourself in an evening of spectacular performances from the best of Broadway. This event features an array of musical numbers, dance routines, and comedy acts performed by top artists and ensembles. Enjoy the magic of live theater and the vibrant culture of Broadway in an unforgettable show.', '2024-08-05', '2024-08-05', 'National Centre for the Performing Arts, Mumbai, India', 'b9c1dc6ce2c394a39a8fa62873cd8b79.jpg', '2024-05-30 07:38:18', NULL, 1),
(9, '8', '6', 'Tech Innovators Conference 2024', 'Join industry leaders and tech enthusiasts at the Tech Innovators Conference 2024, where the latest trends and advancements in technology are discussed. Topics include artificial intelligence, blockchain, cybersecurity, and more. Network with professionals, attend workshops, and explore exhibits showcasing cutting-edge tech solutions.', '2024-09-15', '2024-09-17', 'Bangalore International Exhibition Centre, Bangalore, India', 'bf7cf26761cb2305f4a7811cfa93cac3.jpg', '2024-05-30 07:39:21', NULL, 1),
(10, '9', '7', 'Mastering Digital Photography', ' Enhance your photography skills in this intensive, hands-on workshop. Led by professional photographers, participants will learn advanced photography techniques, including lighting, composition, and post-processing. Bring your own camera and get ready to capture stunning images.', '2024-06-20', '2024-06-22', 'Indian Institute of Photography, Noida, India', '1801165d2c3d1023b9a7fbbf487cc975.jpg', '2024-05-30 07:40:18', NULL, 1),
(11, '10', '8', 'City Marathon 2024', 'Join thousands of runners in the annual city marathon. This challenging route takes you through the heart of the city, offering scenic views and a festive atmosphere. Whether you’re a seasoned runner or a beginner, this event is perfect for anyone looking to test their limits.', '2024-10-01', '2024-10-01', 'Marine Drive, Mumbai, India', '0cb5641c4722cd8d1969774fdaf5712a.jpg', '2024-05-30 07:41:16', NULL, 1),
(12, '11', '9', 'Harvest Food and Wine Festival', 'Celebrate the harvest season with a festival featuring gourmet food, fine wines, and live entertainment. Sample delicious dishes prepared by top chefs, enjoy wine tastings, and listen to live music in a beautiful outdoor setting. A perfect event for foodies and wine enthusiasts.', '2024-09-25', '2024-09-27', 'Sula Vineyards, Nashik, India', '1e3fa00ea0f7184a7036944c54a2bc05.jpg', '2024-05-30 07:42:07', NULL, 1),
(13, '12', '10', ' International Auto Show', 'Explore the latest models and innovations from leading automobile manufacturers at this annual trade show. See concept cars, electric vehicles, and the newest automotive technology. A must-attend event for car enthusiasts and industry professionals.', '2024-11-10', '2024-11-14', 'Pragati Maidan, New Delhi, India', 'dbdd5923b7d0be085f5621e603d58cf7.jpg', '2024-05-30 07:43:08', NULL, 1),
(14, '13', '11', 'Charity Gala for Children\'s Hospital', 'An elegant evening of dining and entertainment to raise funds for the Children\'s Hospital. Enjoy a gourmet dinner, bid on exclusive items in the silent auction, and be entertained by live performances. All proceeds go towards improving healthcare for children.', '2024-06-05', '2024-06-05', 'The Taj Mahal Palace, Mumbai, India', 'abdc148073c7adda8eddf2c876e175a9.jpg', '2024-05-30 07:43:54', NULL, 1),
(15, '14', '12', 'FutureTech Expo 2024', 'Discover the future of technology at the FutureTech Expo. This event brings together tech enthusiasts, innovators, and industry leaders to showcase the latest advancements in AI, robotics, VR, and more. Attend keynote sessions, participate in workshops, and network with like-minded professionals.', '2024-07-17', '2024-07-18', 'Hyderabad International Convention Centre, Hyderabad, India', '8e068015a4c182588973f51e01edce05.jpg', '2024-05-30 07:44:50', NULL, 1),
(16, '15', 'Select', 'Global Web Development Summit', 'Join web developers from around the world in this virtual summit. Learn about the latest trends and best practices in web development, including frameworks, tools, and techniques. Participate in live webinars, interactive sessions, and network with peers from the comfort of your home.', '2024-06-26', '2024-05-30', 'Online', '684a04cb4c9134bd2d60d4c79ad7e309.jpg', '2024-05-30 07:45:38', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblgenralsettings`
--

CREATE TABLE `tblgenralsettings` (
  `id` int(11) NOT NULL,
  `SiteName` varchar(200) DEFAULT NULL,
  `PhoneNumber` text DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `footercontent` mediumtext DEFAULT NULL,
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblgenralsettings`
--

INSERT INTO `tblgenralsettings` (`id`, `SiteName`, `PhoneNumber`, `EmailId`, `address`, `footercontent`, `LastUpdationDate`) VALUES
(1, 'Plan it', '+91 6239087540', 'demotest@test.com', 'Gandhi Nagar, New Delhi 833201', 'Copyright 2024 All Rights Reserved', '2024-05-30 08:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblnews`
--

CREATE TABLE `tblnews` (
  `id` int(11) NOT NULL,
  `NewsTitle` longtext DEFAULT NULL,
  `NewsDetails` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblnews`
--

INSERT INTO `tblnews` (`id`, `NewsTitle`, `NewsDetails`, `PostingDate`, `LastUpdationDate`) VALUES
(9, 'Test', 'hello', '2024-05-30 12:21:25', NULL),
(10, 'Test 2', 'Hiiiiiiii', '2024-05-30 12:39:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageType` varchar(255) DEFAULT NULL,
  `PageDetails` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageType`, `PageDetails`, `LastupdationDate`) VALUES
(1, 'aboutus', '<div><br></div><div>Welcome to Plan It, your ultimate destination for seamless event planning and booking.<br></div><div><br></div><div>At Plan It, we understand the importance of every occasion, whether it\'s a corporate conference, a wedding celebration, or a community gathering. Our mission is simple: to make event planning effortless, enjoyable, and stress-free for everyone involved.</div><div><br></div><div>With Plan It, you have access to a diverse range of venues, vendors, and services, all at your fingertips. Whether you\'re searching for the perfect venue, booking a talented caterer, or hiring a skilled photographer, our platform has everything you need to bring your event to life.</div><div><br></div><div>What sets Plan It apart is our commitment to convenience and quality. Our user-friendly interface makes it easy to browse, compare, and book services with just a few clicks. We\'ve handpicked our partners to ensure that every option meets our high standards of excellence, so you can trust that your event is in good hands.</div><div><br></div><div>But Plan It is more than just a booking platform; it\'s a community of passionate event enthusiasts dedicated to making every moment memorable. Our team of experienced professionals is here to support you every step of the way, offering expert advice, personalized recommendations, and unparalleled customer service.</div><div><br></div><div>Whether you\'re planning a small gathering or a large-scale event, Plan It has you covered. Join us on this journey of creativity, collaboration, and celebration, and let\'s make your next event an unforgettable success.</div><div><br></div><div>Thank you for choosing Plan It. We can\'t wait to help you bring your vision to life.</div><div><br></div><div>Best regards,</div><div><br></div><div>Divyanshu</div><div>Founder &amp; CEO, Plan It<br></div><div><br></div>', '2024-05-29 20:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `tblsponsers`
--

CREATE TABLE `tblsponsers` (
  `id` int(11) NOT NULL,
  `sponserName` varchar(255) DEFAULT NULL,
  `sponserLogo` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `lastUpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsponsers`
--

INSERT INTO `tblsponsers` (`id`, `sponserName`, `sponserLogo`, `postingDate`, `lastUpdationDate`) VALUES
(4, 'Rockstar Energy', '41b586905e6233e72b076191f8bf9512.png', '2024-05-30 07:19:16', '0000-00-00 00:00:00'),
(5, 'Broadway League', '156005c5baf40ff51a327f1c34f2975b.jpg', '2024-05-30 07:20:31', '0000-00-00 00:00:00'),
(6, 'TechCrunch', '799bad5a3b514f096e69bbc4a7896cd9.jpg', '2024-05-30 07:21:29', '0000-00-00 00:00:00'),
(7, 'Canon', '09dd8c2662b96ce14928333f055c5580.png', '2024-05-30 07:21:59', '0000-00-00 00:00:00'),
(8, 'Nike', '8266e4bfeda1bd42d8f9794eb4ea0a13.png', '2024-05-30 07:22:30', '0000-00-00 00:00:00'),
(9, 'Whole Foods Market', 'f19c9085129709ee14d013be869df69b.png', '2024-05-30 07:23:14', '0000-00-00 00:00:00'),
(10, 'Mercedes-Benz', 'fe5df232cafa4c4e0f1a0294418e5660.jpg', '2024-05-30 07:23:46', '0000-00-00 00:00:00'),
(11, 'Johnson & Johnson', '8cda81fc7ad906927144235dda5fdf15.jpg', '2024-05-30 07:24:54', '0000-00-00 00:00:00'),
(12, 'Google', '7afbb1602613ec52b265d7a54ad27330.png', '2024-05-30 07:25:01', '0000-00-00 00:00:00'),
(13, 'GitHub', '586e508f161f26ce94633729ac56c602.png', '2024-05-30 07:25:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscriber`
--

CREATE TABLE `tblsubscriber` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `Regdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubscriber`
--

INSERT INTO `tblsubscriber` (`id`, `UserEmail`, `Regdate`) VALUES
(3, 'divyanshusjj@gmail.com', '2024-05-30 07:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `Userid` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `Emailid` varchar(255) DEFAULT NULL,
  `PhoneNumber` bigint(12) DEFAULT NULL,
  `UserGender` varchar(100) DEFAULT NULL,
  `UserPassword` varchar(255) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`Userid`, `FullName`, `UserName`, `Emailid`, `PhoneNumber`, `UserGender`, `UserPassword`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(3, 'Divyanshu', 'Divyasnhu-D', 'divyanshusjj@gmail.com', 6204678932, 'Male', '70a2c391f9be170ea6d527dc0b209d2a', '2024-05-30 07:48:32', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbookings`
--
ALTER TABLE `tblbookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblevents`
--
ALTER TABLE `tblevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgenralsettings`
--
ALTER TABLE `tblgenralsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnews`
--
ALTER TABLE `tblnews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsponsers`
--
ALTER TABLE `tblsponsers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`Userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbookings`
--
ALTER TABLE `tblbookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblevents`
--
ALTER TABLE `tblevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblgenralsettings`
--
ALTER TABLE `tblgenralsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblnews`
--
ALTER TABLE `tblnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblsponsers`
--
ALTER TABLE `tblsponsers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `Userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
