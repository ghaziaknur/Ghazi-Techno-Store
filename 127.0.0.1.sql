-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2025 at 01:52 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_onlineshop`
--
CREATE DATABASE `db_onlineshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_onlineshop`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`) VALUES
(1, 'admin', 'ghazi', 'Ghazi Alghifari Aknur');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `idanggota` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `foto` text NOT NULL,
  `tgldaftar` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idanggota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`idanggota`, `email`, `password`, `nama`, `jk`, `tgllahir`, `alamat`, `nohp`, `foto`, `tgldaftar`) VALUES
(1, 'tom@gmail.com', 'tom', 'Tom Holand', 'L', '2002-07-11', 'Padang', '08234353465', 'Tom_Holland_by_Gage_Skidmore.jpg', '2025-02-01 01:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `idproduk` int(11) NOT NULL,
  `idanggota` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `tglcart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `jasakirim`
--

CREATE TABLE IF NOT EXISTS `jasakirim` (
  `idjasa` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `logo` text NOT NULL,
  `detail` text NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`idjasa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jasakirim`
--

INSERT INTO `jasakirim` (`idjasa`, `idadmin`, `nama`, `logo`, `detail`, `tarif`) VALUES
(1, 1, 'JNE', 'jne.jpg', 'Perusahaan yang berdiri sejak 1990 ini menawarkan 4 jenis layanan pengiriman barang, antara lain OKE (Ongkos Kirim Ekonomis), REG (Reguler), YES (Yakin Esok Sampai), dan SS (Super Speed)', 13000),
(2, 1, 'POS INDONESIA', 'pos.jpg', 'Kini untuk jasa pengiriman barang, PT Pos Indonesia menawarkan beberapa jenis layanan, diantaranya adalah Surat Kilat Khusus dan Express Next Day', 11000),
(3, 1, 'TIKI', 'tiki.jpg', 'Perusahaan jasa pengiriman barang ini menawarkan 5 jenis layanan pengiriman barang, antara lain ECO (Economi Service), REG (Reguler Service), ONS (Over Night Service), HDS (Holiday Delivery Service), dan SDS (Same Day Service)', 12500),
(4, 1, 'PANDU LOGISTIC', 'pandu.jpg', 'Perusahaan ini menawarkan 2 jenis layanan jasa pengiriman, yakni Overnight Service dan Same Day Service', 15000),
(5, 1, 'RPX HOLDING', 'rpx.jpg', 'Perusahaan yang memiliki kantor pusat di bilangan Jakarta Selatan ini menawarkan 5 jenis layanan jasa pengiriman, antara lain SameDay Package, MidDay Package, Next Day Package, Regular Package, dan Retail Package', 12000),
(6, 1, 'ESL EXPRESS', 'esl.jpg', 'ESL Express menawarkan berbagai jenis layanan jasa pengiriman. Salah satunya adalah DARAT dengan jenis kiriman RPX â€“ Paket (0,01-99,00 kg)', 14500);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `idkat` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `namakat` varchar(40) NOT NULL,
  `ketkat` text NOT NULL,
  `tglkat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idkat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkat`, `idadmin`, `namakat`, `ketkat`, `tglkat`) VALUES
(5, 1, 'Handphone', 'Yang berhubungan dengan handphone', '2025-02-01 01:29:39'),
(6, 1, 'Laptop', 'Yang berhubungan dengan laptop', '2025-02-01 01:29:55'),
(7, 1, 'Televisi', 'Yang berhubungan dengan televisi', '2025-02-01 01:30:41'),
(8, 1, 'Kulkas', 'Yang berhubungan dengan kulkas', '2025-02-01 01:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `idorder` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `idjasa` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`idorder`, `idproduk`, `idjasa`, `jumlahbeli`, `subtotal`) VALUES
(2, 4, 1, 1, 12.85153);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `noorder` double NOT NULL,
  `idanggota` int(11) NOT NULL,
  `alamatkirim` text NOT NULL,
  `total` double NOT NULL,
  `tglorder` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `statusorder` varchar(20) NOT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idorder`, `noorder`, `idanggota`, `alamatkirim`, `total`, `tglorder`, `statusorder`) VALUES
