SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Membuat database
CREATE DATABASE ppdb_sulsel;
USE ppdb_sulsel;

-- Tabel calon peserta didik
CREATE TABLE `calonpesertadidik` (
  `id_peserta` INT(11) NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(100) DEFAULT NULL,
  `nisn` CHAR(10) NOT NULL,
  `tempat_lahir` VARCHAR(50) DEFAULT NULL,
  `tanggal_lahir` DATE DEFAULT NULL,
  `alamat` TEXT DEFAULT NULL,
  `no_hp` VARCHAR(15) DEFAULT NULL,
  `email` VARCHAR(100) UNIQUE DEFAULT NULL,
  PRIMARY KEY (`id_peserta`),
  UNIQUE KEY `unique_nisn` (`nisn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabel sekolah
CREATE TABLE `sekolah` (
  `id_sekolah` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_sekolah` VARCHAR(100) NOT NULL,
  `alamat` TEXT DEFAULT NULL,
  `jenjang` ENUM('SMA','SMK') DEFAULT NULL,
  PRIMARY KEY (`id_sekolah`),
  UNIQUE KEY `unique_nama_sekolah` (`nama_sekolah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabel jalur pendaftaran
CREATE TABLE `jalurpendaftaran` (
  `id_jalur` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_jalur` VARCHAR(50) NOT NULL,
  `jenjang` ENUM('SMA','SMK') DEFAULT NULL,
  PRIMARY KEY (`id_jalur`),
  UNIQUE KEY `unique_nama_jalur` (`nama_jalur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabel pendaftaran
CREATE TABLE `pendaftaran` (
  `id_pendaftaran` INT(11) NOT NULL AUTO_INCREMENT,
  `nisn` CHAR(10) NOT NULL,
  `id_sekolah` INT(11) NOT NULL,
  `id_jalur` INT(11) NOT NULL,
  `tanggal_daftar` DATE DEFAULT NULL,
  PRIMARY KEY (`id_pendaftaran`),
  CONSTRAINT `fk_pendaftaran_nisn` FOREIGN KEY (`nisn`) REFERENCES `calonpesertadidik` (`nisn`) ON DELETE CASCADE,
  CONSTRAINT `fk_pendaftaran_id_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE,
  CONSTRAINT `fk_pendaftaran_id_jalur` FOREIGN KEY (`id_jalur`) REFERENCES `jalurpendaftaran` (`id_jalur`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabel pengumuman
CREATE TABLE `pengumuman` (
  `id_pengumuman` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pendaftaran` INT(11) NOT NULL,
  `status_kelulusan` ENUM('Lulus','Tidak Lulus') DEFAULT NULL,
  `tanggal_pengumuman` DATE DEFAULT NULL,
  PRIMARY KEY (`id_pengumuman`),
  CONSTRAINT `fk_pengumuman_id_pendaftaran` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran` (`id_pendaftaran`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabel daftar ulang
CREATE TABLE `daftarulang` (
  `id_daftar_ulang` INT(11) NOT NULL AUTO_INCREMENT,
  `id_pengumuman` INT(11) NOT NULL,
  `status_daftar_ulang` ENUM('Selesai','Belum Selesai') DEFAULT NULL,
  `tanggal_daftar_ulang` DATE DEFAULT NULL,
  PRIMARY KEY (`id_daftar_ulang`),
  CONSTRAINT `fk_daftarulang_id_pengumuman` FOREIGN KEY (`id_pengumuman`) REFERENCES `pengumuman` (`id_pengumuman`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `calonpesertadidik` (`nama`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_hp`, `email`) VALUES
('Ahmad Fauzi', '0345678910', 'Makassar', '2007-01-10', 'Jl. Sultan Hasanuddin No. 12', '081234567890', 'ahmad.fauzi@example.com'),
('Budi Santoso', '0345678911', 'Gowa', '2007-02-15', 'Jl. Perintis Kemerdekaan No. 45', '081345678901', 'budi.santoso@example.com'),
('Citra Lestari', '0345678912', 'Maros', '2007-03-20', 'Jl. Pettarani No. 78', '081456789012', 'citra.lestari@example.com'),
('Dewi Anggraini', '0345678913', 'Makassar', '2007-04-25', 'Jl. Veteran Selatan No. 23', '081567890123', 'dewi.anggraini@example.com'),
('Eko Prasetyo', '0345678914', 'Takalar', '2007-05-30', 'Jl. AP Pettarani No. 34', '081678901234', 'eko.prasetyo@example.com'),
('Fajar Hidayat', '0345678915', 'Parepare', '2007-06-05', 'Jl. Urip Sumoharjo No. 56', '081789012345', 'fajar.hidayat@example.com'),
('Gita Purnama', '0345678916', 'Bone', '2007-07-10', 'Jl. Sudirman No. 67', '081890123456', 'gita.purnama@example.com'),
('Hendra Saputra', '0345678917', 'Bulukumba', '2007-08-15', 'Jl. Monginsidi No. 78', '081901234567', 'hendra.saputra@example.com'),
('Indah Sari', '0345678918', 'Makassar', '2007-09-20', 'Jl. Diponegoro No. 89', '082012345678', 'indah.sari@example.com'),
('Joko Widodo', '0345678919', 'Gowa', '2007-10-25', 'Jl. Ahmad Yani No. 90', '082123456789', 'joko.widodo@example.com'),
('Kiki Andriana', '0345678920', 'Maros', '2007-11-30', 'Jl. Dr. Sutomo No. 101', '082234567890', 'kiki.andriana@example.com'),
('Lestari Kusuma', '0345678921', 'Takalar', '2007-12-05', 'Jl. Sam Ratulangi No. 112', '082345678901', 'lestari.kusuma@example.com'),
('Muhammad Rizki', '0345678922', 'Makassar', '2008-01-10', 'Jl. Haji Bau No. 123', '082456789012', 'muhammad.rizki@example.com'),
('Nia Ramadhani', '0345678923', 'Parepare', '2008-02-15', 'Jl. Pettarani No. 134', '082567890123', 'nia.ramadhani@example.com'),
('Oscar Pratama', '0345678924', 'Bone', '2008-03-20', 'Jl. Sultan Alauddin No. 145', '082678901234', 'oscar.pratama@example.com'),
('Putri Amelia', '0345678925', 'Bulukumba', '2008-04-25', 'Jl. Mappanyukki No. 156', '082789012345', 'putri.amelia@example.com'),
('Qori Azhar', '0345678926', 'Makassar', '2008-05-30', 'Jl. Toddopuli No. 167', '082890123456', 'qori.azhar@example.com'),
('Rama Wijaya', '0345678927', 'Gowa', '2008-06-05', 'Jl. Racing Center No. 178', '082901234567', 'rama.wijaya@example.com'),
('Siti Nurhaliza', '0345678928', 'Maros', '2008-07-10', 'Jl. Kakatua No. 189', '083012345678', 'siti.nurhaliza@example.com'),
('Taufik Hidayat', '0345678929', 'Takalar', '2008-08-15', 'Jl. Rajawali No. 200', '083123456789', 'taufik.hidayat@example.com'),
('Umar Hidayat', '0345678930', 'Makassar', '2008-09-20', 'Jl. Gunung Salahutu No. 211', '083234567890', 'umar.hidayat@example.com'),
('Vina Melati', '0345678931', 'Parepare', '2008-10-25', 'Jl. Somba Opu No. 222', '083345678901', 'vina.melati@example.com'),
('Wawan Prasetyo', '0345678932', 'Bone', '2008-11-30', 'Jl. Cendrawasih No. 233', '083456789012', 'wawan.prasetyo@example.com'),
('Xavier Nugraha', '0345678933', 'Bulukumba', '2008-12-05', 'Jl. Merpati No. 244', '083567890123', 'xavier.nugraha@example.com'),
('Yuli Andriani', '0345678934', 'Makassar', '2009-01-10', 'Jl. Kemerdekaan No. 255', '083678901234', 'yuli.andriani@example.com'),
('Zainal Abidin', '0345678935', 'Gowa', '2009-02-15', 'Jl. Nusantara No. 266', '083789012345', 'zainal.abidin@example.com'),
('Adi Saputra', '0345678936', 'Maros', '2009-03-20', 'Jl. Veteran Utara No. 277', '083890123456', 'adi.saputra@example.com'),
('Bambang Hermanto', '0345678937', 'Takalar', '2009-04-25', 'Jl. Gunung Bawakaraeng No. 288', '083901234567', 'bambang.hermanto@example.com'),
('Cindy Marlina', '0345678938', 'Makassar', '2009-05-30', 'Jl. Ratulangi No. 299', '084012345678', 'cindy.marlina@example.com'),
('Doni Saputra', '0345678939', 'Parepare', '2009-06-05', 'Jl. Jenderal Sudirman No. 310', '084123456789', 'doni.saputra@example.com'),
('Elisa Puspita', '0345678940', 'Bone', '2009-07-10', 'Jl. Tamalate No. 321', '084234567890', 'elisa.puspita@example.com'),
('Farhan Maulana', '0345678941', 'Bulukumba', '2009-08-15', 'Jl. Bontolempangan No. 332', '084345678901', 'farhan.maulana@example.com'),
('Gilang Pratama', '0345678942', 'Makassar', '2009-09-20', 'Jl. Bandang No. 343', '084456789012', 'gilang.pratama@example.com'),
('Hana Salsabila', '0345678943', 'Gowa', '2009-10-25', 'Jl. Bawakaraeng No. 354', '084567890123', 'hana.salsabila@example.com'),
('Ilham Ramadhan', '0345678944', 'Maros', '2009-11-30', 'Jl. Monginsidi No. 365', '084678901234', 'ilham.ramadhan@example.com');

INSERT INTO `sekolah` (`nama_sekolah`, `alamat`, `jenjang`) VALUES
('SMA Negeri 1 Makassar', 'Jl. Sultan Alauddin No. 1, Makassar', 'SMA'),
('SMA Negeri 2 Makassar', 'Jl. AP Pettarani No. 10, Makassar', 'SMA'),
('SMA Negeri 3 Makassar', 'Jl. Urip Sumoharjo No. 20, Makassar', 'SMA'),
('SMA Negeri 4 Makassar', 'Jl. Perintis Kemerdekaan No. 30, Makassar', 'SMA'),
('SMA Negeri 5 Makassar', 'Jl. Veteran Selatan No. 40, Makassar', 'SMA'),
('SMA Negeri 6 Makassar', 'Jl. Andi Pangerang Pettarani No. 50, Makassar', 'SMA'),
('SMA Negeri 1 Gowa', 'Jl. Sultan Hasanuddin No. 5, Gowa', 'SMA'),
('SMA Negeri 2 Gowa', 'Jl. Baso Daeng Patompo No. 15, Gowa', 'SMA'),
('SMA Negeri 1 Maros', 'Jl. Dr. Ratulangi No. 25, Maros', 'SMA'),
('SMA Negeri 1 Takalar', 'Jl. Jenderal Sudirman No. 35, Takalar', 'SMA'),
('SMK Negeri 1 Makassar', 'Jl. Sultan Alauddin No. 60, Makassar', 'SMK'),
('SMK Negeri 2 Makassar', 'Jl. Pettarani No. 70, Makassar', 'SMK'),
('SMK Negeri 3 Makassar', 'Jl. Perintis Kemerdekaan No. 80, Makassar', 'SMK'),
('SMK Negeri 4 Makassar', 'Jl. Urip Sumoharjo No. 90, Makassar', 'SMK'),
('SMK Negeri 5 Makassar', 'Jl. Veteran Utara No. 100, Makassar', 'SMK'),
('SMK Negeri 6 Makassar', 'Jl. Monginsidi No. 110, Makassar', 'SMK'),
('SMK Negeri 1 Gowa', 'Jl. Sultan Hasanuddin No. 120, Gowa', 'SMK'),
('SMK Negeri 2 Gowa', 'Jl. Andi Pangerang Pettarani No. 130, Gowa', 'SMK'),
('SMK Negeri 1 Maros', 'Jl. Jenderal Sudirman No. 140, Maros', 'SMK'),
('SMK Negeri 1 Takalar', 'Jl. Dr. Ratulangi No. 150, Takalar', 'SMK');

INSERT INTO `jalurpendaftaran` (`nama_jalur`, `jenjang`) VALUES
('UTBK SMA', 'SMA'),
('UTBK SMK', 'SMK'),
('Prestasi Akademik SMA', 'SMA'),
('Prestasi Akademik SMK', 'SMK'),
('Prestasi Non Akademik SMA', 'SMA'),
('Prestasi Non Akademik SMK', 'SMK'),
('Zonasi SMA', 'SMA'),
('Zonasi SMK', 'SMK');

INSERT INTO `pendaftaran` (`nisn`, `id_sekolah`, `id_jalur`, `tanggal_daftar`) VALUES
('0345678910', 1, 9, '2025-03-01'),
('0345678911', 2, 10, '2025-03-02'),
('0345678912', 3, 11, '2025-03-03'),
('0345678913', 4, 12, '2025-03-04'),
('0345678914', 5, 13, '2025-03-05'),
('0345678915', 6, 14, '2025-03-06'),
('0345678916', 7, 15, '2025-03-07'),
('0345678917', 8, 16, '2025-03-08'),
('0345678918', 9, 9, '2025-03-09'),
('0345678919', 10, 10, '2025-03-10'),
('0345678920', 11, 11, '2025-03-11'),
('0345678921', 12, 12, '2025-03-12'),
('0345678922', 13, 13, '2025-03-13'),
('0345678923', 14, 14, '2025-03-14'),
('0345678924', 15, 15, '2025-03-15'),
('0345678925', 16, 16, '2025-03-16'),
('0345678926', 17, 9, '2025-03-17'),
('0345678927', 18, 10, '2025-03-18'),
('0345678928', 19, 11, '2025-03-19'),
('0345678929', 20, 12, '2025-03-20'),
('0345678930', 1, 13, '2025-03-21'),
('0345678931', 2, 14, '2025-03-22'),
('0345678932', 3, 15, '2025-03-23'),
('0345678933', 4, 16, '2025-03-24'),
('0345678934', 5, 9, '2025-03-25'),
('0345678935', 6, 10, '2025-03-26'),
('0345678936', 7, 11, '2025-03-27'),
('0345678937', 8, 12, '2025-03-28'),
('0345678938', 9, 13, '2025-03-29'),
('0345678939', 10, 14, '2025-03-30'),
('0345678940', 11, 15, '2025-03-31'),
('0345678941', 12, 16, '2025-04-01'),
('0345678942', 13, 9, '2025-04-02'),
('0345678943', 14, 10, '2025-04-03'),
('0345678944', 15, 11, '2025-04-04');

INSERT INTO `pengumuman` (`id_pendaftaran`, `status_kelulusan`, `tanggal_pengumuman`) VALUES
(107, 'Lulus', '2025-04-05'),
(108, 'Tidak Lulus', '2025-04-06'),
(109, 'Lulus', '2025-04-07'),
(110, 'Lulus', '2025-04-08'),
(111, 'Tidak Lulus', '2025-04-09'),
(112, 'Lulus', '2025-04-10'),
(113, 'Lulus', '2025-04-11'),
(114, 'Tidak Lulus', '2025-04-12'),
(115, 'Lulus', '2025-04-13'),
(116, 'Lulus', '2025-04-14'),
(117, 'Tidak Lulus', '2025-04-15'),
(118, 'Lulus', '2025-04-16'),
(119, 'Lulus', '2025-04-17'),
(120, 'Tidak Lulus', '2025-04-18'),
(121, 'Lulus', '2025-04-19'),
(122, 'Lulus', '2025-04-20'),
(123, 'Tidak Lulus', '2025-04-21'),
(124, 'Lulus', '2025-04-22'),
(125, 'Lulus', '2025-04-23'),
(126, 'Tidak Lulus', '2025-04-24'),
(127, 'Lulus', '2025-04-25'),
(128, 'Lulus', '2025-04-26'),
(129, 'Tidak Lulus', '2025-04-27'),
(130, 'Lulus', '2025-04-28'),
(131, 'Lulus', '2025-04-29'),
(132, 'Tidak Lulus', '2025-04-30'),
(133, 'Lulus', '2025-05-01'),
(134, 'Lulus', '2025-05-02'),
(135, 'Tidak Lulus', '2025-05-03'),
(136, 'Lulus', '2025-05-04'),
(137, 'Lulus', '2025-05-05'),
(138, 'Tidak Lulus', '2025-05-06'),
(139, 'Lulus', '2025-05-07'),
(140, 'Lulus', '2025-05-08'),
(141, 'Tidak Lulus', '2025-05-09');

INSERT INTO `daftarulang` (`id_pengumuman`, `status_daftar_ulang`, `tanggal_daftar_ulang`) VALUES
(1, 'Selesai', '2025-03-01'),
(2, 'Belum Selesai', NULL),
(3, 'Selesai', '2025-03-03'),
(4, 'Selesai', '2025-03-04'),
(5, 'Belum Selesai', NULL),
(6, 'Selesai', '2025-03-06'),
(7, 'Selesai', '2025-03-07'),
(8, 'Belum Selesai', NULL),
(9, 'Selesai', '2025-03-09'),
(10, 'Belum Selesai', NULL),
(11, 'Selesai', '2025-03-11'),
(12, 'Selesai', '2025-03-12'),
(13, 'Belum Selesai', NULL),
(14, 'Selesai', '2025-03-14'),
(15, 'Selesai', '2025-03-15'),
(16, 'Belum Selesai', NULL),
(17, 'Selesai', '2025-03-17'),
(18, 'Belum Selesai', NULL),
(19, 'Selesai', '2025-03-19'),
(20, 'Belum Selesai', NULL),
(21, 'Selesai', '2025-03-21'),
(22, 'Selesai', '2025-03-22'),
(23, 'Belum Selesai', NULL),
(24, 'Selesai', '2025-03-24'),
(25, 'Selesai', '2025-03-25'),
(26, 'Belum Selesai', NULL),
(27, 'Selesai', '2025-03-27'),
(28, 'Belum Selesai', NULL),
(29, 'Selesai', '2025-03-29'),
(30, 'Belum Selesai', NULL),
(31, 'Selesai', '2025-03-31'),
(32, 'Selesai', '2025-04-01'),
(33, 'Belum Selesai', NULL),
(34, 'Selesai', '2025-04-03'),
(35, 'Belum Selesai', NULL);

COMMIT;