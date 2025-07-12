-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2025 at 08:22 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Id` int NOT NULL,
  `barcode` int DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint DEFAULT NULL,
  `harga_beli` bigint DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `kategori_id` int DEFAULT NULL,
  `satuan_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `supplier_id`) VALUES
(1, 10001, 'Pulpen Biru', 3000, 2000, 100, 1, 1, 1, 1),
(2, 10002, 'Buku Tulis', 5000, 3500, 150, 1, 2, 1, 1),
(3, 10003, 'Lampu LED', 25000, 20000, 50, 2, 1, 4, 2),
(4, 10004, 'Snack Ring', 8000, 6000, 200, 3, 2, 1, 3),
(5, 10005, 'Air Mineral 1L', 5000, 3500, 300, 4, 4, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int NOT NULL,
  `NIK` int DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `Telp` char(20) DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `NIK`, `name`, `Telp`, `Email`, `Alamat`) VALUES
(1, 1001, 'Andi', '0812121211', 'andi@gmail.com', 'Jl. Mawar No.1'),
(2, 1002, 'Budi', '0812121212', 'budi@gmail.com', 'Jl. Melati No.2'),
(3, 1003, 'Citra', '0812121213', 'citra@gmail.com', 'Jl. Kenanga No.3'),
(4, 1004, 'Dewi', '0812121214', 'dewi@gmail.com', 'Jl. Anggrek No.4'),
(5, 1005, 'Eko', '0812121215', 'eko@gmail.com', 'Jl. Dahlia No.5');

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `Id` int NOT NULL,
  `Harga` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `Subtotal` bigint DEFAULT NULL,
  `Pembelian_Id` int DEFAULT NULL,
  `Barang_Id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`Id`, `Harga`, `QTY`, `Subtotal`, `Pembelian_Id`, `Barang_Id`) VALUES
(1, 2000, 50, 100000, 1, 1),
(2, 20000, 3, 60000, 2, 3),
(3, 6000, 10, 60000, 3, 4),
(4, 3500, 20, 70000, 4, 5),
(5, 3500, 10, 35000, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `Id` int NOT NULL,
  `Harga` int DEFAULT NULL,
  `QTY` int DEFAULT NULL,
  `Subtotal` bigint DEFAULT NULL,
  `Penjualan_Id` int DEFAULT NULL,
  `Barang_Id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`Id`, `Harga`, `QTY`, `Subtotal`, `Penjualan_Id`, `Barang_Id`) VALUES
(1, 3000, 2, 6000, 1, 1),
(2, 5000, 2, 10000, 2, 2),
(3, 25000, 1, 25000, 2, 3),
(4, 8000, 2, 16000, 3, 4),
(5, 5000, 3, 15000, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `Id` int NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`Id`, `name`) VALUES
(1, 'Alat Tulis'),
(2, 'Elektronik'),
(3, 'Makanan'),
(4, 'Minuman'),
(5, 'Kebutuhan Rumah');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `Id` int NOT NULL,
  `Invoice` int DEFAULT NULL,
  `Total` bigint DEFAULT NULL,
  `Bayar` bigint DEFAULT NULL,
  `Deskripsi` varchar(255) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Supplier_Id` int DEFAULT NULL,
  `User_Id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`Id`, `Invoice`, `Total`, `Bayar`, `Deskripsi`, `Tanggal`, `Supplier_Id`, `User_Id`) VALUES
