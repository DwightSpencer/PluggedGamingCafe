-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2018 at 04:26 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pluggedcafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `discount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Owner', '100.00', 1, '2016-05-30 12:37:03', '2017-02-18 16:11:35');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `status` enum('Busy','Printed','Completed') DEFAULT 'Busy',
  `customer_id` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `usd` decimal(10,2) DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `checked_in` datetime DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `table_id`, `status`, `customer_id`, `discount`, `usd`, `user_id`, `created_at`, `updated_at`, `checked_in`, `checked_out`) VALUES
(1, 62, 'Completed', NULL, 0, '500.00', 3, '2018-03-30 12:32:54', '2018-03-30 12:34:21', '2018-03-30 12:32:54', NULL),
(2, 63, 'Completed', NULL, 0, '300.00', 3, '2018-03-30 12:34:44', '2018-03-30 12:35:20', '2018-03-30 12:34:44', NULL),
(3, 71, 'Completed', NULL, 0, '200.00', 3, '2018-03-30 12:35:34', '2018-03-30 12:35:47', '2018-03-30 12:35:34', NULL),
(4, 66, 'Busy', NULL, 0, '0.00', 3, '2018-03-29 12:39:11', '2018-03-29 12:39:11', '2018-03-29 12:39:11', NULL),
(5, 66, 'Completed', NULL, 0, '1000.00', 3, '2018-03-30 12:42:39', '2018-03-30 12:42:50', '2018-03-30 12:42:39', NULL),
(6, 64, 'Completed', NULL, 0, '500.00', 3, '2018-03-30 12:43:00', '2018-03-30 13:03:00', '2018-03-30 12:43:00', '2018-03-30 13:02:02'),
(7, 64, 'Completed', NULL, 0, '200.00', 3, '2018-03-30 13:03:08', '2018-03-30 13:54:14', '2018-03-30 13:03:08', '2018-03-30 13:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ordered_date` datetime DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `description`, `quantity`, `price`, `ordered_date`, `discount`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, 1, 1257, 'Bacon', 1, '120.00', '2018-03-30 12:32:54', 0, '2018-03-30 12:32:54', '2018-03-30 12:32:54', NULL, 3),
(2, 1, 1275, 'Fried Chicken', 1, '160.00', '2018-03-30 12:32:54', 0, '2018-03-30 12:32:56', '2018-03-30 12:32:56', NULL, 3),
(3, 1, 1301, 'Iced Tea', 1, '75.00', '2018-03-30 12:32:54', 0, '2018-03-30 12:33:10', '2018-03-30 12:33:10', NULL, 3),
(4, 2, 1257, 'Bacon', 1, '120.00', '2018-03-30 12:34:44', 0, '2018-03-30 12:34:44', '2018-03-30 12:34:47', '2018-03-30 12:34:47', 3),
(5, 2, 1275, 'Fried Chicken', 1, '160.00', '2018-03-30 12:34:44', 0, '2018-03-30 12:34:49', '2018-03-30 12:34:56', '2018-03-30 12:34:56', 3),
(6, 2, 1273, 'Creamy Mushroom Chicken Rice Toppings', 1, '150.00', '2018-03-30 12:34:44', 0, '2018-03-30 12:34:51', '2018-03-30 12:34:51', NULL, 3),
(7, 2, 1283, 'Red Horse', 2, '55.00', '2018-03-30 12:34:44', 0, '2018-03-30 12:35:05', '2018-03-30 12:35:06', NULL, 3),
(8, 3, 1307, 'PS4', 2, '80.00', '2018-03-30 12:35:34', 0, '2018-03-30 12:35:34', '2018-03-30 12:35:36', NULL, 3),
(9, 4, 1269, 'Carbonara', 2, '150.00', '2018-03-29 12:39:11', 0, '2018-03-29 12:39:11', '2018-03-29 12:39:22', NULL, 3),
(10, 5, 1269, 'Carbonara', 1, '150.00', '2018-03-30 12:42:39', 0, '2018-03-30 12:42:40', '2018-03-30 12:42:40', NULL, 3),
(11, 5, 1271, 'Kaldereta Pasta', 1, '160.00', '2018-03-30 12:42:39', 0, '2018-03-30 12:42:41', '2018-03-30 12:42:41', NULL, 3),
(12, 6, 1257, 'Bacon', 1, '120.00', '2018-03-30 12:43:00', 0, '2018-03-30 12:43:00', '2018-03-30 12:43:00', NULL, 3),
(13, 6, 1253, 'Bangus', 1, '120.00', '2018-03-30 12:43:00', 0, '2018-03-30 12:43:01', '2018-03-30 12:43:01', NULL, 3),
(14, 7, 1273, 'Creamy Mushroom Chicken Rice Toppings', 1, '150.00', '2018-03-30 13:03:08', 0, '2018-03-30 13:03:09', '2018-03-30 13:03:09', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `unitprice` decimal(10,2) DEFAULT '0.00',
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `product_category_id`, `product_type_id`, `unitprice`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1252, 'Beef Tapa', 26, NULL, '120.00', 'kuTlPKHla4pwFRB7.jpg', 1, '2018-03-27 16:46:36', '2018-03-27 16:46:36'),
(1253, 'Bangus', 26, NULL, '120.00', 'dVo38K1vRG9895cC.jpg', 1, '2018-03-27 16:51:22', '2018-03-27 16:51:22'),
(1254, 'Skinless Longganisa', 26, NULL, '90.00', 'sLfnEFe6h0FCVkPQ.jpg', 1, '2018-03-27 16:52:46', '2018-03-27 17:01:04'),
(1255, 'Ham', 26, NULL, '90.00', '8JEEbtb4ZyTjWoJr.jpg', 1, '2018-03-27 16:54:04', '2018-03-27 16:54:04'),
(1256, 'Corned Beef', 26, NULL, '120.00', 'QcEWUqxlclGJxjzI.jpg', 1, '2018-03-27 16:56:19', '2018-03-27 16:56:19'),
(1257, 'Bacon', 26, NULL, '120.00', 'SobMVW7E3k5S8mbg.jpg', 1, '2018-03-27 16:59:12', '2018-03-27 16:59:43'),
(1258, 'Chicken Salad', 28, NULL, '130.00', 'RvOuQXLiDVZ4Li64.jpg', 1, '2018-03-27 17:08:32', '2018-03-27 17:08:32'),
(1259, 'Thousand Island', 28, NULL, '120.00', 'mjSJsU5fk4qZHG04.jpg', 1, '2018-03-27 17:11:00', '2018-03-27 17:11:00'),
(1260, 'Onion Rings', 30, NULL, '120.00', 'Sh0O4NvGAHUwmLaT.jpg', 1, '2018-03-27 17:11:34', '2018-03-27 17:11:34'),
(1261, 'Plugged Chili Dynamite', 30, NULL, '140.00', 'vZ72CJB9CPoNDG6x.jpg', 1, '2018-03-27 17:14:55', '2018-03-27 17:14:55'),
(1262, 'Beef Nachos', 30, NULL, '150.00', 'givg4DtHMdgZZttw.jpg', 1, '2018-03-27 17:15:29', '2018-03-27 17:15:29'),
(1263, 'Buffalo Wings', 30, NULL, '150.00', 'bwdgjGJK0y5Wqnto.jpg', 1, '2018-03-27 17:16:19', '2018-03-27 17:16:19'),
(1264, 'Honey BBQ Wings', 30, NULL, '150.00', 'JkgZs55RIptR6weI.jpg', 1, '2018-03-27 17:16:48', '2018-03-27 17:16:48'),
(1265, 'Garlic Parmesan Wings', 30, NULL, '160.00', 'xpMRuCrMQiT6oDbw.jpg', 1, '2018-03-27 17:17:13', '2018-03-27 17:17:13'),
(1266, 'Chicken Poppers', 30, NULL, '160.00', 'cUU9KhzNGaYSDyfu.jpg', 1, '2018-03-27 17:17:28', '2018-03-27 17:17:28'),
(1267, 'Sizzling Liempo', 30, NULL, '180.00', 'bC2bBtWw5e1MtYb1.jpg', 1, '2018-03-27 17:18:16', '2018-03-27 17:18:16'),
(1268, 'Plugged Burger', 27, NULL, '150.00', 'AV6thUEk30old9Lw.jpg', 1, '2018-03-27 17:19:05', '2018-03-27 17:19:05'),
(1269, 'Carbonara', 27, NULL, '150.00', 'wSTS5a6R1GO4IE2x.jpg', 1, '2018-03-27 17:19:26', '2018-03-27 17:19:26'),
(1270, 'Pomodoro Pasta', 27, NULL, '150.00', 'EAYydBfEa9Gryj88.jpg', 1, '2018-03-27 17:20:07', '2018-03-27 17:43:14'),
(1271, 'Kaldereta Pasta', 27, NULL, '160.00', 'J2nGNUjTOUNL5uHp.jpg', 1, '2018-03-27 17:20:27', '2018-03-27 17:20:27'),
(1273, 'Creamy Mushroom Chicken Rice Toppings', 29, NULL, '150.00', 'ZzCpiBTFSYZHquJw.jpg', 1, '2018-03-27 17:21:42', '2018-03-27 17:45:11'),
(1274, 'Pork Sisig Rice', 29, NULL, '150.00', 'N4Fh8BpilphXZWb7.jpg', 1, '2018-03-27 17:22:05', '2018-03-27 17:22:05'),
(1275, 'Fried Chicken', 29, NULL, '160.00', 'hpszpmQPUiYOMmlY.jpg', 1, '2018-03-27 17:22:26', '2018-03-27 17:42:05'),
(1276, 'Grilled Chicken Breast', 29, NULL, '160.00', 'yhDNYKupt5ZGg6M4.jpg', 1, '2018-03-27 17:22:52', '2018-03-27 17:22:52'),
(1277, 'Fish Fillet', 29, NULL, '160.00', 'ecryx4k8M1fLySAT.jpg', 1, '2018-03-27 17:23:14', '2018-03-27 17:23:14'),
(1278, 'Kaldereta', 29, NULL, '180.00', 'KVxUtcXAwPD8BGmr.jpg', 1, '2018-03-27 17:23:33', '2018-03-27 17:23:33'),
(1279, 'Plugged Schnitzel', 29, NULL, '180.00', 'uaBEBVQOhULye6r2.jpg', 1, '2018-03-27 17:24:13', '2018-03-27 17:24:13'),
(1280, 'Pork Chop', 29, NULL, '180.00', 'AXZ3E425PaczStux.jpg', 1, '2018-03-27 17:24:28', '2018-03-27 17:24:28'),
(1281, 'San Mig Light', 31, NULL, '55.00', 'e7Y0wOlAJRIs8e4m.jpg', 1, '2018-03-27 17:26:57', '2018-03-27 17:26:57'),
(1282, 'San Mig Apple', 31, NULL, '55.00', 'BVl2Bc7pMr4HScyY.jpg', 1, '2018-03-27 17:27:11', '2018-03-27 17:27:11'),
(1283, 'Red Horse', 31, NULL, '55.00', '0pj88LraMwwE2hrq.jpg', 1, '2018-03-27 17:27:26', '2018-03-27 17:27:26'),
(1284, 'Pale Pilsen', 31, NULL, '60.00', 'U2F5S5wg4f0XlUgf.jpg', 1, '2018-03-27 17:27:51', '2018-03-27 17:27:51'),
(1285, 'Smirnoff Mule', 31, NULL, '60.00', 'u45Bel9uF0aRwuYD.jpg', 1, '2018-03-27 17:28:16', '2018-03-27 17:28:16'),
(1286, 'San Mig Light Bucket', 31, NULL, '310.00', 'yLgsU0Iuvr3BSDFH.jpg', 1, '2018-03-27 17:28:52', '2018-03-27 17:28:52'),
(1287, 'San Mig Apple Bucket', 31, NULL, '310.00', 'd0qVeOIMRlUtB4PT.jpg', 1, '2018-03-27 17:29:11', '2018-03-27 17:29:11'),
(1288, 'Red Horse Bucket', 31, NULL, '310.00', 'HGcrJp0iVwzuzppm.jpg', 1, '2018-03-27 17:29:31', '2018-03-27 17:29:31'),
(1289, 'Pale Pilsen Bucket', 31, NULL, '330.00', 'LjlPni12zFeHyUeH.jpg', 1, '2018-03-27 17:29:55', '2018-03-27 17:29:55'),
(1290, 'Smirnoff Mule Bucket', 31, NULL, '330.00', 'NYeDduONqTI2sTaK.jpg', 1, '2018-03-27 17:30:11', '2018-03-27 17:30:11'),
(1291, 'Bottled Water', 33, NULL, '20.00', 'R4wW4gI409SWvtvI.jpg', 1, '2018-03-27 17:30:42', '2018-03-27 17:30:42'),
(1292, 'Soft Drinks', 33, NULL, '35.00', 'XTpEsWMp7YDIit8g.jpg', 1, '2018-03-27 17:30:57', '2018-03-27 17:30:57'),
(1293, 'Mango Juice', 33, NULL, '40.00', 'FPqRB0lfWpb2ZElB.jpg', 1, '2018-03-27 17:33:57', '2018-03-27 17:33:57'),
(1294, 'Four Seasons', 33, NULL, '40.00', '1jfF0a6q0HSUmMXR.jpg', 1, '2018-03-27 17:34:14', '2018-03-27 17:34:14'),
(1295, 'Pineapple Juice', 33, NULL, '40.00', 'jM7G3WnbnJAiNm9A.jpg', 1, '2018-03-27 17:34:32', '2018-03-27 17:34:32'),
(1296, 'Pineapple Blueberry Juice', 33, NULL, '45.00', 'HZEDT6pskqbowIG4.jpg', 1, '2018-03-27 17:34:59', '2018-03-27 17:34:59'),
(1297, 'Pineapple Strawberry Juice', 33, NULL, '45.00', 'Ixop7YoJdZuwxXJc.jpg', 1, '2018-03-27 17:35:20', '2018-03-27 17:35:20'),
(1298, 'Pineapple Orange Juice', 33, NULL, '45.00', 'gOYN8JN9SeX3IMpo.jpg', 1, '2018-03-27 17:35:40', '2018-03-27 17:35:40'),
(1299, 'Brewed Coffee', 33, NULL, '45.00', 'xbb3C9YjFdhyA4MH.jpg', 1, '2018-03-27 17:36:02', '2018-03-27 17:36:02'),
(1300, 'Hot Choco', 33, NULL, '60.00', 'NhlCrpDRfZwkYKrf.jpg', 1, '2018-03-27 17:36:21', '2018-03-27 17:36:21'),
(1301, 'Iced Tea', 33, NULL, '75.00', 'gyRll5Afy2JQh89J.jpg', 1, '2018-03-27 17:36:47', '2018-03-27 17:36:47'),
(1302, 'Vanilla Caramel Frappe', 32, NULL, '120.00', '35JwiSPdfa8czrAL.jpg', 1, '2018-03-27 17:38:44', '2018-03-27 17:42:40'),
(1303, 'Choco Almond Frappe', 32, NULL, '130.00', 'cnt3k5EXyBIBWBIE.jpg', 1, '2018-03-27 17:39:04', '2018-03-27 17:39:04'),
(1304, 'Double Chocolate Chip Frappe', 32, NULL, '130.00', 'i6uMemkmZS6Dh0r9.jpg', 1, '2018-03-27 17:39:35', '2018-03-27 17:39:35'),
(1305, 'Oreo Goodness Frappe', 32, NULL, '130.00', 'fylczod87R7phpBT.jpg', 1, '2018-03-27 17:40:16', '2018-03-27 17:40:16'),
(1306, 'Blueberry Frappe', 32, NULL, '140.00', 'hL8pGNFoHhzULrzy.jpg', 1, '2018-03-27 17:40:33', '2018-03-27 17:40:33'),
(1307, 'PS4', 34, NULL, '80.00', 'ZQJgyNvBy6vyTPND.jpg', 1, '2018-03-29 17:19:29', '2018-03-29 17:55:13'),
(1308, 'Plain Fries', 35, NULL, '115.00', '9fTsRUXCRrD9jTQZ.jpg', 1, '2018-03-29 17:50:41', '2018-03-29 17:51:11'),
(1309, 'BBQ Fries', 35, NULL, '115.00', 'Rp0vpoXJzuGCVRWX.jpg', 1, '2018-03-29 17:51:45', '2018-03-29 17:52:09'),
(1310, 'Sour Cream Fries', 35, NULL, '115.00', 'KJAfFc1d1uehQ52f.jpg', 1, '2018-03-29 17:52:30', '2018-03-29 17:52:30'),
(1311, 'Cheese Fries', 35, NULL, '115.00', 'qyO1M66tlNtATxCK.png', 1, '2018-03-29 17:52:48', '2018-03-29 17:52:48'),
(1312, 'Cheesy Beef Fries', 35, NULL, '165.00', 'XZp2bQ6CXdSAXwZl.jpg', 1, '2018-03-29 17:53:05', '2018-03-29 17:53:05'),
(1313, 'Unlimited PS4', 34, NULL, '200.00', 'jYXYX19wjVXxnq5C.jpg', 1, '2018-03-29 17:56:19', '2018-03-29 17:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `ordering`, `created_at`, `updated_at`) VALUES
(26, 'All Day Breakfast', 1, '2018-03-26 08:55:51', '2018-03-26 09:09:23'),
(27, 'Burger and Pasta', 2, '2018-03-26 09:09:40', '2018-03-26 09:09:40'),
(28, 'Salad', 3, '2018-03-26 09:10:01', '2018-03-26 09:10:01'),
(29, 'Rice Meals', 4, '2018-03-26 09:10:27', '2018-03-26 09:10:27'),
(30, 'Appetizers', 5, '2018-03-26 09:10:37', '2018-03-26 09:10:37'),
(31, 'Beer', 6, '2018-03-26 09:10:47', '2018-03-26 09:10:47'),
(32, 'Frappe', 7, '2018-03-26 09:10:59', '2018-03-26 09:10:59'),
(33, 'Drinks', 8, '2018-03-26 09:12:02', '2018-03-26 09:12:02'),
(34, 'Console Game', 9, '2018-03-27 20:32:46', '2018-03-27 20:33:01'),
(35, 'Plugged French Fries', 10, '2018-03-29 17:32:30', '2018-03-29 17:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `product_id`, `item_id`, `quantity`, `user_id`, `created_at`, `updated_at`) VALUES
(10, 14, 3, '0.10', 1, '2016-09-11 10:24:38', '2016-09-11 10:24:38'),
(11, 12, 5, '0.20', 1, '2016-09-11 10:24:55', '2016-09-11 10:24:55'),
(13, 1, 5, '0.10', 1, '2016-09-11 10:25:33', '2016-09-11 10:25:33'),
(14, 1167, 4, '1.00', 1, '2017-11-19 20:38:43', '2017-11-19 20:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('Free','Busy','Printed') DEFAULT 'Free',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(62, '1', 'Free', '2018-03-26 08:21:46', '2018-03-30 12:34:21'),
(63, '2', 'Free', '2018-03-26 08:21:50', '2018-03-30 12:35:20'),
(64, '3', 'Free', '2018-03-26 08:21:54', '2018-03-30 13:54:14'),
(65, '4', 'Free', '2018-03-26 08:21:57', '2018-03-28 12:20:13'),
(66, '5', 'Free', '2018-03-26 08:22:00', '2018-03-30 12:42:50'),
(70, '6', 'Busy', '2018-03-26 08:22:12', '2018-03-29 17:23:46'),
(71, 'Game Area 1', 'Free', '2018-03-29 17:20:54', '2018-03-30 12:35:47'),
(72, 'Game Area 2', 'Free', '2018-03-29 17:21:08', '2018-03-29 17:25:09'),
(73, 'Game Area 3', 'Free', '2018-03-29 17:21:20', '2018-03-29 17:25:18'),
(74, 'Game Area 4', 'Busy', '2018-03-29 17:22:00', '2018-03-29 17:25:48'),
(75, '7', 'Free', '2018-03-29 17:23:55', '2018-03-29 17:23:55'),
(76, '8', 'Free', '2018-03-29 17:23:59', '2018-03-29 17:23:59'),
(77, '9', 'Free', '2018-03-29 17:24:07', '2018-03-29 17:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` enum('SuperAdmin','Admin','Cashier') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `role`, `active`, `created_at`, `updated_at`) VALUES
(1, 'super', '$2y$10$Zy1XTuyhK3zxTdkkmFicmOXpIEtRpwzoNTZPuna/L9i08C/Bp8aCC', '9I90pHQZyNOzgmoG2yhIDPFEp5SUkBfB1hT00uKgynnLh1vCu5hp6MwmAiVH', 'SuperAdmin', 1, '2016-03-03 10:18:30', '2017-11-22 13:39:52'),
(2, 'admin', '$2y$10$OzvezM1JTpSyLjBnuxueg.NC9yDNovAGWSi1FFw6yZczE5y6tMpfO', '2pwG5x5Ladmfc4OzVFJQU0OSv05bQubNXwH2Ln7GG3s2ghID2GDEUW6BMJoJ', 'Admin', 1, '2016-06-04 11:24:02', '2017-11-24 00:43:43'),
(3, 'cashier', '$2y$10$RGlUQWowwJ8ZCNcll9ByN.rvjp2ZN7HRMonM6wrF5T2ubIXLK8Sh.', 'P4q4tpo3KhTmdU1GZy34yCRyGUnm0Cv0BpE8BDIuszbMbu0pEHqQyA6cPg85', 'Cashier', 1, '2016-06-04 11:24:02', '2017-11-24 00:43:51'),
(4, 'cashier2', '$2y$10$1ymw8qTMQJCWhm8/vRXdFeaafdOu/3kJT7JS5Iv954f6/jFdYxrSa', 'ZeDwrULdwTT6Tix1AgyR245iWo75iV5apop425JZp2IEMtSgCd0If9DROSgJ', 'Cashier', 1, '2018-03-29 17:16:47', '2018-03-29 17:16:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1314;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
