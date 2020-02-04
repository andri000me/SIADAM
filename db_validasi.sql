-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 08:06 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_validasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `datel`
--

CREATE TABLE `datel` (
  `idDatel` varchar(5) NOT NULL,
  `namaDatel` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datel`
--

INSERT INTO `datel` (`idDatel`, `namaDatel`, `keterangan`) VALUES
('E1', 'Semarangan', 'asdasdasd'),
('K2', 'Kendal', ''),
('S1', 'Semarang', ''),
('U3', 'Ungaran', '');

-- --------------------------------------------------------

--
-- Table structure for table `merek_olt`
--

CREATE TABLE `merek_olt` (
  `idMerek` varchar(6) NOT NULL,
  `namaMerek` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merek_olt`
--

INSERT INTO `merek_olt` (`idMerek`, `namaMerek`, `keterangan`) VALUES
('merk1', 'ZTE', NULL),
('merk2', 'Huawei', NULL),
('merk3', 'ALU', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `idPegawai` int(11) NOT NULL,
  `namaPegawai` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`idPegawai`, `namaPegawai`, `username`, `password`, `status`) VALUES
(1, 'AdminA', 'admin123', 'admin123', 'Admin'),
(2, 'AdminB', 'admin234', 'admin234', 'Admin'),
(3, 'DamanA', 'daman123', 'daman123', 'Daman'),
(4, 'DamanB', 'daman234', 'daman234', 'Daman'),
(5, 'DavaA', 'dava123', 'dava123', 'Dava'),
(6, 'DavaB', 'dava234', 'dava234', 'Dava'),
(7, 'HDDamanA', 'hddaman123', 'hddaman123', 'HD Daman'),
(8, 'HDDamanB', 'hddaman234', 'hddaman234', 'HD Daman'),
(9, 'OndeskA', 'ondesk123', 'ondesk123', 'Ondesk'),
(10, 'OndeskB', 'ondesk234', 'ondesk234', 'Ondesk'),
(11, 'OnsiteA', 'onsite123', 'onsite123', 'Onsite'),
(12, 'OnsiteB', 'onsite234', 'onsite234', 'Onsite'),
(13, 'SDIA', 'sdi123', 'sdi123', 'SDI'),
(14, 'SDIB', 'sdi234', 'sdi234', 'SDI'),
(20, 'taufiq', 'admin1234', 'adminadmin', 'Admin'),
(21, '1234', '12355', '12345', 'Daman');

-- --------------------------------------------------------

--
-- Table structure for table `regional`
--

CREATE TABLE `regional` (
  `idRegional` varchar(5) NOT NULL,
  `namaRegional` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regional`
--

INSERT INTO `regional` (`idRegional`, `namaRegional`, `keterangan`) VALUES
('D4', 'Regional 4', '');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_data_odp`
--

CREATE TABLE `rekap_data_odp` (
  `idNOSS` varchar(16) NOT NULL,
  `indexODP` varchar(20) NOT NULL,
  `idODP` varchar(16) NOT NULL,
  `ftp` varchar(5) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `longitude` varchar(16) NOT NULL,
  `clusterName` varchar(50) DEFAULT NULL,
  `clusterStatus` varchar(15) DEFAULT NULL,
  `avai` varchar(4) NOT NULL,
  `used` varchar(4) NOT NULL,
  `rsv` varchar(4) NOT NULL,
  `rsk` varchar(4) NOT NULL,
  `total` varchar(4) NOT NULL,
  `idRegional` varchar(5) NOT NULL,
  `idWitel` varchar(5) NOT NULL,
  `idDatel` varchar(5) NOT NULL,
  `idSTO` varchar(5) NOT NULL,
  `infoODP` varchar(50) DEFAULT NULL,
  `updateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap_data_odp`
--

INSERT INTO `rekap_data_odp` (`idNOSS`, `indexODP`, `idODP`, `ftp`, `latitude`, `longitude`, `clusterName`, `clusterStatus`, `avai`, `used`, `rsv`, `rsk`, `total`, `idRegional`, `idWitel`, `idDatel`, `idSTO`, `infoODP`, `updateDate`) VALUES
(' 4123468914.0', 'FA/D02/029.01', 'ODP-MKG-FA/029', '#N/A', '-6967479051', '11029873620', NULL, NULL, '7', '0', '1', '0', '8', 'D4', 'WTL4', 'S1', 'MKG', NULL, '2020-01-20 14:00:00'),
(' 4147170941.0', 'FAA/D04/076.01', 'ODP-SMT-FAA/076', '#N/A', '-7018743991', '11034163498', NULL, NULL, '8', '0', '0', '0', '8', 'D4', 'WTL4', 'S1', 'SMT', NULL, '2020-01-20 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_data_olt`
--

CREATE TABLE `rekap_data_olt` (
  `hostname` varchar(16) NOT NULL,
  `ipOLT` varchar(15) DEFAULT NULL,
  `idSTO` varchar(5) NOT NULL,
  `idLogicalDevice` varchar(20) NOT NULL,
  `idSpecOLT` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap_data_olt`
--

INSERT INTO `rekap_data_olt` (`hostname`, `ipOLT`, `idSTO`, `idLogicalDevice`, `idSpecOLT`) VALUES
('GPON01-D4-SMT-3', '172.22.203.36', 'SMT', '12975088', 'spec1');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_data_validasi`
--

CREATE TABLE `rekap_data_validasi` (
  `tanggal_pelurusan` datetime NOT NULL,
  `idOndesk` varchar(18) NOT NULL,
  `idOnsite1` varchar(18) NOT NULL,
  `idOnsite2` varchar(18) NOT NULL,
  `idODP` varchar(16) NOT NULL,
  `noteODP` varchar(50) DEFAULT NULL,
  `QRODP` varchar(16) DEFAULT NULL,
  `koordinatODP` varchar(25) DEFAULT NULL,
  `hostname` varchar(16) NOT NULL,
  `portOLT` varchar(10) DEFAULT NULL,
  `totalIN` varchar(2) DEFAULT NULL,
  `kapasitasODP` varchar(2) DEFAULT NULL,
  `portOutSplitter` varchar(8) DEFAULT NULL,
  `QROutSplitter` varchar(16) DEFAULT NULL,
  `portODP` varchar(2) DEFAULT NULL,
  `statusportODP` varchar(35) DEFAULT NULL,
  `ONU` varchar(25) DEFAULT NULL,
  `serialNumber` varchar(25) DEFAULT NULL,
  `serviceNumber` varchar(16) DEFAULT NULL,
  `QRDropCore` varchar(40) DEFAULT NULL,
  `noteDropCore` varchar(75) DEFAULT NULL,
  `flagOLTPort` varchar(30) DEFAULT NULL,
  `ODPtoOLT` varchar(40) DEFAULT NULL,
  `ODPtoONT` varchar(35) DEFAULT NULL,
  `RFS` varchar(35) DEFAULT NULL,
  `noteHDDaman` varchar(75) DEFAULT NULL,
  `updateDateUIM` datetime DEFAULT NULL,
  `updaterUIM` varchar(18) DEFAULT 'NULL',
  `noteQRODP` varchar(45) DEFAULT NULL,
  `noteQROutSplitter` varchar(45) DEFAULT NULL,
  `noteQRDropCore` varchar(45) DEFAULT NULL,
  `updaterDava` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specification_olt`
--

CREATE TABLE `specification_olt` (
  `idSpecOLT` varchar(6) NOT NULL,
  `namaSpecOLT` varchar(50) NOT NULL,
  `merekOLT` varchar(6) NOT NULL,
  `typeOLT` varchar(6) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specification_olt`
--

INSERT INTO `specification_olt` (`idSpecOLT`, `namaSpecOLT`, `merekOLT`, `typeOLT`, `keterangan`) VALUES
('spec1', 'ZTE ZXA10 C300 Logical Device', 'ZTE', 'C300', ''),
('spec2', 'Alcatel-Lucent 7360 FX-16 Logical Device', 'merk3', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sto`
--

CREATE TABLE `sto` (
  `idSTO` varchar(5) NOT NULL,
  `namaSTO` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sto`
--

INSERT INTO `sto` (`idSTO`, `namaSTO`, `keterangan`) VALUES
('ABR', 'Ambarawa', NULL),
('GNK', 'Semarang Genuk', NULL),
('KDL', 'Kendal', 'adoh\r\n\r\n'),
('MKG', 'Semarang Mangkang', NULL),
('NDIYA', 'MBUHLAHH', 'PIYEMENEHH'),
('SMC', 'Semarang Candi', NULL),
('SMT', 'Semarang Tugu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_olt`
--

CREATE TABLE `type_olt` (
  `idTypeOLT` varchar(6) NOT NULL,
  `typeOLT` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_olt`
--

INSERT INTO `type_olt` (`idTypeOLT`, `typeOLT`, `keterangan`) VALUES
('type1', 'C300', ''),
('type2', 'C300.v.2.0', '');

-- --------------------------------------------------------

--
-- Table structure for table `witel`
--

CREATE TABLE `witel` (
  `idWitel` varchar(5) NOT NULL,
  `namaWitel` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `witel`
--

INSERT INTO `witel` (`idWitel`, `namaWitel`, `keterangan`) VALUES
('WTL4', 'Semaranga', ''),
('WTL5', 'Singotoro', 'kuy\r\n'),
('WTL6', 'Jakarta', 'New');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datel`
--
ALTER TABLE `datel`
  ADD PRIMARY KEY (`idDatel`);

--
-- Indexes for table `merek_olt`
--
ALTER TABLE `merek_olt`
  ADD PRIMARY KEY (`idMerek`),
  ADD UNIQUE KEY `namaMerek` (`namaMerek`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`idPegawai`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `regional`
--
ALTER TABLE `regional`
  ADD PRIMARY KEY (`idRegional`);

--
-- Indexes for table `rekap_data_odp`
--
ALTER TABLE `rekap_data_odp`
  ADD PRIMARY KEY (`idODP`) USING BTREE,
  ADD KEY `region` (`idRegional`),
  ADD KEY `witel` (`idWitel`),
  ADD KEY `datel` (`idDatel`),
  ADD KEY `STOtomat` (`idSTO`);

--
-- Indexes for table `rekap_data_olt`
--
ALTER TABLE `rekap_data_olt`
  ADD PRIMARY KEY (`hostname`),
  ADD KEY `sentralTO` (`idSTO`),
  ADD KEY `spec` (`idSpecOLT`);

--
-- Indexes for table `specification_olt`
--
ALTER TABLE `specification_olt`
  ADD PRIMARY KEY (`idSpecOLT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
