-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2018 at 09:49 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wakafhutan`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` int(11) NOT NULL,
  `nama_campaign` varchar(30) NOT NULL,
  `nominal` double NOT NULL,
  `waktu` date NOT NULL,
  `deskripsi` text NOT NULL,
  `id_pewakaf` int(11) NOT NULL,
  `id_lahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`id`, `nama_campaign`, `nominal`, `waktu`, `deskripsi`, `id_pewakaf`, `id_lahan`) VALUES
(1, 'Hijaukan Bumi Bogor', 35000000, '2018-04-30', 'Mari kita hijaukan kembali kota bogor dengan berwakaf hutan', 1, 123),
(2, 'Selamatkan Hutan Gunung Slamet', 12000000, '2018-08-31', 'kesarakahan penguasa dengan pembangunan pembangkit listrik tenaga panas bumi merusak ekosistem hutan lindung gunung slemet. hal ini berdampak bagi penduduk di hilir yang setiap tahun mulai terserang banjir bandang', 1, 124);

-- --------------------------------------------------------

--
-- Table structure for table `info_lahan`
--

CREATE TABLE `info_lahan` (
  `id` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `luas` float NOT NULL,
  `harga` double NOT NULL,
  `jenis_lahan` enum('lahan kritis','lahan potensial') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info_lahan`
--

INSERT INTO `info_lahan` (`id`, `alamat`, `luas`, `harga`, `jenis_lahan`) VALUES
(123, 'Desa ciracas kecamatan bogor kabupaten bogor', 200, 250, 'lahan potensial'),
(124, 'jalan curug, kecamatan randudongkal kabupaten pemalang', 1000, 150, 'lahan kritis');

-- --------------------------------------------------------

--
-- Table structure for table `pengelola`
--

CREATE TABLE `pengelola` (
  `id` int(11) NOT NULL,
  `nama` varchar(11) NOT NULL,
  `alamat` varchar(11) NOT NULL,
  `kontak` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengelola`
--

INSERT INTO `pengelola` (`id`, `nama`, `alamat`, `kontak`) VALUES
(1, 'yusuf', 'bandung', '0823173652'),
(2, 'adi', 'banten', '097652623');

-- --------------------------------------------------------

--
-- Table structure for table `penyaluran_dana`
--

CREATE TABLE `penyaluran_dana` (
  `id` int(11) NOT NULL,
  `nama_campaign` varchar(100) NOT NULL,
  `total` double NOT NULL,
  `penerima` varchar(45) NOT NULL,
  `id_campaign` int(11) NOT NULL,
  `id_pewakaf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyaluran_dana`
--

INSERT INTO `penyaluran_dana` (`id`, `nama_campaign`, `total`, `penerima`, `id_campaign`, `id_pewakaf`) VALUES
(1, 'selamatkan gunung slamet', 12000000, 'adi', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pewakaf`
--

CREATE TABLE `pewakaf` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_hp` float NOT NULL,
  `nominal` double NOT NULL,
  `pembayaran` enum('transfer BCA','transfer BRI','transfer BNI','paypal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pewakaf`
--

INSERT INTO `pewakaf` (`id`, `nama`, `email`, `nomor_hp`, `nominal`, `pembayaran`) VALUES
(1, 'Muhammad Luqni Baehaqi', 'baehaqi@gmail.com', 877636000, 50000, 'transfer BRI'),
(2, 'Surya darma ali', 'surya@gmail.com', 8776360000, 1000000, 'transfer BCA'),
(3, 'sanjaya', 'san@gmail.com', 887799000, 500000, 'transfer BNI'),
(4, 'maharani', 'rani@gmail.com', 887799000, 200000, 'transfer BRI'),
(5, 'bambang', 'bambang@gmail.com', 887939000, 1100000, 'transfer BCA'),
(6, 'bambang', 'bambang@gmail.com', 887939000, 1100000, 'transfer BCA'),
(7, 'Sumanto', 'sumanto@gmail.com', 88774400000, 20000000, 'transfer BRI'),
(8, 'Joko', 'joko@gmail.com', 86432100, 30000000, 'transfer BRI'),
(9, 'mega', 'mega@gmail.com', 887939000, 100000, 'transfer BCA'),
(10, 'kaesang', 'kaesang@gmail.com', 88774400000, 200000000, 'paypal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pewakaf` (`id_pewakaf`),
  ADD KEY `idx_lahan` (`id_lahan`);

--
-- Indexes for table `info_lahan`
--
ALTER TABLE `info_lahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyaluran_dana`
--
ALTER TABLE `penyaluran_dana`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pewakaf` (`id_pewakaf`),
  ADD KEY `idx_campaign` (`id_campaign`);

--
-- Indexes for table `pewakaf`
--
ALTER TABLE `pewakaf`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`id_pewakaf`) REFERENCES `pewakaf` (`id`),
  ADD CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`id_lahan`) REFERENCES `info_lahan` (`id`);

--
-- Constraints for table `penyaluran_dana`
--
ALTER TABLE `penyaluran_dana`
  ADD CONSTRAINT `penyaluran_dana_ibfk_1` FOREIGN KEY (`id_pewakaf`) REFERENCES `pewakaf` (`id`),
  ADD CONSTRAINT `penyaluran_dana_ibfk_2` FOREIGN KEY (`id_campaign`) REFERENCES `campaign` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
