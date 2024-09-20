-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Sep 2024 pada 04.01
-- Versi server: 8.0.30
-- Versi PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msib7_sql1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `city`) VALUES
(1, 'John Doe', 'Jakarta'),
(2, 'Jane Smith', 'Bandung'),
(3, 'Alice Johnson', 'Surabaya'),
(4, 'Bob Williams', 'Yogyakarta'),
(5, 'Charlie Brown', 'Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `salesman_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `date`, `amount`, `customer_id`, `salesman_id`) VALUES
(1, '2023-01-10', 1500000.00, 1, 1),
(2, '2023-01-15', 2000000.00, 1, 1),
(3, '2023-01-20', 1000000.00, 2, 2),
(4, '2023-02-05', 3000000.00, 3, 3),
(5, '2023-02-10', 2500000.00, 3, 3),
(6, '2023-02-15', 3500000.00, 4, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesman`
--

CREATE TABLE `salesman` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `commission` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `salesman`
--

INSERT INTO `salesman` (`id`, `name`, `city`, `commission`) VALUES
(1, 'Mike Ross', 'Jakarta', 0.15),
(2, 'Harvey Specter', 'Bandung', 0.20),
(3, 'Rachel Zane', 'Surabaya', 0.18),
(4, 'Donna Paulsen', 'Yogyakarta', 0.10),
(5, 'Louis Litt', 'Semarang', 0.25);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indeks untuk tabel `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
