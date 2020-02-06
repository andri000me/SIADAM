-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2020 at 02:13 AM
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

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `kodedatelotomatis` (`nomer` INT) RETURNS VARCHAR(5) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(5);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("D", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kodepegawaiotomatis` (`nomer` INT) RETURNS VARCHAR(8) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(8);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("P", LPAD(urut, 7, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `koderegionalotomatis` (`nomer` INT) RETURNS VARCHAR(5) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(5);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("R", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kodespecotomatis` (`nomer` INT) RETURNS VARCHAR(6) CHARSET latin1 NO SQL
BEGIN
DECLARE kodebaru CHAR(6);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("Spec", LPAD(urut, 2, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kodestootomatis` (`nomer` INT) RETURNS VARCHAR(5) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(5);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("S", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kodewitelotomatis` (`nomer` INT) RETURNS VARCHAR(5) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(5);
DECLARE urut INT;
 
SET urut = IF(nomer IS NULL, 1, nomer + 1);
SET kodebaru = CONCAT("W", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `datel`
--

CREATE TABLE `datel` (
  `idDatel` varchar(5) NOT NULL,
  `namaDatel` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `idWitel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datel`
--

INSERT INTO `datel` (`idDatel`, `namaDatel`, `keterangan`, `idWitel`) VALUES
('D0001', 'Kendal', NULL, 'W0001'),
('D0002', 'Semarang Kota', NULL, 'W0001'),
('D0003', 'Ungaran', NULL, 'W0001');

--
-- Triggers `datel`
--
DELIMITER $$
CREATE TRIGGER `datelotomatis` BEFORE INSERT ON `datel` FOR EACH ROW BEGIN
DECLARE s VARCHAR(5);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idDatel,2,5) AS Nomer
FROM datel ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kodedatelotomatis(i));
 
IF(NEW.idDatel IS NULL OR NEW.idDatel = '')
 THEN SET NEW.idDatel =s;
END IF;
END
$$
DELIMITER ;

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
  `idPegawai` varchar(8) NOT NULL,
  `namaPegawai` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`idPegawai`, `namaPegawai`, `username`, `password`, `status`) VALUES
('P0000001', 'AdminA', 'admin123', 'admin123', 'Admin'),
('P0000002', 'OndeskA', 'ondesk123', 'ondesk123', 'Ondesk'),
('P0000003', 'OnsiteA', 'onsite123', 'onsite123', 'Onsite'),
('P0000004', 'DamanA', 'daman123', 'daman123', 'Daman'),
('P0000005', 'HDDamanA', 'hddaman123', 'hddaman123', 'HD Daman'),
('P0000006', 'SDIA', 'sdi123', 'sdi123', 'SDI'),
('P0000007', 'DavaA', 'dava123', 'dava123', 'Dava');

--
-- Triggers `pegawai`
--
DELIMITER $$
CREATE TRIGGER `Pegawai` BEFORE INSERT ON `pegawai` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idPegawai,2,7) AS Nomer
FROM pegawai ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kodepegawaiotomatis(i));
 
IF(NEW.idPegawai IS NULL OR NEW.idPegawai = '')
 THEN SET NEW.idPegawai =s;
END IF;
END
$$
DELIMITER ;

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
('R0001', 'Semarang', NULL);

--
-- Triggers `regional`
--
DELIMITER $$
CREATE TRIGGER `regionalotomatis` BEFORE INSERT ON `regional` FOR EACH ROW BEGIN
DECLARE s VARCHAR(5);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idRegional,2,5) AS Nomer
FROM regional ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT koderegionalotomatis(i));
 
IF(NEW.idRegional IS NULL OR NEW.idRegional = '')
 THEN SET NEW.idRegional =s;
END IF;
END
$$
DELIMITER ;

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
  `idSTO` varchar(5) NOT NULL,
  `infoODP` varchar(50) DEFAULT NULL,
  `updateDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap_data_odp`
--

