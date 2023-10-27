-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Okt 2023 pada 09.02
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bulan_pembayaran`
--

CREATE TABLE `bulan_pembayaran` (
  `id_bulan_pembayaran` int(11) NOT NULL,
  `nama_bulan` enum('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember') NOT NULL,
  `tahun` int(4) NOT NULL,
  `pembayaran_perminggu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bulan_pembayaran`
--

INSERT INTO `bulan_pembayaran` (`id_bulan_pembayaran`, `nama_bulan`, `tahun`, `pembayaran_perminggu`) VALUES
(11, 'januari', 2023, 5000),
(12, 'februari', 2023, 5000),
(13, 'maret', 2023, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'administrator'),
(2, 'Bendahara'),
(3, 'Kosma');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `jumlah_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `jumlah_pengeluaran`, `keterangan`, `tanggal_pengeluaran`, `id_user`) VALUES
(10, 50000, 'Untuk Pendaftaran Turnamen Mobile Legend', 1685679404, 2),
(11, 20000, 'Beli ATK', 1685679430, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_uang_kas` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `id_user`, `id_uang_kas`, `aksi`, `tanggal`) VALUES
(24, 2, 50, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679051),
(25, 2, 51, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679056),
(26, 2, 53, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679078),
(27, 2, 52, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679083),
(28, 2, 50, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 3,000', 1685679089),
(29, 2, 51, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679095),
(30, 2, 53, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679101),
(31, 2, 52, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679110),
(32, 2, 50, 'telah mengubah pembayaran minggu ke-2 dari Rp. 3,000 menjadi Rp. 5,000', 1685679120),
(33, 2, 50, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679130),
(34, 2, 50, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679137),
(35, 2, 51, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679142),
(36, 2, 51, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679149),
(37, 2, 53, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679154),
(38, 2, 53, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679159),
(39, 2, 52, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679165),
(40, 2, 52, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679172),
(41, 2, 54, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679182),
(42, 2, 54, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679186),
(43, 2, 54, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679193),
(44, 2, 54, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679198),
(45, 2, 55, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679205),
(46, 2, 55, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679209),
(47, 2, 55, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679214),
(48, 2, 55, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679219),
(49, 2, 57, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679223),
(50, 2, 57, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679229),
(51, 2, 57, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679235),
(52, 2, 57, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679240),
(53, 2, 56, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679244),
(54, 2, 56, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679250),
(55, 2, 56, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679255),
(56, 2, 56, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1685679261),
(57, 2, 58, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679280),
(58, 2, 59, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679285),
(59, 2, 61, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679290),
(60, 2, 60, 'telah mengubah pembayaran minggu ke-1 dari Rp. 0 menjadi Rp. 5,000', 1685679296),
(61, 2, 58, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 3,000', 1685679319),
(62, 2, 59, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679326),
(63, 2, 61, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679331),
(64, 2, 60, 'telah mengubah pembayaran minggu ke-2 dari Rp. 0 menjadi Rp. 5,000', 1685679336),
(65, 2, 59, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 2,000', 1685679342),
(66, 2, 60, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679350),
(67, 2, 61, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1685679360),
(68, 2, 58, 'telah mengubah pembayaran minggu ke-2 dari Rp. 3,000 menjadi Rp. 5,000', 1686028101),
(69, 1, 58, 'telah mengubah pembayaran minggu ke-3 dari Rp. 0 menjadi Rp. 5,000', 1686047502),
(70, 1, 59, 'telah mengubah pembayaran minggu ke-3 dari Rp. 2,000 menjadi Rp. 5,000', 1686047508),
(71, 1, 58, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1686047516),
(72, 1, 59, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1686047522),
(73, 1, 61, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1686047529),
(74, 1, 60, 'telah mengubah pembayaran minggu ke-4 dari Rp. 0 menjadi Rp. 5,000', 1686047535);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_pengeluaran`
--

CREATE TABLE `riwayat_pengeluaran` (
  `id_riwayat_pengeluaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `aksi` text NOT NULL,
  `tanggal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_pengeluaran`
--

INSERT INTO `riwayat_pengeluaran` (`id_riwayat_pengeluaran`, `id_user`, `aksi`, `tanggal`) VALUES
(4, 2, 'telah menambahkan pengeluaran Untuk Pendaftaran Turnamen Mobile Legend dengan biaya Rp. 50,000', 1685679404),
(5, 2, 'telah menambahkan pengeluaran Beli ATK dengan biaya Rp. 20,000', 1685679430),
(6, 2, 'telah menambahkan pengeluaran Healing sekelas dengan biaya Rp. 300,000', 1686027555),
(7, 1, 'telah mengubah pengeluaran Healing sekelas dari biaya Rp. 300,000 menjadi Rp. 135,000', 1686047549);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `no_telepon` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `jenis_kelamin`, `no_telepon`, `email`) VALUES
(7, 'Atha Kurniawan', 'pria', '083165887653', 'atthakurniawan455@gmail.com'),
(8, 'Danur Lestari', 'wanita', '089765341837', 'danurlestari@gmail.com'),
(9, 'Haykal Alya Mubarak', 'pria', '081274631028', 'haykalalyamubarak@gmail.com'),
(10, 'Elsa Setiawati', 'wanita', '082318290433', 'elsasetiawati@gmail.com'),
(11, 'Ahmad Dhani', 'pria', '082365439876', 'ahmaddhani@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uang_kas`
--

CREATE TABLE `uang_kas` (
  `id_uang_kas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_bulan_pembayaran` int(11) NOT NULL,
  `minggu_ke_1` int(11) DEFAULT NULL,
  `minggu_ke_2` int(11) DEFAULT NULL,
  `minggu_ke_3` int(11) DEFAULT NULL,
  `minggu_ke_4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `uang_kas`
--

INSERT INTO `uang_kas` (`id_uang_kas`, `id_siswa`, `id_bulan_pembayaran`, `minggu_ke_1`, `minggu_ke_2`, `minggu_ke_3`, `minggu_ke_4`) VALUES
(45, 1, 10, 0, 0, 0, 0),
(46, 2, 10, 0, 0, 0, 0),
(47, 3, 10, 0, 0, 0, 0),
(48, 4, 10, 0, 0, 0, 0),
(49, 5, 10, 0, 0, 0, 0),
(50, 7, 11, 5000, 5000, 5000, 5000),
(51, 8, 11, 5000, 5000, 5000, 5000),
(52, 9, 11, 5000, 5000, 5000, 5000),
(53, 10, 11, 5000, 5000, 5000, 5000),
(54, 7, 12, 5000, 5000, 5000, 5000),
(55, 8, 12, 5000, 5000, 5000, 5000),
(56, 9, 12, 5000, 5000, 5000, 5000),
(57, 10, 12, 5000, 5000, 5000, 5000),
(58, 7, 13, 5000, 5000, 5000, 5000),
(59, 8, 13, 5000, 5000, 5000, 5000),
(60, 9, 13, 5000, 5000, 5000, 5000),
(61, 10, 13, 5000, 5000, 5000, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_jabatan`) VALUES
(1, 'Administrator', 'Admin', '$2y$10$RtlG8gY2cp/2BYEeMBJ2C.tMli1qvWGCoT/jkKIZVNrRJ/4cGbbTm', 1),
(2, 'Aulia Wulandari', 'Bendahara', '$2y$10$fdeYDCtDbXiGEQGLtbiAgOjZe240BbZJfVZK.61cItcJ/VZqO.f4.', 2),
(3, 'Ustara Dwi Fernanda', 'Kosma', '$2y$10$1G9mvmbcbdwjdqCb1EuG5OGAYNhPa1aOmlmd2yS2/Yz.A3HRS/u5u', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  ADD PRIMARY KEY (`id_bulan_pembayaran`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_uang_kas` (`id_uang_kas`);

--
-- Indeks untuk tabel `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  ADD PRIMARY KEY (`id_riwayat_pengeluaran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `uang_kas`
--
ALTER TABLE `uang_kas`
  ADD PRIMARY KEY (`id_uang_kas`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_bulan_pembayaran` (`id_bulan_pembayaran`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bulan_pembayaran`
--
ALTER TABLE `bulan_pembayaran`
  MODIFY `id_bulan_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT untuk tabel `riwayat_pengeluaran`
--
ALTER TABLE `riwayat_pengeluaran`
  MODIFY `id_riwayat_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `uang_kas`
--
ALTER TABLE `uang_kas`
  MODIFY `id_uang_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
