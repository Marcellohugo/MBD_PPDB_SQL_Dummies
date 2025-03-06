SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE ppdb_sulsel;
USE ppdb_sulsel;

CREATE TABLE `calonpesertadidik` (
  `id_peserta` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nisn` varchar(20) UNIQUE DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(100) UNIQUE DEFAULT NULL,
  PRIMARY KEY (`id_peserta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `sekolah` (
  `id_sekolah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sekolah` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jenjang` enum('SMA','SMK') DEFAULT NULL,
  PRIMARY KEY (`id_sekolah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jalurpendaftaran` (
  `id_jalur` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jalur` varchar(50) DEFAULT NULL,
  `jenjang` enum('SMA','SMK') DEFAULT NULL,
  PRIMARY KEY (`id_jalur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_peserta` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `id_jalur` int(11) NOT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `status_pendaftaran` enum('Diterima','Ditolak','Menunggu') DEFAULT NULL,
  PRIMARY KEY (`id_pendaftaran`),
  FOREIGN KEY (`id_peserta`) REFERENCES `calonpesertadidik` (`id_peserta`) ON DELETE CASCADE,
  FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE,
  FOREIGN KEY (`id_jalur`) REFERENCES `jalurpendaftaran` (`id_jalur`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT,
  `id_pendaftaran` int(11) NOT NULL,
  `status_kelulusan` enum('Lulus','Tidak Lulus') DEFAULT NULL,
  `tanggal_pengumuman` date DEFAULT NULL,
  PRIMARY KEY (`id_pengumuman`),
  FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `daftarulang` (
  `id_daftar_ulang` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengumuman` int(11) NOT NULL,
  `status_daftar_ulang` enum('Selesai','Belum Selesai') DEFAULT NULL,
  `tanggal_daftar_ulang` date DEFAULT NULL,
  PRIMARY KEY (`id_daftar_ulang`),
  FOREIGN KEY (`id_pengumuman`) REFERENCES `pengumuman` (`id_pengumuman`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;