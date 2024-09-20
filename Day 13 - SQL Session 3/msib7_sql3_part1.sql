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
-- Database: `msib7_sql3_part1`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSiswaByBorn` (IN `tempatLahir` VARCHAR(100))   BEGIN
    SELECT * 
    FROM Siswa 
    WHERE TTL LIKE CONCAT('%', tempatLahir, '%');
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getJmlByGender` (`genderInput` CHAR(1)) RETURNS INT DETERMINISTIC BEGIN
    DECLARE jumlah INT;
    
    SELECT COUNT(*) INTO jumlah
    FROM Siswa
    WHERE gender = genderInput;
    
    RETURN jumlah;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` int NOT NULL,
  `nilai_IPA` decimal(5,2) DEFAULT NULL,
  `nilai_IPS` decimal(5,2) DEFAULT NULL,
  `nilai_MTK` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `nilai_IPA`, `nilai_IPS`, `nilai_MTK`) VALUES
(1, 85.00, 90.00, 88.00),
(2, 75.00, 80.00, 82.00),
(3, 90.00, 85.00, 92.00),
(4, 88.00, 87.00, 89.00),
(5, 70.00, 78.00, 75.00),
(6, 92.00, 90.00, 95.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int NOT NULL,
  `NIS` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `TTL` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `NIS`, `nama`, `TTL`, `gender`, `alamat`) VALUES
(1, '001', 'Andi Susanto', 'Jakarta, 01-01-2005', 'L', 'Jakarta'),
(2, '002', 'Budi Pratama', 'Bandung, 15-03-2004', 'L', 'Bandung'),
(3, '003', 'Citra Dewi', 'Surabaya, 22-05-2005', 'P', 'Surabaya'),
(4, '004', 'Dian Wijaya', 'Yogyakarta, 11-07-2004', 'L', 'Yogyakarta'),
(5, '005', 'Viyella Arya', 'Semarang, 05-09-2005', 'P', 'Semarang'),
(6, '006', 'Eka Putri', 'Malang, 23-11-2004', 'P', 'Malang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