INSERT INTO `rekap_data_odp` (`idNOSS`, `indexODP`, `idODP`, `ftp`, `latitude`, `longitude`, `clusterName`, `clusterStatus`, `avai`, `used`, `rsv`, `rsk`, `total`, `idSTO`, `infoODP`, `updateDate`) VALUES
(' 4123468914.0', 'FA/D02/029.01', 'ODP-MKG-FA/029', '#N/A', '-6967479051', '11029873620', NULL, NULL, '7', '0', '1', '0', '8', 'S0001', NULL, '2020-01-20 14:00:00'),
(' 4147170941.0', 'FAA/D04/076.01', 'ODP-SMT-FAA/076', '#N/A', '-7018743991', '11034163498', NULL, NULL, '8', '0', '0', '0', '8', 'S0001', NULL, '2020-01-20 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rekap_data_olt`
--

CREATE TABLE `rekap_data_olt` (
  `hostname` varchar(16) NOT NULL,
  `ipOLT` varchar(15) DEFAULT NULL,
  `idLogicalDevice` varchar(20) NOT NULL,
  `idSTO` varchar(5) NOT NULL,
  `idSpecOLT` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap_data_olt`
--

INSERT INTO `rekap_data_olt` (`hostname`, `ipOLT`, `idLogicalDevice`, `idSTO`, `idSpecOLT`) VALUES
('sdsad', '2123', 'dsad333', 'S0001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rekap_data_validasi`
--

CREATE TABLE `rekap_data_validasi` (
  `nomorValidasi` int(11) NOT NULL,
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

--
-- Dumping data for table `rekap_data_validasi`
--

INSERT INTO `rekap_data_validasi` (`nomorValidasi`, `tanggal_pelurusan`, `idOndesk`, `idOnsite1`, `idOnsite2`, `idODP`, `noteODP`, `QRODP`, `koordinatODP`, `hostname`, `portOLT`, `totalIN`, `kapasitasODP`, `portOutSplitter`, `QROutSplitter`, `portODP`, `statusportODP`, `ONU`, `serialNumber`, `serviceNumber`, `QRDropCore`, `noteDropCore`, `flagOLTPort`, `ODPtoOLT`, `ODPtoONT`, `RFS`, `noteHDDaman`, `updateDateUIM`, `updaterUIM`, `noteQRODP`, `noteQROutSplitter`, `noteQRDropCore`, `updaterDava`) VALUES
(1, '0000-00-00 00:00:00', 'a', 'a', 'a', '', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '0000-00-00 00:00:00', 'a', 'a', 'a', 'a', 'a');

--
-- Triggers `rekap_data_validasi`
--
DELIMITER $$
CREATE TRIGGER `auto_increment_validasi` BEFORE INSERT ON `rekap_data_validasi` FOR EACH ROW BEGIN
	DECLARE lastindex INT;
	DECLARE newindex INT;
	SET lastindex = (SELECT COUNT(*) FROM `rekap_data_validasi`);
	IF  lastindex = 0 THEN
		SET newindex = 1;
	ELSE
		SET  newindex = lastindex + 1;  
	END IF;
    	IF(NEW.nomorValidasi IS NULL OR NEW.nomorValidasi = '' 
        OR NEW.nomorValidasi > newindex OR NEW.nomorValidasi > 
        newindex)	THEN 	
    		SET NEW.nomorValidasi = newindex;
    END IF;
END
$$
DELIMITER ;

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
('Spec01', 'ZTE ZXA10 C300 Logical Device', 'ZTE', 'C300', NULL),
('Spec02', 'Alcatel-Lucent 7360 FX-16 Logical Device', 'ALU', '', NULL);

--
-- Triggers `specification_olt`
--
DELIMITER $$
CREATE TRIGGER `specotomats` BEFORE INSERT ON `specification_olt` FOR EACH ROW BEGIN
DECLARE s VARCHAR(6);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idSpecOLT,5,6) AS Nomer
FROM specification_olt ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kodespecotomatis(i));
 
IF(NEW.idSpecOLT IS NULL OR NEW.idSpecOLT = '')
 THEN SET NEW.idSpecOLT =s;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sto`
--

CREATE TABLE `sto` (
  `idSTO` varchar(5) NOT NULL,
  `kodeSTO` varchar(5) NOT NULL,
  `namaSTO` varchar(20) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `idDatel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sto`
--

INSERT INTO `sto` (`idSTO`, `kodeSTO`, `namaSTO`, `keterangan`, `idDatel`) VALUES
('S0001', 'SMT', 'Semarang Tua', '', 'D0002'),
('S0002', 'SMC', 'Semarang Candi', NULL, 'D0002'),
('S0003', 'SMB', 'Semarang Barat', 'Test', 'D0002');

--
-- Triggers `sto`
--
DELIMITER $$
CREATE TRIGGER `stootomatis` BEFORE INSERT ON `sto` FOR EACH ROW BEGIN
DECLARE s VARCHAR(5);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idSTO,2,5) AS Nomer
FROM sto ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kodestootomatis(i));
 
IF(NEW.idSTO IS NULL OR NEW.idSTO = '')
 THEN SET NEW.idSTO =s;
END IF;
END
$$
DELIMITER ;

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
  `keterangan` varchar(50) DEFAULT NULL,
  `idRegional` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `witel`
--

INSERT INTO `witel` (`idWitel`, `namaWitel`, `keterangan`, `idRegional`) VALUES
('W0001', 'Semarang', NULL, 'R0001');

--
-- Triggers `witel`
--
DELIMITER $$
CREATE TRIGGER `witelotomatis` BEFORE INSERT ON `witel` FOR EACH ROW BEGIN
DECLARE s VARCHAR(5);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(idWitel,2,5) AS Nomer
FROM witel ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kodewitelotomatis(i));
 
IF(NEW.idWitel IS NULL OR NEW.idWitel = '')
 THEN SET NEW.idWitel =s;
END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datel`
--
ALTER TABLE `datel`
  ADD PRIMARY KEY (`idDatel`),
  ADD KEY `fk_witel` (`idWitel`);

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
  ADD KEY `fk_sto` (`idSTO`);

--
-- Indexes for table `rekap_data_olt`
--
ALTER TABLE `rekap_data_olt`
  ADD PRIMARY KEY (`hostname`),
  ADD KEY `fk_rekap` (`idSpecOLT`,`idSTO`) USING BTREE,
  ADD KEY `fk_sto_dua` (`idSTO`);

--
-- Indexes for table `rekap_data_validasi`
--
ALTER TABLE `rekap_data_validasi`
  ADD PRIMARY KEY (`nomorValidasi`);

--
-- Indexes for table `specification_olt`
--
ALTER TABLE `specification_olt`
  ADD PRIMARY KEY (`idSpecOLT`);

--
-- Indexes for table `sto`
--
ALTER TABLE `sto`
  ADD PRIMARY KEY (`idSTO`),
  ADD UNIQUE KEY `kodeSTO` (`kodeSTO`),
  ADD KEY `fk_datel` (`idDatel`);

--
-- Indexes for table `witel`
--
ALTER TABLE `witel`
  ADD PRIMARY KEY (`idWitel`),
  ADD KEY `fk_regional` (`idRegional`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datel`
--
ALTER TABLE `datel`
  ADD CONSTRAINT `fk_witel` FOREIGN KEY (`idWitel`) REFERENCES `witel` (`idWitel`);

--
-- Constraints for table `rekap_data_odp`
--
ALTER TABLE `rekap_data_odp`
  ADD CONSTRAINT `fk_sto` FOREIGN KEY (`idSTO`) REFERENCES `sto` (`idSTO`);

--
-- Constraints for table `rekap_data_olt`
--
ALTER TABLE `rekap_data_olt`
  ADD CONSTRAINT `fk_spek` FOREIGN KEY (`idSpecOLT`) REFERENCES `specification_olt` (`idSpecOLT`),
  ADD CONSTRAINT `fk_sto_dua` FOREIGN KEY (`idSTO`) REFERENCES `sto` (`idSTO`);

--
-- Constraints for table `sto`
--
ALTER TABLE `sto`
  ADD CONSTRAINT `fk_datel` FOREIGN KEY (`idDatel`) REFERENCES `datel` (`idDatel`);

--
-- Constraints for table `witel`
--
ALTER TABLE `witel`
  ADD CONSTRAINT `fk_regional` FOREIGN KEY (`idRegional`) REFERENCES `regional` (`idRegional`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
