-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Sep 2024 pada 06.47
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
-- Database: `msib7_sql2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `id` int NOT NULL,
  `mahasiswa_id` int DEFAULT NULL,
  `matakuliah_id` varchar(10) DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `ambil_mk`
--

INSERT INTO `ambil_mk` (`id`, `mahasiswa_id`, `matakuliah_id`, `nilai`) VALUES
(1, 1, 'A01', 85.00),
(2, 1, 'A03', 90.00),
(3, 2, 'A02', 78.00),
(4, 2, 'A03', 82.00),
(5, 3, 'A01', 88.00),
(6, 3, 'A05', 92.00),
(7, 4, 'A02', 80.00),
(8, 4, 'A03', 95.00),
(9, 5, 'A04', 89.00),
(10, 5, 'A03', 70.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int NOT NULL,
  `NIM` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `NIM`, `name`, `alamat`) VALUES
(1, '1234567890', 'Andi Susanto', 'Jakarta'),
(2, '0987654321', 'Budi Pratama', 'Bandung'),
(3, '1122334455', 'Citra Dewi', 'Surabaya'),
(4, '2233445566', 'Dian Wijaya', 'Yogyakarta'),
(5, '3344556677', 'Viyella Arya', 'Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sks` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `name`, `sks`) VALUES
('A01', 'Algoritma', 3),
('A02', 'Struktur Data', 4),
('A03', 'Basis Data', 3),
('A04', 'Pemrograman Web', 3),
('A05', 'Sistem Operasi', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`),
  ADD KEY `matakuliah_id` (`matakuliah_id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