(2, 20250201015023, 1, 'Bukittinggi', 5200012.85153, '2025-02-01 01:50:23', 'Diterima');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `idbayar` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `namabankpengirim` varchar(50) NOT NULL,
  `namapengirim` varchar(50) NOT NULL,
  `jumlahtransfer` double NOT NULL,
  `tgltransfer` date NOT NULL DEFAULT '0000-00-00',
  `namabankpenerima` varchar(50) NOT NULL,
  `bukti` text NOT NULL,
  PRIMARY KEY (`idbayar`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idbayar`, `idorder`, `namabankpengirim`, `namapengirim`, `jumlahtransfer`, `tgltransfer`, `namabankpenerima`, `bukti`) VALUES
(1, 2, 'BRI', 'Tom Holand', 5200013, '2025-02-01', 'BCA', 'Cuplikan layar 2025-02-01 015042.png');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `idproduk` int(11) NOT NULL AUTO_INCREMENT,
  `idkat` int(11) NOT NULL,
  `idadmin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(11) NOT NULL,
  `spesifikasi` text NOT NULL,
  `detail` text NOT NULL,
  `diskon` int(11) NOT NULL,
  `berat` float NOT NULL,
  `isikotak` text NOT NULL,
  `foto1` text NOT NULL,
  `foto2` text NOT NULL,
  `tglproduk` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idproduk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkat`, `idadmin`, `nama`, `harga`, `stok`, `spesifikasi`, `detail`, `diskon`, `berat`, `isikotak`, `foto1`, `foto2`, `tglproduk`) VALUES
(1, 5, 1, 'iPhone 12', 7749000, 4, 'Layar Super Retina XDR 6,1 inci<br />\r\nCeramic Shield, lebih tangguh dari kaca ponsel pintar mana pun<br />\r\nChip A14 Bionic, chip paling cepat yang pernah ada di ponsel pintar<br />\r\nSistem kamera ganda canggih dengan kamera Ultra Wide dan Wide 12 MP; mode Malam, Deep Fusion, Smart HDR 3, perekaman HDR 4K Dolby Vision<br />\r\nKamera depan TrueDepth 12 MP dengan mode Malam, perekaman HDR 4K Dolby Vision<br />\r\nLevel ketahanan air IP68 terdepan di industri<br />\r\nMendukung aksesori MagSafe untuk kemudahan pemasangan dan pengisian daya nirkabel yang lebih cepat<br />\r\niOS 14 dengan widget yang didesain ulang di Layar Home, Perpustakaan App yang sepenuhnya baru, Cuplikan App, dan banyak lagi', 'iPhone dengan iOS 14.<br />\r\nKabel USB-C ke Lightning.<br />\r\nBuku Manual dan dokumentasi lain.', 2, 400, '<br />\r\niPhone dengan iOS 14.<br />\r\nKabel USB-C ke Lightning.<br />\r\nBuku Manual dan dokumentasi lain.', 'iphone_12_purple_1_3.webp', '', '2025-02-01 01:37:58'),
(2, 5, 1, 'iPhone 13', 9249000, 9, 'Layar Super Retina XDR 6,1 inci<br />\r\nMode Sinematik menambahkan kedalaman bidang yang dangkal dan pindah fokus secara otomatis di video Anda<br />\r\nSistem kamera ganda canggih dengan kamera Wide dan Ultra Wide 12 MP; Gaya Fotografi, Smart HDR 4, mode Malam, perekaman HDR 4K Dolby Vision<br />\r\nKamera depan TrueDepth 12 MP dengan mode Malam, perekaman HDR 4K Dolby Vision<br />\r\nChip A15 Bionic untuk performa secepat kilat<br />\r\nPemutaran video hingga 19 jam<br />\r\nDesain kokoh dengan Ceramic Shield<br />\r\nLevel ketahanan air IP68 terdepan di industri<br />\r\niOS 15 dilengkapi berbagai fitur baru untuk melakukan lebih banyak hal dengan iPhone<br />\r\nMendukung aksesori MagSafe untuk kemudahan pemasangan dan pengisian daya nirkabel yang lebih cepat', 'iPhone dengan iOS 15.<br />\r\nKabel USB-C ke Lightning.<br />\r\nBuku Manual dan dokumentasi lain.', 4, 300, '<br />\r\niPhone dengan iOS 15.<br />\r\nKabel USB-C ke Lightning.<br />\r\nBuku Manual dan dokumentasi lain.', 'iphone_13_midnight_1.webp', '', '2025-02-01 01:39:47'),
(3, 5, 1, 'iPhone 14', 12499000, 10, 'Layar Super Retina XDR 6,1 inci<br />\r\nSistem kamera canggih untuk foto yang lebih baik dalam berbagai kondisi pencahayaan<br />\r\nMode Sinematik kini dalam Dolby Vision 4K pada kecepatan hingga 30 fps<br />\r\nMode Aksi untuk video handheld yang stabil<br />\r\nFitur keselamatan penting, —Deteksi Tabrakan1 memanggil bantuan saat Anda tak bisa<br />\r\nKekuatan baterai sepanjang hari dan pemutaran video hingga 20 jam<br />\r\nChip A15 Bionic dengan GPU 5-core untuk performa secepat kilat. Seluler 5G super cepat<br />\r\nFitur ketahanan terdepan di industri dengan Ceramic Shield dan tahan air<br />\r\niOS 16 menawarkan semakin banyak cara untuk personalisasi, komunikasi, dan berbagi', 'iPhone 14. Dengan sistem kamera ganda paling hebat di iPhone. Ambil foto yang memukau dalam pencahayaan rendah maupun terang. Deteksi Tabrakan, sebuah fitur keselamatan baru, memanggil bantuan saat Anda tak bisa', 5, 400, 'iPhone dengan iOS 16.<br />\r\nKabel USB-C ke Lightning.<br />\r\nBuku Manual dan dokumentasi lain.', 'iphone_14_blue_1.webp', '', '2025-02-01 01:41:02'),
(4, 5, 1, 'iPhone 15', 13.249, 4, 'DYNAMIC ISLAND HADIR DI IPHONE 15 — Dynamic Island menampilkan gelembung pemberitahuan dan Aktivitas Langsung — jadi Anda tidak melewatkannya saat melakukan hal lain. Anda dapat melihat siapa yang menelepon, memeriksa status penerbangan Anda, dan banyak lagi.<br />\r\nDESAIN INOVATIF — iPhone 15 dilengkapi dengan desain aluminium dan kaca berwarna yang tangguh. Tahan cipratan, air, dan debu. Bagian depan Ceramic Shield lebih tangguh dibandingkan kaca ponsel pintar mana pun. Dan layar Super Retina XDR 6,1&#8243; hingga 2x lebih terang di bawah sinar matahari dibandingkan iPhone 14.<br />\r\nKAMERA UTAMA 48 MP DENGAN TELEFOTO 2X — Kamera Utama 48 MP mengambil gambar dengan resolusi super tinggi. Jadi kini semakin mudah untuk mengambil foto yang memukau dengan detail menakjubkan. Telefoto berkualitas optik 2x memungkinkan Anda mengambil gambar close-up yang sempurna.<br />\r\nGENERASI BARU MODE POTRET — Ambil gambar dengan lebih banyak detail dan warna. Ketuk untuk mengalihkan fokus antara subjek — bahkan setelah Anda mengambil gambar.<br />\r\nCHIP A16 BIONIC SUPER BERTENAGA — Chip super cepat mendukung beragam fitur canggih seperti fotografi komputasional, transisi Dynamic Island yang lancar, dan Isolasi Suara untuk panggilan telepon. Dan A16 Bionic sangat efisien dalam membantu menghadirkan kekuatan baterai sepanjang hari yang menakjubkan.<br />\r\nKONEKTIVITAS USB-C — Konektor USB-C memungkinkan Anda mengisi daya Mac atau iPad dengan kabel yang sama dengan yang Anda gunakan untuk mengisi daya iPhone 15. Anda bahkan dapat menggunakan iPhone 15 untuk mengisi daya Apple Watch atau AirPods.', 'iPhone 15 menghadirkan Dynamic Island, kamera Utama 48 MP, dan USB-C — semuanya dalam desain aluminium dan kaca berwarna yang tangguh.', 3, 400, '<br />\r\niPhone dengan iOS 17.<br />\r\nKabel USB-C ke USB-C.<br />\r\nBuku Manual dan dokumentasi lain.', 'apple_iphone_15_blue_1.webp', '', '2025-02-01 01:42:44'),
(5, 8, 1, 'MODENA Kulkas Side By Side 2 Pintu ALLEGRA - RF 2551 S', 15136500, 4, 'Spesifikasi<br />\r\nLain-lain	<br />\r\nLED Lighting<br />\r\nTwist Ice Maker<br />\r\nFitur	Grid Handle, No Frost,<br />\r\nKapasitas	556 L<br />\r\nMaterial	Tempered Glass<br />\r\nGaransi	12 Bulan dari Distributor Resmi di Indonesia<br />\r\n', 'Side by Side 2 Door<br />\r\nGrid Handle<br />\r\nTempered Glass Shelves<br />\r\nNo Frost, LED Light, Twist Ice Maker<br />\r\n556L, 270W<br />\r\nUnit Utama', 3, 30, 'kulkas dan adapter', 'MODENA-Kulkas-Side-By-Side-2-Pintu-ALLEGRA-RF-2551-S--SKU02516094-2016101015536.jpg', '', '2025-02-01 01:45:00'),
(6, 6, 1, 'ASUS TUF Gaming A15 FA506NF-R525BXT-O (AMD Ryzen 5, 16GB, 512GB SSD, RTX 2050)', 11399000, 6, 'Spesifikasi<br />\r\nPlatform	Notebook<br />\r\nTipe Prosesor	AMD Ryzen 5<br />\r\nProcessor Onboard	AMD Ryzen 5 7535HS (6 Core, 512KB L1 Cache, 3.3GHz Base)<br />\r\nKapasitas Penyimpanan	512GB SSD<br />\r\nMemori Standar	16GB RAM<br />\r\nTipe Grafis	NVIDIA GeForce RTX 2050 4GB<br />\r\nUkuran Layar	15.6" Full HD<br />\r\nResolusi Layar	1920 x 1080<br />\r\nTipe Layar	IPS Level 144 Hz<br />\r\nLayar Sentuh	Tidak<br />\r\nWireless Bluetooth	Integrated<br />\r\nKeyboard	Backlit Chiclet Keyboard RGB<br />\r\nRagam Input Device	Touchpad<br />\r\nAudio	Integrated<br />\r\nSpeaker	Integrated<br />\r\nKamera	720P HD camera<br />\r\nSistem Operasi	Windows 11 Home<br />\r\nSoftware Lainnya	Office Home and Student<br />\r\nDaya / Power	150W AC Adapter<br />\r\nDimensi (PTL)	35.9 x 25.6 x 2.28 ~ 2.45 cm (14.13" x 10.08" x 0.90" ~ 0.96")<br />\r\nBerat Produk	2.30 Kg (5.07 lbs)', 'Processor: AMD Ryzen 5 7535HS<br />\r\nRAM: 16GB, Storage: 512GB SSD<br />\r\nVGA: NVIDIA GeForce RTX 2050, Konektivitas: WiFi + Bluetooth<br />\r\nUkuran Layar: 15.6 inch FHD 144Hz<br />\r\nSistem Operasi: Windows 11 Home + Office Home and Student<br />\r\nAsus TUF Gaming A15 FA506NF-R525BXT-O', 4, 2, 'Laptop dan adapternya', 'ASUS-TUF-Gaming-A15-FA506NFR525BXTO-AMD-Ryzen-5-16GB-512GB-SSD-RTX-2050-Graphite-Black-d710ee4e7bd44503b9d58a9dde8c9563_large.jpg', '', '2025-02-01 01:46:58'),
(7, 7, 1, 'COOCAA Google TV 50 Inch Smart LED TV 50Y72', 4599000, 7, 'Spesifikasi<br />\r\nUkuran Layar	50 Inch<br />\r\nResolusi Layar	3840 x 2160 4K Resolution<br />\r\nTipe Layar	LED<br />\r\nAudio	Dolby Audio Digital<br />\r\nKoneksi Nirkabel	WIFI<br />\r\nKonsumsi Daya	124 watts<br />\r\nVoltase	100 - 240V AC, 50/60Hz<br />\r\nDimensi Produk	124 x 18 x 76 cm<br />\r\nLain-lain	<br />\r\nBuilt-In Digital TV<br />\r\nFlicker Free<br />\r\nGame Mode<br />\r\nNetflix<br />\r\nYoutube', 'Ukuran : 50 Inch<br />\r\nResolusi Layar : 3840 x 2160<br />\r\nOS Google TV, Panel 4K UHD<br />\r\nDolby Audio Digital, Built-In Digital TV<br />\r\nFlicker Free, Game Mode, Netflix, Youtube, WiFi<br />\r\nUnit Utama', 2, 4, 'Televisi dan adapternya', 'COOCAA-Google-TV-50-Inch-Smart-LED-TV-50Y72-ba11ca36bc8b455baca68e31f9a2d315_large.jpg', '', '2025-02-01 01:48:27');
