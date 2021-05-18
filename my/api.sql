-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 06:51 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `qty`, `price`, `discount`) VALUES
(0, 'HeadPhone', 56, '870', 0),
(0, 'Speaker', 7, '1020', 0),
(3, 'USB Cables', 5, '150', 0),
(4, 'OTG', 70, '20', 0),
(5, 'EarPhone', 2, '300', 5),
(8, 'Cable', 7, '70', 15),
(0, 'Test-1', 56, '5643', 3),
(45, 'Test-2', 7, '34', 7),
(0, 'Test-3', 56, '5643', 3),
(45, 'Test-4', 2, '34', 7),
(0, 'Test-5', 536, '56463', 13),
(45, 'Test-6', 27, '324', 72),
(0, 'Test-7', 564, '593', 33),
(45, 'Test-8', 78, '22334', 37),
(0, 'Test-14', 56, '5643', 3),
(45, 'Test-24', 7, '34', 7),
(0, 'Test-551', 56, '5643', 3),
(45, 'Test-342', 37, '34333', 37);

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE `login_user` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` text NOT NULL,
  `price` int(11) NOT NULL,
  `discount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `qty`, `price`, `discount`) VALUES
(1, '5', '10', 2000, '25'),
(2, 'Samsung', '34', 67000, '10'),
(3, 'nokia', '30', 23000, '15'),
(4, 'bat', '45', 3455, '0'),
(5, 'bat', '23', 5678, '20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetail`
--

CREATE TABLE `tbl_orderdetail` (
  `id` int(5) NOT NULL,
  `order_id` int(5) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD UNIQUE KEY `product_name` (`product_name`),
  ADD UNIQUE KEY `quantity` (`quantity`),
  ADD UNIQUE KEY `price` (`price`),
  ADD UNIQUE KEY `discount` (`discount`),
  ADD UNIQUE KEY `amount` (`amount`);
ALTER TABLE `tbl_orderdetail` ADD FULLTEXT KEY `quantity_2` (`quantity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
