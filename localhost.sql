-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2025 at 09:15 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `berita`
--
CREATE DATABASE IF NOT EXISTS `berita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `berita`;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- Database: `contoh`
--
CREATE DATABASE IF NOT EXISTS `contoh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `contoh`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_saya`
--

CREATE TABLE `tb_saya` (
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tgl` date NOT NULL,
  `nim` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_saya`
--

INSERT INTO `tb_saya` (`nama`, `tgl`, `nim`) VALUES
('dhavi', '2024-12-02', '123456');
--
-- Database: `dbcontohtrigger.ti1`
--
CREATE DATABASE IF NOT EXISTS `dbcontohtrigger.ti1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dbcontohtrigger.ti1`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `pin` varchar(6) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`pin`, `nama`, `nim`) VALUES
('112255', 'dhavi', '14523078'),
('112445', 'dhisti', '14523081');

--
-- Triggers `tbl_user`
--
DELIMITER $$
CREATE TRIGGER `generate_pin` BEFORE INSERT ON `tbl_user` FOR EACH ROW BEGIN
DECLARE newpin varchar(255);
SELECT curtime()+0 into newpin;
SET new.pin=newpin;
END
$$
DELIMITER ;
--
-- Database: `db_achmaddhavi_penjualanmotor.14523078`
--
CREATE DATABASE IF NOT EXISTS `db_achmaddhavi_penjualanmotor.14523078` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_achmaddhavi_penjualanmotor.14523078`;

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `id_motor` int NOT NULL,
  `nama_motor` varchar(50) DEFAULT NULL,
  `harga` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `motor`
--

