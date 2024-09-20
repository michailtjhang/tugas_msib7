-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 19 Sep 2024 pada 06.11
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
-- Database: `msib7_sql3_part2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `nama`, `harga`) VALUES
(1, 'Laptop Dell', 10000000.00),
(2, 'HP Samsung', 5000000.00),
(3, 'TV LG', 3000000.00),
(4, 'Kulkas Toshiba', 4000000.00),
(5, 'Mesin Cuci Sharp', 3500000.00);

--
-- Trigger `products`
--
DELIMITER $$
CREATE TRIGGER `after_product_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO Stocks (product_id, quantity) 
    VALUES (NEW.id, 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stocks`
--

CREATE TABLE `stocks` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `quantity`) VALUES
(1, 1, 15),
(2, 2, 15),
(3, 3, 30),
(4, 4, 5),
(5, 5, 12);

--
-- Trigger `stocks`
--
DELIMITER $$
CREATE TRIGGER `check_stock_after_update` AFTER UPDATE ON `stocks` FOR EACH ROW BEGIN
    IF NEW.quantity < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Warning: Stock kurang dari 10!';
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