(1, 101, 100000, 100000, 'Pembelian awal', '2025-05-01', 1, 1),
(2, 102, 75000, 80000, 'Restok lampu', '2025-05-03', 2, 1),
(3, 103, 120000, 120000, 'Isi stok makanan', '2025-05-05', 3, 2),
(4, 104, 95000, 95000, 'Isi air mineral', '2025-05-07', 4, 3),
(5, 105, 50000, 60000, 'Stok kebutuhan rumah', '2025-05-10', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `Id` int NOT NULL,
  `Invoice` int DEFAULT NULL,
  `Total` bigint DEFAULT NULL,
  `Bayar` bigint DEFAULT NULL,
  `Kembali` int DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `customer_Id` int DEFAULT NULL,
  `user_Id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`Id`, `Invoice`, `Total`, `Bayar`, `Kembali`, `Tanggal`, `customer_Id`, `user_Id`) VALUES
(1, 1001, 10000, 10000, 0, '2025-05-01', 1, 2),
(2, 1002, 25000, 30000, 5000, '2025-05-02', 2, 2),
(3, 1003, 18000, 20000, 2000, '2025-05-03', 3, 2),
(4, 1004, 30000, 30000, 0, '2025-05-04', 4, 3),
(5, 1005, 15000, 20000, 5000, '2025-05-05', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `Id` int NOT NULL,
  `name` char(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`Id`, `name`, `deskripsi`) VALUES
(1, 'Pcs', 'Satuan per item'),
(2, 'Pack', 'Isi beberapa pcs'),
(3, 'Box', 'Isi banyak item'),
(4, 'Liter', 'Satuan cair'),
(5, 'Kg', 'Satuan berat');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Id` int NOT NULL,
  `NIK` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `Telp` char(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Perusahaan` varchar(150) DEFAULT NULL,
  `Nama_Bank` varchar(150) DEFAULT NULL,
  `Nama_Akun_Bank` varchar(150) DEFAULT NULL,
  `No_Akun_Bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Id`, `NIK`, `name`, `Telp`, `Email`, `Alamat`, `Perusahaan`, `Nama_Bank`, `Nama_Akun_Bank`, `No_Akun_Bank`) VALUES
(1, 12345678, 'Toko Alat Sekolah', '081234567890', 'AlatTulis@tokosupply.com', 'Jl. CEMPAKA', 'PT. ATK CEMPAKA', 'BCA', 'Toko Alat Sekolah', '1234567890'),
(2, 22345678, 'Gudang Elektronik', '082234567891', 'elek@gudang.com', 'Jl. Sultan Adam', 'Gudang Jaya', 'BRI', 'Gudang Elektronik', '2234567890'),
(3, 32345678, 'Warung Saji', '083234567892', 'saji@warung.com', 'Jl. Sungai Andai', 'Saji Corp', 'Mandiri', 'Warung Saji', '3234567890'),
(4, 42345678, 'Minum Sehat', '084234567893', 'minum@sehat.com', 'Jl. Martapura', 'Air Minum Ltd', 'BNI', 'Minum Sehat', '4234567890'),
(5, 52345678, 'Kebutuhan Anda', '085234567894', 'kebutuhan@rumah.com', 'Jl. Rumah 5', 'Rumah Supply', 'BCA', 'Kebutuhan Anda', '5234567890');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int NOT NULL,
  `NIK` int DEFAULT NULL,
  `Username` char(100) DEFAULT NULL,
  `Full_Name` varchar(150) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` char(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Telp` char(20) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Is_Active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `NIK`, `Username`, `Full_Name`, `Password`, `Role`, `Email`, `Telp`, `Alamat`, `Is_Active`) VALUES
(1, 111, 'admin', 'Admin Utama', 'admin123', 'admin', 'admin@email.com', '081234567801', 'Kantor Pusat', 'Y'),
(2, 112, 'kasir1', 'Kasir Satu', 'kasir123', 'kasir', 'kasir1@email.com', '081234567802', 'Kasir A', 'Y'),
(3, 113, 'kasir2', 'Kasir Dua', 'kasir456', 'kasir', 'kasir2@email.com', '081234567803', 'Kasir B', 'Y'),
(4, 114, 'staff1', 'Staff Gudang', 'gudang123', 'staff', 'staff@email.com', '081234567804', 'Gudang', 'Y'),
(5, 115, 'viewer', 'Viewer Only', 'viewer123', 'viewer', 'viewer@email.com', '081234567805', 'Lainnya', 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_supplier` (`supplier_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_Pembelian` (`Pembelian_Id`),
  ADD KEY `fk_Barang_Beli` (`Barang_Id`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_Penjualan` (`Penjualan_Id`),
  ADD KEY `fk_Barang` (`Barang_Id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_Supplier_pembelian` (`Supplier_Id`),
  ADD KEY `fk_User_pembelian` (`User_Id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_customer` (`customer_Id`),
  ADD KEY `fk_user_penjualan` (`user_Id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`Id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`Id`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`Id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`);

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `fk_Barang_Beli` FOREIGN KEY (`Barang_Id`) REFERENCES `barang` (`Id`),
  ADD CONSTRAINT `fk_Pembelian` FOREIGN KEY (`Pembelian_Id`) REFERENCES `pembelian` (`Id`);

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk_Barang` FOREIGN KEY (`Barang_Id`) REFERENCES `barang` (`Id`),
  ADD CONSTRAINT `fk_Penjualan` FOREIGN KEY (`Penjualan_Id`) REFERENCES `penjualan` (`Id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_Supplier_pembelian` FOREIGN KEY (`Supplier_Id`) REFERENCES `supplier` (`Id`),
  ADD CONSTRAINT `fk_User_pembelian` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_Id`) REFERENCES `customer` (`Id`),
  ADD CONSTRAINT `fk_user_penjualan` FOREIGN KEY (`user_Id`) REFERENCES `user` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
