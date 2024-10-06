-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Sep 2024 pada 09.28
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
-- Database: `msib7_hospital`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migration_control`
--

CREATE TABLE `migration_control` (
  `id` int NOT NULL,
  `migration_name` varchar(255) NOT NULL,
  `date_executed` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `migration_control`
--

INSERT INTO `migration_control` (`id`, `migration_name`, `date_executed`) VALUES
(1, 'initial_migration', '2024-09-23 07:24:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` char(6) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `umur` int DEFAULT NULL,
  `alamat` text,
  `penyakit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `umur`, `alamat`, `penyakit`) VALUES
('PSN001', 'Andi Saputra', 25, 'Jl. Merdeka No. 10, Jakarta', 'Demam'),
('PSN003', 'Budi Santoso', 38, 'Jl. Sudirman No. 15, Bandung', 'Diabetes'),
('PSN004', 'Dewi Persik', 35, 'Jl. Mawar No. 5, Surabaya', 'Hipertensi'),
('PSN005', 'Rahmat Hidayat', 50, 'Jl. Kenangan No. 12, Yogyakarta', 'Asma'),
('PSN006', 'Rina Melati', 28, 'Jl. Jendral Sudirman No. 23, Medan', 'Penyakit Jantung'),
('PSN007', 'Budi', 21, 'Jl. Kebun Anggur', 'Pusing');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migration_control`
--
ALTER TABLE `migration_control`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migration_control`
--
ALTER TABLE `migration_control`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
