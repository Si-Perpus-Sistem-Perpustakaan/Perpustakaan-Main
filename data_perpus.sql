-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 28, 2024 at 03:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_pinjam`
--

CREATE TABLE `log_pinjam` (
  `id_log` int NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_pinjam`
--

INSERT INTO `log_pinjam` (`id_log`, `id_buku`, `id_anggota`, `tgl_pinjam`) VALUES
(3, 'B003', 'A002', '2020-06-01'),
(4, 'B002', 'A005', '2020-06-23'),
(6, 'B001', 'A003', '2024-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jekel` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `nama`, `jekel`, `alamat`, `no_hp`) VALUES
('A002', 'Desi', 'Perempuan', 'Margerejo', '987654321'),
('A003', 'Krisna', 'Laki-laki', 'Ciputra', '555555555'),
('A004', 'Glinda', 'Perempuan', 'Surabaya', '124676125482'),
('A005', 'Latea', 'Perempuan', 'Gresik', '666666666'),
('A006', 'Shenan', 'Perempuan', 'Sidoarjo', '124676125482'),
('A007', 'Kevin', 'Laki-laki', 'Surabaya', '124676125482'),
('A008', 'Elan', 'Laki-laki', 'Sidoarjo', '124676125482'),
('A009', 'Hendra', 'Laki-laki', 'Sidoarjo', '124676125482'),
('A010', 'Julian', 'Laki-laki', 'Surabaya', '124676125482'),
('A011', 'Dave', 'Laki-laki', 'Surabaya', '124676125482'),
('A012', 'David', 'Laki-laki', 'Surabaya', '124676125482'),
('A013', 'diana', 'Perempuan', 'pabean', '124676125482'),
('A014', 'Aldo', 'Laki-laki', 'Sidoarjo', '124676125482'),
('A015', 'Belia', 'Perempuan', 'Surabaya', '124676125482'),
('A016', 'Mutia', 'Perempuan', 'Surabaya', '124676125482'),
('A017', 'Listia', 'Perempuan', 'Sidoarjo', '124676125482'),
('A018', 'Luna', 'Perempuan', 'Sidoarjo', '124676125482'),
('A019', 'Rachel', 'Perempuan', 'Surabaya', '124676125482'),
('A020', 'Dodit', 'Laki-laki', 'Sidoarjo', '124676125482'),
('A021', 'Diana', 'Perempuan', 'Sidoarjo', '124676125482'),
('A022', 'Eve', 'Perempuan', 'Surabaya', '124676125482'),
('A023', 'Juan', 'Laki-laki', 'Sidoarjo', '124676125482'),
('A024', 'Brenda', 'Perempuan', 'Sidoarjo', '124676125482'),
('A025', 'Wicked', 'Perempuan', 'Surabaya', '124676125482'),
('A026', 'tiara', 'Perempuan', 'ketintang', '0293819');

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(30) NOT NULL,
  `pengarang` varchar(30) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `th_terbit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `th_terbit`) VALUES
('B001', 'Menyenangkanmu', 'Deandra', 'Blibuku', 2024),
('B002', 'Lost Me', 'Anggara', 'Toko Kelontong', 2021),
('B003', 'Bersikap Bodo Amat', 'Sena', 'Blibuku', 2020),
('B004', 'Kukatakan Cukup', 'Lutisia', 'Gramedia', 2022),
('B005', 'Bersikap Peduli', 'Maona', 'Blibuku', 2023),
('B006', 'Mengembirakanmu', 'Gilang', 'Toko Kelontong', 2024),
('B007', 'Suka Duka', 'Lunasya', 'Gramedia', 2021),
('B008', 'Kukira Kau Rumah', 'Patrisia', 'Gramedia', 2020),
('B009', 'Happy Human', 'Kenan', 'Toko Kelontong', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('Administrator','Petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'petugas', 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'Petugas'),
(2, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator'),
(3, 'tissa', 'petugas1', '731a0bceac71b340675a4ab7e1f1eab9', 'Petugas'),
(4, 'tiara', 'petugas2', 'ae2511009380674cfa294ba6a0d43baf', 'Petugas'),
(5, 'jerdin', 'petugas3', '40fdc2b80ec1a1d4771da87c53ebdd4f', 'Petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas_sirkulasi`
--

CREATE TABLE `tb_petugas_sirkulasi` (
  `id_petugas_sirkulasi` int NOT NULL,
  `id_petugas` int NOT NULL,
  `tanggal_tugas` date NOT NULL,
  `shift` enum('Pagi','Siang','Malam') NOT NULL,
  `nama_petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_petugas_sirkulasi`
--

INSERT INTO `tb_petugas_sirkulasi` (`id_petugas_sirkulasi`, `id_petugas`, `tanggal_tugas`, `shift`, `nama_petugas`) VALUES
(1, 3, '2024-12-04', 'Pagi', 'Tissa'),
(2, 4, '2024-12-04', 'Siang', 'Tiara'),
(3, 5, '2024-12-04', 'Malam', 'Jerdin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sirkulasi`
--

CREATE TABLE `tb_sirkulasi` (
  `id_sk` varchar(20) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('PIN','KEM') NOT NULL,
  `tgl_dikembalikan` date NOT NULL,
  `id_petugas_sirkulasi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_sirkulasi`
--

INSERT INTO `tb_sirkulasi` (`id_sk`, `id_buku`, `id_anggota`, `tgl_pinjam`, `tgl_kembali`, `status`, `tgl_dikembalikan`, `id_petugas_sirkulasi`) VALUES
('S003', 'B003', 'A002', '2024-04-29', '2024-05-06', 'KEM', '2024-04-25', NULL),
('S004', 'B002', 'A005', '2024-04-30', '2024-05-07', 'KEM', '2024-04-25', NULL),
('S006', 'B001', 'A003', '2024-06-28', '2024-07-05', 'KEM', '2024-06-14', NULL),
('S015', 'B002', 'A005', '2024-12-03', '2024-12-10', 'KEM', '2024-12-04', NULL),
('S019', 'B001', 'A005', '2024-12-16', '2024-12-23', 'KEM', '2024-12-21', NULL),
('S020', 'B002', 'A002', '2024-12-16', '2024-12-23', 'KEM', '2024-12-21', NULL),
('S021', 'B001', 'A002', '2024-12-30', '2025-01-06', 'PIN', '2024-12-28', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_pinjam`
--
ALTER TABLE `log_pinjam`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_petugas_sirkulasi`
--
ALTER TABLE `tb_petugas_sirkulasi`
  ADD PRIMARY KEY (`id_petugas_sirkulasi`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `tb_sirkulasi`
--
ALTER TABLE `tb_sirkulasi`
  ADD PRIMARY KEY (`id_sk`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas_sirkulasi` (`id_petugas_sirkulasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_pinjam`
--
ALTER TABLE `log_pinjam`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_petugas_sirkulasi`
--
ALTER TABLE `tb_petugas_sirkulasi`
  MODIFY `id_petugas_sirkulasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_pinjam`
--
ALTER TABLE `log_pinjam`
  ADD CONSTRAINT `log_pinjam_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `log_pinjam_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_petugas_sirkulasi`
--
ALTER TABLE `tb_petugas_sirkulasi`
  ADD CONSTRAINT `tb_petugas_sirkulasi_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_sirkulasi`
--
ALTER TABLE `tb_sirkulasi`
  ADD CONSTRAINT `tb_sirkulasi_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_sirkulasi_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `tb_anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_sirkulasi_ibfk_3` FOREIGN KEY (`id_petugas_sirkulasi`) REFERENCES `tb_petugas_sirkulasi` (`id_petugas_sirkulasi`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