INSERT INTO `motor` (`id_motor`, `nama_motor`, `harga`) VALUES
(1, 'Honda Beat', 17000000),
(2, 'Honda Scoopy', 20000000),
(3, 'Honda Vario', 23000000),
(4, 'Yamaha Nmax', 30000000),
(5, 'Honda CBR', 36000000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`) VALUES
(1, 'Ali'),
(2, 'Budi'),
(3, 'Maulana'),
(4, 'Yayat'),
(5, 'Hidayat');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `id_motor` int DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_motor`, `id_pelanggan`, `tanggal_transaksi`) VALUES
(1, 1, 1, '2023-12-04'),
(2, 2, 2, '2023-12-22'),
(3, 3, 3, '2024-02-13'),
(4, 4, 4, '2024-07-18'),
(5, 5, 5, '2024-12-11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewpenjualanmotor`
-- (See below for the actual view)
--
CREATE TABLE `viewpenjualanmotor` (
`harga` int
,`id_transaksi` int
,`nama_motor` varchar(50)
,`nama_pelanggan` varchar(50)
,`tanggal_transaksi` date
);

-- --------------------------------------------------------

--
-- Structure for view `viewpenjualanmotor`
--
DROP TABLE IF EXISTS `viewpenjualanmotor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewpenjualanmotor`  AS SELECT `transaksi`.`id_transaksi` AS `id_transaksi`, `motor`.`nama_motor` AS `nama_motor`, `motor`.`harga` AS `harga`, `pelanggan`.`nama_pelanggan` AS `nama_pelanggan`, `transaksi`.`tanggal_transaksi` AS `tanggal_transaksi` FROM ((`transaksi` join `motor` on((`transaksi`.`id_motor` = `motor`.`id_motor`))) join `pelanggan` on((`transaksi`.`id_pelanggan` = `pelanggan`.`id_pelanggan`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id_motor`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_motor` (`id_motor`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_motor`) REFERENCES `motor` (`id_motor`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
--
-- Database: `db_data`
--
CREATE DATABASE IF NOT EXISTS `db_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_data`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `warna` varchar(100) DEFAULT NULL,
  `kode_kategori` varchar(5) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `harga_beli` int DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  `profit` int DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('BOOO1', 'Kemeja Anak', 'Biru', 'KOO3', 'pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('BOOO2', 'Blazer Anak', 'Hitam', 'KOO4', 'pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('BOOO3', 'Rok Mono', 'Pink', 'KOO4', 'pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('BOOO4', 'Kerudung Anak', 'Coklat', 'KOO4', 'pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('BOOO5', 'Kerudung Dewasa', 'Coklat', 'KOO2', 'pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('BOOO6', 'Kaos Oblong', 'Putih', 'KOO1', 'pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('BOOO7', 'Kaos Kerah', 'Merah', 'KOO1', 'pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('BOOO8', 'Celana Pendek Anak ', 'Biru', 'KOO3', 'pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('BOOO9', 'Celana Panjang Jeans', 'Biru', 'KOO1', 'pcs', 25, 130000, 250000, 120000, '2022-09-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('KOO1', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('KOO2', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('KOO3', 'Baju Anak Laki-laki', '2022-09-15', 1),
('KOO4', 'Baju Anak Perempuan', '2022-09-15', 1),
('KOO5', 'Topi Dewasa', '2022-09-15', 1),
('KOO6', 'Produk Kebersihan', '2022-10-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telepon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', 'Kunigan', '08461773345', 'kunyuk960@gmail.com', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '0813121212', NULL, '2022-09-15', 3),
(3, 'Wati', 'Plered', '084545454545', NULL, '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'BOOO1', 5, 3),
(7, '2021-09-07', 'BOOO1', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'Kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra ', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  `id_pelanngan` int DEFAULT NULL,
  `bayar` int DEFAULT NULL,
  `kembali` int DEFAULT NULL,
  `diskon` int DEFAULT NULL,
  `potongan` int DEFAULT NULL,
  `total_b` int DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanngan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('pj-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('pj-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('pj-00000003', '2021-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'pj-00000001', 'BOOO1', 2, 50000),
(79, 'pj-00000001', 'BOOO8', 2, 300000),
(80, 'pj-00000002', 'BOOO1', 2, 50000),
(81, 'pj-00000002', 'BOOO2', 1, 23000),
(82, 'pj-00000003', 'BOOO1', 2, 50000),
(83, 'pj-00000003', 'BOOO2', 1, 23000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@email.com', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `id_pelanngan` (`id_pelanngan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `tb_kategori_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_pelanngan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Database: `db_login`
--
CREATE DATABASE IF NOT EXISTS `db_login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_login`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- Database: `db_perpus`
--
CREATE DATABASE IF NOT EXISTS `db_perpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_perpus`;
--
-- Database: `db_praktikdba_14523002_adrianoktaviano.p`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523002_adrianoktaviano.p` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523002_adrianoktaviano.p`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(225) DEFAULT NULL,
  `warna` varchar(100) DEFAULT NULL,
  `kode_kategori` varchar(50) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `harga_beli` int DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  `profit` int DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja anak', 'Biru', 'KAT003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'KAT003', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'KAT002', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'KAT004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'KAT002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos oblong', 'Putih', 'KAT001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'KAT001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'KAT003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'KAT001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(50) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('KAT001', 'baju dewasa laki-laki', '2024-09-30', 1),
('KAT002', 'baju dewasa perempuan', '2024-09-30', 1),
('KAT003', 'baju anak laki-laki', '2024-09-30', 2),
('KAT004', 'baju anak perempuan', '2024-09-30', 2),
('KAT005', 'topi dewasa', '2024-09-30', 3),
('KAT006', 'Produk kebersihan', '2024-09-30', 3),
('KAT007', 'Testing', '2024-09-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telepon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '0813212121212', '', '2022-09-15', 3),
(3, 'wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2021-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `foto` varchar(225) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'Admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'admin', 'candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `bayar` int DEFAULT NULL,
  `Kembali` int DEFAULT NULL,
  `Diskon` float DEFAULT NULL,
  `Potongan` int DEFAULT NULL,
  `total_b` int DEFAULT NULL,
  `Pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `Kembali`, `Diskon`, `Potongan`, `total_b`, `Pengguna`) VALUES
('PJ00000001', '2021-12-04', 2, 350000, 0, 1.2, 4000, 350000, 3),
('PJ00000002', '2021-12-04', 2, 80000, 5000, 5.6, 4000, 75000, 3),
('PJ00000003', '2021-09-15', 3, 80000, 5000, 5.6, 4000, 75000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ00000001', 'B0001', 2, 54000),
(79, 'PJ00000001', 'B0008', 2, 300000),
(80, 'PJ00000002', 'B0001', 2, 54000),
(81, 'PJ00000002', 'B0002', 1, 25000),
(82, 'PJ00000003', 'B0001', 2, 54000),
(83, 'PJ00000003', 'B0002', 1, 25000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_as_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view1_as_14523002_adrianoktaviano.p` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(225)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_sum_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view2_sum_14523002_adrianoktaviano.p` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_count_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view3_count_14523002_adrianoktaviano.p` (
`jumlahdata` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_avg_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view4_avg_14523002_adrianoktaviano.p` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_max_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view5_max_14523002_adrianoktaviano.p` (
`hargabelitertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_min_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view6_min_14523002_adrianoktaviano.p` (
`hargabeliterendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_maxminavg_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view7_maxminavg_14523002_adrianoktaviano.p` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_agregat_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view8_agregat_14523002_adrianoktaviano.p` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_distinct_14523002_adrianoktaviano.p`
-- (See below for the actual view)
--
CREATE TABLE `view9_distinct_14523002_adrianoktaviano.p` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `view1_as_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view1_as_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_as_14523002_adrianoktaviano.p`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_sum_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view2_sum_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_sum_14523002_adrianoktaviano.p`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_count_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view3_count_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_count_14523002_adrianoktaviano.p`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `jumlahdata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_avg_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view4_avg_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_avg_14523002_adrianoktaviano.p`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_max_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view5_max_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_max_14523002_adrianoktaviano.p`  AS SELECT max(`tb_barang`.`harga_beli`) AS `hargabelitertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_min_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view6_min_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_min_14523002_adrianoktaviano.p`  AS SELECT min(`tb_barang`.`harga_beli`) AS `hargabeliterendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_maxminavg_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view7_maxminavg_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_maxminavg_14523002_adrianoktaviano.p`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_agregat_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view8_agregat_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_agregat_14523002_adrianoktaviano.p`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_distinct_14523002_adrianoktaviano.p`
--
DROP TABLE IF EXISTS `view9_distinct_14523002_adrianoktaviano.p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_distinct_14523002_adrianoktaviano.p`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`);
--
-- Database: `db_praktikdba_14523010_rifkiadityanugroho`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523010_rifkiadityanugroho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523010_rifkiadityanugroho`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `profit` int NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja Anak', 'Biru', 'K003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'K004', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'K004', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'K004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'K002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos Oblong', 'Putih', 'K001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'K001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'K003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'K001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1),
('B0010', 'testing', 'Merah', 'K003', 'Pcs', 10, 10000, 15000, 5000, '2023-10-30', 3);

--
-- Triggers `tb_barang`
--
DELIMITER $$
CREATE TRIGGER `historyhapusbarang` BEFORE DELETE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyhapusbarang
    set kode_barang_dihapus = OLD.kode_barang,
    nama_barang=old.nama_barang,
    waktu = NOW(); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `historyubahharga` BEFORE UPDATE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyubahharga
    set kode_barang = OLD.kode_barang,
    harga_jual_lama=old.harga_jual,
    harga_jual_baru=new.harga_jual,
    waktu = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyhapusbarang`
--

CREATE TABLE `tb_historyhapusbarang` (
  `id` int NOT NULL,
  `kode_barang_dihapus` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyhapusbarang`
--

INSERT INTO `tb_historyhapusbarang` (`id`, `kode_barang_dihapus`, `nama_barang`, `waktu`) VALUES
(1, 'B0011', 'Handuk Mandi', '2022-11-22'),
(2, 'B0010', 'Baju Kemeja ', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyubahharga`
--

CREATE TABLE `tb_historyubahharga` (
  `id` int NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `harga_jual_lama` int NOT NULL,
  `harga_jual_baru` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyubahharga`
--

INSERT INTO `tb_historyubahharga` (`id`, `kode_barang`, `harga_jual_lama`, `harga_jual_baru`, `waktu`) VALUES
(1, 'B0001', 25000, 27000, '2022-11-22'),
(3, 'B0002', 23000, 25000, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('K001', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('K002', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('K003', 'Baju Anak Laki-Laki', '2022-09-15', 1),
('K004', 'Baju Anak Perempuan', '2022-09-15', 1),
('K005', 'Topi Dewasa', '2022-09-15', 1),
('K006', 'Produk Kebersihan', '2022-10-07', 1),
('K007', 'testing', '2023-06-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telpon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '081312121212', '', '2022-09-15', 3),
(3, 'Wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2022-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL,
  `diskon` int NOT NULL,
  `potongan` int NOT NULL,
  `total_b` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('PJ-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('PJ-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('PJ-00000003', '2022-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ-00000001', 'B0001', 2, 50000),
(79, 'PJ-00000001', 'B0008', 2, 300000),
(80, 'PJ-00000002', 'B0001', 2, 50000),
(81, 'PJ-00000002', 'B0002', 1, 23000),
(82, 'PJ-00000003', 'B0001', 2, 50000),
(83, 'PJ-00000003', 'B0002', 1, 23000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view1_14523010_rifkiaditya` (
`(harga_jual*stok)` bigint
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view2_14523010_rifkiaditya` (
`(harga_jual * stok)` bigint
,`(harga_jual * stok) * 0.1` decimal(22,1)
,`(harga_jual *stok) * (1 - 0.1)` decimal(23,1)
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view3_14523010_rifkiaditya` (
`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view4_14523010_rifkiaditya` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view5_14523010_rifkiaditya` (
`TotalModal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view6_14523010_rifkiaditya` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view7_14523010_rifkiaditya` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view8_14523010_rifkiaditya` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view9_14523010_rifkiaditya` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view10_14523010_rifkiaditya` (
`HargaBeliTertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view11_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view11_14523010_rifkiaditya` (
`HargaBeliTerendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view12_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view12_14523010_rifkiaditya` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view13_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view13_14523010_rifkiaditya` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view14_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view14_14523010_rifkiaditya` (
`kode_barang` varchar(50)
,`nama_barang` varchar(255)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view15_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view15_14523010_rifkiaditya` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view16_14523010_rifkiaditya`
-- (See below for the actual view)
--
CREATE TABLE `view16_14523010_rifkiaditya` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barangkategori`
-- (See below for the actual view)
--
CREATE TABLE `view_barangkategori` (
`harga_beli` int
,`nama` varchar(100)
,`nama_barang` varchar(255)
,`nama_kategori` varchar(50)
,`stok` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view1_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_14523010_rifkiaditya`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual*stok)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view2_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_14523010_rifkiaditya`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual * stok)`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `(harga_jual * stok) * 0.1`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `(harga_jual *stok) * (1 - 0.1)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view3_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_14523010_rifkiaditya`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view4_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_14523010_rifkiaditya`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view5_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_14523010_rifkiaditya`  AS SELECT sum(`tb_barang`.`harga_beli`) AS `TotalModal` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view6_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_14523010_rifkiaditya`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view7_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_14523010_rifkiaditya`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `JumlahData` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view8_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_14523010_rifkiaditya`  AS SELECT count(`tb_barang`.`kode_kategori`) AS `JumlahData` FROM `tb_barang` WHERE (`tb_barang`.`kode_kategori` = 'k001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view9_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_14523010_rifkiaditya`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view10_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view10_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10_14523010_rifkiaditya`  AS SELECT max(`tb_barang`.`harga_beli`) AS `HargaBeliTertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view11_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view11_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view11_14523010_rifkiaditya`  AS SELECT min(`tb_barang`.`harga_beli`) AS `HargaBeliTerendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view12_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view12_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view12_14523010_rifkiaditya`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view13_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view13_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view13_14523010_rifkiaditya`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view14_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view14_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view14_14523010_rifkiaditya`  AS SELECT `tb_penjualan_detail`.`kode_barang` AS `kode_barang`, `tb_barang`.`nama_barang` AS `nama_barang`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM (`tb_penjualan_detail` join `tb_barang`) WHERE (`tb_penjualan_detail`.`kode_barang` = `tb_barang`.`kode_barang`) GROUP BY `tb_penjualan_detail`.`kode_barang``kode_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view15_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view15_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view15_14523010_rifkiaditya`  AS SELECT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view16_14523010_rifkiaditya`
--
DROP TABLE IF EXISTS `view16_14523010_rifkiaditya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view16_14523010_rifkiaditya`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_barangkategori`
--
DROP TABLE IF EXISTS `view_barangkategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barangkategori`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, `tb_barang`.`harga_beli` AS `harga_beli`, `tb_kategori`.`nama_kategori` AS `nama_kategori`, `tb_barang`.`stok` AS `stok`, `tb_pengguna`.`nama` AS `nama` FROM ((`tb_barang` join `tb_kategori`) join `tb_pengguna`) WHERE ((`tb_barang`.`kode_kategori` = `tb_kategori`.`kode_kategori`) AND (`tb_barang`.`pengguna` = `tb_pengguna`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `fkuser1` (`pengguna`);

--
-- Indexes for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `fkkategori1` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `pengguna` (`pengguna`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `kode_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`),
  ADD CONSTRAINT `fkuser1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `fkkategori1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);
--
-- Database: `db_praktikdba_14523015_mzainalidris`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523015_mzainalidris` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523015_mzainalidris`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(225) DEFAULT NULL,
  `warna` varchar(100) DEFAULT NULL,
  `kode_kategori` varchar(50) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `harga_beli` int DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  `profit` int DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja anak', 'Biru', 'KAT003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'KAT003', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'KAT002', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'KAT004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'KAT002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos oblong', 'Putih', 'KAT001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'KAT001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'KAT003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'KAT001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(50) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('KAT001', 'baju dewasa laki-laki', '2024-09-30', 1),
('KAT002', 'baju dewasa perempuan', '2024-09-30', 1),
('KAT003', 'baju anak laki-laki', '2024-09-30', 2),
('KAT004', 'baju anak perempuan', '2024-09-30', 2),
('KAT005', 'topi dewasa', '2024-09-30', 3),
('KAT006', 'Produk kebersihan', '2024-09-30', 3),
('KAT007', 'Testing', '2024-09-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telepon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '0813212121212', '', '2022-09-15', 3),
(3, 'wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2021-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `foto` varchar(225) DEFAULT NULL,
  `tgl_input` date DEFAULT NULL,
  `pengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'Admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'admin', 'candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `bayar` int DEFAULT NULL,
  `Kembali` int DEFAULT NULL,
  `Diskon` float DEFAULT NULL,
  `Potongan` int DEFAULT NULL,
  `total_b` int DEFAULT NULL,
  `Pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `Kembali`, `Diskon`, `Potongan`, `total_b`, `Pengguna`) VALUES
('PJ00000001', '2021-12-04', 2, 350000, 0, 1.2, 4000, 350000, 3),
('PJ00000002', '2021-12-04', 2, 80000, 5000, 5.6, 4000, 75000, 3),
('PJ00000003', '2021-09-15', 3, 80000, 5000, 5.6, 4000, 75000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ00000001', 'B0001', 2, 54000),
(79, 'PJ00000001', 'B0008', 2, 300000),
(80, 'PJ00000002', 'B0001', 2, 54000),
(81, 'PJ00000002', 'B0002', 1, 25000),
(82, 'PJ00000003', 'B0001', 2, 54000),
(83, 'PJ00000003', 'B0002', 1, 25000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_as_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view1_as_14523015_mzainalidris` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(225)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_sum_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view2_sum_14523015_mzainalidris` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_count_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view3_count_14523015_mzainalidris` (
`jumlahdata` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_avg_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view4_avg_14523015_mzainalidris` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_max_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view5_max_14523015_mzainalidris` (
`hargabelitertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_min_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view6_min_14523015_mzainalidris` (
`hargabeliterendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_maxminavg_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view7_maxminavg_14523015_mzainalidris` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_agregat_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view8_agregat_14523015_mzainalidris` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_distinct_14523015_mzainalidris`
-- (See below for the actual view)
--
CREATE TABLE `view9_distinct_14523015_mzainalidris` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `view1_as_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view1_as_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_as_14523015_mzainalidris`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_sum_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view2_sum_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_sum_14523015_mzainalidris`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_count_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view3_count_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_count_14523015_mzainalidris`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `jumlahdata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_avg_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view4_avg_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_avg_14523015_mzainalidris`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_max_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view5_max_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_max_14523015_mzainalidris`  AS SELECT max(`tb_barang`.`harga_beli`) AS `hargabelitertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_min_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view6_min_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_min_14523015_mzainalidris`  AS SELECT min(`tb_barang`.`harga_beli`) AS `hargabeliterendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_maxminavg_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view7_maxminavg_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_maxminavg_14523015_mzainalidris`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_agregat_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view8_agregat_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_agregat_14523015_mzainalidris`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_distinct_14523015_mzainalidris`
--
DROP TABLE IF EXISTS `view9_distinct_14523015_mzainalidris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_distinct_14523015_mzainalidris`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`);
--
-- Database: `db_praktikdba_14523022_maulanaabdulmalik`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523022_maulanaabdulmalik` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523022_maulanaabdulmalik`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `profit` int NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja Anak', 'Biru', 'K003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'K004', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'K004', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'K004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'K002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos Oblong', 'Putih', 'K001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'K001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'K003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'K001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1),
('B0010', 'testing', 'Merah', 'K003', 'Pcs', 10, 10000, 15000, 5000, '2023-10-30', 3);

--
-- Triggers `tb_barang`
--
DELIMITER $$
CREATE TRIGGER `historyhapusbarang` BEFORE DELETE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyhapusbarang
    set kode_barang_dihapus = OLD.kode_barang,
    nama_barang=old.nama_barang,
    waktu = NOW(); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `historyubahharga` BEFORE UPDATE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyubahharga
    set kode_barang = OLD.kode_barang,
    harga_jual_lama=old.harga_jual,
    harga_jual_baru=new.harga_jual,
    waktu = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyhapusbarang`
--

CREATE TABLE `tb_historyhapusbarang` (
  `id` int NOT NULL,
  `kode_barang_dihapus` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyhapusbarang`
--

INSERT INTO `tb_historyhapusbarang` (`id`, `kode_barang_dihapus`, `nama_barang`, `waktu`) VALUES
(1, 'B0011', 'Handuk Mandi', '2022-11-22'),
(2, 'B0010', 'Baju Kemeja ', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyubahharga`
--

CREATE TABLE `tb_historyubahharga` (
  `id` int NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `harga_jual_lama` int NOT NULL,
  `harga_jual_baru` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyubahharga`
--

INSERT INTO `tb_historyubahharga` (`id`, `kode_barang`, `harga_jual_lama`, `harga_jual_baru`, `waktu`) VALUES
(1, 'B0001', 25000, 27000, '2022-11-22'),
(3, 'B0002', 23000, 25000, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('K001', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('K002', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('K003', 'Baju Anak Laki-Laki', '2022-09-15', 1),
('K004', 'Baju Anak Perempuan', '2022-09-15', 1),
('K005', 'Topi Dewasa', '2022-09-15', 1),
('K006', 'Produk Kebersihan', '2022-10-07', 1),
('K007', 'testing', '2023-06-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telpon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '081312121212', '', '2022-09-15', 3),
(3, 'Wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2022-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL,
  `diskon` int NOT NULL,
  `potongan` int NOT NULL,
  `total_b` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('PJ-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('PJ-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('PJ-00000003', '2022-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ-00000001', 'B0001', 2, 50000),
(79, 'PJ-00000001', 'B0008', 2, 300000),
(80, 'PJ-00000002', 'B0001', 2, 50000),
(81, 'PJ-00000002', 'B0002', 1, 23000),
(82, 'PJ-00000003', 'B0001', 2, 50000),
(83, 'PJ-00000003', 'B0002', 1, 23000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view1_14523022_maulana` (
`(harga_jual*stok)` bigint
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view2_14523022_maulana` (
`(harga_jual * stok)` bigint
,`(harga_jual * stok) * 0.1` decimal(22,1)
,`(harga_jual *stok) * (1 - 0.1)` decimal(23,1)
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view3_14523022_maulana` (
`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view4_14523022_maulana` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view5_14523022_maulana` (
`TotalModal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view6_14523022_maulana` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view7_14523022_maulana` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view8_14523022_maulana` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view9_14523022_maulana` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view10_14523022_maulana` (
`HargaBeliTertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view11_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view11_14523022_maulana` (
`HargaBeliTerendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view12_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view12_14523022_maulana` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view13_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view13_14523022_maulana` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view14_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view14_14523022_maulana` (
`kode_barang` varchar(50)
,`nama_barang` varchar(255)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view15_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view15_14523022_maulana` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view16_14523022_maulana`
-- (See below for the actual view)
--
CREATE TABLE `view16_14523022_maulana` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barangkategori`
-- (See below for the actual view)
--
CREATE TABLE `view_barangkategori` (
`harga_beli` int
,`nama` varchar(100)
,`nama_barang` varchar(255)
,`nama_kategori` varchar(50)
,`stok` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1_14523022_maulana`
--
DROP TABLE IF EXISTS `view1_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_14523022_maulana`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual*stok)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_14523022_maulana`
--
DROP TABLE IF EXISTS `view2_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_14523022_maulana`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual * stok)`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `(harga_jual * stok) * 0.1`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `(harga_jual *stok) * (1 - 0.1)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_14523022_maulana`
--
DROP TABLE IF EXISTS `view3_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_14523022_maulana`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_14523022_maulana`
--
DROP TABLE IF EXISTS `view4_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_14523022_maulana`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_14523022_maulana`
--
DROP TABLE IF EXISTS `view5_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_14523022_maulana`  AS SELECT sum(`tb_barang`.`harga_beli`) AS `TotalModal` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_14523022_maulana`
--
DROP TABLE IF EXISTS `view6_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_14523022_maulana`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_14523022_maulana`
--
DROP TABLE IF EXISTS `view7_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_14523022_maulana`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `JumlahData` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_14523022_maulana`
--
DROP TABLE IF EXISTS `view8_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_14523022_maulana`  AS SELECT count(`tb_barang`.`kode_kategori`) AS `JumlahData` FROM `tb_barang` WHERE (`tb_barang`.`kode_kategori` = 'k001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_14523022_maulana`
--
DROP TABLE IF EXISTS `view9_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_14523022_maulana`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view10_14523022_maulana`
--
DROP TABLE IF EXISTS `view10_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10_14523022_maulana`  AS SELECT max(`tb_barang`.`harga_beli`) AS `HargaBeliTertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view11_14523022_maulana`
--
DROP TABLE IF EXISTS `view11_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view11_14523022_maulana`  AS SELECT min(`tb_barang`.`harga_beli`) AS `HargaBeliTerendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view12_14523022_maulana`
--
DROP TABLE IF EXISTS `view12_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view12_14523022_maulana`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view13_14523022_maulana`
--
DROP TABLE IF EXISTS `view13_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view13_14523022_maulana`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view14_14523022_maulana`
--
DROP TABLE IF EXISTS `view14_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view14_14523022_maulana`  AS SELECT `tb_penjualan_detail`.`kode_barang` AS `kode_barang`, `tb_barang`.`nama_barang` AS `nama_barang`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM (`tb_penjualan_detail` join `tb_barang`) WHERE (`tb_penjualan_detail`.`kode_barang` = `tb_barang`.`kode_barang`) GROUP BY `tb_penjualan_detail`.`kode_barang``kode_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view15_14523022_maulana`
--
DROP TABLE IF EXISTS `view15_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view15_14523022_maulana`  AS SELECT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view16_14523022_maulana`
--
DROP TABLE IF EXISTS `view16_14523022_maulana`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view16_14523022_maulana`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_barangkategori`
--
DROP TABLE IF EXISTS `view_barangkategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barangkategori`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, `tb_barang`.`harga_beli` AS `harga_beli`, `tb_kategori`.`nama_kategori` AS `nama_kategori`, `tb_barang`.`stok` AS `stok`, `tb_pengguna`.`nama` AS `nama` FROM ((`tb_barang` join `tb_kategori`) join `tb_pengguna`) WHERE ((`tb_barang`.`kode_kategori` = `tb_kategori`.`kode_kategori`) AND (`tb_barang`.`pengguna` = `tb_pengguna`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `fkuser1` (`pengguna`);

--
-- Indexes for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `fkkategori1` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `pengguna` (`pengguna`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `kode_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`),
  ADD CONSTRAINT `fkuser1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `fkkategori1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);
--
-- Database: `db_praktikdba_14523078_achmaddhavi`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523078_achmaddhavi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523078_achmaddhavi`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `profit` int NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja Anak', 'Biru', 'K003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'K004', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'K004', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'K004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'K002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos Oblong', 'Putih', 'K001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'K001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'K003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'K001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1),
('B0010', 'testing', 'Merah', 'K003', 'Pcs', 10, 10000, 15000, 5000, '2023-10-30', 3);

--
-- Triggers `tb_barang`
--
DELIMITER $$
CREATE TRIGGER `historyhapusbarang` BEFORE DELETE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyhapusbarang
    set kode_barang_dihapus = OLD.kode_barang,
    nama_barang=old.nama_barang,
    waktu = NOW(); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `historyubahharga` BEFORE UPDATE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyubahharga
    set kode_barang = OLD.kode_barang,
    harga_jual_lama=old.harga_jual,
    harga_jual_baru=new.harga_jual,
    waktu = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyhapusbarang`
--

CREATE TABLE `tb_historyhapusbarang` (
  `id` int NOT NULL,
  `kode_barang_dihapus` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyhapusbarang`
--

INSERT INTO `tb_historyhapusbarang` (`id`, `kode_barang_dihapus`, `nama_barang`, `waktu`) VALUES
(1, 'B0011', 'Handuk Mandi', '2022-11-22'),
(2, 'B0010', 'Baju Kemeja ', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyubahharga`
--

CREATE TABLE `tb_historyubahharga` (
  `id` int NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `harga_jual_lama` int NOT NULL,
  `harga_jual_baru` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyubahharga`
--

INSERT INTO `tb_historyubahharga` (`id`, `kode_barang`, `harga_jual_lama`, `harga_jual_baru`, `waktu`) VALUES
(1, 'B0001', 25000, 27000, '2022-11-22'),
(3, 'B0002', 23000, 25000, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('K001', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('K002', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('K003', 'Baju Anak Laki-Laki', '2022-09-15', 1),
('K004', 'Baju Anak Perempuan', '2022-09-15', 1),
('K005', 'Topi Dewasa', '2022-09-15', 1),
('K006', 'Produk Kebersihan', '2022-10-07', 1),
('K007', 'testing', '2023-06-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telpon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '081312121212', '', '2022-09-15', 3),
(3, 'Wati', 'kedawung-Cirebon', '084545454545', '', '2022-09-15', 3),
(10, 'dhavi', 'karawang', '0812345678', 'gandi@gmail.com', '2024-12-25', 3);

--
-- Triggers `tb_pelanggan`
--
DELIMITER $$
CREATE TRIGGER `Trigger_delete_pelanggan` AFTER DELETE ON `tb_pelanggan` FOR EACH ROW BEGIN
INSERT INTO tb_riwayatpelanggan
SET tglriwayat=CURRENT_DATE(),
	wakturiwayat=CURRENT_TIME(),
    kode_pelanggan=old.kode_pelanggan,
    nama_pelanggan_lama=old.nama,
    nama_pelanggan_baru='-',
    alamat_lama=old.alamat,
    alamat_baru='-',
    telpon_lama=old.telpon,
    telpon_baru='-',
    email_lama=old.email,
    email_baru='-',
    keterangan='Delete Data';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_insert_pelanggan` AFTER INSERT ON `tb_pelanggan` FOR EACH ROW BEGIN
INSERT INTO tb_riwayatpelanggan
SET tglriwayat=CURRENT_DATE(),
	wakturiwayat=CURRENT_TIME(),
    kode_pelanggan=new.kode_pelanggan,
    nama_pelanggan_lama='-',
    nama_pelanggan_baru=new.nama,
    alamat_lama='-',
    alamat_baru=new.alamat,
    telepon_lama='-',
    telepon_baru=new.telpon,
    email_lama='-',
    email_baru=new.email,
    keterangan='Insert Data Baru';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_update_pelanggan` AFTER UPDATE ON `tb_pelanggan` FOR EACH ROW BEGIN
INSERT INTO tb_riwayatpelanggan
SET tglriwayat=CURRENT_DATE(),
	wakturiwayat=CURRENT_TIME(),
    kode_pelanggan=old.kode_pelanggan,
    nama_pelanggan_lama=old.nama,
    nama_pelanggan_baru=new.nama,
    alamat_lama=old.alamat,
    alamat_baru=new.alamat,
    telepon_lama=old.telpon,
    telepon_baru=new.telpon,
    email_lama=old.email,
    email_baru=new.email,
    keterangan='Update Data';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2022-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL,
  `diskon` int NOT NULL,
  `potongan` int NOT NULL,
  `total_b` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('PJ-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('PJ-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('PJ-00000003', '2022-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ-00000001', 'B0001', 2, 50000),
(79, 'PJ-00000001', 'B0008', 2, 300000),
(80, 'PJ-00000002', 'B0001', 2, 50000),
(81, 'PJ-00000002', 'B0002', 1, 23000),
(82, 'PJ-00000003', 'B0001', 2, 50000),
(83, 'PJ-00000003', 'B0002', 1, 23000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_riwayatpelanggan`
--

CREATE TABLE `tb_riwayatpelanggan` (
  `id` int NOT NULL,
  `tglriwayat` date NOT NULL,
  `wakturiwayat` time NOT NULL,
  `kode_pelanggan` int NOT NULL,
  `nama_pelanggan_lama` varchar(50) NOT NULL,
  `nama_pelanggan_baru` varchar(50) NOT NULL,
  `alamat_lama` varchar(200) NOT NULL,
  `alamat_baru` varchar(200) NOT NULL,
  `telepon_lama` varchar(30) NOT NULL,
  `telepon_baru` varchar(30) NOT NULL,
  `email_lama` varchar(30) NOT NULL,
  `email_baru` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_riwayatpelanggan`
--

INSERT INTO `tb_riwayatpelanggan` (`id`, `tglriwayat`, `wakturiwayat`, `kode_pelanggan`, `nama_pelanggan_lama`, `nama_pelanggan_baru`, `alamat_lama`, `alamat_baru`, `telepon_lama`, `telepon_baru`, `email_lama`, `email_baru`, `keterangan`) VALUES
(1, '2024-12-30', '11:51:06', 10, '-', 'dhavi', '-', 'karawang', '-', '0812345678', '-', 'gandi@gmail.com', 'Insert Data Baru'),
(2, '2024-12-30', '12:09:29', 3, 'Wati', 'Wati', 'Plered', 'Pkedawung-cirebon', '084545454545', '084545454545', '', '', 'Update Data'),
(3, '2024-12-30', '12:09:43', 3, 'Wati', 'Wati', 'Pkedawung-cirebon', 'kedawung-Cirebon', '084545454545', '084545454545', '', '', 'Update Data');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view1_14523078_achmaddhavi` (
`(harga_jual*stok)` bigint
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view2_14523078_achmaddhavi` (
`(harga_jual * stok)` bigint
,`(harga_jual * stok) * 0.1` decimal(22,1)
,`(harga_jual *stok) * (1 - 0.1)` decimal(23,1)
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view3_14523078_achmaddhavi` (
`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view4_14523078_achmaddhavi` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view5_14523078_achmaddhavi` (
`TotalModal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view6_14523078_achmaddhavi` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view7_14523078_achmaddhavi` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view8_14523078_achmaddhavi` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view9_14523078_achmaddhavi` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view10_14523078_achmaddhavi` (
`HargaBeliTertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view11_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view11_14523078_achmaddhavi` (
`HargaBeliTerendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view12_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view12_14523078_achmaddhavi` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view13_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view13_14523078_achmaddhavi` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view14_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view14_14523078_achmaddhavi` (
`kode_barang` varchar(50)
,`nama_barang` varchar(255)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view15_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view15_14523078_achmaddhavi` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view16_14523078_achmaddhavi`
-- (See below for the actual view)
--
CREATE TABLE `view16_14523078_achmaddhavi` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barangkategori`
-- (See below for the actual view)
--
CREATE TABLE `view_barangkategori` (
`harga_beli` int
,`nama` varchar(100)
,`nama_barang` varchar(255)
,`nama_kategori` varchar(50)
,`stok` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view1_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_14523078_achmaddhavi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual*stok)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view2_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_14523078_achmaddhavi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual * stok)`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `(harga_jual * stok) * 0.1`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `(harga_jual *stok) * (1 - 0.1)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view3_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_14523078_achmaddhavi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view4_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_14523078_achmaddhavi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view5_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_14523078_achmaddhavi`  AS SELECT sum(`tb_barang`.`harga_beli`) AS `TotalModal` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view6_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_14523078_achmaddhavi`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view7_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_14523078_achmaddhavi`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `JumlahData` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view8_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_14523078_achmaddhavi`  AS SELECT count(`tb_barang`.`kode_kategori`) AS `JumlahData` FROM `tb_barang` WHERE (`tb_barang`.`kode_kategori` = 'k001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view9_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_14523078_achmaddhavi`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view10_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view10_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10_14523078_achmaddhavi`  AS SELECT max(`tb_barang`.`harga_beli`) AS `HargaBeliTertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view11_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view11_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view11_14523078_achmaddhavi`  AS SELECT min(`tb_barang`.`harga_beli`) AS `HargaBeliTerendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view12_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view12_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view12_14523078_achmaddhavi`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view13_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view13_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view13_14523078_achmaddhavi`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view14_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view14_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view14_14523078_achmaddhavi`  AS SELECT `tb_penjualan_detail`.`kode_barang` AS `kode_barang`, `tb_barang`.`nama_barang` AS `nama_barang`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM (`tb_penjualan_detail` join `tb_barang`) WHERE (`tb_penjualan_detail`.`kode_barang` = `tb_barang`.`kode_barang`) GROUP BY `tb_penjualan_detail`.`kode_barang``kode_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view15_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view15_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view15_14523078_achmaddhavi`  AS SELECT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view16_14523078_achmaddhavi`
--
DROP TABLE IF EXISTS `view16_14523078_achmaddhavi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view16_14523078_achmaddhavi`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_barangkategori`
--
DROP TABLE IF EXISTS `view_barangkategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barangkategori`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, `tb_barang`.`harga_beli` AS `harga_beli`, `tb_kategori`.`nama_kategori` AS `nama_kategori`, `tb_barang`.`stok` AS `stok`, `tb_pengguna`.`nama` AS `nama` FROM ((`tb_barang` join `tb_kategori`) join `tb_pengguna`) WHERE ((`tb_barang`.`kode_kategori` = `tb_kategori`.`kode_kategori`) AND (`tb_barang`.`pengguna` = `tb_pengguna`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `fkuser1` (`pengguna`);

--
-- Indexes for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `fkkategori1` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `pengguna` (`pengguna`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `tb_riwayatpelanggan`
--
ALTER TABLE `tb_riwayatpelanggan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `kode_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tb_riwayatpelanggan`
--
ALTER TABLE `tb_riwayatpelanggan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`),
  ADD CONSTRAINT `fkuser1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `fkkategori1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);
--
-- Database: `db_praktikdba_14523081_dhistiamaliamayazi`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523081_dhistiamaliamayazi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523081_dhistiamaliamayazi`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `profit` int NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja Anak', 'Biru', 'K003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'K004', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'K004', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'K004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'K002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos Oblong', 'Putih', 'K001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'K001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'K003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'K001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1),
('B0010', 'testing', 'Merah', 'K003', 'Pcs', 10, 10000, 15000, 5000, '2023-10-30', 3);

--
-- Triggers `tb_barang`
--
DELIMITER $$
CREATE TRIGGER `historyhapusbarang` BEFORE DELETE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyhapusbarang
    set kode_barang_dihapus = OLD.kode_barang,
    nama_barang=old.nama_barang,
    waktu = NOW(); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `historyubahharga` BEFORE UPDATE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyubahharga
    set kode_barang = OLD.kode_barang,
    harga_jual_lama=old.harga_jual,
    harga_jual_baru=new.harga_jual,
    waktu = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyhapusbarang`
--

CREATE TABLE `tb_historyhapusbarang` (
  `id` int NOT NULL,
  `kode_barang_dihapus` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyhapusbarang`
--

INSERT INTO `tb_historyhapusbarang` (`id`, `kode_barang_dihapus`, `nama_barang`, `waktu`) VALUES
(1, 'B0011', 'Handuk Mandi', '2022-11-22'),
(2, 'B0010', 'Baju Kemeja ', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyubahharga`
--

CREATE TABLE `tb_historyubahharga` (
  `id` int NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `harga_jual_lama` int NOT NULL,
  `harga_jual_baru` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyubahharga`
--

INSERT INTO `tb_historyubahharga` (`id`, `kode_barang`, `harga_jual_lama`, `harga_jual_baru`, `waktu`) VALUES
(1, 'B0001', 25000, 27000, '2022-11-22'),
(3, 'B0002', 23000, 25000, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('K001', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('K002', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('K003', 'Baju Anak Laki-Laki', '2022-09-15', 1),
('K004', 'Baju Anak Perempuan', '2022-09-15', 1),
('K005', 'Topi Dewasa', '2022-09-15', 1),
('K006', 'Produk Kebersihan', '2022-10-07', 1),
('K007', 'testing', '2023-06-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telpon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '081312121212', '', '2022-09-15', 3),
(3, 'Wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2022-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL,
  `diskon` int NOT NULL,
  `potongan` int NOT NULL,
  `total_b` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('PJ-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('PJ-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('PJ-00000003', '2022-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ-00000001', 'B0001', 2, 50000),
(79, 'PJ-00000001', 'B0008', 2, 300000),
(80, 'PJ-00000002', 'B0001', 2, 50000),
(81, 'PJ-00000002', 'B0002', 1, 23000),
(82, 'PJ-00000003', 'B0001', 2, 50000),
(83, 'PJ-00000003', 'B0002', 1, 23000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view1_14523081_dhistiamaliamayazi` (
`(harga_jual*stok)` bigint
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view2_14523081_dhistiamaliamayazi` (
`(harga_jual * stok)` bigint
,`(harga_jual * stok) * 0.1` decimal(22,1)
,`(harga_jual *stok) * (1 - 0.1)` decimal(23,1)
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view3_14523081_dhistiamaliamayazi` (
`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view4_14523081_dhistiamaliamayazi` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view5_14523081_dhistiamaliamayazi` (
`TotalModal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view6_14523081_dhistiamaliamayazi` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view7_14523081_dhistiamaliamayazi` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view8_14523081_dhistiamaliamayazi` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view9_14523081_dhistiamaliamayazi` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view10_14523081_dhistiamaliamayazi` (
`HargaBeliTertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view11_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view11_14523081_dhistiamaliamayazi` (
`HargaBeliTerendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view12_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view12_14523081_dhistiamaliamayazi` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view13_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view13_14523081_dhistiamaliamayazi` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view14_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view14_14523081_dhistiamaliamayazi` (
`kode_barang` varchar(50)
,`nama_barang` varchar(255)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view15_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view15_14523081_dhistiamaliamayazi` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view16_14523081_dhistiamaliamayazi`
-- (See below for the actual view)
--
CREATE TABLE `view16_14523081_dhistiamaliamayazi` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barangkategori`
-- (See below for the actual view)
--
CREATE TABLE `view_barangkategori` (
`harga_beli` int
,`nama` varchar(100)
,`nama_barang` varchar(255)
,`nama_kategori` varchar(50)
,`stok` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view1_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_14523081_dhistiamaliamayazi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual*stok)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view2_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_14523081_dhistiamaliamayazi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual * stok)`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `(harga_jual * stok) * 0.1`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `(harga_jual *stok) * (1 - 0.1)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view3_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_14523081_dhistiamaliamayazi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view4_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_14523081_dhistiamaliamayazi`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view5_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_14523081_dhistiamaliamayazi`  AS SELECT sum(`tb_barang`.`harga_beli`) AS `TotalModal` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view6_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_14523081_dhistiamaliamayazi`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view7_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_14523081_dhistiamaliamayazi`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `JumlahData` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view8_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_14523081_dhistiamaliamayazi`  AS SELECT count(`tb_barang`.`kode_kategori`) AS `JumlahData` FROM `tb_barang` WHERE (`tb_barang`.`kode_kategori` = 'k001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view9_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_14523081_dhistiamaliamayazi`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view10_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view10_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10_14523081_dhistiamaliamayazi`  AS SELECT max(`tb_barang`.`harga_beli`) AS `HargaBeliTertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view11_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view11_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view11_14523081_dhistiamaliamayazi`  AS SELECT min(`tb_barang`.`harga_beli`) AS `HargaBeliTerendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view12_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view12_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view12_14523081_dhistiamaliamayazi`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view13_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view13_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view13_14523081_dhistiamaliamayazi`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view14_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view14_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view14_14523081_dhistiamaliamayazi`  AS SELECT `tb_penjualan_detail`.`kode_barang` AS `kode_barang`, `tb_barang`.`nama_barang` AS `nama_barang`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM (`tb_penjualan_detail` join `tb_barang`) WHERE (`tb_penjualan_detail`.`kode_barang` = `tb_barang`.`kode_barang`) GROUP BY `tb_penjualan_detail`.`kode_barang``kode_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view15_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view15_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view15_14523081_dhistiamaliamayazi`  AS SELECT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view16_14523081_dhistiamaliamayazi`
--
DROP TABLE IF EXISTS `view16_14523081_dhistiamaliamayazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view16_14523081_dhistiamaliamayazi`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_barangkategori`
--
DROP TABLE IF EXISTS `view_barangkategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barangkategori`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, `tb_barang`.`harga_beli` AS `harga_beli`, `tb_kategori`.`nama_kategori` AS `nama_kategori`, `tb_barang`.`stok` AS `stok`, `tb_pengguna`.`nama` AS `nama` FROM ((`tb_barang` join `tb_kategori`) join `tb_pengguna`) WHERE ((`tb_barang`.`kode_kategori` = `tb_kategori`.`kode_kategori`) AND (`tb_barang`.`pengguna` = `tb_pengguna`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `fkuser1` (`pengguna`);

--
-- Indexes for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `fkkategori1` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `pengguna` (`pengguna`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `kode_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`),
  ADD CONSTRAINT `fkuser1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `fkkategori1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);
--
-- Database: `db_praktikdba_14523082_dedeahmadrivandi`
--
CREATE DATABASE IF NOT EXISTS `db_praktikdba_14523082_dedeahmadrivandi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_praktikdba_14523082_dedeahmadrivandi`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `kode_kategori` varchar(5) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `profit` int NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `warna`, `kode_kategori`, `satuan`, `stok`, `harga_beli`, `harga_jual`, `profit`, `tgl_input`, `pengguna`) VALUES
('B0001', 'Kemeja Anak', 'Biru', 'K003', 'Pcs', 26, 18000, 27000, 9000, '2022-08-15', 1),
('B0002', 'Blazer Anak', 'Hitam', 'K004', 'Pcs', 13, 17000, 25000, 8000, '2022-08-15', 1),
('B0003', 'Rok Mono', 'Pink', 'K004', 'Pcs', 18, 20000, 26000, 6000, '2022-09-15', 1),
('B0004', 'Kerudung Anak', 'Coklat', 'K004', 'Pcs', 26, 10000, 15000, 5000, '2022-09-15', 1),
('B0005', 'Kerudung Dewasa', 'Coklat', 'K002', 'Pcs', 9, 15000, 20000, 5000, '2022-09-15', 1),
('B0006', 'Kaos Oblong', 'Putih', 'K001', 'Pcs', 11, 16000, 23000, 7000, '2022-09-15', 1),
('B0007', 'Kaos Kerah', 'Merah', 'K001', 'Pcs', 11, 20000, 25000, 5000, '2022-09-15', 1),
('B0008', 'Celana Pendek Anak', 'Biru', 'K003', 'Pcs', 11, 120000, 150000, 30000, '2022-09-15', 1),
('B0009', 'Celana Panjang Jeans', 'Biru', 'K001', 'Pcs', 25, 130000, 250000, 120000, '2022-09-15', 1),
('B0010', 'testing', 'Merah', 'K003', 'Pcs', 10, 10000, 15000, 5000, '2023-10-30', 3);

--
-- Triggers `tb_barang`
--
DELIMITER $$
CREATE TRIGGER `historyhapusbarang` BEFORE DELETE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyhapusbarang
    set kode_barang_dihapus = OLD.kode_barang,
    nama_barang=old.nama_barang,
    waktu = NOW(); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `historyubahharga` BEFORE UPDATE ON `tb_barang` FOR EACH ROW BEGIN
    INSERT INTO tb_historyubahharga
    set kode_barang = OLD.kode_barang,
    harga_jual_lama=old.harga_jual,
    harga_jual_baru=new.harga_jual,
    waktu = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyhapusbarang`
--

CREATE TABLE `tb_historyhapusbarang` (
  `id` int NOT NULL,
  `kode_barang_dihapus` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyhapusbarang`
--

INSERT INTO `tb_historyhapusbarang` (`id`, `kode_barang_dihapus`, `nama_barang`, `waktu`) VALUES
(1, 'B0011', 'Handuk Mandi', '2022-11-22'),
(2, 'B0010', 'Baju Kemeja ', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_historyubahharga`
--

CREATE TABLE `tb_historyubahharga` (
  `id` int NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `harga_jual_lama` int NOT NULL,
  `harga_jual_baru` int NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_historyubahharga`
--

INSERT INTO `tb_historyubahharga` (`id`, `kode_barang`, `harga_jual_lama`, `harga_jual_baru`, `waktu`) VALUES
(1, 'B0001', 25000, 27000, '2022-11-22'),
(3, 'B0002', 23000, 25000, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kode_kategori` varchar(30) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kode_kategori`, `nama_kategori`, `tgl_input`, `pengguna`) VALUES
('K001', 'Baju Dewasa Laki-laki', '2022-09-15', 1),
('K002', 'Baju Dewasa Perempuan', '2022-09-15', 1),
('K003', 'Baju Anak Laki-Laki', '2022-09-15', 1),
('K004', 'Baju Anak Perempuan', '2022-09-15', 1),
('K005', 'Topi Dewasa', '2022-09-15', 1),
('K006', 'Produk Kebersihan', '2022-10-07', 1),
('K007', 'testing', '2023-06-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama`, `alamat`, `telpon`, `email`, `tgl_input`, `pengguna`) VALUES
(1, 'Umum', '', '', '', '2022-09-15', 3),
(2, 'Budi Raharjo', 'Plumbon Cirebon', '081312121212', '', '2022-09-15', 3),
(3, 'Wati', 'Plered', '084545454545', '', '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_detail`
--

CREATE TABLE `tb_pembelian_detail` (
  `id` int NOT NULL,
  `tgl` date NOT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_pembelian_detail`
--

INSERT INTO `tb_pembelian_detail` (`id`, `tgl`, `kode_barang`, `jumlah`, `pengguna`) VALUES
(6, '2021-12-04', 'B0001', 5, 3),
(7, '2022-09-07', 'B0001', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id`, `username`, `nama`, `password`, `level`, `foto`, `tgl_input`, `pengguna`) VALUES
(1, 'admin', 'Rina Maelani', 'admin', 'admin', 'kartini.jpg', '2022-09-01', 1),
(3, 'kasir', 'Candra', 'kasir', 'kasir', 'user.png', '2022-09-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `kode_penjualan` varchar(50) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bayar` int NOT NULL,
  `kembali` int NOT NULL,
  `diskon` int NOT NULL,
  `potongan` int NOT NULL,
  `total_b` int NOT NULL,
  `pengguna` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`kode_penjualan`, `tgl_penjualan`, `id_pelanggan`, `bayar`, `kembali`, `diskon`, `potongan`, `total_b`, `pengguna`) VALUES
('PJ-00000001', '2021-12-04', 2, 350000, 0, 0, 0, 350000, 3),
('PJ-00000002', '2021-12-04', 1, 100000, 27000, 0, 0, 73000, 3),
('PJ-00000003', '2022-09-15', 2, 100000, 27000, 0, 0, 73000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_detail`
--

CREATE TABLE `tb_penjualan_detail` (
  `id` int NOT NULL,
  `kode_penjualan` varchar(20) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan_detail`
--

INSERT INTO `tb_penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `jumlah`, `total`) VALUES
(78, 'PJ-00000001', 'B0001', 2, 50000),
(79, 'PJ-00000001', 'B0008', 2, 300000),
(80, 'PJ-00000002', 'B0001', 2, 50000),
(81, 'PJ-00000002', 'B0002', 1, 23000),
(82, 'PJ-00000003', 'B0001', 2, 50000),
(83, 'PJ-00000003', 'B0002', 1, 23000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view1_14523082_dede` (
`(harga_jual*stok)` bigint
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view2_14523082_dede` (
`(harga_jual * stok)` bigint
,`(harga_jual * stok) * 0.1` decimal(22,1)
,`(harga_jual *stok) * (1 - 0.1)` decimal(23,1)
,`nama_barang` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view3_14523082_dede` (
`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view4_14523082_dede` (
`Diskon` decimal(22,1)
,`HargaDiskon` decimal(23,1)
,`nama_barang` varchar(255)
,`TotalHarga` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view5_14523082_dede` (
`TotalModal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view6_14523082_dede` (
`GrandTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view7_14523082_dede` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view8_14523082_dede` (
`JumlahData` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view9_14523082_dede` (
`RataPenjualan` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view10_14523082_dede` (
`HargaBeliTertinggi` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view11_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view11_14523082_dede` (
`HargaBeliTerendah` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view12_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view12_14523082_dede` (
`Maksimal` int
,`Minimum` int
,`Ratarata` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view13_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view13_14523082_dede` (
`kode_penjualan` varchar(20)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view14_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view14_14523082_dede` (
`kode_barang` varchar(50)
,`nama_barang` varchar(255)
,`Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view15_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view15_14523082_dede` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view16_14523082_dede`
-- (See below for the actual view)
--
CREATE TABLE `view16_14523082_dede` (
`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barangkategori`
-- (See below for the actual view)
--
CREATE TABLE `view_barangkategori` (
`harga_beli` int
,`nama` varchar(100)
,`nama_barang` varchar(255)
,`nama_kategori` varchar(50)
,`stok` int
);

-- --------------------------------------------------------

--
-- Structure for view `view1_14523082_dede`
--
DROP TABLE IF EXISTS `view1_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1_14523082_dede`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual*stok)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view2_14523082_dede`
--
DROP TABLE IF EXISTS `view2_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2_14523082_dede`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `(harga_jual * stok)`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `(harga_jual * stok) * 0.1`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `(harga_jual *stok) * (1 - 0.1)` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view3_14523082_dede`
--
DROP TABLE IF EXISTS `view3_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3_14523082_dede`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view4_14523082_dede`
--
DROP TABLE IF EXISTS `view4_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4_14523082_dede`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, (`tb_barang`.`harga_jual` * `tb_barang`.`stok`) AS `TotalHarga`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * 0.1) AS `Diskon`, ((`tb_barang`.`harga_jual` * `tb_barang`.`stok`) * (1 - 0.1)) AS `HargaDiskon` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view5_14523082_dede`
--
DROP TABLE IF EXISTS `view5_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5_14523082_dede`  AS SELECT sum(`tb_barang`.`harga_beli`) AS `TotalModal` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view6_14523082_dede`
--
DROP TABLE IF EXISTS `view6_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6_14523082_dede`  AS SELECT sum(`tb_penjualan_detail`.`total`) AS `GrandTotal` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view7_14523082_dede`
--
DROP TABLE IF EXISTS `view7_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7_14523082_dede`  AS SELECT count(`tb_penjualan`.`kode_penjualan`) AS `JumlahData` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view8_14523082_dede`
--
DROP TABLE IF EXISTS `view8_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8_14523082_dede`  AS SELECT count(`tb_barang`.`kode_kategori`) AS `JumlahData` FROM `tb_barang` WHERE (`tb_barang`.`kode_kategori` = 'k001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view9_14523082_dede`
--
DROP TABLE IF EXISTS `view9_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9_14523082_dede`  AS SELECT avg(`tb_penjualan_detail`.`jumlah`) AS `RataPenjualan` FROM `tb_penjualan_detail` WHERE (`tb_penjualan_detail`.`kode_barang` = 'B0001')  ;

-- --------------------------------------------------------

--
-- Structure for view `view10_14523082_dede`
--
DROP TABLE IF EXISTS `view10_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10_14523082_dede`  AS SELECT max(`tb_barang`.`harga_beli`) AS `HargaBeliTertinggi` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view11_14523082_dede`
--
DROP TABLE IF EXISTS `view11_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view11_14523082_dede`  AS SELECT min(`tb_barang`.`harga_beli`) AS `HargaBeliTerendah` FROM `tb_barang``tb_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view12_14523082_dede`
--
DROP TABLE IF EXISTS `view12_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view12_14523082_dede`  AS SELECT max(`tb_penjualan`.`total_b`) AS `Maksimal`, min(`tb_penjualan`.`total_b`) AS `Minimum`, avg(`tb_penjualan`.`total_b`) AS `Ratarata` FROM `tb_penjualan``tb_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view13_14523082_dede`
--
DROP TABLE IF EXISTS `view13_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view13_14523082_dede`  AS SELECT `tb_penjualan_detail`.`kode_penjualan` AS `kode_penjualan`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM `tb_penjualan_detail` GROUP BY `tb_penjualan_detail`.`kode_penjualan``kode_penjualan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view14_14523082_dede`
--
DROP TABLE IF EXISTS `view14_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view14_14523082_dede`  AS SELECT `tb_penjualan_detail`.`kode_barang` AS `kode_barang`, `tb_barang`.`nama_barang` AS `nama_barang`, sum(`tb_penjualan_detail`.`total`) AS `Total` FROM (`tb_penjualan_detail` join `tb_barang`) WHERE (`tb_penjualan_detail`.`kode_barang` = `tb_barang`.`kode_barang`) GROUP BY `tb_penjualan_detail`.`kode_barang``kode_barang`  ;

-- --------------------------------------------------------

--
-- Structure for view `view15_14523082_dede`
--
DROP TABLE IF EXISTS `view15_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view15_14523082_dede`  AS SELECT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view16_14523082_dede`
--
DROP TABLE IF EXISTS `view16_14523082_dede`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view16_14523082_dede`  AS SELECT DISTINCT `tb_kategori`.`nama_kategori` AS `nama_kategori` FROM (`tb_barang` join `tb_kategori`) WHERE (`tb_kategori`.`kode_kategori` = `tb_barang`.`kode_kategori`)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_barangkategori`
--
DROP TABLE IF EXISTS `view_barangkategori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barangkategori`  AS SELECT `tb_barang`.`nama_barang` AS `nama_barang`, `tb_barang`.`harga_beli` AS `harga_beli`, `tb_kategori`.`nama_kategori` AS `nama_kategori`, `tb_barang`.`stok` AS `stok`, `tb_pengguna`.`nama` AS `nama` FROM ((`tb_barang` join `tb_kategori`) join `tb_pengguna`) WHERE ((`tb_barang`.`kode_kategori` = `tb_kategori`.`kode_kategori`) AND (`tb_barang`.`pengguna` = `tb_pengguna`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `fkbarang1` (`kode_kategori`),
  ADD KEY `fkuser1` (`pengguna`);

--
-- Indexes for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kode_kategori`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `fkkategori1` (`pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `pengguna` (`pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`kode_penjualan`),
  ADD KEY `pengguna` (`pengguna`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_penjualan` (`kode_penjualan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_historyhapusbarang`
--
ALTER TABLE `tb_historyhapusbarang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_historyubahharga`
--
ALTER TABLE `tb_historyubahharga`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `kode_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `fkbarang1` FOREIGN KEY (`kode_kategori`) REFERENCES `tb_kategori` (`kode_kategori`),
  ADD CONSTRAINT `fkuser1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD CONSTRAINT `fkkategori1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_pembelian_detail`
--
ALTER TABLE `tb_pembelian_detail`
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  ADD CONSTRAINT `tb_pembelian_detail_ibfk_2` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`);

--
-- Constraints for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `tb_pengguna` (`id`),
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`kode_pelanggan`);

--
-- Constraints for table `tb_penjualan_detail`
--
ALTER TABLE `tb_penjualan_detail`
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`kode_penjualan`) REFERENCES `tb_penjualan` (`kode_penjualan`),
  ADD CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`);
--
-- Database: `inventory`
--
CREATE DATABASE IF NOT EXISTS `inventory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `inventory`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kodebrg` varchar(15) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `satuan` varchar(5) NOT NULL,
  `stok` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kodebrg`, `nama`, `satuan`, `stok`) VALUES
('B001', 'Keybord', 'Pcs', 10100),
('B002', 'Mouse', 'Pcs', 250);

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE `beli` (
  `nofaktur` varchar(15) NOT NULL,
  `tgl` date NOT NULL,
  `kodebrg` varchar(15) NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `beli`
--

INSERT INTO `beli` (`nofaktur`, `tgl`, `kodebrg`, `qty`) VALUES
('B123', '2016-12-02', 'B001', 5000),
('B125', '2017-12-07', 'B001', 4000),
('B126', '2017-12-23', 'B001', 1000),
('F001', '2023-12-21', 'B001', 50);

--
-- Triggers `beli`
--
DELIMITER $$
CREATE TRIGGER `updatestokbarangbelihapus` AFTER DELETE ON `beli` FOR EACH ROW update barang set stok=stok-old.qty where kodebrg=old.kodebrg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatestokbarangubah` AFTER UPDATE ON `beli` FOR EACH ROW UPDATE barang set stok=stok-old.qty+new.qty where kodebrg=new.kodebrg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatetestokbarangbelimasuk` AFTER INSERT ON `beli` FOR EACH ROW UPDATE barang set stok=stok+new.qty where 
kodebrg=new.kodebrg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatetestokbarangmasuk` BEFORE INSERT ON `beli` FOR EACH ROW BEGIN
update barang set stok=stok+New.qty where kodebrg=New.kodebrg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE `jual` (
  `nofaktur` varchar(15) NOT NULL,
  `tgl` date NOT NULL,
  `kodebrg` varchar(15) NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jual`
--

INSERT INTO `jual` (`nofaktur`, `tgl`, `kodebrg`, `qty`) VALUES
('B124', '2024-12-02', 'B001', 1000),
('B124', '2024-12-04', 'B001', 4000);

--
-- Triggers `jual`
--
DELIMITER $$
CREATE TRIGGER `updatetestokbarangkeluar` BEFORE INSERT ON `jual` FOR EACH ROW BEGIN
UPDATE barang SET stok=stok-new.qty where kodebrg=New.kodebrg;
end
$$
DELIMITER ;
--
-- Database: `inventoryti1`
--
CREATE DATABASE IF NOT EXISTS `inventoryti1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `inventoryti1`;
--
-- Database: `login_web`
--
CREATE DATABASE IF NOT EXISTS `login_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `login_web`;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Database: `movieverse`
--
CREATE DATABASE IF NOT EXISTS `movieverse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `movieverse`;

-- --------------------------------------------------------

--
-- Table structure for table `kritik`
--

CREATE TABLE `kritik` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kritik`
--

INSERT INTO `kritik` (`id`, `user_id`, `isi`, `tanggal`) VALUES
(1, 5, 'asuu', '2025-07-12'),
(2, 7, 'awqq', '2025-07-12'),
(4, 5, 'hijhoihji', '2025-07-13'),
(5, 11, 'web sangat bagusss', '2025-07-13'),
(6, 10, 'wwww', '2025-07-14'),
(7, 12, 'wkwkkwk', '2025-07-14'),
(8, 12, 'wkwkw', '2025-07-14'),
(9, 5, 'awokkk', '2025-07-14'),
(10, 10, 'palll', '2025-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int NOT NULL,
  `isi` text NOT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `isi`, `tanggal`) VALUES
(3, 'paldi ganteng', '2025-07-13 01:31:52'),
(4, 'film sedang gangguan', '2025-07-13 02:16:49'),
(5, 'web lagi gabutt', '2025-07-14 10:04:22'),
(6, 'Pesan notifikasi dari Postman', '2025-07-14 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(5, 'dapi', 'dhaviachmad12@gmail.com', '$2y$10$lx7UVxjZZGn4vltKU4j00e8Q9fLASm3wS6g01hV/Zcll9taUPhFu2', 'admin', '2025-07-12 15:01:18'),
(10, 'faldi', 'achmaddhavi802@gmail.com', '$2y$10$BkFEjgfKldTbSkmqTpEJz.UCparaOu3ze6NB18pupbPRB6hUN2bcu', 'user', '2025-07-13 03:08:23'),
(11, 'dhisti', 'dhistiamalia@gmail.com', '$2y$10$hk26wEybBpY3L024Z4CEJug.UfpubygaNrLV863COvSdfLEuD.Kfi', 'admin', '2025-07-13 14:39:36'),
(12, 'amay', 'amay@gmail.com', '$2y$10$FXIF.A58lalfWgYhFhbplOu0EUpciSds85tzdWEbpqMjy/2q4hqOm', 'user', '2025-07-14 04:31:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kritik`
--
ALTER TABLE `kritik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kritik`
--
ALTER TABLE `kritik`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `perpus`
--
CREATE DATABASE IF NOT EXISTS `perpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `perpus`;
--
-- Database: `perpus_api`
--
CREATE DATABASE IF NOT EXISTS `perpus_api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `perpus_api`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
