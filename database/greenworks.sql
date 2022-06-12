-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 02:22 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greenworks`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Apparels', 'apparels', '2022-05-18 05:28:40', '2022-05-24 12:21:50'),
(2, 'Shoes', 'shoes', '2022-05-18 05:28:40', '2022-05-24 12:22:08'),
(3, 'Furniture', 'furniture', '2022-05-18 05:28:40', '2022-05-24 12:22:41'),
(4, 'Electronics', 'electronics', '2022-05-18 05:28:40', '2022-05-24 12:23:05'),
(5, 'Tools', 'tools', '2022-05-18 05:28:40', '2022-05-24 12:24:15'),
(6, 'Swords and Longswords', 'swords-and-longswords', '2022-05-18 05:28:40', '2022-05-24 12:24:56'),
(7, 'Laptop', 'laptop', '2022-05-25 01:59:38', '2022-05-25 01:59:38'),
(8, 'Fruits and Vegetable', 'fruits-and-vegetable', '2022-05-25 21:52:45', '2022-05-25 21:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`) VALUES
(1, 'OFF1000', 'fixed', '1000.00', '1000.00', '2022-05-22 11:39:16', '2022-05-22 12:48:02'),
(6, 'OFF20P', 'fixed', '20.00', '1000.00', '2022-05-22 11:49:34', '2022-05-22 12:32:25'),
(8, 'POPP', 'percentage', '50.00', '500.00', '2022-05-22 13:00:16', '2022-05-22 13:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3,4,6', 4, '2022-05-18 13:38:58', '2022-05-25 21:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SHOP', 'High Noon loot bags are now available', '250', '/shop', '1652896878.jpg', 1, '2022-05-18 06:08:48', '2022-05-25 01:58:37'),
(2, 'LET\'S GOOOOP', 'QUEUE TIMES WITH THE BOYS', '1000', '/shop', '1652883136.png', 1, '2022-05-18 06:12:16', '2022-05-25 21:31:11'),
(3, 'Carrots', 'Carrots', '100', '/shop', '1653544490.png', 1, '2022-05-25 21:54:50', '2022-05-25 21:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(36, '2014_10_12_000000_create_users_table', 1),
(37, '2014_10_12_100000_create_password_resets_table', 1),
(38, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(39, '2019_08_19_000000_create_failed_jobs_table', 1),
(40, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(41, '2022_04_15_192533_create_sessions_table', 1),
(42, '2022_04_16_084730_create_categories_table', 1),
(43, '2022_04_16_102129_create_products_table', 1),
(44, '2022_05_11_115330_create_home_sliders_table', 1),
(45, '2022_05_16_193259_create_home_categories_table', 1),
(46, '2022_05_21_065633_create_orders_table', 2),
(47, '2022_05_21_070206_create_order_items_table', 2),
(48, '2022_05_21_070253_create_shippings_table', 2),
(49, '2022_05_21_070348_create_transactions_table', 2),
(50, '2022_05_21_084133_create_coupons_table', 3),
(51, '2022_05_21_154224_create_sales_table', 4),
(53, '2022_05_22_185410_create_coupons_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','cancelled','processing','shipped') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(1, 1, '416', '0.00', '87.36', '503.36', 'Romeo', 'Perez', '09208006183', 'romeojohnorig5@gmail.com', 'test line1', 'test line1', 'Olongapo', 'Zambales', 'Philippines', '2200', 'delivered', 1, '2022-05-22 15:19:21', '2022-05-24 05:13:13', '2022-05-24', NULL),
(2, 1, '294', '0.00', '61.74', '355.74', 'Perez', 'John', '0661087731', 'romeojohnorig5@gmail.com', 'tangency', 'tangency2', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'cancelled', 0, '2022-05-22 15:49:56', '2022-05-24 05:19:59', NULL, '2022-05-24'),
(3, 2, '488', '0.00', '102.48', '590.48', 'Kirk', 'Nacor', '09390987654', 'kirk@gmail.com', 'test line1', 'tangency', 'Olongapo', 'Zambales', 'Philippines', '2200', 'delivered', 0, '2022-05-24 04:18:12', '2022-05-25 18:49:20', '2022-05-26', '2022-05-25'),
(4, 2, '98', '0.00', '20.58', '118.58', 'Neo', 'John', '0661087731', 'neomorales@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'shipped', 0, '2022-05-24 14:02:28', '2022-05-25 18:49:11', NULL, '2022-05-25'),
(5, 2, '430', '0.00', '90.30', '520.30', 'Perez', 'John', '0661087731', 'romeojohnorig5@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'processing', 0, '2022-05-24 14:29:02', '2022-05-25 19:20:46', '2022-05-25', NULL),
(6, 2, '474', '0.00', '99.54', '573.54', 'Perez', 'John', '0661087731', 'romeojohnorig5@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'cancelled', 0, '2022-05-25 01:46:48', '2022-05-25 01:48:55', NULL, '2022-05-25'),
(7, 3, '200', '0.00', '42.00', '242.00', 'Michellin', 'Tangency', '0661087731', 'romeojohnorig5@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'cancelled', 0, '2022-05-25 20:04:07', '2022-05-25 20:04:30', NULL, '2022-05-26'),
(8, 4, '474', '0.00', '99.54', '573.54', 'Shermayne OOI', 'Francisco', '0661087731', 'shermayne@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'processing', 0, '2022-05-25 21:45:31', '2022-05-25 23:48:12', '2022-05-26', NULL),
(9, 4, '25', '0.00', '5.25', '30.25', 'Perez', 'John', '0661087731', 'romeojohnorig5@gmail.com', '1829 bennet road', 'Old cabalan', 'Olongapo', 'Province / Region', 'Philippines', '2200', 'processing', 0, '2022-05-25 21:59:15', '2022-05-25 23:47:56', NULL, '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 5, 1, '122.00', 1, '2022-05-22 15:19:21', '2022-05-22 15:19:21'),
(2, 6, 1, '230.00', 1, '2022-05-22 15:19:21', '2022-05-22 15:19:21'),
(3, 11, 1, '64.00', 1, '2022-05-22 15:19:21', '2022-05-22 15:19:21'),
(4, 8, 2, '98.00', 3, '2022-05-22 15:49:57', '2022-05-22 15:49:57'),
(5, 5, 3, '122.00', 4, '2022-05-24 04:18:12', '2022-05-24 04:18:12'),
(6, 8, 4, '98.00', 1, '2022-05-24 14:02:28', '2022-05-24 14:02:28'),
(7, 7, 5, '430.00', 1, '2022-05-24 14:29:02', '2022-05-24 14:29:02'),
(8, 6, 6, '230.00', 1, '2022-05-25 01:46:48', '2022-05-25 01:46:48'),
(9, 5, 6, '122.00', 2, '2022-05-25 01:46:48', '2022-05-25 01:46:48'),
(10, 29, 7, '100.00', 2, '2022-05-25 20:04:07', '2022-05-25 20:04:07'),
(11, 5, 8, '122.00', 2, '2022-05-25 21:45:31', '2022-05-25 21:45:31'),
(12, 6, 8, '230.00', 1, '2022-05-25 21:45:31', '2022-05-25 21:45:31'),
(13, 35, 9, '25.00', 1, '2022-05-25 21:59:15', '2022-05-25 21:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `condition` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `condition`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(5, 'non eum autem qui', 'non-eum-autem-qui', 'Non amet sit deserunt aspernatur ut. Qui nobis vel ducimus quo. Minima fugit aut commodi ab.', 'Perspiciatis quia quod quia enim qui earum explicabo odit. Accusantium temporibus nobis dolorum voluptatum qui rerum sed. Veritatis ipsum animi eum ut sint autem porro. Ad rerum atque similique alias voluptatem provident. Dolorem error quia labore. Minus nam accusamus omnis incidunt et. Non quos nobis vel facere aut reiciendis odio molestiae. Iusto aut quia tempore sequi molestias laboriosam et. Sequi corporis voluptatum praesentium.', '122.00', NULL, 'DIGI166', 'instock', 0, 0, 5, '1653540601_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 20:50:01'),
(6, 'nihil voluptatibus ab laudantium', 'nihil-voluptatibus-ab-laudantium', 'Modi necessitatibus dolorem sed saepe velit id. Omnis ad architecto vero vel perferendis. Facilis iste sapiente nulla repellat nesciunt est magnam.', 'Sed eius vero qui est similique debitis qui. Ipsa dolorem sequi sed. Praesentium laborum animi voluptatibus aut non. Eligendi unde commodi eaque. Ut sint voluptatem aliquam. Aut aut et quia et velit. Laudantium qui et qui. Praesentium voluptatem adipisci veritatis est quasi est libero. Nulla non quo et et.', '230.00', NULL, 'DIGI208', 'instock', 0, 1, 125, '1653540630_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 20:50:30'),
(7, 'voluptatem ipsum laboriosam sed', 'voluptatem-ipsum-laboriosam-sed', 'In quas qui optio ea et sapiente nihil. Sint aut in quaerat non necessitatibus dolor. Voluptas amet totam laboriosam dolor. Esse quia reiciendis iusto eveniet omnis deserunt aliquam.', 'Magni doloribus reprehenderit et deleniti quia corrupti. Rem provident sunt quos quod soluta nam nobis. Et nam similique laudantium saepe est quis voluptatum. Quo modi et animi est dicta accusamus pariatur. Occaecati hic quisquam rem et quia eum. Blanditiis odit in ipsam. Natus tempora ratione vel veritatis quasi ut.', '430.00', NULL, 'DIGI324', 'instock', 0, 1, 112, '1653540661_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 20:51:01'),
(8, 'provident fuga et placeat', 'provident-fuga-et-placeat', 'Deserunt sint sit odio. Aut sed eveniet rem officiis perferendis consequatur. Suscipit quod corrupti ipsum fugit autem animi. Numquam enim placeat quia quaerat velit fuga.', 'Sequi et ratione ut tempore consequuntur quo temporibus. Mollitia dolorum illum est. Sapiente voluptas fugiat expedita recusandae ratione quasi. Sint et facilis et nihil alias. Commodi maxime eius officiis dolor ut facere et magni. Reprehenderit corrupti quidem nisi distinctio autem. Ipsum ratione id sunt voluptate nesciunt id sed. Impedit id enim libero libero sint voluptatibus explicabo. Voluptatem impedit voluptas veritatis ullam non dignissimos. Autem dolor occaecati ut explicabo autem.', '98.00', NULL, 'DIGI457', 'instock', 0, 1, 163, '1653540742_png', NULL, 2, '2022-05-18 05:28:40', '2022-05-25 20:52:22'),
(9, 'optio sit et rerum', 'optio-sit-et-rerum', 'Vel aut eos illo occaecati ab nihil. Iusto alias ut modi nihil inventore. In consectetur consequatur eos sit.', 'Eveniet eaque exercitationem tenetur natus voluptas voluptatem. Est optio veniam dolorem aut accusantium molestias fugit. Voluptatem rerum et quo minus dolore. Nostrum libero voluptatem qui eum et. Sint fugit voluptates est enim. Fuga velit aperiam id veritatis voluptatem.', '282.00', NULL, 'DIGI343', 'instock', 0, 0, 155, '1653540764_png', NULL, 2, '2022-05-18 05:28:40', '2022-05-25 20:52:44'),
(10, 'aspernatur dignissimos qui porro', 'aspernatur-dignissimos-qui-porro', 'Aut omnis consequatur quo sit magni illo corporis iste. Temporibus perspiciatis sed dolorem nobis nisi consectetur. Sit ad quo pariatur asperiores et magni aut.', 'Et vel animi veniam animi reiciendis adipisci. Architecto iste earum sint reiciendis magnam vitae saepe tempora. Sed porro suscipit nihil iure. Sapiente sint quo eaque consectetur corporis animi saepe. Vero quis mollitia est dolores voluptatem odit. Sint incidunt iste et rem fugiat similique laborum. Quos et et quibusdam.', '172.00', '50.00', 'DIGI178', 'instock', 0, 1, 103, '1653540841_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 20:54:01'),
(11, 'ipsum velit inventore explicabo', 'ipsum-velit-inventore-explicabo', 'Aut sunt sit vero reprehenderit. Odio saepe iste dolores et facilis officiis. Ut delectus qui optio officia.', 'Sint vero illo odit odio eum incidunt. Quia blanditiis est temporibus mollitia earum nulla enim. Nesciunt est est cumque et sapiente eos accusantium. Perferendis at dicta explicabo accusantium explicabo doloremque. Eos distinctio distinctio quae inventore quisquam est sed. Nobis sed ipsam molestiae et qui fuga in sapiente.', '64.00', NULL, 'DIGI427', 'instock', 0, 0, 134, '1653540863_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 20:54:23'),
(12, 'voluptatem odio accusantium dicta', 'voluptatem-odio-accusantium-dicta', 'Quis expedita qui eaque. Optio debitis ab fuga repellat tempora qui corrupti. Nesciunt numquam ut iusto qui quos et.', 'Voluptatibus quae ex veritatis sint. Corrupti architecto dolor occaecati eaque. Dolore molestias vero inventore. Voluptate est natus sapiente est similique quisquam. Et provident cupiditate dolorem tempore. Atque ratione rerum molestiae impedit repudiandae ut dolore. Ad officiis sapiente quo ex. Non ea nemo nulla. Et est dolore quidem cumque.', '142.00', NULL, 'DIGI461', 'instock', 0, 0, 157, '1653540881_png', NULL, 3, '2022-05-18 05:28:40', '2022-05-25 20:54:41'),
(13, 'laudantium illo adipisci magnam', 'laudantium-illo-adipisci-magnam', 'Quo earum alias laborum enim. Rerum quia et autem magnam at. Qui sed autem nemo.', 'Et inventore et sunt excepturi eveniet quibusdam. Dolorem distinctio fugit aut qui cum et. Qui dignissimos laborum omnis illo. Consectetur ut occaecati in ullam qui minus porro exercitationem. Ea ipsam voluptas tempore ratione excepturi asperiores dolores. Est provident ipsa tenetur laboriosam incidunt. Iste nulla facere fugiat quo soluta distinctio. Voluptatem et non sed architecto. Est consequatur omnis qui sed non. Quo repudiandae magni quas praesentium modi.', '188.00', NULL, 'DIGI489', 'instock', 0, 0, 188, '1653540904_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 20:55:04'),
(14, 'alias et doloremque rerum', 'alias-et-doloremque-rerum', 'Architecto veniam doloremque quis et tenetur explicabo. Dolor ducimus nesciunt quasi quia temporibus eum. Ut mollitia placeat delectus quia fugiat et. Quaerat laudantium veniam voluptas quas.', 'Quis dolor quasi vel error eos. Et id qui occaecati voluptatem illo nulla aut. Dolore voluptatibus molestias dolorem fugit quas dolorum maxime rerum. Iure a tenetur et consequatur possimus perferendis eius. Dolorem possimus ut velit iure. Et temporibus ea voluptatem. Ut repudiandae vitae ut maiores. Quia repellat dolorum et tenetur. Modi distinctio veniam optio cupiditate ad accusantium. Autem et eum pariatur unde consequatur qui id. Dolorum non facere reiciendis quod.', '436.00', NULL, 'DIGI254', 'instock', 0, 0, 126, '1653540924_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 20:55:24'),
(15, 'sequi et suscipit inventore', 'sequi-et-suscipit-inventore', 'Omnis ut dignissimos ex in at aut. Magnam eos amet inventore voluptatem. Deleniti amet iste ratione tempore iusto libero. Est expedita tenetur repudiandae dolores ipsam.', 'Iste commodi laboriosam dolorum dolor veritatis. Corrupti molestiae ipsa aut. Saepe sed eos et quia culpa porro quam. Recusandae fugit laboriosam laborum ut magnam. Et natus rem aliquid voluptatem. Animi et nihil odit quo facilis quia. Quidem velit ratione exercitationem cum ipsa. Quibusdam tempora quidem officia est. Ea ut recusandae ut earum. Unde ratione aut consequatur alias sed. Ad atque et inventore tempora velit beatae qui.', '254.00', NULL, 'DIGI369', 'instock', 0, 0, 129, '1653540963_png', NULL, 5, '2022-05-18 05:28:40', '2022-05-25 20:56:03'),
(17, 'nam quia consectetur ut', 'nam-quia-consectetur-ut', 'Est cum dicta molestias praesentium a distinctio. Qui ad assumenda earum nulla in eum. Veniam labore voluptate ad.', 'Et nulla sapiente consequuntur. Necessitatibus aut unde ipsam. Eum a ut voluptatem deserunt ut. Libero praesentium dolor quidem occaecati. Voluptas provident et enim saepe quasi mollitia. Vitae ipsum qui et. Quae blanditiis voluptatem et magnam nam ut. Vero architecto non nesciunt libero voluptatem excepturi asperiores. Ut sed id at voluptatem dolore. Est doloremque cumque qui adipisci eum.', '386.00', '150.00', 'DIGI305', 'instock', 0, 1, 179, '1653540992_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 20:56:32'),
(18, 'unde vel beatae fuga', 'unde-vel-beatae-fuga', 'Omnis totam ex pariatur provident qui autem consequatur. Inventore eum laborum et eum odio rerum velit. Doloribus reiciendis hic quae est quae est voluptatem incidunt.', 'Iste necessitatibus assumenda libero a dolor tempora unde. Corrupti dolor cupiditate unde eius vel rerum. Culpa reiciendis doloribus quis rerum inventore asperiores blanditiis. Voluptas animi illum maxime dolores. Doloremque sint quisquam illo cum iusto minus facilis architecto. Corrupti possimus nihil ducimus autem. Esse assumenda ut placeat aut culpa inventore ipsa sit.', '211.00', NULL, 'DIGI203', 'instock', 0, 1, 189, '1653541024_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 20:57:04'),
(19, 'saepe porro magnam impedit', 'saepe-porro-magnam-impedit', 'Modi quaerat deleniti ut itaque debitis. Repellendus quo quisquam minima nesciunt. Eveniet molestiae vel aspernatur laborum.', 'Iusto quis qui ut quasi officia fugit. Omnis molestiae deleniti iusto rerum velit tempore modi alias. Enim quis aut id optio veritatis asperiores alias. Impedit beatae veniam voluptas illo. Accusamus excepturi numquam nulla. Enim voluptatibus vel deserunt dolor quo. Delectus odit dolorem esse. Velit fugit sapiente corrupti quia est quia cumque. Et voluptatem enim voluptas voluptatem. Voluptatibus ut quis harum ut sit et. Consequatur quae dolore officiis nam quidem est corporis.', '260.00', NULL, 'DIGI380', 'instock', 0, 1, 120, '1653541048_png', NULL, 6, '2022-05-18 05:28:40', '2022-05-25 20:57:28'),
(20, 'quia sit nisi quia', 'quia-sit-nisi-quia', 'Possimus sunt sint ea expedita sequi. Est magnam culpa beatae voluptatum. Enim minus at rerum eaque blanditiis est. Iure assumenda odio in et quo.', 'Facilis ut perspiciatis impedit officiis. Fugiat rerum debitis omnis aut ratione expedita similique. Adipisci veniam rem harum rerum. Quo veniam rerum consectetur est quisquam. Qui fuga quidem aperiam unde sed. Necessitatibus dolore hic cupiditate consequuntur incidunt. Sit quam enim dolores similique enim maiores vitae.', '98.00', NULL, 'DIGI259', 'instock', 0, 0, 179, '1653541086_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 20:58:06'),
(21, 'ipsam et et tempore', 'ipsam-et-et-tempore', 'Quisquam consequuntur beatae ad. Officiis harum voluptatum hic est id blanditiis earum. Similique amet aliquid nesciunt in facilis. Ipsa illum omnis aut architecto officiis et.', 'Beatae harum omnis quasi ipsa aperiam. Quidem non repellendus nobis nihil rerum illum dicta blanditiis. Nisi aut illum natus saepe aut ad in. Ratione ullam quia modi. Ad et autem illum iste porro. Iure assumenda ut et nihil occaecati sapiente. Aut reprehenderit incidunt fugiat. Incidunt et amet corrupti sed eum possimus quas. Architecto voluptas quibusdam debitis atque beatae distinctio.', '445.00', '200.00', 'DIGI107', 'instock', 0, 1, 125, '1653541137_png', NULL, 6, '2022-05-18 05:28:40', '2022-05-25 20:58:57'),
(22, 'deserunt esse id tenetur', 'deserunt-esse-id-tenetur', 'Nulla et incidunt vero voluptatem. Est quia non vero vero ut dolorum rerum. Voluptatem sunt accusamus dolorum aperiam aut similique.', 'Quis dolore consequatur aspernatur autem sint ut iusto enim. Cum non at iure fuga. Nesciunt laboriosam iusto corrupti laudantium et unde et assumenda. Vitae ea numquam in aut tempore aut ducimus laboriosam. Delectus atque non qui quos tempore officiis. Quo quaerat officia quia tenetur facilis velit debitis. Quo repellendus rerum vel et iusto corrupti incidunt illo. Aperiam sapiente ea soluta quos.', '452.00', NULL, 'DIGI129', 'instock', 0, 1, 184, '1653541189_png', NULL, 6, '2022-05-18 05:28:40', '2022-05-25 20:59:49'),
(23, 'veritatis fugiat ducimus reiciendis', 'veritatis-fugiat-ducimus-reiciendis', 'Dolorem cum est et eos perspiciatis. Eveniet vel eos rem eius autem rerum sed. Sed ea dolorem inventore quod perferendis. Est et ea molestiae. Et est quia laborum modi magnam.', 'Et quae sunt totam aliquam ipsa at. Explicabo ut impedit blanditiis omnis deserunt rerum quod quia. Consequatur earum voluptates dicta debitis nisi consequuntur. Itaque vel voluptates molestias aut itaque cupiditate. Ut est omnis voluptatem et rerum. Consequatur inventore id id natus perspiciatis. Vero ea repudiandae officiis quam dolor rem. Omnis et quisquam eos odio unde corrupti deleniti. Hic incidunt enim voluptatem sequi excepturi delectus velit.', '188.00', NULL, 'DIGI442', 'instock', 0, 0, 161, '1653541231_png', NULL, 6, '2022-05-18 05:28:40', '2022-05-25 21:00:31'),
(24, 'accusantium eius eius facere', 'accusantium-eius-eius-facere', 'Porro quod vel dicta commodi accusamus. Quia eos rerum eligendi animi quibusdam. Iure fugit eligendi iste minima porro maxime aut. Est inventore necessitatibus quibusdam delectus et error.', 'Et fugit similique quis ut sequi temporibus. Dolores ab corporis est iusto nobis. Occaecati explicabo nihil saepe sunt. Doloremque enim suscipit reiciendis doloremque repudiandae. Error pariatur animi temporibus officiis quos iste. In nihil modi ut minima sunt. Rerum fuga numquam dolorem dolorem. Assumenda itaque repellat sed quis nesciunt. Quis tempora rem quis minima accusamus. Quo est laboriosam laborum libero animi rerum est.', '378.00', NULL, 'DIGI320', 'instock', 0, 0, 161, '1653541260_png', NULL, 6, '2022-05-18 05:28:40', '2022-05-25 21:01:00'),
(25, 'est sit doloribus illo', 'est-sit-doloribus-illo', 'Nam rerum omnis enim eaque. Saepe sapiente ut velit officia libero error. Quidem sint aperiam quisquam dolorem suscipit.', 'Veritatis qui eveniet id est cumque. Eum magni quas voluptatem ipsum. Sint nihil repellat nihil sit. Et repudiandae non dolorem sit eaque. Voluptas consequuntur ad ut. Molestiae consequatur voluptates asperiores nisi. Quae consequatur dicta qui minima voluptatibus. Quia omnis unde sapiente ut quia rerum. Est id qui molestiae vitae temporibus quibusdam. Aut mollitia voluptate modi rerum.', '405.00', NULL, 'DIGI432', 'instock', 0, 1, 137, '1653541332_png', NULL, 1, '2022-05-18 05:28:40', '2022-05-25 21:02:12'),
(26, 'neque unde delectus omnis', 'neque-unde-delectus-omnis', 'Inventore et est laborum non unde. Repudiandae aut mollitia ea earum perferendis quas eum. Necessitatibus soluta similique labore. Sed officia officiis quam et laudantium natus.', 'Vel quia rerum ipsam vitae. Nemo vel molestiae dolores. Enim deserunt inventore et placeat. Dicta repellendus cum sequi repudiandae. Id harum iure quis beatae ab laboriosam non. Temporibus quia harum atque aut corrupti. Qui aut enim et qui accusantium nostrum. Dignissimos odit nemo voluptate ut laborum. Architecto dicta at voluptatum ex aspernatur velit eum. Error qui consequuntur veritatis provident voluptatem. Provident quasi provident nisi quos quasi necessitatibus quia.', '462.00', '120.00', 'DIGI113', 'instock', 0, 1, 197, '1653541386_png', NULL, 4, '2022-05-18 05:28:40', '2022-05-25 21:03:06'),
(27, 'Shaco', 'shaco', 'shaco one trick', 'shaco one trick 1 million points', '100.00', '60.00', 'SHACO12301312', 'instock', 0, 0, 25, '1653541433_png', NULL, 1, '2022-05-18 05:48:52', '2022-05-25 21:03:53'),
(28, 'Paremona', 'paremona', 'hellopopo', 'tangerines', '50.00', '20.00', 'DIGO234', 'instock', 0, 0, 46, '1653541484_png', NULL, 1, '2022-05-18 05:54:24', '2022-05-25 21:04:44'),
(29, 'Tangerines', 'tangerines', 'tangerines ni neil', 'tangerines ni neil sa sta rita', '100.00', '20.00', 'DIGI1234', 'instock', 0, 1, 23, '1653541535_png', NULL, 4, '2022-05-18 06:06:45', '2022-05-25 21:05:35'),
(30, 'Lootbags', 'lootbags', 'lootbag', 'lootbags', '30.00', '20.00', 'LOOTBAG1234', 'instock', 0, 1, 30, '1653541563_png', NULL, 3, '2022-05-18 08:00:03', '2022-05-25 21:06:03'),
(31, 'Steak', 'Steak', 'pyke', 'pyke', '30.00', '20.00', 'PYKE123', 'instock', 0, 0, 30, '1653541603_png', NULL, 3, '2022-05-18 08:00:40', '2022-05-25 21:06:43'),
(32, 'Key ng bahay ni kuya', 'key-ng-bahay-ni-kuya', 'Vitamins po', 'Vitamins on the go', '100.00', '50.00', NULL, 'instock', 0, 1, 5, '1653541643_png', NULL, 1, '2022-05-24 09:05:31', '2022-05-25 21:07:23'),
(33, 'medicines', 'medicines', 'poppp', 'poppppp', '100.00', NULL, NULL, 'instock', 0, 1, 20, '1653541672_png', NULL, 1, '2022-05-25 01:55:18', '2022-05-25 21:07:52'),
(34, 'Cog', 'cog', 'tangency', 'poppers', '100.00', '50.00', NULL, 'instock', 0, 1, 10, '1653541710_png', NULL, 7, '2022-05-25 20:13:49', '2022-05-25 21:08:30'),
(35, 'Carrot', 'carrot', 'Short Desc', 'Desc', '50.00', '25.00', NULL, 'instock', 0, 1, 20, '1653544275_png', NULL, 6, '2022-05-25 21:51:15', '2022-05-25 21:51:15'),
(36, 'consectetur eligendi sapiente rerum', 'consectetur-eligendi-sapiente-rerum', 'Nihil eos nobis quam eaque. Perspiciatis ipsam cumque dolore in. Eum ea tenetur dolores voluptatem.', 'Necessitatibus eum rerum nihil. Consequuntur iure beatae distinctio odit. A iste quas rem ab. Soluta eum aliquid corporis quam id sit. Molestiae quod laboriosam rerum ea. Qui tenetur quia quia velit est. Quae et possimus totam accusantium quaerat autem dolorem dolore. Consectetur consequuntur quisquam repudiandae voluptatem beatae dolorum esse optio. Quo saepe quia cumque corporis adipisci. Temporibus et deserunt quidem voluptatem.', '196.00', NULL, 'DIGI406', 'instock', 0, 0, 137, 'product_26.png', NULL, 2, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(37, 'quo occaecati est nam', 'quo-occaecati-est-nam', 'Nisi molestias ut optio inventore at. Nisi accusantium nihil suscipit illo esse voluptas. Voluptas rerum consectetur hic. Consequatur optio et aut tempore atque excepturi distinctio.', 'Officia ex eum rem aut dolores blanditiis. Deleniti vero cum quod maxime quo itaque sed. In unde magnam excepturi aut molestiae iste pariatur excepturi. Laborum fugit fugit cumque nulla laboriosam eum voluptatibus et. Ipsa dolores ratione officia autem perspiciatis enim. Omnis voluptates omnis aut aperiam ipsa sint tempora. Voluptates et quas quae perspiciatis aut. Quidem qui laborum sit harum eos facilis qui ex.', '163.00', NULL, 'DIGI256', 'instock', 0, 0, 197, 'product_17.png', NULL, 3, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(38, 'ipsum illum id aliquid', 'ipsum-illum-id-aliquid', 'Veritatis saepe quia assumenda perspiciatis nihil explicabo error. Et perspiciatis iure ut.', 'Eaque cum sunt sint vero rerum illum qui. Voluptas sit earum quia cumque sed cum. Aliquid aspernatur est pariatur atque eius nam ut. Labore commodi velit voluptas non et non eos. Vitae ut laborum expedita sed sapiente. Quia maxime pariatur dolorum totam. Ut iste magni aut magnam perferendis at. Non consequatur labore quae fugit ut.', '149.00', NULL, 'DIGI307', 'instock', 0, 0, 161, 'product_34.png', NULL, 5, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(39, 'distinctio repellat nesciunt eos', 'distinctio-repellat-nesciunt-eos', 'Illo voluptatem recusandae quidem animi consectetur. Qui sed velit consequatur similique non totam.', 'Ut voluptas laboriosam dolorem ad consequatur laudantium eos. Magni eum sed sint quaerat reiciendis repudiandae. Cupiditate debitis minus vero alias. Necessitatibus perspiciatis qui aspernatur ut voluptas sapiente. Alias deserunt expedita nostrum consequuntur. Ipsam et deserunt voluptas dolorem sit quaerat. Repellendus perspiciatis nulla et nisi omnis unde. Rerum occaecati cupiditate dolorem perferendis.', '475.00', NULL, 'DIGI283', 'instock', 0, 0, 148, 'product_37.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(40, 'sit enim cupiditate eum', 'sit-enim-cupiditate-eum', 'Est doloribus aperiam possimus nemo. Minima ex esse consequatur voluptatibus. Iste praesentium omnis aut magnam hic.', 'Ullam dolore tenetur culpa porro enim. Illum aspernatur aut voluptas enim. Consequatur quisquam deleniti ut aliquid earum asperiores. Quaerat mollitia voluptas molestias. Consequatur facere laudantium dolorem enim perspiciatis. Esse aut nostrum quia praesentium nisi ut officiis. Omnis distinctio voluptatem in magnam enim sunt. Autem unde assumenda adipisci aut quae assumenda eveniet. Vero labore natus dolores. Voluptas placeat veritatis quia placeat ipsam maxime.', '248.00', NULL, 'DIGI140', 'instock', 0, 0, 173, 'product_7.png', NULL, 5, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(41, 'eos unde ut sint', 'eos-unde-ut-sint', 'Similique delectus ab sit. Quasi consectetur modi quo est deserunt eveniet ut. Ab exercitationem ea quia.', 'Placeat reprehenderit omnis qui repellendus et doloribus voluptatem molestiae. Vitae cum et facere in ipsa voluptatibus rerum animi. Nemo doloribus aut vel in eos incidunt. Id expedita accusantium fugiat quia deserunt omnis commodi. In illum veniam hic culpa. Atque praesentium et corrupti modi ipsum aliquam ipsa. Est corporis rem molestiae. Hic iste sit qui qui nihil molestias enim beatae.', '10.00', NULL, 'DIGI490', 'instock', 0, 0, 129, 'product_38.png', NULL, 4, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(42, 'dolor amet accusamus ut', 'dolor-amet-accusamus-ut', 'Autem nisi qui dolore. Aut aut aut veritatis rerum. Quia pariatur vero hic. Atque corporis pariatur illum eos dolore quas animi.', 'Aspernatur sunt perferendis quia natus ipsa. Quidem incidunt eligendi et ut. Error necessitatibus sed voluptatem iusto voluptatem. Omnis delectus eos modi esse eum. Architecto veniam dolor et quia sed vitae. Eum id laudantium recusandae doloribus. Tempora qui omnis eos in voluptas ea nostrum. Minima et consequatur velit nam sit.', '204.00', NULL, 'DIGI369', 'instock', 0, 0, 179, 'product_36.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(43, 'quidem consequatur quisquam quod', 'quidem-consequatur-quisquam-quod', 'Beatae beatae iure modi a ad sed libero. Reprehenderit pariatur hic voluptas aut aut odit dolore. Neque possimus harum et eum fugiat esse. Officia adipisci error commodi sed.', 'Et iure rerum provident maiores natus cupiditate dicta. Dolor delectus commodi quia itaque eos. Mollitia hic dolore rem sequi corrupti et. Consequuntur nesciunt nihil distinctio dolores. Rerum enim perferendis quo ut ea aut similique. In est sed quas nulla sunt molestiae soluta. Ut earum eaque dolores ipsam. Vel eos perferendis officiis molestiae a. Eum sit porro sint ut.', '443.00', NULL, 'DIGI294', 'instock', 0, 0, 104, 'product_10.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(44, 'molestiae qui qui ex', 'molestiae-qui-qui-ex', 'Magni ipsam sed aliquam et rem eaque ut. Consequatur aut odit quam sint. Cumque repudiandae qui tenetur voluptatum occaecati sed rerum. Deleniti saepe natus aspernatur sed dolores reprehenderit.', 'Ullam corporis necessitatibus a quod aliquam. Asperiores sequi quo et ratione assumenda cupiditate eius. Sed fugiat autem perspiciatis odio. Nobis dolore deserunt inventore aut aut minus. Est aut facilis nesciunt nam. Porro quia qui unde dolore voluptate. Qui molestiae est minus non dolor quos. Ea molestias atque deserunt voluptas labore qui dolorem. Quam debitis recusandae eum architecto impedit delectus. Id iste et iste fugit at nobis.', '188.00', NULL, 'DIGI349', 'instock', 0, 0, 145, 'product_39.png', NULL, 4, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(45, 'itaque est dolorem illo', 'itaque-est-dolorem-illo', 'Eos quod nam cum consectetur sapiente et ut. In vero ut architecto reprehenderit voluptate pariatur. Esse adipisci expedita sunt.', 'Eaque tenetur corrupti enim. Repudiandae dolores ducimus exercitationem libero. Cumque explicabo consequatur tempore eos perspiciatis. Aut corporis eius molestiae earum. Fugit rerum sit officia sit qui voluptatem. Quia et maxime commodi dolor labore magni. Beatae dolorem provident impedit modi. Est ad voluptatem aut dolorem nihil nihil. Ullam consequatur non aut beatae velit dolorum magni et.', '199.00', NULL, 'DIGI178', 'instock', 0, 0, 193, 'product_13.png', NULL, 3, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(46, 'vitae quia aliquam pariatur', 'vitae-quia-aliquam-pariatur', 'Numquam nihil repellendus rerum in. Quae deleniti illum est quibusdam praesentium ratione. Rerum quia sed et dolores. Eum nesciunt a nemo ea.', 'Consequatur ut iste id cum non. Sed sit sit vero. Aut laborum doloremque sed repudiandae ut ex. Non iste veritatis quia eum placeat sint blanditiis. Commodi cumque quis illum vel. Voluptates commodi modi voluptates blanditiis nam sint dolor dolorum. Soluta et sed libero libero dolorem. Debitis id explicabo laudantium dolores numquam omnis. Sint accusantium dolores similique.', '493.00', NULL, 'DIGI391', 'instock', 0, 0, 133, 'product_22.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(47, 'sed laudantium aut totam', 'sed-laudantium-aut-totam', 'Qui sit aut enim suscipit eum. Quae quo quos modi.', 'Excepturi consequuntur quam dolores debitis dolores consequuntur eos. Repudiandae neque eum a eaque consequatur quo culpa molestiae. Vitae qui doloremque sapiente possimus. Aperiam laborum dolore sapiente et omnis numquam rerum. Numquam nihil maxime consequatur. Nobis optio et suscipit est. Suscipit molestiae modi est similique aliquid. Est dolorum ea incidunt. Minus quo doloremque quis consequatur eaque et quia sint. Repudiandae culpa aliquid ea. Dolores quibusdam nam inventore mollitia id.', '334.00', NULL, 'DIGI478', 'instock', 0, 0, 160, 'product_20.png', NULL, 4, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(48, 'velit aut sed soluta', 'velit-aut-sed-soluta', 'Accusamus reiciendis enim in quisquam animi ea magnam. Et et iusto sequi vitae omnis vero aut. Quaerat quo et voluptatibus vero. Ipsam explicabo blanditiis nam enim rerum in.', 'Non non doloremque earum officiis provident blanditiis. Dolores nihil odio quia nostrum. Consequuntur accusantium ad sed totam quisquam consequuntur. Ipsa mollitia molestiae dolores in. Aut asperiores aut sint sed. Eos id et ipsa sapiente numquam quod necessitatibus architecto. Dolor et vel sint voluptas quos nam dolorem reprehenderit. Earum soluta aut totam velit omnis repellendus eius in.', '191.00', NULL, 'DIGI218', 'instock', 0, 0, 133, 'product_29.png', NULL, 5, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(49, 'eum quibusdam earum similique', 'eum-quibusdam-earum-similique', 'Et architecto molestiae facere et est. Dolores maxime praesentium quia molestiae quis. Officia nihil ut quaerat voluptate. Quia officia in consequuntur eos fugit quod accusamus doloremque.', 'Et ipsa ut doloremque vitae. Numquam sed molestias repudiandae nihil rerum necessitatibus sint. Qui id accusamus quo omnis. Ipsum recusandae laborum illum sapiente. Quia consequatur adipisci eaque occaecati. Quis dolor aut at consectetur consectetur cum voluptatibus. Recusandae totam illo voluptas voluptatem est illo officia recusandae. Nemo aut iusto quos. Rem debitis et blanditiis illo. Soluta dolorem numquam harum nostrum officia necessitatibus.', '331.00', NULL, 'DIGI461', 'instock', 0, 0, 166, 'product_18.png', NULL, 5, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(50, 'quia autem sunt ipsum', 'quia-autem-sunt-ipsum', 'Id adipisci delectus explicabo aut suscipit consequatur. Id maxime id doloribus dolore. Nesciunt voluptatem doloribus at amet iusto.', 'Sed rerum libero et sit est quis. Et voluptatibus velit quisquam consequuntur sint exercitationem doloribus. Ab veniam mollitia sint sit. Et voluptatem est dolor maxime non molestias repellendus. Temporibus libero unde vel rerum nostrum cum. Saepe minus ducimus non quos culpa laboriosam ut. Debitis ut porro molestias maiores ad animi sunt.', '161.00', NULL, 'DIGI110', 'instock', 0, 0, 127, 'product_1.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(51, 'dolores nulla aperiam accusamus', 'dolores-nulla-aperiam-accusamus', 'Dignissimos in rerum voluptates voluptates recusandae quasi nihil. Commodi et placeat reiciendis quisquam. In vero minus voluptate ullam.', 'Laboriosam mollitia illum sunt. Ea harum natus minima suscipit laborum quo aut. Eaque velit reiciendis alias unde voluptatum. Voluptatum minus debitis sapiente adipisci. Ut tempore consequatur ea illo. Voluptatem adipisci pariatur delectus repudiandae. Beatae optio dolore qui vitae officiis accusamus dolor neque.', '76.00', NULL, 'DIGI268', 'instock', 0, 0, 100, 'product_5.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(52, 'quod dolores libero ullam', 'quod-dolores-libero-ullam', 'Unde quaerat debitis sit iure sit atque. Ab similique iusto eveniet pariatur praesentium vel. Quibusdam vero nemo velit accusamus. Et pariatur dolores sed minus.', 'Dolorem delectus earum suscipit adipisci iste voluptas autem. Vero illo iste soluta nihil et cum occaecati consequatur. Cumque tempora rerum dicta aut consequatur incidunt iure. Iure quos rerum natus incidunt. Non eaque alias quidem explicabo recusandae. Voluptatem tempore et non ipsam corporis. Et voluptatem magni voluptatem ut velit et. Quia quibusdam officiis quis quia quasi ad. Quia est sed dolores minus nihil.', '304.00', NULL, 'DIGI415', 'instock', 0, 0, 152, 'product_31.png', NULL, 5, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(53, 'consectetur adipisci quia et', 'consectetur-adipisci-quia-et', 'Enim iusto aut et distinctio molestiae. Nam non voluptates ab laudantium vitae quasi. Perspiciatis nesciunt incidunt laboriosam et.', 'Corrupti eaque quod non voluptate eum est. Autem magni nam sequi possimus sint suscipit vel. Culpa id distinctio odit sed delectus temporibus totam. Illum et rerum vero impedit sit accusamus non necessitatibus. Rerum rerum aut perspiciatis et odit eum. Aut blanditiis aut qui eveniet corporis mollitia eaque eos. Voluptates facilis ut consectetur assumenda neque placeat quas. Sunt doloremque eum placeat at reiciendis et. Est non reiciendis blanditiis est alias a. Eos totam quia aperiam error aut.', '207.00', NULL, 'DIGI393', 'instock', 0, 0, 105, 'product_8.png', NULL, 1, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(54, 'velit officiis quod quis', 'velit-officiis-quod-quis', 'Aperiam veniam necessitatibus porro rerum. Exercitationem ducimus quisquam et. Recusandae officia accusantium nam.', 'Autem omnis eaque qui ut quis. Ipsa doloremque ut id perspiciatis necessitatibus ipsum. Vel non suscipit ea quas aut. Tempore autem nemo quis ut. Itaque ad suscipit odio voluptatem vero aperiam nobis. Dolores et vero expedita inventore doloremque ipsum tempora. Voluptates consequatur consequuntur optio dicta quo. Deserunt labore rerum quo enim voluptas. Est nulla consequatur ut quia ab provident. Sint assumenda dolores accusamus similique repellat iure.', '421.00', NULL, 'DIGI398', 'instock', 0, 0, 155, 'product_33.png', NULL, 2, '2022-05-25 23:40:13', '2022-05-25 23:40:13'),
(55, 'non ab qui qui', 'non-ab-qui-qui', 'Veritatis velit nam officia aut. Et in voluptatem ut quidem possimus sequi dolor dolorem. Exercitationem dolore quos aut facere dolor qui repellendus voluptas.', 'Numquam sed rerum omnis est. Dicta maxime qui earum. Laborum asperiores laboriosam facilis facilis dolorum quia. Est impedit id consequatur cumque. Sit est eius a sapiente voluptatem labore. Distinctio numquam occaecati iure. Nobis sit in porro et. Sit odio aliquid quasi repellat quos qui. Delectus alias reiciendis eum ullam tenetur ut deleniti. Deleniti placeat quaerat in eligendi.', '443.00', NULL, 'DIGI244', 'instock', 0, 0, 155, 'product_12.png', NULL, 4, '2022-05-25 23:40:14', '2022-05-25 23:40:14'),
(56, 'consequatur perferendis voluptas sint', 'consequatur-perferendis-voluptas-sint', 'Placeat id sunt nostrum autem accusantium non in. Eveniet esse ipsam sint voluptate totam quo. Id ipsum nam deleniti omnis velit quia. Dolorem a id iure voluptates commodi.', 'Praesentium occaecati perspiciatis et. Ab enim porro ullam iste dolorum ducimus incidunt. Esse laudantium placeat earum enim iure delectus ex. Molestiae iusto aut qui provident quis. Voluptas ad consectetur hic alias commodi praesentium. Voluptates laudantium dolores nihil quasi dolores dolor. Aspernatur minus qui similique aut. Optio eum nisi nihil necessitatibus dignissimos reprehenderit.', '290.00', NULL, 'DIGI336', 'instock', 0, 0, 144, 'product_16.png', NULL, 3, '2022-05-25 23:40:14', '2022-05-25 23:40:14'),
(57, 'mollitia sint soluta excepturi', 'mollitia-sint-soluta-excepturi', 'Nihil velit commodi dolor repellendus sint maxime illum atque. Rerum reprehenderit deserunt et soluta eum totam omnis. Minima deleniti velit est placeat suscipit aperiam sunt.', 'Voluptates ipsa hic adipisci rem nobis sit. Provident ullam veniam provident et. Est neque totam et placeat. Ut expedita saepe vel labore nobis. Quis voluptas numquam illum quia modi. Ipsam sit occaecati expedita. Tenetur atque illo id fugit. Fugiat quia voluptatem quam est eius iusto. Sint totam id culpa mollitia. Sed pariatur perspiciatis cupiditate voluptatem libero. Dicta ex exercitationem expedita provident. Sapiente in quasi vitae molestias molestiae.', '226.00', NULL, 'DIGI400', 'instock', 0, 0, 143, 'product_21.png', NULL, 4, '2022-05-25 23:40:14', '2022-05-25 23:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-05-31 03:28:19', 0, NULL, '2022-05-30 05:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FUQsbP0WGmpNWvQytxmsV7LS7lkOJ79EGBbM48AZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibEx1Tm44OXd3M1pBNkFYUWNOcFFlNW10S0R0bkVhMVBYZXFSUGp5TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1653916517),
('NXB3b6i253CfJ3nkX073hvTP9bo1BcnavwoflNBf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36 Edg/101.0.1210.53', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZFB1NGhKY015TDN4V2lDMFNBUTRkNndkalZhM2ptTkxyeEV3dEI2eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL29yZGVycy8zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjU6InV0eXBlIjtzOjM6IlVTUiI7czo0OiJjYXJ0IjthOjE6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiNDY4Mzk5NTgxMzQyNTA1YzQ3ZjQ2MTViODFiZWRhYTkiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiI0NjgzOTk1ODEzNDI1MDVjNDdmNDYxNWI4MWJlZGFhOSI7czoyOiJpZCI7aTo1O3M6MzoicXR5IjtpOjE7czo0OiJuYW1lIjtzOjE3OiJub24gZXVtIGF1dGVtIHF1aSI7czo1OiJwcmljZSI7ZDoxMjI7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AdGF4UmF0ZSI7aToyMTtzOjQxOiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AaXNTYXZlZCI7YjowO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czo4OiJjaGVja291dCI7YTo0OntzOjg6ImRpc2NvdW50IjtpOjA7czo4OiJzdWJ0b3RhbCI7czo2OiIxMjIuMDAiO3M6MzoidGF4IjtzOjU6IjI1LjYyIjtzOjU6InRvdGFsIjtzOjY6IjE0Ny42MiI7fX0=', 1653916800),
('Shj6OISPrDbPzEOIwlqa8XS1YmZ2F2xJ8lN4h1pf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNIaW8wSmdMNVVzYzgxSHkzMHpkdDIySllYR3NYN1BwSlhmMzVtZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1653922058);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, 'Classroom', 'Romeo', '09265431622', '201911621@gordoncollege.edu.ph', 'test line1', 'test line1', 'Tangency', 'ZZambales', 'UNited States', '2230', '2022-05-22 15:19:21', '2022-05-22 15:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','paypal','card','gcash') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'cod', 'pending', '2022-05-22 15:19:21', '2022-05-22 15:19:21'),
(2, 1, 2, 'cod', 'pending', '2022-05-22 15:49:57', '2022-05-22 15:49:57'),
(3, 2, 3, 'cod', 'pending', '2022-05-24 04:18:12', '2022-05-24 04:18:12'),
(4, 2, 4, 'cod', 'pending', '2022-05-24 14:02:28', '2022-05-24 14:02:28'),
(5, 2, 5, 'cod', 'pending', '2022-05-24 14:29:02', '2022-05-24 14:29:02'),
(6, 2, 6, 'cod', 'pending', '2022-05-25 01:46:48', '2022-05-25 01:46:48'),
(7, 3, 7, 'cod', 'pending', '2022-05-25 20:04:07', '2022-05-25 20:04:07'),
(8, 4, 8, 'cod', 'pending', '2022-05-25 21:45:31', '2022-05-25 21:45:31'),
(9, 4, 9, 'cod', 'pending', '2022-05-25 21:59:15', '2022-05-25 21:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'Romeo John Perez', 'romeojohnorig5@gmail.com', NULL, '$2y$10$ptEPknf4N95SPH1s3WE6hOagASNXvxr8lHU97/23WNiMr6tGLRYiW', NULL, NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-05-18 05:32:01', '2022-05-18 05:32:01'),
(2, 'Kirk', 'kirk@gmail.com', NULL, '$2y$10$Bw6/xtpZgXpa.snSn9tB9uyDtJQO6/r773HPzeE3tfs4NJi9zFMiW', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-05-24 03:43:47', '2022-05-24 03:43:47'),
(3, 'Rumyooo', 'romeojohnorig6@gmail.com', NULL, '$2y$10$Vv2QZo5TQcUOP/rK6m4KEeRJJeeq0slgSeGPvuzotnXWeRZSwf95G', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-05-25 19:53:12', '2022-05-25 19:53:12'),
(4, 'shermayne@gmail.com', 'shermayne@gmail.com', NULL, '$2y$10$VM7nTcx3g0gDRS5w65iBB.JGKxr.64STg7peHDQKC6POEO3u6VhYK', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-05-25 21:37:15', '2022-05-25 21:37:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
