-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2020 at 02:47 AM
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
  `NIP` varchar(18) NOT NULL,
  `namaPegawai` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`idPegawai`, `NIP`, `namaPegawai`, `username`, `password`, `status`) VALUES
(1, '1', 'AdminA', 'admin123', 'admin123', 'Admin'),
(2, '2', 'AdminB', 'admin234', 'admin234', 'Admin'),
(3, '13', 'DamanA', 'daman123', 'daman123', 'Daman'),
(4, '14', 'DamanB', 'daman234', 'daman234', 'Daman'),
(5, '11', 'DavaA', 'dava123', 'dava123', 'Dava'),
(6, '12', 'DavaB', 'dava234', 'dava234', 'Dava'),
(7, '9', 'HDDamanA', 'hddaman123', 'hddaman123', 'HD Daman'),
(8, '10', 'HDDamanB', 'hddaman234', 'hddaman234', 'HD Daman'),
(9, '5', 'OndeskA', 'ondesk123', 'ondesk123', 'Ondesk'),
(10, '6', 'OndeskB', 'ondesk234', 'ondesk234', 'Ondesk'),
(11, '3', 'OnsiteA', 'onsite123', 'onsite123', 'Onsite'),
(12, '4', 'OnsiteB', 'onsite234', 'onsite234', 'Onsite'),
(13, '7', 'SDIA', 'sdi123', 'sdi123', 'SDI'),
(14, '8', 'SDIB', 'sdi234', 'sdi234', 'SDI'),
(17, '', '<h1>Angga</h1>', '<h1>Angga</h1>', '12345', 'Daman');

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
('spec1', 'ZTE ZXA10 C300 Logical Device', 'merk1', 'type1', NULL),
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
('KDL', 'Kendal', NULL),
('MKG', 'Semarang Mangkang', NULL),
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
('WTL4', 'Semarang', '');

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
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `NIP` (`NIP`);

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
-- Indexes for table `rekap_data_validasi`
--
ALTER TABLE `rekap_data_validasi`
  ADD KEY `ondesk` (`idOndesk`),
  ADD KEY `onsite1` (`idOnsite1`),
  ADD KEY `onsite2` (`idOnsite2`),
  ADD KEY `ODP` (`idODP`),
  ADD KEY `hostname` (`hostname`),
  ADD KEY `Dava` (`updaterDava`),
  ADD KEY `UIM` (`updaterUIM`);

--
-- Indexes for table `specification_olt`
--
ALTER TABLE `specification_olt`
  ADD PRIMARY KEY (`idSpecOLT`),
  ADD KEY `type` (`typeOLT`),
  ADD KEY `merek` (`merekOLT`);

--
-- Indexes for table `sto`
--
ALTER TABLE `sto`
  ADD PRIMARY KEY (`idSTO`);

--
-- Indexes for table `type_olt`
--
ALTER TABLE `type_olt`
  ADD PRIMARY KEY (`idTypeOLT`),
  ADD UNIQUE KEY `typeOLT` (`typeOLT`);

--
-- Indexes for table `witel`
--
ALTER TABLE `witel`
  ADD PRIMARY KEY (`idWitel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `idPegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekap_data_odp`
--
ALTER TABLE `rekap_data_odp`
  ADD CONSTRAINT `STOtomat` FOREIGN KEY (`idSTO`) REFERENCES `sto` (`idSTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `datel` FOREIGN KEY (`idDatel`) REFERENCES `datel` (`idDatel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `region` FOREIGN KEY (`idRegional`) REFERENCES `regional` (`idRegional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `witel` FOREIGN KEY (`idWitel`) REFERENCES `witel` (`idWitel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rekap_data_olt`
--
ALTER TABLE `rekap_data_olt`
  ADD CONSTRAINT `sentralTO` FOREIGN KEY (`idSTO`) REFERENCES `sto` (`idSTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `spec` FOREIGN KEY (`idSpecOLT`) REFERENCES `specification_olt` (`idSpecOLT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sto` FOREIGN KEY (`idSTO`) REFERENCES `sto` (`idSTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rekap_data_validasi`
--
ALTER TABLE `rekap_data_validasi`
  ADD CONSTRAINT `Dava` FOREIGN KEY (`updaterDava`) REFERENCES `pegawai` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ODP` FOREIGN KEY (`idODP`) REFERENCES `rekap_data_odp` (`idODP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `UIM` FOREIGN KEY (`updaterUIM`) REFERENCES `pegawai` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hostname` FOREIGN KEY (`hostname`) REFERENCES `rekap_data_olt` (`hostname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ondesk` FOREIGN KEY (`idOndesk`) REFERENCES `pegawai` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `onsite1` FOREIGN KEY (`idOnsite1`) REFERENCES `pegawai` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `onsite2` FOREIGN KEY (`idOnsite2`) REFERENCES `pegawai` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `specification_olt`
--
ALTER TABLE `specification_olt`
  ADD CONSTRAINT `merek` FOREIGN KEY (`merekOLT`) REFERENCES `merek_olt` (`idMerek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `type` FOREIGN KEY (`typeOLT`) REFERENCES `type_olt` (`idTypeOLT`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
