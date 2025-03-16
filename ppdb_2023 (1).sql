-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Mar 2025 pada 06.03
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_2023`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon_peserta_didik`
--

CREATE TABLE `calon_peserta_didik` (
  `Id_peserta` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `NISN` char(10) NOT NULL,
  `Tempat_Lahir` varchar(50) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Nomor_Hp` char(12) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `calon_peserta_didik`
--

INSERT INTO `calon_peserta_didik` (`Id_peserta`, `Nama`, `NISN`, `Tempat_Lahir`, `Tanggal_Lahir`, `Nomor_Hp`, `Email`) VALUES
(1, 'Ahmad Fauzi', '1234567890', 'Surabaya', '2008-05-12', '081234567890', 'ahmad.fauzi@example.com'),
(2, 'Budi Santoso', '1234567891', 'Jakarta', '2007-10-25', '081234567891', 'budi.santoso@example.com'),
(3, 'Citra Lestari', '1234567892', 'Bandung', '2008-02-18', '081234567892', 'citra.lestari@example.com'),
(4, 'Dewi Kusuma', '1234567893', 'Yogyakarta', '2007-07-30', '081234567893', 'dewi.kusuma@example.com'),
(5, 'Eko Saputra', '1234567894', 'Semarang', '2008-01-05', '081234567894', 'eko.saputra@example.com'),
(6, 'Fajar Pratama', '1234567895', 'Malang', '2007-12-15', '081234567895', 'fajar.pratama@example.com'),
(7, 'Gita Rahma', '1234567896', 'Denpasar', '2008-04-20', '081234567896', 'gita.rahma@example.com'),
(8, 'Hadi Susanto', '1234567897', 'Makassar', '2007-09-10', '081234567897', 'hadi.susanto@example.com'),
(9, 'Indah Permata', '1234567898', 'Medan', '2008-06-07', '081234567898', 'indah.permata@example.com'),
(10, 'Joko Widodo', '1234567899', 'Surakarta', '2007-11-22', '081234567899', 'joko.widodo@example.com'),
(11, 'Kurniawan', '1234567800', 'Palembang', '2008-03-14', '081234567800', 'kurniawan@example.com'),
(12, 'Lestari Dewi', '1234567801', 'Pekanbaru', '2007-08-28', '081234567801', 'lestari.dewi@example.com'),
(13, 'Mahmud Zulkifli', '1234567802', 'Aceh', '2008-07-19', '081234567802', 'mahmud.zulkifli@example.com'),
(14, 'Nina Hartati', '1234567803', 'Pontianak', '2007-05-21', '081234567803', 'nina.hartati@example.com'),
(15, 'Oscar Pradana', '1234567804', 'Balikpapan', '2008-09-23', '081234567804', 'oscar.pradana@example.com'),
(16, 'Putri Ananda', '1234567805', 'Samarinda', '2007-06-29', '081234567805', 'putri.ananda@example.com'),
(17, 'Qory Alamsyah', '1234567806', 'Banjarmasin', '2008-11-11', '081234567806', 'qory.alamsyah@example.com'),
(18, 'Rizky Ramadhan', '1234567807', 'Serang', '2007-12-05', '081234567807', 'rizky.ramadhan@example.com'),
(19, 'Siti Khadijah', '1234567808', 'Depok', '2008-10-02', '081234567808', 'siti.khadijah@example.com'),
(20, 'Taufik Hidayat', '1234567809', 'Bekasi', '2007-07-01', '081234567809', 'taufik.hidayat@example.com'),
(21, 'Umar Faruq', '1234567810', 'Bogor', '2008-08-16', '081234567810', 'umar.faruq@example.com'),
(22, 'Vina Rosdiana', '1234567811', 'Tangerang', '2007-09-27', '081234567811', 'vina.rosdiana@example.com'),
(23, 'Wahyu Saputra', '1234567812', 'Batam', '2008-12-29', '081234567812', 'wahyu.saputra@example.com'),
(24, 'Xaverius Prasetyo', '1234567813', 'Padang', '2007-11-18', '081234567813', 'xaverius.prasetyo@example.com'),
(25, 'Yusuf Maulana', '1234567814', 'Manado', '2008-05-04', '081234567814', 'yusuf.maulana@example.com'),
(26, 'Zahra Rahim', '1234567815', 'Ambon', '2007-10-07', '081234567815', 'zahra.rahim@example.com'),
(27, 'Aditya Nugroho', '1234567816', 'Jayapura', '2008-02-11', '081234567816', 'aditya.nugroho@example.com'),
(28, 'Bella Anggraini', '1234567817', 'Sorong', '2007-04-09', '081234567817', 'bella.anggraini@example.com'),
(29, 'Cahyo Wibowo', '1234567818', 'Kupang', '2008-03-25', '081234567818', 'cahyo.wibowo@example.com'),
(30, 'Dian Pertiwi', '1234567819', 'Banda Aceh', '2007-07-17', '081234567819', 'dian.pertiwi@example.com'),
(31, 'Eri Susanti', '1234567820', 'Ternate', '2008-06-01', '081234567820', 'eri.susanti@example.com'),
(32, 'Farhan Mahardika', '1234567821', 'Gorontalo', '2007-12-10', '081234567821', 'farhan.mahardika@example.com'),
(33, 'Gilang Prasetyo', '1234567822', 'Palangkaraya', '2008-01-30', '081234567822', 'gilang.prasetyo@example.com'),
(34, 'Hafiz Rahman', '1234567823', 'Bengkulu', '2007-11-03', '081234567823', 'hafiz.rahman@example.com'),
(35, 'Ida Ayu', '1234567824', 'Mataram', '2008-07-22', '081234567824', 'ida.ayu@example.com'),
(36, 'Johan Ardiansyah', '1234567825', 'Tarakan', '2007-09-15', '081234567825', 'johan.ardiansyah@example.com'),
(37, 'Kiki Fadilah', '1234567826', 'Cilegon', '2008-04-28', '081234567826', 'kiki.fadilah@example.com'),
(38, 'Lukman Hakim', '1234567827', 'Palu', '2007-06-12', '081234567827', 'lukman.hakim@example.com'),
(39, 'Maya Sari', '1234567828', 'Bitung', '2008-02-07', '081234567828', 'maya.sari@example.com'),
(40, 'Nanda Saputra', '1234567829', 'Lampung', '2008-05-19', '081234567829', 'nanda.saputra@example.com'),
(41, 'Olivia Kartika', '1234567830', 'Jember', '2007-08-23', '081234567830', 'olivia.kartika@example.com'),
(42, 'Prasetyo Adi', '1234567831', 'Cirebon', '2008-09-30', '081234567831', 'prasetyo.adi@example.com'),
(43, 'Rina Anggraini', '1234567832', 'Pangkalpinang', '2007-10-12', '081234567832', 'rina.anggraini@example.com'),
(44, 'Sandy Permana', '1234567833', 'Batu', '2008-02-14', '081234567833', 'sandy.permana@example.com'),
(45, 'Tasya Amelia', '1234567834', 'Probolinggo', '2007-11-08', '081234567834', 'tasya.amelia@example.com'),
(46, 'Udin Sulaiman', '1234567835', 'Salatiga', '2008-07-05', '081234567835', 'udin.sulaiman@example.com'),
(47, 'Vito Ramadhan', '1234567836', 'Banjarbaru', '2007-06-22', '081234567836', 'vito.ramadhan@example.com'),
(48, 'Wulan Sari', '1234567837', 'Kediri', '2008-03-10', '081234567837', 'wulan.sari@example.com'),
(49, 'Xena Permadi', '1234567838', 'Sukabumi', '2007-05-06', '081234567838', 'xena.permadi@example.com'),
(50, 'Yusuf Maulana', '1234567839', 'Palembang', '2008-01-15', '081234567839', 'yusuf.maulana@example.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_ulang`
--

CREATE TABLE `daftar_ulang` (
  `Id_daftar_ulang` int(11) NOT NULL,
  `Id_pengumuman` int(11) NOT NULL,
  `Status_daftar_ulang` enum('Pending','Approved','Rejected') NOT NULL,
  `Tanggal_daftar_ulang` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar_ulang`
--

INSERT INTO `daftar_ulang` (`Id_daftar_ulang`, `Id_pengumuman`, `Status_daftar_ulang`, `Tanggal_daftar_ulang`) VALUES
(51, 1, 'Pending', '2025-05-01'),
(52, 2, 'Approved', '2025-05-02'),
(53, 3, 'Rejected', '2025-05-03'),
(54, 4, 'Pending', '2025-05-04'),
(55, 5, 'Approved', '2025-05-05'),
(56, 6, 'Rejected', '2025-05-06'),
(57, 7, 'Pending', '2025-05-07'),
(58, 8, 'Approved', '2025-05-08'),
(59, 9, 'Rejected', '2025-05-09'),
(60, 10, 'Pending', '2025-05-10'),
(61, 11, 'Approved', '2025-05-11'),
(62, 12, 'Rejected', '2025-05-12'),
(63, 13, 'Pending', '2025-05-13'),
(64, 14, 'Approved', '2025-05-14'),
(65, 15, 'Rejected', '2025-05-15'),
(66, 16, 'Pending', '2025-05-16'),
(67, 17, 'Approved', '2025-05-17'),
(68, 18, 'Rejected', '2025-05-18'),
(69, 19, 'Pending', '2025-05-19'),
(70, 20, 'Approved', '2025-05-20'),
(71, 21, 'Rejected', '2025-05-21'),
(72, 22, 'Pending', '2025-05-22'),
(73, 23, 'Approved', '2025-05-23'),
(74, 24, 'Rejected', '2025-05-24'),
(75, 25, 'Pending', '2025-05-25'),
(76, 26, 'Approved', '2025-05-26'),
(77, 27, 'Rejected', '2025-05-27'),
(78, 28, 'Pending', '2025-05-28'),
(79, 29, 'Approved', '2025-05-29'),
(80, 30, 'Rejected', '2025-05-30'),
(81, 31, 'Pending', '2025-06-01'),
(82, 32, 'Approved', '2025-06-02'),
(83, 33, 'Rejected', '2025-06-03'),
(84, 34, 'Pending', '2025-06-04'),
(85, 35, 'Approved', '2025-06-05'),
(86, 36, 'Rejected', '2025-06-06'),
(87, 37, 'Pending', '2025-06-07'),
(88, 38, 'Approved', '2025-06-08'),
(89, 39, 'Rejected', '2025-06-09'),
(90, 40, 'Pending', '2025-06-10'),
(91, 41, 'Approved', '2025-06-11'),
(92, 42, 'Rejected', '2025-06-12'),
(93, 43, 'Pending', '2025-06-13'),
(94, 44, 'Approved', '2025-06-14'),
(95, 45, 'Rejected', '2025-06-15'),
(96, 46, 'Pending', '2025-06-16'),
(97, 47, 'Approved', '2025-06-17'),
(98, 48, 'Rejected', '2025-06-18'),
(99, 49, 'Pending', '2025-06-19'),
(100, 50, 'Approved', '2025-06-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jalur_pendaftaran`
--

CREATE TABLE `jalur_pendaftaran` (
  `Id_jalur` int(11) NOT NULL,
  `Nama_Jalur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jalur_pendaftaran`
--

INSERT INTO `jalur_pendaftaran` (`Id_jalur`, `Nama_Jalur`) VALUES
(1, 'SMA Boarding School'),
(2, 'SMA Afirmasi'),
(3, 'SMA Perpindahan Tugas OrangTua'),
(4, 'SMA Anak Guru'),
(5, 'SMA Prestasi Non-Akademik'),
(6, 'SMK Afirmasi'),
(7, 'SMK Perpindahan Tugas OrangTua'),
(8, 'SMK Anak Guru'),
(9, 'SMK Anak DUDI Mitra SMK'),
(10, 'SMK Prestasi Non-Akademik'),
(11, 'SMK Domisili Terdekat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `Id_pendaftaran` int(11) NOT NULL,
  `Id_peserta` int(11) NOT NULL,
  `Id_sekolah` int(11) NOT NULL,
  `Id_jalur` int(11) NOT NULL,
  `Tanggal_pendaftaran` date NOT NULL,
  `Status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`Id_pendaftaran`, `Id_peserta`, `Id_sekolah`, `Id_jalur`, `Tanggal_pendaftaran`, `Status`) VALUES
(1, 1, 1, 1, '2025-03-01', 'Pending'),
(2, 2, 2, 2, '2025-03-02', 'Approved'),
(3, 3, 3, 3, '2025-03-03', 'Rejected'),
(4, 4, 4, 4, '2025-03-04', 'Pending'),
(5, 5, 5, 5, '2025-03-05', 'Approved'),
(6, 6, 1, 6, '2025-03-06', 'Rejected'),
(7, 7, 2, 7, '2025-03-07', 'Pending'),
(8, 8, 3, 8, '2025-03-08', 'Approved'),
(9, 9, 4, 9, '2025-03-09', 'Rejected'),
(10, 10, 5, 10, '2025-03-10', 'Pending'),
(11, 11, 1, 11, '2025-03-11', 'Approved'),
(12, 12, 2, 12, '2025-03-12', 'Rejected'),
(13, 13, 3, 13, '2025-03-13', 'Pending'),
(14, 14, 4, 14, '2025-03-14', 'Approved'),
(15, 15, 5, 15, '2025-03-15', 'Rejected'),
(16, 16, 1, 16, '2025-03-16', 'Pending'),
(17, 17, 2, 17, '2025-03-17', 'Approved'),
(18, 18, 3, 18, '2025-03-18', 'Rejected'),
(19, 19, 4, 19, '2025-03-19', 'Pending'),
(20, 20, 5, 20, '2025-03-20', 'Approved'),
(21, 21, 1, 21, '2025-03-21', 'Rejected'),
(22, 22, 2, 22, '2025-03-22', 'Pending'),
(23, 23, 3, 23, '2025-03-23', 'Approved'),
(24, 24, 4, 24, '2025-03-24', 'Rejected'),
(25, 25, 5, 25, '2025-03-25', 'Pending'),
(26, 26, 1, 26, '2025-03-26', 'Approved'),
(27, 27, 2, 27, '2025-03-27', 'Rejected'),
(28, 28, 3, 28, '2025-03-28', 'Pending'),
(29, 29, 4, 29, '2025-03-29', 'Approved'),
(30, 30, 5, 30, '2025-03-30', 'Rejected'),
(31, 31, 1, 31, '2025-03-31', 'Pending'),
(32, 32, 2, 32, '2025-04-01', 'Approved'),
(33, 33, 3, 33, '2025-04-02', 'Rejected'),
(34, 34, 4, 34, '2025-04-03', 'Pending'),
(35, 35, 5, 35, '2025-04-04', 'Approved'),
(36, 36, 1, 36, '2025-04-05', 'Rejected'),
(37, 37, 2, 37, '2025-04-06', 'Pending'),
(38, 38, 3, 38, '2025-04-07', 'Approved'),
(39, 39, 4, 39, '2025-04-08', 'Rejected'),
(40, 40, 5, 40, '2025-04-09', 'Pending'),
(41, 41, 1, 41, '2025-04-10', 'Approved'),
(42, 42, 2, 42, '2025-04-11', 'Rejected'),
(43, 43, 3, 43, '2025-04-12', 'Pending'),
(44, 44, 4, 44, '2025-04-13', 'Approved'),
(45, 45, 5, 45, '2025-04-14', 'Rejected'),
(46, 46, 1, 46, '2025-04-15', 'Pending'),
(47, 47, 2, 47, '2025-04-16', 'Approved'),
(48, 48, 3, 48, '2025-04-17', 'Rejected'),
(49, 49, 4, 49, '2025-04-18', 'Pending'),
(50, 50, 5, 50, '2025-04-19', 'Approved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `Id_pengumuman` int(11) NOT NULL,
  `Id_pendaftaran` int(11) NOT NULL,
  `Status_kelulusan` enum('Pending','Approved','Rejected') NOT NULL,
  `Tanggal_pengumuman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`Id_pengumuman`, `Id_pendaftaran`, `Status_kelulusan`, `Tanggal_pengumuman`) VALUES
(1, 1, 'Pending', '2025-04-01'),
(2, 2, 'Approved', '2025-04-02'),
(3, 3, 'Rejected', '2025-04-03'),
(4, 4, 'Pending', '2025-04-04'),
(5, 5, 'Approved', '2025-04-05'),
(6, 6, 'Rejected', '2025-04-06'),
(7, 7, 'Pending', '2025-04-07'),
(8, 8, 'Approved', '2025-04-08'),
(9, 9, 'Rejected', '2025-04-09'),
(10, 10, 'Pending', '2025-04-10'),
(11, 11, 'Approved', '2025-04-11'),
(12, 12, 'Rejected', '2025-04-12'),
(13, 13, 'Pending', '2025-04-13'),
(14, 14, 'Approved', '2025-04-14'),
(15, 15, 'Rejected', '2025-04-15'),
(16, 16, 'Pending', '2025-04-16'),
(17, 17, 'Approved', '2025-04-17'),
(18, 18, 'Rejected', '2025-04-18'),
(19, 19, 'Pending', '2025-04-19'),
(20, 20, 'Approved', '2025-04-20'),
(21, 21, 'Rejected', '2025-04-21'),
(22, 22, 'Pending', '2025-04-22'),
(23, 23, 'Approved', '2025-04-23'),
(24, 24, 'Rejected', '2025-04-24'),
(25, 25, 'Pending', '2025-04-25'),
(26, 26, 'Approved', '2025-04-26'),
(27, 27, 'Rejected', '2025-04-27'),
(28, 28, 'Pending', '2025-04-28'),
(29, 29, 'Approved', '2025-04-29'),
(30, 30, 'Rejected', '2025-04-30'),
(31, 31, 'Pending', '2025-05-01'),
(32, 32, 'Approved', '2025-05-02'),
(33, 33, 'Rejected', '2025-05-03'),
(34, 34, 'Pending', '2025-05-04'),
(35, 35, 'Approved', '2025-05-05'),
(36, 36, 'Rejected', '2025-05-06'),
(37, 37, 'Pending', '2025-05-07'),
(38, 38, 'Approved', '2025-05-08'),
(39, 39, 'Rejected', '2025-05-09'),
(40, 40, 'Pending', '2025-05-10'),
(41, 41, 'Approved', '2025-05-11'),
(42, 42, 'Rejected', '2025-05-12'),
(43, 43, 'Pending', '2025-05-13'),
(44, 44, 'Approved', '2025-05-14'),
(45, 45, 'Rejected', '2025-05-15'),
(46, 46, 'Pending', '2025-05-16'),
(47, 47, 'Approved', '2025-05-17'),
(48, 48, 'Rejected', '2025-05-18'),
(49, 49, 'Pending', '2025-05-19'),
(50, 50, 'Approved', '2025-05-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `Id_sekolah` int(11) NOT NULL,
  `Nama_Sekolah` varchar(50) NOT NULL,
  `Alamat_Sekolah` varchar(50) NOT NULL,
  `Kuota_Penerimaan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`Id_sekolah`, `Nama_Sekolah`, `Alamat_Sekolah`, `Kuota_Penerimaan`) VALUES
(1, 'SMA Negeri 1', 'Jl. Merdeka No. 1, Jakarta', 100),
(2, 'SMA Negeri 2', 'Jl. Sudirman No. 2, Bandung', 120),
(3, 'SMA Negeri 3', 'Jl. Diponegoro No. 3, Surabaya', 150),
(4, 'SMA Negeri 4', 'Jl. Ahmad Yani No. 4, Yogyakarta', 200),
(5, 'SMA Negeri 5', 'Jl. Gajah Mada No. 5, Semarang', 180),
(6, 'SMA Negeri 6', 'Jl. Pemuda No. 6, Medan', 160),
(7, 'SMA Negeri 7', 'Jl. Pahlawan No. 7, Malang', 140),
(8, 'SMA Negeri 8', 'Jl. Kartini No. 8, Denpasar', 170),
(9, 'SMA Negeri 9', 'Jl. Sutomo No. 9, Makassar', 190),
(10, 'SMA Negeri 10', 'Jl. Rajawali No. 10, Palembang', 210),
(11, 'SMA Negeri 11', 'Jl. Dipatiukur No. 11, Balikpapan', 100),
(12, 'SMA Negeri 12', 'Jl. Cendrawasih No. 12, Manado', 120),
(13, 'SMA Negeri 13', 'Jl. Merpati No. 13, Batam', 130),
(14, 'SMA Negeri 14', 'Jl. Mawar No. 14, Pontianak', 110),
(15, 'SMA Negeri 15', 'Jl. Anggrek No. 15, Banda Aceh', 115),
(16, 'SMA Negeri 16', 'Jl. Melati No. 16, Samarinda', 125),
(17, 'SMA Negeri 17', 'Jl. Kenanga No. 17, Jambi', 135),
(18, 'SMA Negeri 18', 'Jl. Tulip No. 18, Pekanbaru', 145),
(19, 'SMA Negeri 19', 'Jl. Dahlia No. 19, Padang', 155),
(20, 'SMA Negeri 20', 'Jl. Flamboyan No. 20, Banjarmasin', 165),
(21, 'SMA Negeri 21', 'Jl. Cemara No. 21, Bengkulu', 175),
(22, 'SMA Negeri 22', 'Jl. Teratai No. 22, Ternate', 185),
(23, 'SMA Negeri 23', 'Jl. Lili No. 23, Kupang', 195),
(24, 'SMA Negeri 24', 'Jl. Sakura No. 24, Palu', 205),
(25, 'SMA Negeri 25', 'Jl. Seruni No. 25, Mataram', 215),
(26, 'SMA Negeri 26', 'Jl. Bougenville No. 26, Ambon', 225),
(27, 'SMA Negeri 27', 'Jl. Pinus No. 27, Jayapura', 235),
(28, 'SMA Negeri 28', 'Jl. Cemara No. 28, Kendari', 245),
(29, 'SMA Negeri 29', 'Jl. Beringin No. 29, Gorontalo', 255),
(30, 'SMA Negeri 30', 'Jl. Duren No. 30, Tarakan', 265),
(31, 'SMA Negeri 31', 'Jl. Salak No. 31, Sorong', 275),
(32, 'SMA Negeri 32', 'Jl. Jambu No. 32, Serang', 285),
(33, 'SMA Negeri 33', 'Jl. Rambutan No. 33, Pangkal Pinang', 295),
(34, 'SMA Negeri 34', 'Jl. Sirsak No. 34, Palangka Raya', 305),
(35, 'SMA Negeri 35', 'Jl. Alpukat No. 35, Tanjung Pinang', 315),
(36, 'SMA Negeri 36', 'Jl. Nangka No. 36, Bengkalis', 325),
(37, 'SMA Negeri 37', 'Jl. Mangga No. 37, Lubuk Linggau', 335),
(38, 'SMA Negeri 38', 'Jl. Pisang No. 38, Sibolga', 345),
(39, 'SMA Negeri 39', 'Jl. Kelapa No. 39, Binjai', 355),
(40, 'SMA Negeri 40', 'Jl. Cempaka No. 40, Tebing Tinggi', 365),
(41, 'SMA Negeri 41', 'Jl. Mawar No. 41, Bukittinggi', 375),
(42, 'SMA Negeri 42', 'Jl. Melati No. 42, Padang Panjang', 385),
(43, 'SMA Negeri 43', 'Jl. Anggrek No. 43, Pariaman', 395),
(44, 'SMA Negeri 44', 'Jl. Kenanga No. 44, Sawahlunto', 405),
(45, 'SMA Negeri 45', 'Jl. Dahlia No. 45, Payakumbuh', 415),
(46, 'SMA Negeri 46', 'Jl. Flamboyan No. 46, Solok', 425),
(47, 'SMA Negeri 47', 'Jl. Teratai No. 47, Painan', 435),
(48, 'SMA Negeri 48', 'Jl. Lili No. 48, Batusangkar', 445),
(49, 'SMA Negeri 49', 'Jl. Tulip No. 49, Padang Pariaman', 455),
(50, 'SMA Negeri 50', 'Jl. Bougenville No. 50, Dharmasraya', 465);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `calon_peserta_didik`
--
ALTER TABLE `calon_peserta_didik`
  ADD PRIMARY KEY (`Id_peserta`);

--
-- Indeks untuk tabel `daftar_ulang`
--
ALTER TABLE `daftar_ulang`
  ADD PRIMARY KEY (`Id_daftar_ulang`),
  ADD KEY `daftar_ulang_pengumuman` (`Id_pengumuman`);

--
-- Indeks untuk tabel `jalur_pendaftaran`
--
ALTER TABLE `jalur_pendaftaran`
  ADD PRIMARY KEY (`Id_jalur`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`Id_pendaftaran`),
  ADD KEY `pendaftaran_calon_peserta_didik` (`Id_peserta`),
  ADD KEY `pendaftaran_jalur_pendaftaran` (`Id_jalur`),
  ADD KEY `pendaftaran_sekolah` (`Id_sekolah`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`Id_pengumuman`),
  ADD KEY `pengumuman_pendaftaran` (`Id_pendaftaran`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`Id_sekolah`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `calon_peserta_didik`
--
ALTER TABLE `calon_peserta_didik`
  MODIFY `Id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `daftar_ulang`
--
ALTER TABLE `daftar_ulang`
  MODIFY `Id_daftar_ulang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `jalur_pendaftaran`
--
ALTER TABLE `jalur_pendaftaran`
  MODIFY `Id_jalur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `Id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `Id_pengumuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_ulang`
--
ALTER TABLE `daftar_ulang`
  ADD CONSTRAINT `daftar_ulang_pengumuman` FOREIGN KEY (`Id_pengumuman`) REFERENCES `pengumuman` (`Id_pengumuman`);

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_calon_peserta_didik` FOREIGN KEY (`Id_peserta`) REFERENCES `calon_peserta_didik` (`Id_peserta`),
  ADD CONSTRAINT `pendaftaran_jalur_pendaftaran` FOREIGN KEY (`Id_jalur`) REFERENCES `jalur_pendaftaran` (`Id_jalur`),
  ADD CONSTRAINT `pendaftaran_sekolah` FOREIGN KEY (`Id_sekolah`) REFERENCES `sekolah` (`Id_sekolah`);

--
-- Ketidakleluasaan untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_pendaftaran` FOREIGN KEY (`Id_pendaftaran`) REFERENCES `pendaftaran` (`Id_pendaftaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
