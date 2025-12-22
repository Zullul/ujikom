-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 22, 2025 at 02:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jurnal_pkl`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensis`
--

CREATE TABLE `absensis` (
  `id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `prakerin_siswa_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  `status_kehadiran` enum('hadir','sakit','izin','alpa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_masuk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_pulang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_izin_sakit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diverifikasi_pembimbing_dudi` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absensis`
--

INSERT INTO `absensis` (`id`, `siswa_id`, `prakerin_siswa_id`, `tanggal`, `jam_masuk`, `jam_pulang`, `status_kehadiran`, `keterangan`, `foto_masuk`, `foto_pulang`, `foto_izin_sakit`, `diverifikasi_pembimbing_dudi`, `created_at`, `updated_at`) VALUES
(46, 2099, 88, '2025-11-29', '05:28:29', '05:29:13', 'hadir', NULL, 'absensi/masuk/692a220d96c52_1764368909.jpg', 'absensi/pulang/692a2239064e1_1764368953.jpg', NULL, 0, '2025-11-28 22:28:29', '2025-11-28 22:29:13'),
(56, 2100, 90, '2025-12-12', '19:58:08', '19:59:02', 'hadir', NULL, 'absensi/masuk/693c116004274_1765544288.jpg', 'absensi/pulang/693c11963efde_1765544342.jpg', NULL, 0, '2025-12-12 12:58:08', '2025-12-12 12:59:02'),
(57, 2100, 90, '2025-12-18', '07:53:14', NULL, 'hadir', NULL, 'absensi/masuk/6943507a61191_1766019194.jpg', NULL, NULL, 0, '2025-12-18 00:53:14', '2025-12-18 00:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AYU HARTINI (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 51, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 4, \"siswa_id\": 2064, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 8, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-20 15:02:52', '2025-10-20 15:02:52'),
(2, 'Data Prakerin Siswa', 'membuat data prakerin siswa: SELA SALAFIAH (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 52, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 4, \"siswa_id\": 2088, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 8, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-20 15:02:52', '2025-10-20 15:02:52'),
(3, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ARIA RIZKY PERMANA (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 53, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 4, \"siswa_id\": 2062, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 8, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-20 15:02:52', '2025-10-20 15:02:52'),
(4, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ADE PEBRIANA (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 54, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 4, \"siswa_id\": 2057, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 8, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-20 15:02:52', '2025-10-20 15:02:52'),
(5, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Rivaldy Fauzan (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 55, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 4, \"siswa_id\": 2087, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 8, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-20 15:02:52', '2025-10-20 15:02:52'),
(6, 'Akun Pengguna', 'menghapus data akun pengguna: test (Username: test)', 'App\\Models\\User', 'deleted', 1555, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"test\"}}', NULL, '2025-10-21 01:02:17', '2025-10-21 01:02:17'),
(7, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Gian (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 56, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 3, \"siswa_id\": 2072, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 5, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-21 01:24:11', '2025-10-21 01:24:11'),
(8, 'Data Prakerin Siswa', 'membuat data prakerin siswa: HAFIDZ AMAR ALFARIZZIE (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 57, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 3, \"siswa_id\": 2073, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 5, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-21 01:24:11', '2025-10-21 01:24:11'),
(9, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Mochammad Rifqi Tsani (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 58, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 3, \"siswa_id\": 2078, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 5, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-21 01:24:11', '2025-10-21 01:24:11'),
(10, 'Data Prakerin Siswa', 'membuat data prakerin siswa: MOHAMMAD ABHIE RAMDANI (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 59, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 3, \"siswa_id\": 2079, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 5, \"guru_pembimbing_id\": 148, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-21 01:24:11', '2025-10-21 01:24:11'),
(11, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Var (Dudi ID: 3)', 'App\\Models\\DudiPembimbing', 'created', 13, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 3, \"jabatan\": null, \"nama_pembimbing\": \"Var\"}}', NULL, '2025-10-22 02:06:11', '2025-10-22 02:06:11'),
(12, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Var (Username: var)', 'App\\Models\\User', 'created', 1557, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"var\"}}', NULL, '2025-10-22 02:06:11', '2025-10-22 02:06:11'),
(13, 'Data Dudi Pembimbing', 'memperbarui data dudi pembimbing: Ayu (Dudi ID: 3)', 'App\\Models\\DudiPembimbing', 'updated', 5, 'App\\Models\\User', 531, '{\"old\": {\"nama_pembimbing\": \"Darsu\"}, \"attributes\": {\"nama_pembimbing\": \"Ayu\"}}', NULL, '2025-10-22 02:21:28', '2025-10-22 02:21:28'),
(14, 'Data Dudi Pembimbing', 'memperbarui data dudi pembimbing: ade (Dudi ID: 7)', 'App\\Models\\DudiPembimbing', 'updated', 12, 'App\\Models\\User', 531, '{\"old\": {\"nama_pembimbing\": \"rivaldy\"}, \"attributes\": {\"nama_pembimbing\": \"ade\"}}', NULL, '2025-10-22 02:22:27', '2025-10-22 02:22:27'),
(15, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: rivaldy (Dudi ID: 7)', 'App\\Models\\DudiPembimbing', 'created', 14, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 7, \"jabatan\": null, \"nama_pembimbing\": \"rivaldy\"}}', NULL, '2025-10-22 02:26:09', '2025-10-22 02:26:09'),
(16, 'Data Dudi', 'membuat data dudi: Access Media (Pimpinan: )', 'App\\Models\\Dudi', 'created', 8, 'App\\Models\\User', 531, '{\"attributes\": {\"alamat\": \"Tasikmalaya\", \"no_telp\": null, \"nama_dudi\": \"Access Media\", \"nama_pimpinan\": null}}', NULL, '2025-10-23 09:43:46', '2025-10-23 09:43:46'),
(17, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ayu (Dudi ID: 8)', 'App\\Models\\DudiPembimbing', 'created', 15, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 8, \"jabatan\": null, \"nama_pembimbing\": \"Ayu\"}}', NULL, '2025-10-23 09:43:46', '2025-10-23 09:43:46'),
(18, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Ayu (Username: ayu)', 'App\\Models\\User', 'created', 1558, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ayu\"}}', NULL, '2025-10-23 09:43:46', '2025-10-23 09:43:46'),
(19, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: rivaldy (Dudi ID: 8)', 'App\\Models\\DudiPembimbing', 'created', 16, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 8, \"jabatan\": null, \"nama_pembimbing\": \"rivaldy\"}}', NULL, '2025-10-23 09:44:38', '2025-10-23 09:44:38'),
(20, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: rivaldy (Username: rivaldy)', 'App\\Models\\User', 'created', 1559, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"rivaldy\"}}', NULL, '2025-10-23 09:44:39', '2025-10-23 09:44:39'),
(21, 'Data Dudi', 'membuat data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'created', 9, 'App\\Models\\User', 531, '{\"attributes\": {\"alamat\": \"Bantul\", \"no_telp\": null, \"nama_dudi\": \"Robotic School\", \"nama_pimpinan\": null}}', NULL, '2025-10-23 09:47:42', '2025-10-23 09:47:42'),
(22, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ibnu (Dudi ID: 9)', 'App\\Models\\DudiPembimbing', 'created', 17, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 9, \"jabatan\": null, \"nama_pembimbing\": \"Ibnu\"}}', NULL, '2025-10-23 09:47:42', '2025-10-23 09:47:42'),
(23, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Ibnu (Username: ibnu)', 'App\\Models\\User', 'created', 1560, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ibnu\"}}', NULL, '2025-10-23 09:47:42', '2025-10-23 09:47:42'),
(24, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Sarah (Dudi ID: 9)', 'App\\Models\\DudiPembimbing', 'created', 18, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 9, \"jabatan\": null, \"nama_pembimbing\": \"Sarah\"}}', NULL, '2025-10-23 09:48:09', '2025-10-23 09:48:09'),
(25, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Sarah (Username: sarah)', 'App\\Models\\User', 'created', 1561, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"sarah\"}}', NULL, '2025-10-23 09:48:09', '2025-10-23 09:48:09'),
(26, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Malik (Dudi ID: 9)', 'App\\Models\\DudiPembimbing', 'created', 19, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 9, \"jabatan\": null, \"nama_pembimbing\": \"Malik\"}}', NULL, '2025-10-23 09:48:28', '2025-10-23 09:48:28'),
(27, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Malik (Username: malik)', 'App\\Models\\User', 'created', 1562, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"malik\"}}', NULL, '2025-10-23 09:48:28', '2025-10-23 09:48:28'),
(28, 'Data Prakerin', 'memperbarui data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'updated', 2, 'App\\Models\\User', 531, '{\"old\": {\"keterangan\": \"Program Prakerin Tahun 2025/2026\"}, \"attributes\": {\"keterangan\": \"Program Prakerin Tahun 2025/2026 Gelombang 1\"}}', NULL, '2025-10-23 09:50:16', '2025-10-23 09:50:16'),
(29, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 3, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"97583275392753290\", \"keterangan\": \"Program Prakerin Tahun 2025/2026 Gelombang 2\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-10-22T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-10-30T17:00:00.000000Z\"}}', NULL, '2025-10-23 09:51:12', '2025-10-23 09:51:12'),
(30, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ZULLUL ARDAN RAFAYANTO (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 60, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 9, \"siswa_id\": 2092, \"prakerin_id\": 3, \"dudi_pembimbing_id\": 19, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 09:53:00', '2025-10-23 09:53:00'),
(31, 'Data Prakerin Siswa', 'membuat data prakerin siswa: NABIL SEPTI RAMDHANI (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 61, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 9, \"siswa_id\": 2082, \"prakerin_id\": 3, \"dudi_pembimbing_id\": 19, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 09:53:00', '2025-10-23 09:53:00'),
(32, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Kesya Arifatun Safanah (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 62, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 9, \"siswa_id\": 2077, \"prakerin_id\": 3, \"dudi_pembimbing_id\": 19, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 09:53:00', '2025-10-23 09:53:00'),
(33, 'Data Prakerin Siswa', 'membuat data prakerin siswa: JIHAD IRFANSYAH (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 63, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 9, \"siswa_id\": 2075, \"prakerin_id\": 3, \"dudi_pembimbing_id\": 19, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 09:53:00', '2025-10-23 09:53:00'),
(34, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AFRIZAL ZAHRAN MULYANA (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 64, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 9, \"siswa_id\": 2059, \"prakerin_id\": 3, \"dudi_pembimbing_id\": 19, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 09:53:00', '2025-10-23 09:53:00'),
(35, 'Data Dudi', 'membuat data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'created', 10, 'App\\Models\\User', 531, '{\"attributes\": {\"alamat\": \"Bantul\", \"no_telp\": null, \"nama_dudi\": \"Robotic School\", \"nama_pimpinan\": null}}', NULL, '2025-10-23 10:22:37', '2025-10-23 10:22:37'),
(36, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ibnu (Dudi ID: 10)', 'App\\Models\\DudiPembimbing', 'created', 20, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 10, \"jabatan\": null, \"nama_pembimbing\": \"Ibnu\"}}', NULL, '2025-10-23 10:22:37', '2025-10-23 10:22:37'),
(37, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: malik (Dudi ID: 10)', 'App\\Models\\DudiPembimbing', 'created', 21, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 10, \"jabatan\": null, \"nama_pembimbing\": \"malik\"}}', NULL, '2025-10-23 10:22:59', '2025-10-23 10:22:59'),
(38, 'Data Dudi', 'membuat data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'created', 11, 'App\\Models\\User', 531, '{\"attributes\": {\"alamat\": \"Bantul\", \"no_telp\": null, \"nama_dudi\": \"Robotic School\", \"nama_pimpinan\": null}}', NULL, '2025-10-23 10:35:43', '2025-10-23 10:35:43'),
(39, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ibnu (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 22, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Ibnu\"}}', NULL, '2025-10-23 10:35:43', '2025-10-23 10:35:43'),
(40, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Ibnu (Robotic School) (Username: ibnu.robotic-school)', 'App\\Models\\User', 'created', 1563, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ibnu.robotic-school\"}}', NULL, '2025-10-23 10:35:44', '2025-10-23 10:35:44'),
(41, 'Data Dudi', 'membuat data dudi: Access Media (Pimpinan: )', 'App\\Models\\Dudi', 'created', 12, 'App\\Models\\User', 531, '{\"attributes\": {\"alamat\": \"Tasikmalaya\", \"no_telp\": null, \"nama_dudi\": \"Access Media\", \"nama_pimpinan\": null}}', NULL, '2025-10-23 10:36:22', '2025-10-23 10:36:22'),
(42, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ayu (Dudi ID: 12)', 'App\\Models\\DudiPembimbing', 'created', 23, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 12, \"jabatan\": null, \"nama_pembimbing\": \"Ayu\"}}', NULL, '2025-10-23 10:36:22', '2025-10-23 10:36:22'),
(43, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Ayu (Access Media) (Username: ayu.access-media)', 'App\\Models\\User', 'created', 1564, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ayu.access-media\"}}', NULL, '2025-10-23 10:36:22', '2025-10-23 10:36:22'),
(44, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: malik (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 24, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"malik\"}}', NULL, '2025-10-23 10:36:46', '2025-10-23 10:36:46'),
(45, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: malik (Robotic School) (Username: malik.robotic-school)', 'App\\Models\\User', 'created', 1565, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"malik.robotic-school\"}}', NULL, '2025-10-23 10:36:46', '2025-10-23 10:36:46'),
(46, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: malik (Dudi ID: 12)', 'App\\Models\\DudiPembimbing', 'created', 25, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 12, \"jabatan\": null, \"nama_pembimbing\": \"malik\"}}', NULL, '2025-10-23 10:37:21', '2025-10-23 10:37:21'),
(47, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: malik (Access Media) (Username: malik.access-media)', 'App\\Models\\User', 'created', 1566, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"malik.access-media\"}}', NULL, '2025-10-23 10:37:21', '2025-10-23 10:37:21'),
(48, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ani Rochayani (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 26, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Ani Rochayani\"}}', NULL, '2025-10-23 10:40:34', '2025-10-23 10:40:34'),
(49, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Ani Rochayani (Robotic School) (Username: ani.robotic-school)', 'App\\Models\\User', 'created', 1567, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ani.robotic-school\"}}', NULL, '2025-10-23 10:40:34', '2025-10-23 10:40:34'),
(50, 'Akun Pengguna', 'menghapus data akun pengguna: Ani Rochayani (Robotic School) (Username: ani.robotic-school)', 'App\\Models\\User', 'deleted', 1567, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"ani.robotic-school\"}}', NULL, '2025-10-23 10:41:15', '2025-10-23 10:41:15'),
(51, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: Ani Rochayani (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'deleted', 26, 'App\\Models\\User', 531, '{\"old\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Ani Rochayani\"}}', NULL, '2025-10-23 10:41:36', '2025-10-23 10:41:36'),
(52, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ZULLUL ARDAN RAFAYANTO (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 65, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2092, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 11:03:06', '2025-10-23 11:03:06'),
(53, 'Data Prakerin Siswa', 'membuat data prakerin siswa: NABIL SEPTI RAMDHANI (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 66, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2082, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 11:03:06', '2025-10-23 11:03:06'),
(54, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Kesya Arifatun Safanah (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 67, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2077, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 11:03:06', '2025-10-23 11:03:06'),
(55, 'Data Prakerin Siswa', 'membuat data prakerin siswa: JIHAD IRFANSYAH (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 68, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2075, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 11:03:06', '2025-10-23 11:03:06'),
(56, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AFRIZAL ZAHRAN MULYANA (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 69, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2059, \"prakerin_id\": 2, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-23 11:03:06', '2025-10-23 11:03:06'),
(57, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Var (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 27, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Var\"}}', NULL, '2025-10-23 11:38:49', '2025-10-23 11:38:49'),
(58, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Var (Robotic School) (Username: var.robotic-school)', 'App\\Models\\User', 'created', 1568, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"var.robotic-school\"}}', NULL, '2025-10-23 11:38:50', '2025-10-23 11:38:50'),
(59, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: siti (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 28, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"siti\"}}', NULL, '2025-10-23 11:39:03', '2025-10-23 11:39:03'),
(60, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: siti (Robotic School) (Username: siti.robotic-school)', 'App\\Models\\User', 'created', 1569, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"siti.robotic-school\"}}', NULL, '2025-10-23 11:39:03', '2025-10-23 11:39:03'),
(61, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Uya (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 29, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Uya\"}}', NULL, '2025-10-23 11:39:25', '2025-10-23 11:39:25'),
(62, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Uya (Robotic School) (Username: uya.robotic-school)', 'App\\Models\\User', 'created', 1570, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"uya.robotic-school\"}}', NULL, '2025-10-23 11:39:25', '2025-10-23 11:39:25'),
(63, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: test (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'created', 30, 'App\\Models\\User', 531, '{\"attributes\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"test\"}}', NULL, '2025-10-23 11:39:33', '2025-10-23 11:39:33'),
(64, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: test (Robotic School) (Username: test.robotic-school)', 'App\\Models\\User', 'created', 1571, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"test.robotic-school\"}}', NULL, '2025-10-23 11:39:33', '2025-10-23 11:39:33'),
(65, 'Akun Pengguna', 'menghapus data akun pengguna: Var (Robotic School) (Username: var.robotic-school)', 'App\\Models\\User', 'deleted', 1568, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"var.robotic-school\"}}', NULL, '2025-10-23 11:53:57', '2025-10-23 11:53:57'),
(66, 'Akun Pengguna', 'menghapus data akun pengguna: siti (Robotic School) (Username: siti.robotic-school)', 'App\\Models\\User', 'deleted', 1569, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"siti.robotic-school\"}}', NULL, '2025-10-23 11:53:57', '2025-10-23 11:53:57'),
(67, 'Akun Pengguna', 'menghapus data akun pengguna: Uya (Robotic School) (Username: uya.robotic-school)', 'App\\Models\\User', 'deleted', 1570, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"uya.robotic-school\"}}', NULL, '2025-10-23 11:53:57', '2025-10-23 11:53:57'),
(68, 'Akun Pengguna', 'menghapus data akun pengguna: test (Robotic School) (Username: test.robotic-school)', 'App\\Models\\User', 'deleted', 1571, 'App\\Models\\User', 531, '{\"old\": {\"username\": \"test.robotic-school\"}}', NULL, '2025-10-23 11:53:57', '2025-10-23 11:53:57'),
(69, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: Var (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'deleted', 27, 'App\\Models\\User', 531, '{\"old\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Var\"}}', NULL, '2025-10-23 11:54:23', '2025-10-23 11:54:23'),
(70, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: siti (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'deleted', 28, 'App\\Models\\User', 531, '{\"old\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"siti\"}}', NULL, '2025-10-23 11:54:23', '2025-10-23 11:54:23'),
(71, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: Uya (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'deleted', 29, 'App\\Models\\User', 531, '{\"old\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"Uya\"}}', NULL, '2025-10-23 11:54:23', '2025-10-23 11:54:23'),
(72, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: test (Dudi ID: 11)', 'App\\Models\\DudiPembimbing', 'deleted', 30, 'App\\Models\\User', 531, '{\"old\": {\"dudi_id\": 11, \"jabatan\": null, \"nama_pembimbing\": \"test\"}}', NULL, '2025-10-23 11:54:23', '2025-10-23 11:54:23'),
(73, 'Data Dudi', 'memperbarui data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'updated', 11, 'App\\Models\\User', 531, '{\"old\": {\"alamat\": \"Bantul\"}, \"attributes\": {\"alamat\": \"Banjar Patroman\"}}', NULL, '2025-10-25 00:59:31', '2025-10-25 00:59:31'),
(74, 'Data Dudi', 'memperbarui data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'updated', 11, 'App\\Models\\User', 531, '{\"old\": {\"alamat\": \"Banjar Patroman\"}, \"attributes\": {\"alamat\": \"smk 1 banjar patroman\"}}', NULL, '2025-10-25 01:00:41', '2025-10-25 01:00:41'),
(75, 'Data Dudi', 'memperbarui data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'updated', 11, 'App\\Models\\User', 531, '{\"old\": {\"alamat\": \"smk 1 banjar patroman\"}, \"attributes\": {\"alamat\": \"proactive education,bantul,yogyakarta\"}}', NULL, '2025-10-25 01:19:21', '2025-10-25 01:19:21'),
(76, 'Data Prakerin', 'memperbarui data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'updated', 2, 'App\\Models\\User', 531, '{\"old\": {\"tanggal_selesai\": \"2025-10-23T17:00:00.000000Z\"}, \"attributes\": {\"tanggal_selesai\": \"2025-10-30T17:00:00.000000Z\"}}', NULL, '2025-10-25 13:13:45', '2025-10-25 13:13:45'),
(77, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 4, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"768\", \"keterangan\": \"Program Prakerin Tahun 2025/2026 Gelombang 2\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-10-24T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-10-30T17:00:00.000000Z\"}}', NULL, '2025-10-25 13:18:47', '2025-10-25 13:18:47'),
(78, 'Data Prakerin', 'memperbarui data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'updated', 4, 'App\\Models\\User', 531, '{\"old\": {\"keterangan\": \"Program Prakerin Tahun 2025/2026 Gelombang 2\"}, \"attributes\": {\"keterangan\": \"Program Prakerin Tahun 2025/2026 Gelombang 1\"}}', NULL, '2025-10-25 13:19:16', '2025-10-25 13:19:16'),
(79, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ZULLUL ARDAN RAFAYANTO (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 70, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2092, \"prakerin_id\": 4, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-25 13:20:24', '2025-10-25 13:20:24'),
(80, 'Data Prakerin Siswa', 'membuat data prakerin siswa: NABIL SEPTI RAMDHANI (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 71, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2082, \"prakerin_id\": 4, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-25 13:20:24', '2025-10-25 13:20:24'),
(81, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Kesya Arifatun Safanah (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 72, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2077, \"prakerin_id\": 4, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-25 13:20:24', '2025-10-25 13:20:24'),
(82, 'Data Prakerin Siswa', 'membuat data prakerin siswa: JIHAD IRFANSYAH (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 73, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2075, \"prakerin_id\": 4, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-25 13:20:24', '2025-10-25 13:20:24'),
(83, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AFRIZAL ZAHRAN MULYANA (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 74, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2059, \"prakerin_id\": 4, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-10-25 13:20:24', '2025-10-25 13:20:24'),
(84, 'Data Dudi', 'memperbarui data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'updated', 11, 'App\\Models\\User', 531, '{\"old\": {\"alamat\": \"proactive education,bantul,yogyakarta\"}, \"attributes\": {\"alamat\": \"Bantul\"}}', NULL, '2025-10-25 13:21:02', '2025-10-25 13:21:02'),
(85, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 5, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"97583275392753290\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-03T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-19T17:00:00.000000Z\"}}', NULL, '2025-11-04 05:21:06', '2025-11-04 05:21:06'),
(86, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ADE PEBRIANA (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 75, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2057, \"prakerin_id\": 5, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-04 05:22:25', '2025-11-04 05:22:25'),
(87, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ARIA RIZKY PERMANA (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 76, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2062, \"prakerin_id\": 5, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-04 05:22:25', '2025-11-04 05:22:25'),
(88, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ZULLUL ARDAN RAFAYANTO (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 77, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2092, \"prakerin_id\": 5, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-04 05:22:25', '2025-11-04 05:22:25'),
(89, 'Data Prakerin', 'membuat data prakerin: lsjfweoghwipg (2025/2026)', 'App\\Models\\Prakerin', 'created', 6, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"lsjfweoghwipg\", \"no_sk\": \"73598582\", \"keterangan\": \"Program Prakerin Gelombang 2 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"nuirwthiewhgowi\", \"tanggal_mulai\": \"2025-11-21T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-29T17:00:00.000000Z\"}}', NULL, '2025-11-04 11:44:34', '2025-11-04 11:44:34'),
(90, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 7, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"3452\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-04T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-16T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:30:14', '2025-11-05 01:30:14'),
(91, 'Data Prakerin', 'membuat data prakerin: lsjfweoghwipg (2025/2026)', 'App\\Models\\Prakerin', 'created', 8, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"lsjfweoghwipg\", \"no_sk\": \"73598582\", \"keterangan\": \"Prakerin Gelombang 2 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"nuirwthiewhgowi\", \"tanggal_mulai\": \"2025-11-17T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-25T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:31:01', '2025-11-05 01:31:01'),
(92, 'Data Prakerin', 'menghapus data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'deleted', 7, 'App\\Models\\User', 531, '{\"old\": {\"ketua\": \"sela\", \"no_sk\": \"3452\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-04T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-16T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:32:13', '2025-11-05 01:32:13'),
(93, 'Data Prakerin', 'menghapus data prakerin: lsjfweoghwipg (2025/2026)', 'App\\Models\\Prakerin', 'deleted', 8, 'App\\Models\\User', 531, '{\"old\": {\"ketua\": \"lsjfweoghwipg\", \"no_sk\": \"73598582\", \"keterangan\": \"Prakerin Gelombang 2 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"nuirwthiewhgowi\", \"tanggal_mulai\": \"2025-11-17T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-25T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:32:13', '2025-11-05 01:32:13'),
(94, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 9, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"768\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-04T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-17T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:32:49', '2025-11-05 01:32:49'),
(95, 'Data Prakerin', 'membuat data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'created', 10, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"sela\", \"no_sk\": \"73598582\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-04T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-17T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:39:49', '2025-11-05 01:39:49'),
(96, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AFRIZAL ZAHRAN MULYANA (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 78, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2059, \"prakerin_id\": 10, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(97, 'Data Prakerin Siswa', 'membuat data prakerin siswa: JIHAD IRFANSYAH (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 79, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2075, \"prakerin_id\": 10, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(98, 'Data Prakerin Siswa', 'membuat data prakerin siswa: NABIL SEPTI RAMDHANI (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 80, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2082, \"prakerin_id\": 10, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(99, 'Data Prakerin Siswa', 'membuat data prakerin siswa: ZULLUL ARDAN RAFAYANTO (No SK: 768)', 'App\\Models\\PrakerinSiswa', 'created', 81, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"768\", \"status\": \"berjalan\", \"dudi_id\": 11, \"siswa_id\": 2092, \"prakerin_id\": 10, \"dudi_pembimbing_id\": 24, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(100, 'Data Prakerin', 'membuat data prakerin: lsjfweoghwipg (2025/2026)', 'App\\Models\\Prakerin', 'created', 11, 'App\\Models\\User', 531, '{\"attributes\": {\"ketua\": \"lsjfweoghwipg\", \"no_sk\": \"3452\", \"keterangan\": \"Prakerin Gelombang 2 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"nuirwthiewhgowi\", \"tanggal_mulai\": \"2025-11-19T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-29T17:00:00.000000Z\"}}', NULL, '2025-11-05 01:46:20', '2025-11-05 01:46:20'),
(101, 'Data Prakerin Siswa', 'membuat data prakerin siswa: AYU HARTINI (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 82, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 12, \"siswa_id\": 2064, \"prakerin_id\": 11, \"dudi_pembimbing_id\": 25, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:48:06', '2025-11-05 01:48:06'),
(102, 'Data Prakerin Siswa', 'membuat data prakerin siswa: DELIA SEKAR ARUM (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 83, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 12, \"siswa_id\": 2066, \"prakerin_id\": 11, \"dudi_pembimbing_id\": 25, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(103, 'Data Prakerin Siswa', 'membuat data prakerin siswa: SELA SALAFIAH (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 84, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 12, \"siswa_id\": 2088, \"prakerin_id\": 11, \"dudi_pembimbing_id\": 25, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(104, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Kesya Arifatun Safanah (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 85, 'App\\Models\\User', 531, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 12, \"siswa_id\": 2077, \"prakerin_id\": 11, \"dudi_pembimbing_id\": 25, \"guru_pembimbing_id\": 110, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(105, 'Data Siswa', 'membuat data siswa: John Doe (NIS: 1234567890)', 'App\\Models\\Siswa', 'created', 2094, 'App\\Models\\User', 531, '{\"attributes\": {\"nis\": \"1234567890\", \"status\": \"aktif\", \"kelas_id\": 29, \"nama_siswa\": \"John Doe\", \"jenis_kelamin\": null}}', NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(106, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: John Doe (Username: 1234567890)', 'App\\Models\\User', 'created', 1572, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"1234567890\"}}', NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(107, 'Data Siswa', 'membuat data siswa: Jane Smith (NIS: 0987654321)', 'App\\Models\\Siswa', 'created', 2095, 'App\\Models\\User', 531, '{\"attributes\": {\"nis\": \"0987654321\", \"status\": \"aktif\", \"kelas_id\": 30, \"nama_siswa\": \"Jane Smith\", \"jenis_kelamin\": null}}', NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(108, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Jane Smith (Username: 0987654321)', 'App\\Models\\User', 'created', 1573, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"0987654321\"}}', NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(109, 'Data Guru', 'membuat data guru: Damian (NIP: 198001012010011001)', 'App\\Models\\Guru', 'created', 175, 'App\\Models\\User', 531, '{\"attributes\": {\"nip\": \"198001012010011001\", \"nama_guru\": \"Damian\", \"jenis_kelamin\": null, \"mata_pelajaran\": null}}', NULL, '2025-11-06 14:05:20', '2025-11-06 14:05:20'),
(110, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Damian (Username: 198001012010011001)', 'App\\Models\\User', 'created', 1574, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"198001012010011001\"}}', NULL, '2025-11-06 14:05:20', '2025-11-06 14:05:20'),
(111, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Admin SMA NEGERI PULAUKELAPA (Username: sma_negeri_pulaukelapa)', 'App\\Models\\User', 'created', 1575, 'App\\Models\\User', 1, '{\"attributes\": {\"username\": \"sma_negeri_pulaukelapa\"}}', NULL, '2025-11-06 14:23:13', '2025-11-06 14:23:13'),
(112, 'Data Kelas', 'membuat data kelas: 12 Sosiologi 1', 'App\\Models\\Kelas', 'created', 46, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Sosiologi 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-06 14:30:13', '2025-11-06 14:30:13'),
(113, 'Data Kelas', 'membuat data kelas: 12 Sosiologi 2', 'App\\Models\\Kelas', 'created', 47, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Sosiologi 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-07 14:10:46', '2025-11-07 14:10:46'),
(114, 'Data Siswa', 'membuat data siswa: John Doe (NIS: 8573825709)', 'App\\Models\\Siswa', 'created', 2097, 'App\\Models\\User', 1575, '{\"attributes\": {\"nis\": \"8573825709\", \"status\": \"aktif\", \"kelas_id\": 46, \"nama_siswa\": \"John Doe\", \"jenis_kelamin\": null}}', NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(115, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: John Doe (Username: 8573825709)', 'App\\Models\\User', 'created', 1576, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"8573825709\"}}', NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(116, 'Data Siswa', 'membuat data siswa: Jane Smith (NIS: 0129392472)', 'App\\Models\\Siswa', 'created', 2098, 'App\\Models\\User', 1575, '{\"attributes\": {\"nis\": \"0129392472\", \"status\": \"aktif\", \"kelas_id\": 47, \"nama_siswa\": \"Jane Smith\", \"jenis_kelamin\": null}}', NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(117, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Jane Smith (Username: 0129392472)', 'App\\Models\\User', 'created', 1577, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"0129392472\"}}', NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(118, 'Data Guru', 'membuat data guru: Danang (NIP: 903275328975209)', 'App\\Models\\Guru', 'created', 176, 'App\\Models\\User', 1575, '{\"attributes\": {\"nip\": \"903275328975209\", \"nama_guru\": \"Danang\", \"jenis_kelamin\": null, \"mata_pelajaran\": null}}', NULL, '2025-11-07 14:15:55', '2025-11-07 14:15:55'),
(119, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Danang (Username: 903275328975209)', 'App\\Models\\User', 'created', 1578, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"903275328975209\"}}', NULL, '2025-11-07 14:15:55', '2025-11-07 14:15:55'),
(120, 'Data Guru', 'membuat data guru: Budi (NIP: 00924729864252)', 'App\\Models\\Guru', 'created', 177, 'App\\Models\\User', 1575, '{\"attributes\": {\"nip\": \"00924729864252\", \"nama_guru\": \"Budi\", \"jenis_kelamin\": null, \"mata_pelajaran\": null}}', NULL, '2025-11-07 14:15:55', '2025-11-07 14:15:55'),
(121, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Budi (Username: 00924729864252)', 'App\\Models\\User', 'created', 1579, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"00924729864252\"}}', NULL, '2025-11-07 14:15:56', '2025-11-07 14:15:56'),
(122, 'Data Dudi', 'membuat data dudi: Disnaker Banjar (Pimpinan: )', 'App\\Models\\Dudi', 'created', 13, 'App\\Models\\User', 1575, '{\"attributes\": {\"alamat\": \"Banjar\", \"no_telp\": null, \"nama_dudi\": \"Disnaker Banjar\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 14:16:53', '2025-11-07 14:16:53'),
(123, 'Data Dudi', 'menghapus data dudi: Disnaker Banjar (Pimpinan: )', 'App\\Models\\Dudi', 'deleted', 13, 'App\\Models\\User', 1575, '{\"old\": {\"alamat\": \"Banjar\", \"no_telp\": null, \"nama_dudi\": \"Disnaker Banjar\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 14:32:35', '2025-11-07 14:32:35'),
(124, 'Data Dudi', 'membuat data dudi: Disnaker Banjar (Pimpinan: )', 'App\\Models\\Dudi', 'created', 14, 'App\\Models\\User', 1575, '{\"attributes\": {\"alamat\": \"Banjar\", \"no_telp\": null, \"nama_dudi\": \"Disnaker Banjar\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 14:32:58', '2025-11-07 14:32:58'),
(125, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Asep (Dudi ID: 14)', 'App\\Models\\DudiPembimbing', 'created', 31, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 14, \"jabatan\": null, \"nama_pembimbing\": \"Asep\"}}', NULL, '2025-11-07 14:32:58', '2025-11-07 14:32:58'),
(126, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Asep (Disnaker Banjar) (Username: asep.disnaker-banjar)', 'App\\Models\\User', 'created', 1580, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"asep.disnaker-banjar\"}}', NULL, '2025-11-07 14:32:58', '2025-11-07 14:32:58'),
(127, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Malik (Dudi ID: 14)', 'App\\Models\\DudiPembimbing', 'created', 32, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 14, \"jabatan\": null, \"nama_pembimbing\": \"Malik\"}}', NULL, '2025-11-07 15:22:40', '2025-11-07 15:22:40'),
(128, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Malik (Disnaker Banjar) (Username: malik.disnaker-banjar)', 'App\\Models\\User', 'created', 1581, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"malik.disnaker-banjar\"}}', NULL, '2025-11-07 15:22:41', '2025-11-07 15:22:41'),
(129, 'Data Dudi', 'membuat data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'created', 15, 'App\\Models\\User', 1575, '{\"attributes\": {\"alamat\": \"Bantul\", \"no_telp\": null, \"nama_dudi\": \"Robotic School\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 15:23:25', '2025-11-07 15:23:25'),
(130, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Ibnu (Dudi ID: 15)', 'App\\Models\\DudiPembimbing', 'created', 33, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 15, \"jabatan\": null, \"nama_pembimbing\": \"Ibnu\"}}', NULL, '2025-11-07 15:23:25', '2025-11-07 15:23:25'),
(131, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Malik (Dudi ID: 15)', 'App\\Models\\DudiPembimbing', 'created', 34, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 15, \"jabatan\": null, \"nama_pembimbing\": \"Malik\"}}', NULL, '2025-11-07 16:40:44', '2025-11-07 16:40:44'),
(132, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: Ibnu (Dudi ID: 15)', 'App\\Models\\DudiPembimbing', 'deleted', 33, 'App\\Models\\User', 1575, '{\"old\": {\"dudi_id\": 15, \"jabatan\": null, \"nama_pembimbing\": \"Ibnu\"}}', NULL, '2025-11-07 16:43:01', '2025-11-07 16:43:01'),
(133, 'Data Dudi Pembimbing', 'menghapus data dudi pembimbing: Malik (Dudi ID: 15)', 'App\\Models\\DudiPembimbing', 'deleted', 34, 'App\\Models\\User', 1575, '{\"old\": {\"dudi_id\": 15, \"jabatan\": null, \"nama_pembimbing\": \"Malik\"}}', NULL, '2025-11-07 16:43:01', '2025-11-07 16:43:01'),
(134, 'Data Dudi', 'menghapus data dudi: Robotic School (Pimpinan: )', 'App\\Models\\Dudi', 'deleted', 15, 'App\\Models\\User', 1575, '{\"old\": {\"alamat\": \"Bantul\", \"no_telp\": null, \"nama_dudi\": \"Robotic School\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 16:44:26', '2025-11-07 16:44:26'),
(135, 'Data Dudi', 'membuat data dudi: Prilude Studio (Pimpinan: )', 'App\\Models\\Dudi', 'created', 16, 'App\\Models\\User', 1575, '{\"attributes\": {\"alamat\": \"Tasikmalaya\", \"no_telp\": null, \"nama_dudi\": \"Prilude Studio\", \"nama_pimpinan\": null}}', NULL, '2025-11-07 16:46:01', '2025-11-07 16:46:01'),
(136, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Lily (Dudi ID: 16)', 'App\\Models\\DudiPembimbing', 'created', 35, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 16, \"jabatan\": null, \"nama_pembimbing\": \"Lily\"}}', NULL, '2025-11-07 16:46:01', '2025-11-07 16:46:01'),
(137, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Lily (Prilude Studio) (Username: lily.prilude-studio)', 'App\\Models\\User', 'created', 1582, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"lily.prilude-studio\"}}', NULL, '2025-11-07 16:46:02', '2025-11-07 16:46:02'),
(138, 'Data Prakerin', 'membuat data prakerin: Amba (2025/2026)', 'App\\Models\\Prakerin', 'created', 12, 'App\\Models\\User', 1575, '{\"attributes\": {\"ketua\": \"Amba\", \"no_sk\": \"8327538920\", \"keterangan\": \"Program Prakerin 2025/2026 Gelombang 1\", \"sekolah_id\": 6, \"sekretaris\": \"Ambacaf\", \"tanggal_mulai\": \"2025-11-06T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-29T17:00:00.000000Z\"}}', NULL, '2025-11-07 16:51:52', '2025-11-07 16:51:52'),
(139, 'Data Prakerin', 'membuat data prakerin: Swang (2025/2026)', 'App\\Models\\Prakerin', 'created', 13, 'App\\Models\\User', 1575, '{\"attributes\": {\"ketua\": \"Swang\", \"no_sk\": \"69\", \"keterangan\": \"Program Prakerin 2025/2026 Gelombang 2\", \"sekolah_id\": 6, \"sekretaris\": \"Low\", \"tanggal_mulai\": \"2025-11-30T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-12-11T17:00:00.000000Z\"}}', NULL, '2025-11-07 16:53:01', '2025-11-07 16:53:01'),
(140, 'Data Prakerin Siswa', 'membuat data prakerin siswa: John Doe (No SK: 83275209)', 'App\\Models\\PrakerinSiswa', 'created', 86, 'App\\Models\\User', 1575, '{\"attributes\": {\"no_sk\": \"83275209\", \"status\": \"berjalan\", \"dudi_id\": 16, \"siswa_id\": 2097, \"prakerin_id\": 12, \"dudi_pembimbing_id\": 35, \"guru_pembimbing_id\": 176, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(141, 'Data Prakerin Siswa', 'membuat data prakerin siswa: Jane Smith (No SK: 83275209)', 'App\\Models\\PrakerinSiswa', 'created', 87, 'App\\Models\\User', 1575, '{\"attributes\": {\"no_sk\": \"83275209\", \"status\": \"berjalan\", \"dudi_id\": 16, \"siswa_id\": 2098, \"prakerin_id\": 12, \"dudi_pembimbing_id\": 35, \"guru_pembimbing_id\": 176, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(142, 'Data Tujuan Pembelajaran', 'membuat data tujuan pembelajaran: Bersemangat', 'App\\Models\\TujuanPembelajaran', 'created', 8, 'App\\Models\\User', 1575, '{\"attributes\": {\"deskripsi\": \"Bersemangat\", \"sekolah_id\": 6}}', NULL, '2025-11-07 17:17:07', '2025-11-07 17:17:07'),
(143, 'Data Tujuan Pembelajaran', 'membuat data tujuan pembelajaran: Belajar Beradaptasi', 'App\\Models\\TujuanPembelajaran', 'created', 9, 'App\\Models\\User', 1575, '{\"attributes\": {\"deskripsi\": \"Belajar Beradaptasi\", \"sekolah_id\": 6}}', NULL, '2025-11-07 17:18:08', '2025-11-07 17:18:08'),
(144, 'Akun Pengguna', 'memperbarui data akun pengguna: Malik (Disnaker Banjar) (Username: Malik Mantap)', 'App\\Models\\User', 'updated', 1581, 'App\\Models\\User', 1581, '{\"old\": {\"username\": \"malik.disnaker-banjar\"}, \"attributes\": {\"username\": \"Malik Mantap\"}}', NULL, '2025-11-08 12:57:34', '2025-11-08 12:57:34');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(145, 'Data Siswa', 'membuat data siswa: test (NIS: test)', 'App\\Models\\Siswa', 'created', 2099, 'App\\Models\\User', 1575, '{\"attributes\": {\"nis\": \"test\", \"status\": \"aktif\", \"kelas_id\": 46, \"nama_siswa\": \"test\", \"jenis_kelamin\": null}}', NULL, '2025-11-08 13:41:42', '2025-11-08 13:41:42'),
(146, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: test (Username: test)', 'App\\Models\\User', 'created', 1583, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"test\"}}', NULL, '2025-11-08 13:41:43', '2025-11-08 13:41:43'),
(147, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Admin SEKOLAH TEST (Username: sekolah_test)', 'App\\Models\\User', 'created', 1584, 'App\\Models\\User', 1, '{\"attributes\": {\"username\": \"sekolah_test\"}}', NULL, '2025-11-09 14:23:19', '2025-11-09 14:23:19'),
(148, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: TEST 1 (Username: TEST1234)', 'App\\Models\\User', 'created', 1585, 'App\\Models\\User', 1584, '{\"attributes\": {\"username\": \"TEST1234\"}}', NULL, '2025-11-09 14:25:21', '2025-11-09 14:25:21'),
(149, 'Data Kelas', 'membuat data kelas: 12 Rekayasa 1', 'App\\Models\\Kelas', 'created', 48, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Rekayasa 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:07:35', '2025-11-10 01:07:35'),
(150, 'Data Kelas', 'membuat data kelas: 12 Rekayasa 2', 'App\\Models\\Kelas', 'created', 49, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Rekayasa 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:07:55', '2025-11-10 01:07:55'),
(151, 'Data Kelas', 'membuat data kelas: 12 Sosiologi 1', 'App\\Models\\Kelas', 'created', 50, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Sosiologi 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:44:50', '2025-11-10 01:44:50'),
(152, 'Data Kelas', 'membuat data kelas: 12 Sosiologi 2', 'App\\Models\\Kelas', 'created', 51, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Sosiologi 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:44:50', '2025-11-10 01:44:50'),
(153, 'Data Kelas', 'membuat data kelas: 12 Rekayasa 1', 'App\\Models\\Kelas', 'created', 52, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Rekayasa 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:44:50', '2025-11-10 01:44:50'),
(154, 'Data Kelas', 'membuat data kelas: 12 Rekayasa 2', 'App\\Models\\Kelas', 'created', 53, 'App\\Models\\User', 1575, '{\"attributes\": {\"nama_kelas\": \"12 Rekayasa 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:44:50', '2025-11-10 01:44:50'),
(155, 'Data Kelas', 'menghapus data kelas: 12 Sosiologi 1', 'App\\Models\\Kelas', 'deleted', 50, 'App\\Models\\User', 1575, '{\"old\": {\"nama_kelas\": \"12 Sosiologi 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:48:12', '2025-11-10 01:48:12'),
(156, 'Data Kelas', 'menghapus data kelas: 12 Sosiologi 2', 'App\\Models\\Kelas', 'deleted', 51, 'App\\Models\\User', 1575, '{\"old\": {\"nama_kelas\": \"12 Sosiologi 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:48:12', '2025-11-10 01:48:12'),
(157, 'Data Kelas', 'menghapus data kelas: 12 Rekayasa 1', 'App\\Models\\Kelas', 'deleted', 52, 'App\\Models\\User', 1575, '{\"old\": {\"nama_kelas\": \"12 Rekayasa 1\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:48:12', '2025-11-10 01:48:12'),
(158, 'Data Kelas', 'menghapus data kelas: 12 Rekayasa 2', 'App\\Models\\Kelas', 'deleted', 53, 'App\\Models\\User', 1575, '{\"old\": {\"nama_kelas\": \"12 Rekayasa 2\", \"kompetensi_keahlian\": null}}', NULL, '2025-11-10 01:48:12', '2025-11-10 01:48:12'),
(159, 'Data Prakerin', 'memperbarui data prakerin: Test (2025/2026)', 'App\\Models\\Prakerin', 'updated', 12, 'App\\Models\\User', 1575, '{\"old\": {\"ketua\": \"Amba\"}, \"attributes\": {\"ketua\": \"Test\"}}', NULL, '2025-11-10 01:54:24', '2025-11-10 01:54:24'),
(160, 'Data Prakerin Siswa', 'membuat data prakerin siswa: test (No SK: 73598582)', 'App\\Models\\PrakerinSiswa', 'created', 88, 'App\\Models\\User', 1575, '{\"attributes\": {\"no_sk\": \"73598582\", \"status\": \"berjalan\", \"dudi_id\": 14, \"siswa_id\": 2099, \"prakerin_id\": 12, \"dudi_pembimbing_id\": 31, \"guru_pembimbing_id\": 177, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(161, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: TESTING (Username: TESTING123)', 'App\\Models\\User', 'created', 1586, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"TESTING123\"}}', NULL, '2025-11-10 02:23:49', '2025-11-10 02:23:49'),
(162, 'Data Siswa', 'membuat data siswa: jk (NIS: 6758)', 'App\\Models\\Siswa', 'created', 2100, 'App\\Models\\User', 1575, '{\"attributes\": {\"nis\": \"6758\", \"status\": \"aktif\", \"kelas_id\": 49, \"nama_siswa\": \"jk\", \"jenis_kelamin\": null}}', NULL, '2025-12-08 04:38:01', '2025-12-08 04:38:01'),
(163, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: jk (Username: 6758)', 'App\\Models\\User', 'created', 1587, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"6758\"}}', NULL, '2025-12-08 04:38:02', '2025-12-08 04:38:02'),
(164, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: Malik (Dudi ID: 16)', 'App\\Models\\DudiPembimbing', 'created', 36, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 16, \"jabatan\": null, \"nama_pembimbing\": \"Malik\"}}', NULL, '2025-12-08 04:38:30', '2025-12-08 04:38:30'),
(165, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Malik (Prilude Studio) (Username: malik.prilude-studio)', 'App\\Models\\User', 'created', 1588, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"malik.prilude-studio\"}}', NULL, '2025-12-08 04:38:31', '2025-12-08 04:38:31'),
(166, 'Data Prakerin Siswa', 'membuat data prakerin siswa: jk (No SK: 34529789)', 'App\\Models\\PrakerinSiswa', 'created', 89, 'App\\Models\\User', 1575, '{\"attributes\": {\"no_sk\": \"34529789\", \"status\": \"berjalan\", \"dudi_id\": 16, \"siswa_id\": 2100, \"prakerin_id\": 13, \"dudi_pembimbing_id\": 36, \"guru_pembimbing_id\": 177, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-12-08 04:39:22', '2025-12-08 04:39:22'),
(167, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Admin SMA TEST (Username: sma_test)', 'App\\Models\\User', 'created', 1589, 'App\\Models\\User', 1, '{\"attributes\": {\"username\": \"sma_test\"}}', NULL, '2025-12-09 07:43:14', '2025-12-09 07:43:14'),
(168, 'Data Prakerin', 'menghapus data prakerin: Swang (2025/2026)', 'App\\Models\\Prakerin', 'deleted', 13, 'App\\Models\\User', 1575, '{\"old\": {\"ketua\": \"Swang\", \"no_sk\": \"69\", \"keterangan\": \"Program Prakerin 2025/2026 Gelombang 2\", \"sekolah_id\": 6, \"sekretaris\": \"Low\", \"tanggal_mulai\": \"2025-11-30T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-12-11T17:00:00.000000Z\"}}', NULL, '2025-12-12 09:57:01', '2025-12-12 09:57:01'),
(169, 'Data Prakerin', 'membuat data prakerin: Testing (2025/2026)', 'App\\Models\\Prakerin', 'created', 14, 'App\\Models\\User', 1575, '{\"attributes\": {\"ketua\": \"Testing\", \"no_sk\": \"43867209674209\", \"keterangan\": \"Prakerin Gelombang 2 Tahun 2025/2026\", \"sekolah_id\": 6, \"sekretaris\": \"Testing\", \"tanggal_mulai\": \"2025-12-11T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-12-30T17:00:00.000000Z\"}}', NULL, '2025-12-12 09:57:55', '2025-12-12 09:57:55'),
(170, 'Data Prakerin Siswa', 'membuat data prakerin siswa: jk (No SK: 3452)', 'App\\Models\\PrakerinSiswa', 'created', 90, 'App\\Models\\User', 1575, '{\"attributes\": {\"no_sk\": \"3452\", \"status\": \"berjalan\", \"dudi_id\": 16, \"siswa_id\": 2100, \"prakerin_id\": 14, \"dudi_pembimbing_id\": 36, \"guru_pembimbing_id\": 177, \"hari_kerja_per_minggu\": 5}}', NULL, '2025-12-12 09:58:44', '2025-12-12 09:58:44'),
(171, 'Data Dudi', 'membuat data dudi: test (Pimpinan: )', 'App\\Models\\Dudi', 'created', 17, 'App\\Models\\User', 1575, '{\"attributes\": {\"alamat\": \"test\", \"no_telp\": null, \"nama_dudi\": \"test\", \"nama_pimpinan\": null}}', NULL, '2025-12-16 09:59:32', '2025-12-16 09:59:32'),
(172, 'Data Dudi Pembimbing', 'membuat data dudi pembimbing: test (Dudi ID: 17)', 'App\\Models\\DudiPembimbing', 'created', 37, 'App\\Models\\User', 1575, '{\"attributes\": {\"dudi_id\": 17, \"jabatan\": null, \"nama_pembimbing\": \"test\"}}', NULL, '2025-12-16 09:59:33', '2025-12-16 09:59:33'),
(173, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: test (test) (Username: test.test)', 'App\\Models\\User', 'created', 1590, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"test.test\"}}', NULL, '2025-12-16 09:59:33', '2025-12-16 09:59:33'),
(174, 'Data Prakerin', 'menghapus data prakerin: sela (2025/2026)', 'App\\Models\\Prakerin', 'deleted', 10, 'App\\Models\\User', 531, '{\"old\": {\"ketua\": \"sela\", \"no_sk\": \"73598582\", \"keterangan\": \"Prakerin Gelombang 1 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"sely\", \"tanggal_mulai\": \"2025-11-04T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-17T17:00:00.000000Z\"}}', NULL, '2025-12-17 10:18:32', '2025-12-17 10:18:32'),
(175, 'Data Prakerin', 'menghapus data prakerin: lsjfweoghwipg (2025/2026)', 'App\\Models\\Prakerin', 'deleted', 11, 'App\\Models\\User', 531, '{\"old\": {\"ketua\": \"lsjfweoghwipg\", \"no_sk\": \"3452\", \"keterangan\": \"Prakerin Gelombang 2 2025/2026\", \"sekolah_id\": 5, \"sekretaris\": \"nuirwthiewhgowi\", \"tanggal_mulai\": \"2025-11-19T17:00:00.000000Z\", \"tahun_ajaran_id\": 1, \"tanggal_selesai\": \"2025-11-29T17:00:00.000000Z\"}}', NULL, '2025-12-17 10:18:38', '2025-12-17 10:18:38'),
(176, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALFIAH AZZAHRA (Username: ortu_2324101289)', 'App\\Models\\User', 'created', 1592, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101289\"}}', NULL, '2025-12-18 03:02:26', '2025-12-18 03:02:26'),
(177, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIKA RAHMAWATI (Username: ortu_2324101290)', 'App\\Models\\User', 'created', 1593, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101290\"}}', NULL, '2025-12-18 03:02:26', '2025-12-18 03:02:26'),
(178, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANISA RAHMA SAPITRI (Username: ortu_2324101291)', 'App\\Models\\User', 'created', 1594, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101291\"}}', NULL, '2025-12-18 03:02:27', '2025-12-18 03:02:27'),
(179, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AYU SAKILA (Username: ortu_2324101292)', 'App\\Models\\User', 'created', 1595, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101292\"}}', NULL, '2025-12-18 03:02:27', '2025-12-18 03:02:27'),
(180, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DEVIA UTARI (Username: ortu_2324101293)', 'App\\Models\\User', 'created', 1596, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101293\"}}', NULL, '2025-12-18 03:02:28', '2025-12-18 03:02:28'),
(181, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DINI AHIRUL DESTIANTI (Username: ortu_2324101294)', 'App\\Models\\User', 'created', 1597, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101294\"}}', NULL, '2025-12-18 03:02:28', '2025-12-18 03:02:28'),
(182, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dzakir Azhar (Username: ortu_2324101295)', 'App\\Models\\User', 'created', 1598, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101295\"}}', NULL, '2025-12-18 03:02:28', '2025-12-18 03:02:28'),
(183, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Elvira Khaerunissa (Username: ortu_2324101296)', 'App\\Models\\User', 'created', 1599, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101296\"}}', NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29'),
(184, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FINANDA YUGA MANGGALA (Username: ortu_2324101297)', 'App\\Models\\User', 'created', 1600, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101297\"}}', NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29'),
(185, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FITRI SASKIA RAMADHANI (Username: ortu_2324101298)', 'App\\Models\\User', 'created', 1601, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101298\"}}', NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29'),
(186, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GALANG (Username: ortu_2324101299)', 'App\\Models\\User', 'created', 1602, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101299\"}}', NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30'),
(187, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GALANG FIRMANSYAH (Username: ortu_2324101300)', 'App\\Models\\User', 'created', 1603, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101300\"}}', NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30'),
(188, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GISCA NAFISA DESTIANA (Username: ortu_2324101301)', 'App\\Models\\User', 'created', 1604, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101301\"}}', NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30'),
(189, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HAMIA NURALIA ZAHRA (Username: ortu_2324101302)', 'App\\Models\\User', 'created', 1605, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101302\"}}', NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31'),
(190, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MARSHA ADELIA PUTRI RIDWANSYAH (Username: ortu_2324101303)', 'App\\Models\\User', 'created', 1606, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101303\"}}', NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31'),
(191, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MARTESA PASKARIANTY (Username: ortu_2324101304)', 'App\\Models\\User', 'created', 1607, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101304\"}}', NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31'),
(192, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MEILINDA KHOERUNNISA (Username: ortu_2324101305)', 'App\\Models\\User', 'created', 1608, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101305\"}}', NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32'),
(193, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MIFTAHUL KHOIR (Username: ortu_2324101306)', 'App\\Models\\User', 'created', 1609, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101306\"}}', NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32'),
(194, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD FACHRI NUGRAHA (Username: ortu_2324101542)', 'App\\Models\\User', 'created', 1610, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101542\"}}', NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32'),
(195, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUTHYA PRATIWI (Username: ortu_2324101307)', 'App\\Models\\User', 'created', 1611, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101307\"}}', NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33'),
(196, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nafisa Salsabila Ramadhani (Username: ortu_2324101308)', 'App\\Models\\User', 'created', 1612, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101308\"}}', NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33'),
(197, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nasya Saufika Wati (Username: ortu_2324101309)', 'App\\Models\\User', 'created', 1613, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101309\"}}', NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33'),
(198, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nazhara Syahida (Username: ortu_2324101310)', 'App\\Models\\User', 'created', 1614, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101310\"}}', NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34'),
(199, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nuri Awwaliah (Username: ortu_2324101312)', 'App\\Models\\User', 'created', 1615, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101312\"}}', NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34'),
(200, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RACHEL PUTRI RAMADHANI (Username: ortu_2324101313)', 'App\\Models\\User', 'created', 1616, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101313\"}}', NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34'),
(201, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAIHAN SUPRYATNA (Username: ortu_2324101314)', 'App\\Models\\User', 'created', 1617, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101314\"}}', NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34'),
(202, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Raisya Isni Masdiana (Username: ortu_2324101315)', 'App\\Models\\User', 'created', 1618, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101315\"}}', NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35'),
(203, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rapi Priatna (Username: ortu_2324101316)', 'App\\Models\\User', 'created', 1619, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101316\"}}', NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35'),
(204, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAYZA HUMAIRA (Username: ortu_2324101317)', 'App\\Models\\User', 'created', 1620, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101317\"}}', NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35'),
(205, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Refan Pratama (Username: ortu_2324101318)', 'App\\Models\\User', 'created', 1621, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101318\"}}', NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35'),
(206, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RINI APRIANI (Username: ortu_2324101319)', 'App\\Models\\User', 'created', 1622, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101319\"}}', NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36'),
(207, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIRIN CITRA NUR\'AENI (Username: ortu_2324101320)', 'App\\Models\\User', 'created', 1623, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101320\"}}', NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36'),
(208, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SILPI HANDAYANI (Username: ortu_2324101321)', 'App\\Models\\User', 'created', 1624, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101321\"}}', NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36'),
(209, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Silva Julianty (Username: ortu_2324101322)', 'App\\Models\\User', 'created', 1625, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101322\"}}', NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37'),
(210, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Wiliyanti Pergiwa (Username: ortu_2324101324)', 'App\\Models\\User', 'created', 1626, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101324\"}}', NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37'),
(211, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AGNI DWI LISTYANTO (Username: ortu_2324101325)', 'App\\Models\\User', 'created', 1627, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101325\"}}', NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37'),
(212, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Alya Sahwa Nuralif (Username: ortu_2324101326)', 'App\\Models\\User', 'created', 1628, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101326\"}}', NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37'),
(213, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMELIA PUTRI (Username: ortu_2324101327)', 'App\\Models\\User', 'created', 1629, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101327\"}}', NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38'),
(214, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ayunda Pramesty Setiawan (Username: ortu_2324101328)', 'App\\Models\\User', 'created', 1630, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101328\"}}', NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38'),
(215, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Chelsi Aprilia Manik (Username: ortu_2324101329)', 'App\\Models\\User', 'created', 1631, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101329\"}}', NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38'),
(216, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari CHIKA AURELYA PUTRI ANJANI (Username: ortu_2324101330)', 'App\\Models\\User', 'created', 1632, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101330\"}}', NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38'),
(217, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dianty Syarifah Mechdar (Username: ortu_2324101331)', 'App\\Models\\User', 'created', 1633, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101331\"}}', NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39'),
(218, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dini Septriani (Username: ortu_2324101332)', 'App\\Models\\User', 'created', 1634, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101332\"}}', NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39'),
(219, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DINNA NUR RAHMA (Username: ortu_2324101333)', 'App\\Models\\User', 'created', 1635, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101333\"}}', NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39'),
(220, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FATURROHMAN (Username: ortu_2324101334)', 'App\\Models\\User', 'created', 1636, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101334\"}}', NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39'),
(221, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IKA OKTAVIANI (Username: ortu_2324101335)', 'App\\Models\\User', 'created', 1637, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101335\"}}', NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40'),
(222, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MARYAM PUSPA DEWI (Username: ortu_2324101336)', 'App\\Models\\User', 'created', 1638, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101336\"}}', NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40'),
(223, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MAYA SUPRIHATIN (Username: ortu_2324101337)', 'App\\Models\\User', 'created', 1639, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101337\"}}', NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40'),
(224, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MEILANA GUSTIANA (Username: ortu_2324101338)', 'App\\Models\\User', 'created', 1640, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101338\"}}', NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41'),
(225, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MEILANI FITRIANI (Username: ortu_2324101339)', 'App\\Models\\User', 'created', 1641, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101339\"}}', NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41'),
(226, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD NADIP SUDIRMAN (Username: ortu_2324101340)', 'App\\Models\\User', 'created', 1642, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101340\"}}', NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41'),
(227, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NANDITA NOVELIA PUTRI SETIAWAN (Username: ortu_2324101341)', 'App\\Models\\User', 'created', 1643, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101341\"}}', NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41'),
(228, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NATHASYA ANANDIRA (Username: ortu_2324101342)', 'App\\Models\\User', 'created', 1644, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101342\"}}', NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42'),
(229, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAYLA PUTRI MAHARANI (Username: ortu_2324101343)', 'App\\Models\\User', 'created', 1645, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101343\"}}', NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42'),
(230, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nazwa Ramadhaniah (Username: ortu_2324101344)', 'App\\Models\\User', 'created', 1646, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101344\"}}', NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42'),
(231, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nida Fairuz Anisah (Username: ortu_2324101345)', 'App\\Models\\User', 'created', 1647, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101345\"}}', NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42'),
(232, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NITA PUSPITASARI (Username: ortu_2324101346)', 'App\\Models\\User', 'created', 1648, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101346\"}}', NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43'),
(233, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NURUL NUR IHSAN (Username: ortu_2324101347)', 'App\\Models\\User', 'created', 1649, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101347\"}}', NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43'),
(234, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RACHMA PUSPITA (Username: ortu_2324101349)', 'App\\Models\\User', 'created', 1650, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101349\"}}', NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43'),
(235, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rangga Saputra (Username: ortu_2324101350)', 'App\\Models\\User', 'created', 1651, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101350\"}}', NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43'),
(236, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REPAN TRI RAHMAT (Username: ortu_2324101351)', 'App\\Models\\User', 'created', 1652, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101351\"}}', NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44'),
(237, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Reva Alkalivi (Username: ortu_2324101352)', 'App\\Models\\User', 'created', 1653, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101352\"}}', NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44'),
(238, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REVA OCTA PRATIWI (Username: ortu_2324101353)', 'App\\Models\\User', 'created', 1654, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101353\"}}', NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44'),
(239, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REVAN TRAKASYA (Username: ortu_2324101354)', 'App\\Models\\User', 'created', 1655, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101354\"}}', NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45'),
(240, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIFA MEILANI (Username: ortu_2324101355)', 'App\\Models\\User', 'created', 1656, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101355\"}}', NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45'),
(241, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RISKA YULIANI (Username: ortu_2324101356)', 'App\\Models\\User', 'created', 1657, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101356\"}}', NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45'),
(242, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SERLY HANDRAYANI (Username: ortu_2324101357)', 'App\\Models\\User', 'created', 1658, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101357\"}}', NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45'),
(243, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SILVIANA PITRI MULYADI (Username: ortu_2324101358)', 'App\\Models\\User', 'created', 1659, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101358\"}}', NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46'),
(244, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SITI ROHMAYATI (Username: ortu_2324101359)', 'App\\Models\\User', 'created', 1660, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101359\"}}', NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46'),
(245, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Yunita Sari (Username: ortu_2324101360)', 'App\\Models\\User', 'created', 1661, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101360\"}}', NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46'),
(246, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ade vera latifah (Username: ortu_2324101073)', 'App\\Models\\User', 'created', 1662, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101073\"}}', NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46'),
(247, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIS AMELIA SARI (Username: ortu_2324101074)', 'App\\Models\\User', 'created', 1663, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101074\"}}', NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47'),
(248, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Alsya Nurfadilah (Username: ortu_2324101075)', 'App\\Models\\User', 'created', 1664, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101075\"}}', NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47'),
(249, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANNISA ARTIKA FADILAH (Username: ortu_2324101076)', 'App\\Models\\User', 'created', 1665, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101076\"}}', NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47'),
(250, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARIEF NURAHMAN (Username: ortu_2324101077)', 'App\\Models\\User', 'created', 1666, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101077\"}}', NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47'),
(251, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Arta Yunita (Username: ortu_2324101078)', 'App\\Models\\User', 'created', 1667, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101078\"}}', NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48'),
(252, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AYU LATIFA NURSABRINA (Username: ortu_2324101079)', 'App\\Models\\User', 'created', 1668, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101079\"}}', NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48'),
(253, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AZARAH TUSITA YUSLIANI (Username: ortu_2324101080)', 'App\\Models\\User', 'created', 1669, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101080\"}}', NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48'),
(254, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari BUNGA RISMA RAMADHANTY (Username: ortu_2324101081)', 'App\\Models\\User', 'created', 1670, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101081\"}}', NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48'),
(255, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dinda Niken Pradita (Username: ortu_2324101082)', 'App\\Models\\User', 'created', 1671, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101082\"}}', NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49'),
(256, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DWI NUGROHO (Username: ortu_2324101083)', 'App\\Models\\User', 'created', 1672, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101083\"}}', NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49'),
(257, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari EGI NUGRAHA (Username: ortu_2324101084)', 'App\\Models\\User', 'created', 1673, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101084\"}}', NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49'),
(258, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HAZZA DWI NURHIDAYAT (Username: ortu_2324101085)', 'App\\Models\\User', 'created', 1674, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101085\"}}', NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50'),
(259, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Hilda Raditya Ramadani (Username: ortu_2324101086)', 'App\\Models\\User', 'created', 1675, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101086\"}}', NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50'),
(260, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ILHAM HANAFI (Username: ortu_2324101087)', 'App\\Models\\User', 'created', 1676, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101087\"}}', NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50'),
(261, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari JELITA RESTIANTY (Username: ortu_2324101088)', 'App\\Models\\User', 'created', 1677, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101088\"}}', NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50'),
(262, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Juliyanti (Username: ortu_2324101089)', 'App\\Models\\User', 'created', 1678, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101089\"}}', NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51'),
(263, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Khalisa Handini (Username: ortu_2324101090)', 'App\\Models\\User', 'created', 1679, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101090\"}}', NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51'),
(264, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KIKIM PATIMAH (Username: ortu_2324101091)', 'App\\Models\\User', 'created', 1680, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101091\"}}', NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51'),
(265, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Miftahul Jannah (Username: ortu_2324101092)', 'App\\Models\\User', 'created', 1681, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101092\"}}', NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51'),
(266, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhammad Fadillah Al Hijriyah (Username: ortu_2324101093)', 'App\\Models\\User', 'created', 1682, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101093\"}}', NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52'),
(267, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAURA ALIFA PUTRI RIZAL (Username: ortu_2324101094)', 'App\\Models\\User', 'created', 1683, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101094\"}}', NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52'),
(268, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAZLA SHERLY NOER ISMAYANTI (Username: ortu_2324101095)', 'App\\Models\\User', 'created', 1684, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101095\"}}', NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52'),
(269, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nopa Juwita Indriyani (Username: ortu_2324101096)', 'App\\Models\\User', 'created', 1685, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101096\"}}', NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52'),
(270, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NURUL NURAZIZAH (Username: ortu_2324101097)', 'App\\Models\\User', 'created', 1686, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101097\"}}', NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53'),
(271, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rayhan Nuryaqin (Username: ortu_2324101098)', 'App\\Models\\User', 'created', 1687, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101098\"}}', NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53'),
(272, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RHOFIQ RAMDHANI (Username: ortu_2324101099)', 'App\\Models\\User', 'created', 1688, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101099\"}}', NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53'),
(273, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RISTI NURSITA (Username: ortu_2324101100)', 'App\\Models\\User', 'created', 1689, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101100\"}}', NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54'),
(274, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIZKY FAHRIZA HAKIKI (Username: ortu_2324101101)', 'App\\Models\\User', 'created', 1690, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101101\"}}', NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54'),
(275, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SASA ARI JUANDA (Username: ortu_2324101102)', 'App\\Models\\User', 'created', 1691, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101102\"}}', NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54'),
(276, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SINTA NURJANAH (Username: ortu_2324101103)', 'App\\Models\\User', 'created', 1692, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101103\"}}', NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54'),
(277, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SYALWA SALSABILA (Username: ortu_2324101104)', 'App\\Models\\User', 'created', 1693, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101104\"}}', NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55'),
(278, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari TASYA APRIANI (Username: ortu_2324101106)', 'App\\Models\\User', 'created', 1694, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101106\"}}', NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55'),
(279, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Tiara Ayu Herliana (Username: ortu_2324101107)', 'App\\Models\\User', 'created', 1695, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101107\"}}', NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55'),
(280, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari WILDAN NUR FADILLAH (Username: ortu_2324101108)', 'App\\Models\\User', 'created', 1696, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101108\"}}', NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55'),
(281, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADI FITRIANA (Username: ortu_2324101109)', 'App\\Models\\User', 'created', 1697, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101109\"}}', NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56'),
(282, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADINDA RAMADANI (Username: ortu_2324101110)', 'App\\Models\\User', 'created', 1698, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101110\"}}', NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56'),
(283, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMANDA RAENA DEWI (Username: ortu_2324101111)', 'App\\Models\\User', 'created', 1699, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101111\"}}', NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56'),
(284, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMARA NUR APRILIA (Username: ortu_2324101112)', 'App\\Models\\User', 'created', 1700, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101112\"}}', NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56'),
(285, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMELIA GUSTAMI (Username: ortu_2324101113)', 'App\\Models\\User', 'created', 1701, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101113\"}}', NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57'),
(286, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARGALIH SETIAWAN (Username: ortu_2324101115)', 'App\\Models\\User', 'created', 1702, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101115\"}}', NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57'),
(287, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Arvia Deswita Saripudin (Username: ortu_2324101116)', 'App\\Models\\User', 'created', 1703, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101116\"}}', NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57'),
(288, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Asti Surastri (Username: ortu_2324101117)', 'App\\Models\\User', 'created', 1704, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101117\"}}', NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57'),
(289, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AZKA SHIDDQIE HARUMAN (Username: ortu_2324101118)', 'App\\Models\\User', 'created', 1705, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101118\"}}', NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58'),
(290, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Bunga Cinta Apriliani (Username: ortu_2324101119)', 'App\\Models\\User', 'created', 1706, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101119\"}}', NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58'),
(291, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Danar Khusnul Khofiza (Username: ortu_2324101120)', 'App\\Models\\User', 'created', 1707, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101120\"}}', NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58'),
(292, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DARA AYU LARASATI (Username: ortu_2324101121)', 'App\\Models\\User', 'created', 1708, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101121\"}}', NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59'),
(293, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DELA HERLIAWATI (Username: ortu_2324101122)', 'App\\Models\\User', 'created', 1709, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101122\"}}', NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59'),
(294, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari EVA AISYAH RAHMAWATI (Username: ortu_2324101123)', 'App\\Models\\User', 'created', 1710, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101123\"}}', NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59'),
(295, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fetti Rizki Lestari (Username: ortu_2324101124)', 'App\\Models\\User', 'created', 1711, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101124\"}}', NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59'),
(296, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fitri Oktaviani (Username: ortu_2324101125)', 'App\\Models\\User', 'created', 1712, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101125\"}}', NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00'),
(297, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IDIN MUHYDIN (Username: ortu_2324101126)', 'App\\Models\\User', 'created', 1713, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101126\"}}', NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00'),
(298, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari INTAN SRIWAHYUNI (Username: ortu_2324101127)', 'App\\Models\\User', 'created', 1714, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101127\"}}', NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00'),
(299, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari JAJANG NUGRAHA (Username: ortu_2324101128)', 'App\\Models\\User', 'created', 1715, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101128\"}}', NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00'),
(300, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Milan Muhammad Miftah (Username: ortu_2324101129)', 'App\\Models\\User', 'created', 1716, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101129\"}}', NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01'),
(301, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MONALISA PUTRI UTAMI (Username: ortu_2324101130)', 'App\\Models\\User', 'created', 1717, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101130\"}}', NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01'),
(302, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NUR AYU WIDIASARI (Username: ortu_2324101131)', 'App\\Models\\User', 'created', 1718, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101131\"}}', NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01'),
(303, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Puput Maulana Habibah (Username: ortu_2324101132)', 'App\\Models\\User', 'created', 1719, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101132\"}}', NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01'),
(304, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Reisya Zahrotusyitha (Username: ortu_2324101133)', 'App\\Models\\User', 'created', 1720, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101133\"}}', NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02'),
(305, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REZA (Username: ortu_2324101134)', 'App\\Models\\User', 'created', 1721, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101134\"}}', NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02'),
(306, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RISMA YULIANIKA (Username: ortu_2324101135)', 'App\\Models\\User', 'created', 1722, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101135\"}}', NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02'),
(307, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SATRIA ARRAS (Username: ortu_2324101136)', 'App\\Models\\User', 'created', 1723, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101136\"}}', NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02'),
(308, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SHAZIA AULIA (Username: ortu_2324101137)', 'App\\Models\\User', 'created', 1724, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101137\"}}', NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03'),
(309, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SHELLA AMELIA (Username: ortu_2324101138)', 'App\\Models\\User', 'created', 1725, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101138\"}}', NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(310, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SINTA RAHAYU (Username: ortu_2324101139)', 'App\\Models\\User', 'created', 1726, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101139\"}}', NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03'),
(311, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Syaakira Naura Az zahra (Username: ortu_2324101140)', 'App\\Models\\User', 'created', 1727, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101140\"}}', NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03'),
(312, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari VASHA NAYSILA HIDAYAT (Username: ortu_2324101141)', 'App\\Models\\User', 'created', 1728, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101141\"}}', NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04'),
(313, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Wegi Putra Prayitno (Username: ortu_2324101142)', 'App\\Models\\User', 'created', 1729, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101142\"}}', NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04'),
(314, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari YULIA ANDHANI (Username: ortu_2324101143)', 'App\\Models\\User', 'created', 1730, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101143\"}}', NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04'),
(315, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ZENAL ARIFIN (Username: ortu_2324101144)', 'App\\Models\\User', 'created', 1731, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101144\"}}', NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05'),
(316, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADDIN HANIFA (Username: ortu_2324101145)', 'App\\Models\\User', 'created', 1732, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101145\"}}', NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05'),
(317, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Aditya Agung Nugraha (Username: ortu_2324101146)', 'App\\Models\\User', 'created', 1733, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101146\"}}', NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05'),
(318, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADRIAN AFRIANSYAH (Username: ortu_2324101147)', 'App\\Models\\User', 'created', 1734, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101147\"}}', NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05'),
(319, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AKMAL APRILLIANA NUGRAHA (Username: ortu_2324101148)', 'App\\Models\\User', 'created', 1735, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101148\"}}', NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06'),
(320, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANNISA FEBRIANI (Username: ortu_2324101149)', 'App\\Models\\User', 'created', 1736, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101149\"}}', NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06'),
(321, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari BELA SEFIRA (Username: ortu_2324101150)', 'App\\Models\\User', 'created', 1737, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101150\"}}', NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06'),
(322, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DEBY JUANITA (Username: ortu_2324101151)', 'App\\Models\\User', 'created', 1738, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101151\"}}', NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06'),
(323, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DELIA ANJANI (Username: ortu_2324101152)', 'App\\Models\\User', 'created', 1739, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101152\"}}', NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07'),
(324, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DERIS NURIYAN (Username: ortu_2324101153)', 'App\\Models\\User', 'created', 1740, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101153\"}}', NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07'),
(325, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DERIS TRI OKTAPIANA (Username: ortu_2324101154)', 'App\\Models\\User', 'created', 1741, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101154\"}}', NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07'),
(326, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DESTA EKKI SAPUTRA (Username: ortu_2324101155)', 'App\\Models\\User', 'created', 1742, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101155\"}}', NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07'),
(327, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Diko Salman Alfarisi (Username: ortu_2324101156)', 'App\\Models\\User', 'created', 1743, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101156\"}}', NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08'),
(328, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Eka Cindy Ariyanti (Username: ortu_2324101158)', 'App\\Models\\User', 'created', 1744, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101158\"}}', NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08'),
(329, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HANIF MAULANA (Username: ortu_2324101159)', 'App\\Models\\User', 'created', 1745, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101159\"}}', NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08'),
(330, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari LUSY MAULUDINA FIRDAUS (Username: ortu_2324101160)', 'App\\Models\\User', 'created', 1746, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101160\"}}', NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08'),
(331, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari M Pariz Ali Alvi Mubarok (Username: ortu_2324101161)', 'App\\Models\\User', 'created', 1747, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101161\"}}', NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09'),
(332, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMAD RIFKI ARDIANSAH (Username: ortu_2324101162)', 'App\\Models\\User', 'created', 1748, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101162\"}}', NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09'),
(333, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhammad Dhika Fadillah (Username: ortu_2324101163)', 'App\\Models\\User', 'created', 1749, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101163\"}}', NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09'),
(334, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NADIA SETIA ANANDA (Username: ortu_2324101164)', 'App\\Models\\User', 'created', 1750, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101164\"}}', NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10'),
(335, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nina Apriliani (Username: ortu_2324101165)', 'App\\Models\\User', 'created', 1751, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101165\"}}', NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10'),
(336, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NINA HERLINA (Username: ortu_2324101166)', 'App\\Models\\User', 'created', 1752, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101166\"}}', NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10'),
(337, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NOVA APRILIANI (Username: ortu_2324101167)', 'App\\Models\\User', 'created', 1753, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101167\"}}', NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10'),
(338, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PUTRI LAFTAIN (Username: ortu_2324101168)', 'App\\Models\\User', 'created', 1754, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101168\"}}', NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11'),
(339, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Putri Sauvikha Anjari (Username: ortu_2324101169)', 'App\\Models\\User', 'created', 1755, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101169\"}}', NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11'),
(340, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAIHAN RAFI KUSWANTO (Username: ortu_2324101170)', 'App\\Models\\User', 'created', 1756, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101170\"}}', NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11'),
(341, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REISA PUTRI RIZKIANI SAEPUDIN (Username: ortu_2324101171)', 'App\\Models\\User', 'created', 1757, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101171\"}}', NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11'),
(342, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RESA FITRIYAN (Username: ortu_2324101172)', 'App\\Models\\User', 'created', 1758, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101172\"}}', NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12'),
(343, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RESNA ADELIA (Username: ortu_2324101173)', 'App\\Models\\User', 'created', 1759, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101173\"}}', NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12'),
(344, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SANTI SRI WININGSIH (Username: ortu_2324101174)', 'App\\Models\\User', 'created', 1760, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101174\"}}', NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12'),
(345, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Sela Merliyani (Username: ortu_2324101175)', 'App\\Models\\User', 'created', 1761, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101175\"}}', NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12'),
(346, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Selvi Dwi Rahmawati (Username: ortu_2324101176)', 'App\\Models\\User', 'created', 1762, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101176\"}}', NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13'),
(347, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SHIFA DWI MARYADI (Username: ortu_2324101177)', 'App\\Models\\User', 'created', 1763, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101177\"}}', NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13'),
(348, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari TISA RAMDAN SEPTIA (Username: ortu_2324101178)', 'App\\Models\\User', 'created', 1764, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101178\"}}', NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13'),
(349, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari WINDI AISHA JAUHARAH (Username: ortu_2324101179)', 'App\\Models\\User', 'created', 1765, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101179\"}}', NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13'),
(350, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ZAHRA FATHONIA (Username: ortu_2324101180)', 'App\\Models\\User', 'created', 1766, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101180\"}}', NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14'),
(351, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Abdul Musholim Arraniry (Username: ortu_2324101361)', 'App\\Models\\User', 'created', 1767, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101361\"}}', NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14'),
(352, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ade Ridwan Maulana (Username: ortu_2324101362)', 'App\\Models\\User', 'created', 1768, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101362\"}}', NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14'),
(353, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Agni Aina Lukman (Username: ortu_2324101363)', 'App\\Models\\User', 'created', 1769, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101363\"}}', NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15'),
(354, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIYA RAMADHANI (Username: ortu_2324101364)', 'App\\Models\\User', 'created', 1770, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101364\"}}', NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15'),
(355, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Andri Wiguna (Username: ortu_2324101365)', 'App\\Models\\User', 'created', 1771, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101365\"}}', NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15'),
(356, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANNISA NUUR QOLBI (Username: ortu_2425101541)', 'App\\Models\\User', 'created', 1772, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2425101541\"}}', NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15'),
(357, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ayu Febriani (Username: ortu_2324101367)', 'App\\Models\\User', 'created', 1773, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101367\"}}', NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16'),
(358, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari CIPTO ADE RAMDANI (Username: ortu_2324101368)', 'App\\Models\\User', 'created', 1774, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101368\"}}', NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16'),
(359, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dava Fauzan Aziz (Username: ortu_2324101369)', 'App\\Models\\User', 'created', 1775, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101369\"}}', NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16'),
(360, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Defa Fachrizal Ramadhan (Username: ortu_2324101370)', 'App\\Models\\User', 'created', 1776, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101370\"}}', NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16'),
(361, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DINDA SILVI NURAPRIANI (Username: ortu_2324101371)', 'App\\Models\\User', 'created', 1777, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101371\"}}', NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17'),
(362, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ERINA SRI ANJANI (Username: ortu_2324101372)', 'App\\Models\\User', 'created', 1778, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101372\"}}', NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17'),
(363, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fadhil Ahmad Farizi (Username: ortu_2324101373)', 'App\\Models\\User', 'created', 1779, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101373\"}}', NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17'),
(364, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FALIH MUHAMMAD NAZMI (Username: ortu_2324101374)', 'App\\Models\\User', 'created', 1780, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101374\"}}', NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17'),
(365, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FARIZ PAHRUDIN (Username: ortu_2324101375)', 'App\\Models\\User', 'created', 1781, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101375\"}}', NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18'),
(366, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FERGI ADITYA (Username: ortu_2324101376)', 'App\\Models\\User', 'created', 1782, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101376\"}}', NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18'),
(367, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GILANG ADRIAN PRATAMA (Username: ortu_2324101377)', 'App\\Models\\User', 'created', 1783, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101377\"}}', NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18'),
(368, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IRFAN HASNIAR AZIS (Username: ortu_2324101379)', 'App\\Models\\User', 'created', 1784, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101379\"}}', NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18'),
(369, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IRGI ZAOZA SALSABILA (Username: ortu_2324101380)', 'App\\Models\\User', 'created', 1785, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101380\"}}', NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19'),
(370, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Kurnia Bela Agustina (Username: ortu_2324101381)', 'App\\Models\\User', 'created', 1786, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101381\"}}', NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19'),
(371, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Leni Nuraeni (Username: ortu_2324101382)', 'App\\Models\\User', 'created', 1787, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101382\"}}', NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19'),
(372, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Lutpika Puspitasari (Username: ortu_2324101383)', 'App\\Models\\User', 'created', 1788, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101383\"}}', NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20'),
(373, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD AGUSTIAN PUTRA (Username: ortu_2324101384)', 'App\\Models\\User', 'created', 1789, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101384\"}}', NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20'),
(374, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAUFAL ALIFIANTO (Username: ortu_2324101386)', 'App\\Models\\User', 'created', 1790, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101386\"}}', NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20'),
(375, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAUFAL MUYASSAR YUMAS PUTRA (Username: ortu_2324101387)', 'App\\Models\\User', 'created', 1791, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101387\"}}', NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20'),
(376, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NISA MARSAL (Username: ortu_2324101388)', 'App\\Models\\User', 'created', 1792, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101388\"}}', NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21'),
(377, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Raifal Fadliansyah Fauji (Username: ortu_2324101389)', 'App\\Models\\User', 'created', 1793, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101389\"}}', NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21'),
(378, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAYHAN DARUNNAZWA (Username: ortu_2324101390)', 'App\\Models\\User', 'created', 1794, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101390\"}}', NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21'),
(379, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RENI ANGGRAENI (Username: ortu_2324101391)', 'App\\Models\\User', 'created', 1795, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101391\"}}', NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21'),
(380, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIDHO TRIWILDAN (Username: ortu_2324101392)', 'App\\Models\\User', 'created', 1796, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101392\"}}', NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22'),
(381, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ririn Rindiani Puspitaningrum (Username: ortu_2324101393)', 'App\\Models\\User', 'created', 1797, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101393\"}}', NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22'),
(382, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Salsabila Aurelia Putri (Username: ortu_2324101394)', 'App\\Models\\User', 'created', 1798, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101394\"}}', NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22'),
(383, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Sopianti Novita Usna (Username: ortu_2324101395)', 'App\\Models\\User', 'created', 1799, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101395\"}}', NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22'),
(384, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Tasya Nurin Shadrina (Username: ortu_2324101396)', 'App\\Models\\User', 'created', 1800, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101396\"}}', NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23'),
(385, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ade saepuloh (Username: ortu_2324101397)', 'App\\Models\\User', 'created', 1801, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101397\"}}', NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23'),
(386, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADITYA FIRMANSYAH (Username: ortu_2324101398)', 'App\\Models\\User', 'created', 1802, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101398\"}}', NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23'),
(387, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AGYL AZANI AKBAR (Username: ortu_2324101399)', 'App\\Models\\User', 'created', 1803, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101399\"}}', NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23'),
(388, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIFA SAEFURROHMAN (Username: ortu_2324101400)', 'App\\Models\\User', 'created', 1804, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101400\"}}', NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24'),
(389, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIYA EKA GUSTIANI (Username: ortu_2324101401)', 'App\\Models\\User', 'created', 1805, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101401\"}}', NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24'),
(390, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALMA DWI ALRIZKI (Username: ortu_2324101402)', 'App\\Models\\User', 'created', 1806, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101402\"}}', NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24'),
(391, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ariq Fathurrahman (Username: ortu_2324101403)', 'App\\Models\\User', 'created', 1807, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101403\"}}', NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24'),
(392, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DAVA TISNA APRIZA (Username: ortu_2324101405)', 'App\\Models\\User', 'created', 1808, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101405\"}}', NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25'),
(393, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DAVIN ADHA PUTRA (Username: ortu_2324101406)', 'App\\Models\\User', 'created', 1809, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101406\"}}', NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25'),
(394, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DZAKY FAUZAN (Username: ortu_2324101407)', 'App\\Models\\User', 'created', 1810, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101407\"}}', NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25'),
(395, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ELIS MAESAROH (Username: ortu_2324101408)', 'App\\Models\\User', 'created', 1811, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101408\"}}', NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26'),
(396, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ERWIN ALDRIANSYAH (Username: ortu_2324101409)', 'App\\Models\\User', 'created', 1812, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101409\"}}', NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26'),
(397, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fabian Rizky Adriansyah (Username: ortu_2324101410)', 'App\\Models\\User', 'created', 1813, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101410\"}}', NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26'),
(398, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FAHRANSYAH ABI SOPFIAN (Username: ortu_2324101411)', 'App\\Models\\User', 'created', 1814, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101411\"}}', NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26'),
(399, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FAREED AHMAD (Username: ortu_2324101412)', 'App\\Models\\User', 'created', 1815, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101412\"}}', NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27'),
(400, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FAZRI MAULANA SAPUTRA (Username: ortu_2324101413)', 'App\\Models\\User', 'created', 1816, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101413\"}}', NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27'),
(401, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IIS NURHAYATI (Username: ortu_2324101414)', 'App\\Models\\User', 'created', 1817, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101414\"}}', NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27'),
(402, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Khansa Kamila (Username: ortu_2324101415)', 'App\\Models\\User', 'created', 1818, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101415\"}}', NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27'),
(403, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Kiki Al Rizal Maulana (Username: ortu_2324101416)', 'App\\Models\\User', 'created', 1819, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101416\"}}', NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28'),
(404, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMAD RAFLI ALFARIZI (Username: ortu_2324101417)', 'App\\Models\\User', 'created', 1820, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101417\"}}', NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28'),
(405, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NADIA ASPIYA SHAHIDAH (Username: ortu_2324101418)', 'App\\Models\\User', 'created', 1821, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101418\"}}', NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28'),
(406, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAZWA APRIANITA (Username: ortu_2324101419)', 'App\\Models\\User', 'created', 1822, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101419\"}}', NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29'),
(407, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NOVITA MANISORAYA (Username: ortu_2324101420)', 'App\\Models\\User', 'created', 1823, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101420\"}}', NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29'),
(408, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PADIL PRATAMA (Username: ortu_2324101421)', 'App\\Models\\User', 'created', 1824, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101421\"}}', NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29'),
(409, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAIHAN AMARULLOH (Username: ortu_2324101422)', 'App\\Models\\User', 'created', 1825, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101422\"}}', NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29'),
(410, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Resa Akmal Gifari (Username: ortu_2324101423)', 'App\\Models\\User', 'created', 1826, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101423\"}}', NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30'),
(411, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Resti Lestari (Username: ortu_2324101424)', 'App\\Models\\User', 'created', 1827, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101424\"}}', NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30'),
(412, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SATRIA PUTRA NUGRAHA (Username: ortu_2324101425)', 'App\\Models\\User', 'created', 1828, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101425\"}}', NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30'),
(413, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Satya Rengga Pamungkas (Username: ortu_2324101426)', 'App\\Models\\User', 'created', 1829, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101426\"}}', NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30'),
(414, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Silvi Amellina (Username: ortu_2324101427)', 'App\\Models\\User', 'created', 1830, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101427\"}}', NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31'),
(415, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Silvia Azahra (Username: ortu_2324101428)', 'App\\Models\\User', 'created', 1831, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101428\"}}', NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31'),
(416, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SUCI NOVIANI (Username: ortu_2324101429)', 'App\\Models\\User', 'created', 1832, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101429\"}}', NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31'),
(417, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SYIFA FATURROHMAH AZ-ZAHRA (Username: ortu_2324101430)', 'App\\Models\\User', 'created', 1833, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101430\"}}', NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31'),
(418, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Syiva Yasa Sakilla (Username: ortu_2324101431)', 'App\\Models\\User', 'created', 1834, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101431\"}}', NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32'),
(419, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari YUNIAR ARDIANSYAH MAULANA (Username: ortu_2324101432)', 'App\\Models\\User', 'created', 1835, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101432\"}}', NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32'),
(420, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADVENDA SULISTYOWATI (Username: ortu_2324101469)', 'App\\Models\\User', 'created', 1836, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101469\"}}', NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32'),
(421, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALI APANDI (Username: ortu_2324101470)', 'App\\Models\\User', 'created', 1837, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101470\"}}', NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32'),
(422, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMAL ASMARANI (Username: ortu_2324101471)', 'App\\Models\\User', 'created', 1838, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101471\"}}', NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33'),
(423, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Andika Pebrian Pratama (Username: ortu_2324101472)', 'App\\Models\\User', 'created', 1839, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101472\"}}', NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33'),
(424, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANISA APRILIA (Username: ortu_2324101473)', 'App\\Models\\User', 'created', 1840, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101473\"}}', NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33'),
(425, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARIF NUROHMAN (Username: ortu_2324101474)', 'App\\Models\\User', 'created', 1841, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101474\"}}', NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34'),
(426, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AULIA NURFADILA (Username: ortu_2324101475)', 'App\\Models\\User', 'created', 1842, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101475\"}}', NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34'),
(427, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari BILLY SULTAN DZULIANSYAH (Username: ortu_2324101476)', 'App\\Models\\User', 'created', 1843, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101476\"}}', NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34'),
(428, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari CHANTIKA SALSANABILA (Username: ortu_2324101477)', 'App\\Models\\User', 'created', 1844, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101477\"}}', NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34'),
(429, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Egis Septiani (Username: ortu_2324101478)', 'App\\Models\\User', 'created', 1845, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101478\"}}', NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35'),
(430, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ERRIL EVRILITA KURNIAWAN (Username: ortu_2324101479)', 'App\\Models\\User', 'created', 1846, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101479\"}}', NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35'),
(431, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FANI FEBRIANI (Username: ortu_2324101480)', 'App\\Models\\User', 'created', 1847, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101480\"}}', NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35'),
(432, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fauziah Khirani (Username: ortu_2324101481)', 'App\\Models\\User', 'created', 1848, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101481\"}}', NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35'),
(433, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FERA MAULANI (Username: ortu_2324101482)', 'App\\Models\\User', 'created', 1849, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101482\"}}', NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36'),
(434, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GISA RAJ SUMANTRI (Username: ortu_2324101483)', 'App\\Models\\User', 'created', 1850, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101483\"}}', NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36'),
(435, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KANYASIH AYUNA IMANDRIA (Username: ortu_2324101484)', 'App\\Models\\User', 'created', 1851, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101484\"}}', NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36'),
(436, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Lutfiah Zulfa Nabila (Username: ortu_2324101485)', 'App\\Models\\User', 'created', 1852, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101485\"}}', NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37'),
(437, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MEIDA WULANDARI (Username: ortu_2324101486)', 'App\\Models\\User', 'created', 1853, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101486\"}}', NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37'),
(438, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MELANI PUTRI (Username: ortu_2324101487)', 'App\\Models\\User', 'created', 1854, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101487\"}}', NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37'),
(439, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MIAR RACHMAWATI (Username: ortu_2324101488)', 'App\\Models\\User', 'created', 1855, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101488\"}}', NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37'),
(440, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Najwa Aina Fadiyah (Username: ortu_2324101489)', 'App\\Models\\User', 'created', 1856, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101489\"}}', NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38'),
(441, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NIKEN ANJANI (Username: ortu_2324101490)', 'App\\Models\\User', 'created', 1857, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101490\"}}', NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38'),
(442, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Putri Keila Susanto (Username: ortu_2324101491)', 'App\\Models\\User', 'created', 1858, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101491\"}}', NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38'),
(443, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PUTRI KUSUMANINGRUM (Username: ortu_2324101492)', 'App\\Models\\User', 'created', 1859, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101492\"}}', NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38'),
(444, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAHMA GANIA SYA\'BANIAH (Username: ortu_2324101493)', 'App\\Models\\User', 'created', 1860, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101493\"}}', NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39'),
(445, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rahma Sulistiani (Username: ortu_2324101494)', 'App\\Models\\User', 'created', 1861, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101494\"}}', NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39'),
(446, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAISSYA YULIANI (Username: ortu_2324101495)', 'App\\Models\\User', 'created', 1862, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101495\"}}', NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39'),
(447, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Restu Sri Rahayu (Username: ortu_2324101496)', 'App\\Models\\User', 'created', 1863, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101496\"}}', NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39'),
(448, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SALMA NUR PATIMAH (Username: ortu_2324101497)', 'App\\Models\\User', 'created', 1864, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101497\"}}', NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40'),
(449, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SELMA FITRIA OKTAVIANI (Username: ortu_2324101498)', 'App\\Models\\User', 'created', 1865, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101498\"}}', NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40'),
(450, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Sifa Felisa Putri (Username: ortu_2324101499)', 'App\\Models\\User', 'created', 1866, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101499\"}}', NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40'),
(451, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Silva Ari Ainur Vila Sevila (Username: ortu_2324101500)', 'App\\Models\\User', 'created', 1867, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101500\"}}', NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40'),
(452, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Suci Octavia Azahra (Username: ortu_2324101501)', 'App\\Models\\User', 'created', 1868, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101501\"}}', NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41'),
(453, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari THALITA APRILIA (Username: ortu_2324101502)', 'App\\Models\\User', 'created', 1869, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101502\"}}', NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41'),
(454, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Widi Nur Fajrina (Username: ortu_2324101504)', 'App\\Models\\User', 'created', 1870, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101504\"}}', NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41'),
(455, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALIFA MAULIDA (Username: ortu_2324101505)', 'App\\Models\\User', 'created', 1871, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101505\"}}', NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41'),
(456, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALYA MELINDA (Username: ortu_2324101506)', 'App\\Models\\User', 'created', 1872, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101506\"}}', NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42'),
(457, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANISA ELIANDINI (Username: ortu_2324101507)', 'App\\Models\\User', 'created', 1873, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101507\"}}', NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42'),
(458, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Annisa Razahra Nurfadilah (Username: ortu_2324101508)', 'App\\Models\\User', 'created', 1874, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101508\"}}', NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42'),
(459, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AURORA JULIYANTI (Username: ortu_2324101509)', 'App\\Models\\User', 'created', 1875, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101509\"}}', NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43'),
(460, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DESI JULIANTI (Username: ortu_2324101510)', 'App\\Models\\User', 'created', 1876, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101510\"}}', NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43'),
(461, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Diva Abilla (Username: ortu_2324101511)', 'App\\Models\\User', 'created', 1877, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101511\"}}', NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43'),
(462, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DIVA NURUL ASSYIFA (Username: ortu_2324101512)', 'App\\Models\\User', 'created', 1878, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101512\"}}', NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43'),
(463, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FITRI MULYANI (Username: ortu_2324101513)', 'App\\Models\\User', 'created', 1879, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101513\"}}', NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44'),
(464, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KERIN RINDIANI (Username: ortu_2324101514)', 'App\\Models\\User', 'created', 1880, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101514\"}}', NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44'),
(465, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KEYSYA FEBRY AULYA (Username: ortu_2324101515)', 'App\\Models\\User', 'created', 1881, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101515\"}}', NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44'),
(466, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MAHDA ZELILAH (Username: ortu_2324101516)', 'App\\Models\\User', 'created', 1882, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101516\"}}', NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44'),
(467, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Martha Eryana Putri (Username: ortu_2324101517)', 'App\\Models\\User', 'created', 1883, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101517\"}}', NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45'),
(468, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MELISA KURNIASIH (Username: ortu_2324101518)', 'App\\Models\\User', 'created', 1884, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101518\"}}', NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45'),
(469, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NADIA RAHMAWATI (Username: ortu_2324101519)', 'App\\Models\\User', 'created', 1885, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101519\"}}', NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45'),
(470, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Natisha Salsabilah (Username: ortu_2324101520)', 'App\\Models\\User', 'created', 1886, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101520\"}}', NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45'),
(471, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAYLA NAZWA CHAIRUNNISA (Username: ortu_2324101521)', 'App\\Models\\User', 'created', 1887, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101521\"}}', NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46'),
(472, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NEZA AFRITA (Username: ortu_2324101522)', 'App\\Models\\User', 'created', 1888, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101522\"}}', NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46'),
(473, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PRILA MAULIDHA (Username: ortu_2324101523)', 'App\\Models\\User', 'created', 1889, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101523\"}}', NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46'),
(474, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PUPUT PUTRIANI (Username: ortu_2324101524)', 'App\\Models\\User', 'created', 1890, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101524\"}}', NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46'),
(475, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RACEL LIANTY (Username: ortu_2324101525)', 'App\\Models\\User', 'created', 1891, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101525\"}}', NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47'),
(476, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAHMA NUR KAMILA (Username: ortu_2324101526)', 'App\\Models\\User', 'created', 1892, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101526\"}}', NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(477, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rina (Username: ortu_2324101527)', 'App\\Models\\User', 'created', 1893, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101527\"}}', NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47'),
(478, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SALSA DWI APRILIA (Username: ortu_2324101528)', 'App\\Models\\User', 'created', 1894, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101528\"}}', NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48'),
(479, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Seny Selviyani (Username: ortu_2324101529)', 'App\\Models\\User', 'created', 1895, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101529\"}}', NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48'),
(480, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SHINTA NABILLA RAHMA (Username: ortu_2324101530)', 'App\\Models\\User', 'created', 1896, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101530\"}}', NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48'),
(481, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SITI NUR HAYATI (Username: ortu_2324101531)', 'App\\Models\\User', 'created', 1897, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101531\"}}', NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48'),
(482, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SRI NURUL AWALIA (Username: ortu_2324101532)', 'App\\Models\\User', 'created', 1898, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101532\"}}', NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49'),
(483, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SUCIA NURYANTI (Username: ortu_2324101533)', 'App\\Models\\User', 'created', 1899, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101533\"}}', NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49'),
(484, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Syifa Mufidah (Username: ortu_2324101534)', 'App\\Models\\User', 'created', 1900, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101534\"}}', NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49'),
(485, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari TIARA CITRA (Username: ortu_2324101535)', 'App\\Models\\User', 'created', 1901, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101535\"}}', NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49'),
(486, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Tita Hanita (Username: ortu_2324101536)', 'App\\Models\\User', 'created', 1902, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101536\"}}', NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50'),
(487, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Trie Amellia (Username: ortu_2324101537)', 'App\\Models\\User', 'created', 1903, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101537\"}}', NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50'),
(488, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari WIDYA ASTUTI (Username: ortu_2324101538)', 'App\\Models\\User', 'created', 1904, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101538\"}}', NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50'),
(489, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari WINDI WULANDARI (Username: ortu_2324101539)', 'App\\Models\\User', 'created', 1905, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101539\"}}', NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51'),
(490, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari YOKA RAMADHAN HERFIANI (Username: ortu_2324101540)', 'App\\Models\\User', 'created', 1906, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101540\"}}', NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51'),
(491, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ade Awaluddin (Username: ortu_2324101181)', 'App\\Models\\User', 'created', 1907, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101181\"}}', NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51'),
(492, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADITIA (Username: ortu_2324101182)', 'App\\Models\\User', 'created', 1908, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101182\"}}', NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51'),
(493, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AFRIL DARMAYANTI (Username: ortu_2324101183)', 'App\\Models\\User', 'created', 1909, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101183\"}}', NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52'),
(494, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALAN NURFIKRI (Username: ortu_2324101184)', 'App\\Models\\User', 'created', 1910, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101184\"}}', NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52'),
(495, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALMA NURAINI (Username: ortu_2324101185)', 'App\\Models\\User', 'created', 1911, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101185\"}}', NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52'),
(496, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AMELIA DEVIANTY (Username: ortu_2324101186)', 'App\\Models\\User', 'created', 1912, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101186\"}}', NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52'),
(497, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANDHARA FEBRIANY (Username: ortu_2324101187)', 'App\\Models\\User', 'created', 1913, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101187\"}}', NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53'),
(498, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ayu Andini (Username: ortu_2324101188)', 'App\\Models\\User', 'created', 1914, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101188\"}}', NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53'),
(499, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Desta Rahma Agustin (Username: ortu_2324101189)', 'App\\Models\\User', 'created', 1915, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101189\"}}', NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53'),
(500, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dwi Hartanti (Username: ortu_2324101190)', 'App\\Models\\User', 'created', 1916, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101190\"}}', NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53'),
(501, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fitria Rahmadhani (Username: ortu_2324101191)', 'App\\Models\\User', 'created', 1917, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101191\"}}', NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54'),
(502, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Imel Asmaya (Username: ortu_2324101192)', 'App\\Models\\User', 'created', 1918, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101192\"}}', NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54'),
(503, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IQBAL ABDI AGUNG SAPUTRA (Username: ortu_2324101194)', 'App\\Models\\User', 'created', 1919, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101194\"}}', NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54'),
(504, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Irfan Ferdiansyah (Username: ortu_2324101195)', 'App\\Models\\User', 'created', 1920, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101195\"}}', NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54'),
(505, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari LILIH HUMAIROTUL HABIBAH (Username: ortu_2324101196)', 'App\\Models\\User', 'created', 1921, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101196\"}}', NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55'),
(506, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Lusy Marsela (Username: ortu_2324101197)', 'App\\Models\\User', 'created', 1922, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101197\"}}', NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55'),
(507, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD ILHAM FIRDAUS (Username: ortu_2324101198)', 'App\\Models\\User', 'created', 1923, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101198\"}}', NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55'),
(508, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Naya Suci Septiani (Username: ortu_2324101199)', 'App\\Models\\User', 'created', 1924, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101199\"}}', NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56'),
(509, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAZA MAULANA MUHTAZ (Username: ortu_2324101200)', 'App\\Models\\User', 'created', 1925, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101200\"}}', NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56'),
(510, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAZAR FATHURROCHMAN (Username: ortu_2324101201)', 'App\\Models\\User', 'created', 1926, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101201\"}}', NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56'),
(511, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nur Anida (Username: ortu_2324101202)', 'App\\Models\\User', 'created', 1927, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101202\"}}', NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56'),
(512, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nurlaila (Username: ortu_2324101203)', 'App\\Models\\User', 'created', 1928, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101203\"}}', NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57'),
(513, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAISSYA DINA CAHYANABILA (Username: ortu_2324101204)', 'App\\Models\\User', 'created', 1929, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101204\"}}', NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57'),
(514, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Resti Shintia Rahayu (Username: ortu_2324101205)', 'App\\Models\\User', 'created', 1930, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101205\"}}', NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57'),
(515, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RISNA NATASYA (Username: ortu_2324101206)', 'App\\Models\\User', 'created', 1931, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101206\"}}', NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57'),
(516, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rizky Aditya Gumilang (Username: ortu_2324101207)', 'App\\Models\\User', 'created', 1932, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101207\"}}', NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58'),
(517, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SEKAR RAHMAWATI (Username: ortu_2324101208)', 'App\\Models\\User', 'created', 1933, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101208\"}}', NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58'),
(518, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SERRYN YOLANDHA PUSPITADEWI (Username: ortu_2324101209)', 'App\\Models\\User', 'created', 1934, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101209\"}}', NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58'),
(519, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Shalsa Astriani (Username: ortu_2324101210)', 'App\\Models\\User', 'created', 1935, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101210\"}}', NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58'),
(520, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SITI VANIA PURWANTI (Username: ortu_2324101211)', 'App\\Models\\User', 'created', 1936, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101211\"}}', NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59'),
(521, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Tia Septiani (Username: ortu_2324101212)', 'App\\Models\\User', 'created', 1937, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101212\"}}', NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59'),
(522, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Vina Nurhaliza (Username: ortu_2324101213)', 'App\\Models\\User', 'created', 1938, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101213\"}}', NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59'),
(523, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Winnie Bunga Suci (Username: ortu_2324101214)', 'App\\Models\\User', 'created', 1939, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101214\"}}', NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00'),
(524, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari WULAN HAYATUN NISA (Username: ortu_2324101215)', 'App\\Models\\User', 'created', 1940, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101215\"}}', NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00'),
(525, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Yuni Nuraeni (Username: ortu_2324101216)', 'App\\Models\\User', 'created', 1941, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101216\"}}', NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00'),
(526, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Adi Purnama (Username: ortu_2324101217)', 'App\\Models\\User', 'created', 1942, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101217\"}}', NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00'),
(527, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AISYAH NURSAFITRI (Username: ortu_2324101218)', 'App\\Models\\User', 'created', 1943, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101218\"}}', NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01'),
(528, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALLYA ZAHRATUS SYIFA (Username: ortu_2324101219)', 'App\\Models\\User', 'created', 1944, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101219\"}}', NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01'),
(529, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Amelya Natashya (Username: ortu_2324101220)', 'App\\Models\\User', 'created', 1945, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101220\"}}', NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01'),
(530, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARIN TIFFANY MEYLAN (Username: ortu_2324101221)', 'App\\Models\\User', 'created', 1946, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101221\"}}', NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01'),
(531, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari CHANTIKA CHINTYA HERYANTI (Username: ortu_2324101222)', 'App\\Models\\User', 'created', 1947, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101222\"}}', NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02'),
(532, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dany Irwansyah (Username: ortu_2324101223)', 'App\\Models\\User', 'created', 1948, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101223\"}}', NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02'),
(533, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DELLA AMELIA AGUSTIN (Username: ortu_2324101224)', 'App\\Models\\User', 'created', 1949, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101224\"}}', NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02'),
(534, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DIKRI FAUZAN (Username: ortu_2425101542)', 'App\\Models\\User', 'created', 1950, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2425101542\"}}', NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03'),
(535, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DINDA LESTARI (Username: ortu_2324101225)', 'App\\Models\\User', 'created', 1951, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101225\"}}', NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03'),
(536, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FARIZ MAULANA PRATAMA (Username: ortu_2324101226)', 'App\\Models\\User', 'created', 1952, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101226\"}}', NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03'),
(537, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FARREL ATTARSYAH (Username: ortu_2324101227)', 'App\\Models\\User', 'created', 1953, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101227\"}}', NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03'),
(538, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GISELA VIEKA INDRIANI (Username: ortu_2324101228)', 'App\\Models\\User', 'created', 1954, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101228\"}}', NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04'),
(539, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HESIN RAHMAWATI (Username: ortu_2324101229)', 'App\\Models\\User', 'created', 1955, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101229\"}}', NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04'),
(540, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Irma Rahmawati (Username: ortu_2324101230)', 'App\\Models\\User', 'created', 1956, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101230\"}}', NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04'),
(541, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari LENY YULIANTI (Username: ortu_2324101231)', 'App\\Models\\User', 'created', 1957, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101231\"}}', NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04'),
(542, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Mega Retno Briliani (Username: ortu_2324101232)', 'App\\Models\\User', 'created', 1958, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101232\"}}', NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05'),
(543, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD DESTA PRATAMA (Username: ortu_2324101233)', 'App\\Models\\User', 'created', 1959, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101233\"}}', NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05'),
(544, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD WALI ALKARIM (Username: ortu_2324101235)', 'App\\Models\\User', 'created', 1960, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101235\"}}', NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05'),
(545, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD ZULFAN YANUAR (Username: ortu_2324101236)', 'App\\Models\\User', 'created', 1961, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101236\"}}', NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05'),
(546, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nikeisha Syifaaul Qomah (Username: ortu_2324101237)', 'App\\Models\\User', 'created', 1962, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101237\"}}', NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06'),
(547, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nisya Dwi Utamy (Username: ortu_2324101238)', 'App\\Models\\User', 'created', 1963, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101238\"}}', NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06'),
(548, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nita Amelia (Username: ortu_2324101239)', 'App\\Models\\User', 'created', 1964, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101239\"}}', NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06'),
(549, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NIZAR ADIT TRIANSAH (Username: ortu_2324101240)', 'App\\Models\\User', 'created', 1965, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101240\"}}', NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07'),
(550, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NORY TASYA PRATIWI (Username: ortu_2324101241)', 'App\\Models\\User', 'created', 1966, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101241\"}}', NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07'),
(551, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari QEYSHA QUINN SHAQUILLA SETIAJI (Username: ortu_2324101242)', 'App\\Models\\User', 'created', 1967, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101242\"}}', NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07'),
(552, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rainova Ibny Muyassar (Username: ortu_2324101243)', 'App\\Models\\User', 'created', 1968, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101243\"}}', NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07'),
(553, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Raisya Suci Ramadani (Username: ortu_2324101244)', 'App\\Models\\User', 'created', 1969, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101244\"}}', NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08'),
(554, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REVA LIANISHA SUPARMAN (Username: ortu_2324101245)', 'App\\Models\\User', 'created', 1970, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101245\"}}', NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08'),
(555, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIRIN NURAENI (Username: ortu_2324101246)', 'App\\Models\\User', 'created', 1971, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101246\"}}', NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08'),
(556, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Risca Dwi Aryanti (Username: ortu_2324101247)', 'App\\Models\\User', 'created', 1972, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101247\"}}', NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08'),
(557, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ROBY HERMANSYAH (Username: ortu_2324101248)', 'App\\Models\\User', 'created', 1973, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101248\"}}', NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09'),
(558, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SAVANNAH CLARA MAULIKA (Username: ortu_2324101249)', 'App\\Models\\User', 'created', 1974, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101249\"}}', NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09'),
(559, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SESILIA (Username: ortu_2324101250)', 'App\\Models\\User', 'created', 1975, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101250\"}}', NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09'),
(560, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SIFA FAUJIAH (Username: ortu_2324101251)', 'App\\Models\\User', 'created', 1976, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101251\"}}', NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10'),
(561, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALFANDI ANDRIANSYAH (Username: ortu_2324101253)', 'App\\Models\\User', 'created', 1977, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101253\"}}', NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10'),
(562, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DESWITA VERAWATI (Username: ortu_2324101254)', 'App\\Models\\User', 'created', 1978, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101254\"}}', NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10'),
(563, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Devi Sulistia (Username: ortu_2324101255)', 'App\\Models\\User', 'created', 1979, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101255\"}}', NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10'),
(564, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dika Apriansyah (Username: ortu_2324101256)', 'App\\Models\\User', 'created', 1980, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101256\"}}', NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11'),
(565, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ELIN NURAINI (Username: ortu_2324101257)', 'App\\Models\\User', 'created', 1981, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101257\"}}', NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11'),
(566, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ELINA AGUSTIN (Username: ortu_2324101258)', 'App\\Models\\User', 'created', 1982, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101258\"}}', NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11'),
(567, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Elsa Khoerunnisa (Username: ortu_2324101259)', 'App\\Models\\User', 'created', 1983, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101259\"}}', NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11'),
(568, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fahriel Muhamad Fauzan (Username: ortu_2324101260)', 'App\\Models\\User', 'created', 1984, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101260\"}}', NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12'),
(569, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FAREL SYAFIQ ABRAR (Username: ortu_2324101261)', 'App\\Models\\User', 'created', 1985, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101261\"}}', NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12'),
(570, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Fita Oktafiani (Username: ortu_2324101262)', 'App\\Models\\User', 'created', 1986, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101262\"}}', NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12'),
(571, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FITRIAH NURLATIFAH (Username: ortu_2324101263)', 'App\\Models\\User', 'created', 1987, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101263\"}}', NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12'),
(572, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HANNY APRILA LESTARI (Username: ortu_2324101264)', 'App\\Models\\User', 'created', 1988, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101264\"}}', NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13'),
(573, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ILMI PIANDYA (Username: ortu_2324101265)', 'App\\Models\\User', 'created', 1989, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101265\"}}', NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13'),
(574, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Ismi Nurafiani (Username: ortu_2324101266)', 'App\\Models\\User', 'created', 1990, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101266\"}}', NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13'),
(575, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Lydia Rizkianti (Username: ortu_2324101267)', 'App\\Models\\User', 'created', 1991, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101267\"}}', NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14'),
(576, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari M. Khisyar Ma\'ali (Username: ortu_2324101268)', 'App\\Models\\User', 'created', 1992, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101268\"}}', NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14'),
(577, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari M. ZIA BAGUS PAMUNGKAS (Username: ortu_2324101269)', 'App\\Models\\User', 'created', 1993, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101269\"}}', NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14'),
(578, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MAULIDA CAHYA PRATAMI (Username: ortu_2324101270)', 'App\\Models\\User', 'created', 1994, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101270\"}}', NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14'),
(579, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUMUN MUNZIAH (Username: ortu_2324101271)', 'App\\Models\\User', 'created', 1995, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101271\"}}', NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15'),
(580, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NELA AULIA (Username: ortu_2324101272)', 'App\\Models\\User', 'created', 1996, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101272\"}}', NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15'),
(581, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NESYA NAZWA MAULID (Username: ortu_2324101273)', 'App\\Models\\User', 'created', 1997, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101273\"}}', NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15'),
(582, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NURUL SILVIANI SOLEHA (Username: ortu_2324101274)', 'App\\Models\\User', 'created', 1998, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101274\"}}', NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15'),
(583, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PHASYA RESTU VIGO AKHMATSYAH (Username: ortu_2324101275)', 'App\\Models\\User', 'created', 1999, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101275\"}}', NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16'),
(584, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAISYA RAMDHANI (Username: ortu_2324101276)', 'App\\Models\\User', 'created', 2000, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101276\"}}', NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16'),
(585, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RARA RASIKAH (Username: ortu_2324101277)', 'App\\Models\\User', 'created', 2001, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101277\"}}', NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16'),
(586, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Resti Riska Diana (Username: ortu_2324101278)', 'App\\Models\\User', 'created', 2002, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101278\"}}', NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17'),
(587, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RISQI SAPUTRA (Username: ortu_2324101280)', 'App\\Models\\User', 'created', 2003, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101280\"}}', NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17'),
(588, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIZKI KHOLIK MUBAROK (Username: ortu_2324101281)', 'App\\Models\\User', 'created', 2004, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101281\"}}', NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17'),
(589, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SENI PUSPA NURANI (Username: ortu_2324101282)', 'App\\Models\\User', 'created', 2005, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101282\"}}', NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17'),
(590, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Shaira Oktavia (Username: ortu_2324101283)', 'App\\Models\\User', 'created', 2006, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101283\"}}', NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18'),
(591, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Sheren Redina (Username: ortu_2324101284)', 'App\\Models\\User', 'created', 2007, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101284\"}}', NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18'),
(592, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SRI ISMAYANTI (Username: ortu_2324101285)', 'App\\Models\\User', 'created', 2008, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101285\"}}', NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18'),
(593, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SURYA FALAH (Username: ortu_2324101286)', 'App\\Models\\User', 'created', 2009, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101286\"}}', NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18'),
(594, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Syifa Frananda Heryanto (Username: ortu_2324101287)', 'App\\Models\\User', 'created', 2010, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101287\"}}', NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19'),
(595, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AA FAUDZAN NURSETIA (Username: ortu_2324101433)', 'App\\Models\\User', 'created', 2011, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101433\"}}', NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19'),
(596, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADAM MUHAMMAD RIZKI (Username: ortu_2324101434)', 'App\\Models\\User', 'created', 2012, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101434\"}}', NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19'),
(597, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AJI WIDAYAT (Username: ortu_2324101435)', 'App\\Models\\User', 'created', 2013, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101435\"}}', NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19'),
(598, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALFHA RADJA YANUAR (Username: ortu_2324101436)', 'App\\Models\\User', 'created', 2014, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101436\"}}', NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20'),
(599, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Andiki Pratama (Username: ortu_2324101437)', 'App\\Models\\User', 'created', 2015, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101437\"}}', NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20'),
(600, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AREL HENDARSYAH (Username: ortu_2324101438)', 'App\\Models\\User', 'created', 2016, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101438\"}}', NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20'),
(601, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARIL GUNAWAN (Username: ortu_2324101439)', 'App\\Models\\User', 'created', 2017, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101439\"}}', NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21'),
(602, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Deni Anugrah (Username: ortu_2324101440)', 'App\\Models\\User', 'created', 2018, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101440\"}}', NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21'),
(603, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DIKA D ARIANTO (Username: ortu_2324101441)', 'App\\Models\\User', 'created', 2019, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101441\"}}', NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21'),
(604, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Enditha Alifia Salsabila (Username: ortu_2324101443)', 'App\\Models\\User', 'created', 2020, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101443\"}}', NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21'),
(605, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ERVAN MAULANA (Username: ortu_2324101444)', 'App\\Models\\User', 'created', 2021, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101444\"}}', NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22'),
(606, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GALIH RAMADAN (Username: ortu_2324101445)', 'App\\Models\\User', 'created', 2022, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101445\"}}', NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22'),
(607, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GERIN RIANDY SOLIHIN (Username: ortu_2324101446)', 'App\\Models\\User', 'created', 2023, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101446\"}}', NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22'),
(608, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GHIN GIN ALAMSYAH (Username: ortu_2324101448)', 'App\\Models\\User', 'created', 2024, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101448\"}}', NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22'),
(609, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ILHAM HUSNI (Username: ortu_2324101449)', 'App\\Models\\User', 'created', 2025, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101449\"}}', NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23'),
(610, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Intan Nur Fadillah (Username: ortu_2324101450)', 'App\\Models\\User', 'created', 2026, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101450\"}}', NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23'),
(611, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Irpan Maulana (Username: ortu_2324101451)', 'App\\Models\\User', 'created', 2027, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101451\"}}', NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23'),
(612, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IRPAN RIFAI (Username: ortu_2324101452)', 'App\\Models\\User', 'created', 2028, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101452\"}}', NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23'),
(613, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Kaufanullah Almugni (Username: ortu_2324101453)', 'App\\Models\\User', 'created', 2029, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101453\"}}', NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24'),
(614, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Keizha Adya Mecka (Username: ortu_2324101454)', 'App\\Models\\User', 'created', 2030, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101454\"}}', NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24'),
(615, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MARIO FEBRIAN (Username: ortu_2324101456)', 'App\\Models\\User', 'created', 2031, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101456\"}}', NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24'),
(616, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhammad Rasyid Ridlo (Username: ortu_2324101457)', 'App\\Models\\User', 'created', 2032, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101457\"}}', NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25'),
(617, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NIZMA NURWAHIDAH (Username: ortu_2324101458)', 'App\\Models\\User', 'created', 2033, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101458\"}}', NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25'),
(618, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RENATA AURELLIA RAMADHANI (Username: ortu_2324101459)', 'App\\Models\\User', 'created', 2034, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101459\"}}', NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25'),
(619, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RIFA GINASTIAR (Username: ortu_2324101460)', 'App\\Models\\User', 'created', 2035, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101460\"}}', NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25'),
(620, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Sandi Maulana Jalaludin (Username: ortu_2324101461)', 'App\\Models\\User', 'created', 2036, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101461\"}}', NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26'),
(621, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SHINTA OKTAVIA (Username: ortu_2324101463)', 'App\\Models\\User', 'created', 2037, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101463\"}}', NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26'),
(622, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SULISTIANINGTIAS (Username: ortu_2324101464)', 'App\\Models\\User', 'created', 2038, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101464\"}}', NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26'),
(623, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari VELANI SUBEKTI (Username: ortu_2324101465)', 'App\\Models\\User', 'created', 2039, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101465\"}}', NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27'),
(624, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Wanda Putri Iwani (Username: ortu_2324101466)', 'App\\Models\\User', 'created', 2040, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101466\"}}', NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27'),
(625, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari YOGA MUHAMMAD FIKRI (Username: ortu_2324101467)', 'App\\Models\\User', 'created', 2041, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101467\"}}', NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27'),
(626, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ZIKRI DELPIANA (Username: ortu_2324101468)', 'App\\Models\\User', 'created', 2042, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101468\"}}', NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27'),
(627, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Adelio Farrell Julistira (Username: ortu_2324101001)', 'App\\Models\\User', 'created', 2043, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101001\"}}', NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28'),
(628, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AKBAR MAULANA (Username: ortu_2324101002)', 'App\\Models\\User', 'created', 2044, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101002\"}}', NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28'),
(629, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AKMAL GHANI LAODA (Username: ortu_2324101003)', 'App\\Models\\User', 'created', 2045, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101003\"}}', NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28'),
(630, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALDI ALFAN FEBRIAN (Username: ortu_2324101004)', 'App\\Models\\User', 'created', 2046, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101004\"}}', NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28'),
(631, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ALDI RENALDI PRATAMA (Username: ortu_2324101005)', 'App\\Models\\User', 'created', 2047, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101005\"}}', NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29'),
(632, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Alya Ramadhani Nur Aini (Username: ortu_2324101006)', 'App\\Models\\User', 'created', 2048, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101006\"}}', NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29'),
(633, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANDIKA JAYA SAPUTRA (Username: ortu_2324101007)', 'App\\Models\\User', 'created', 2049, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101007\"}}', NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29'),
(634, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANDIKA RAMDANI (Username: ortu_2324101008)', 'App\\Models\\User', 'created', 2050, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101008\"}}', NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29'),
(635, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ANGEL FRANSISCA JAYA PRATIWI (Username: ortu_2324101009)', 'App\\Models\\User', 'created', 2051, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101009\"}}', NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30'),
(636, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DEDE SUPRIATNA (Username: ortu_2324101010)', 'App\\Models\\User', 'created', 2052, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101010\"}}', NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30'),
(637, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FAHRUL RIADU AMARULLOH (Username: ortu_2324101011)', 'App\\Models\\User', 'created', 2053, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101011\"}}', NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30'),
(638, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Farhan Fauzan (Username: ortu_2324101012)', 'App\\Models\\User', 'created', 2054, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101012\"}}', NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30'),
(639, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FIKA RISCIANI (Username: ortu_2324101013)', 'App\\Models\\User', 'created', 2055, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101013\"}}', NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31'),
(640, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FIKKA APRILIANDINI (Username: ortu_2324101014)', 'App\\Models\\User', 'created', 2056, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101014\"}}', NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31'),
(641, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari GALUH AGUNG PERMANA (Username: ortu_2324101015)', 'App\\Models\\User', 'created', 2057, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101015\"}}', NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31'),
(642, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HARIESTA FERNANDO (Username: ortu_2324101016)', 'App\\Models\\User', 'created', 2058, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101016\"}}', NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32'),
(643, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Intan Dwi Sabila (Username: ortu_2324101017)', 'App\\Models\\User', 'created', 2059, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101017\"}}', NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(644, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari IRSYAL FATHUL MUBAROK (Username: ortu_2324101018)', 'App\\Models\\User', 'created', 2060, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101018\"}}', NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32'),
(645, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Jimi Ahmad Faturrahman (Username: ortu_2324101019)', 'App\\Models\\User', 'created', 2061, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101019\"}}', NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32'),
(646, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KAKA RAMADHANI SUHERMAN (Username: ortu_2324101020)', 'App\\Models\\User', 'created', 2062, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101020\"}}', NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33'),
(647, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KEISYA SHAORI NIANINDRA PUTRI (Username: ortu_2324101021)', 'App\\Models\\User', 'created', 2063, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101021\"}}', NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33'),
(648, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhamad Aria Abdilah (Username: ortu_2324101022)', 'App\\Models\\User', 'created', 2064, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101022\"}}', NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33'),
(649, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMAD FAUZAN NABIL (Username: ortu_2324101023)', 'App\\Models\\User', 'created', 2065, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101023\"}}', NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33'),
(650, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhammad Gifar (Username: ortu_2324101024)', 'App\\Models\\User', 'created', 2066, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101024\"}}', NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34'),
(651, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD RIZKY PRAWIRO (Username: ortu_2324101025)', 'App\\Models\\User', 'created', 2067, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101025\"}}', NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34'),
(652, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NADHIF DZAKI ABDILLAH (Username: ortu_2324101026)', 'App\\Models\\User', 'created', 2068, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101026\"}}', NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34'),
(653, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari PANCA FERDIAN PAMUNGKAS (Username: ortu_2324101027)', 'App\\Models\\User', 'created', 2069, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101027\"}}', NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35'),
(654, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RADIKA RAYAGA WIGUNA (Username: ortu_2324101028)', 'App\\Models\\User', 'created', 2070, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101028\"}}', NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35'),
(655, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rega Nur Sidiq (Username: ortu_2324101029)', 'App\\Models\\User', 'created', 2071, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101029\"}}', NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35'),
(656, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REVAL FADILAH (Username: ortu_2324101030)', 'App\\Models\\User', 'created', 2072, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101030\"}}', NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35'),
(657, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rizky Fauzi (Username: ortu_2324101031)', 'App\\Models\\User', 'created', 2073, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101031\"}}', NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36'),
(658, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ROBI PERMANA ALAMSYAH (Username: ortu_2324101032)', 'App\\Models\\User', 'created', 2074, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101032\"}}', NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36'),
(659, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SANDI ARIZKI SAPUTRA (Username: ortu_2324101033)', 'App\\Models\\User', 'created', 2075, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101033\"}}', NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36'),
(660, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari YOANA TRI MUNAJAT (Username: ortu_2324101034)', 'App\\Models\\User', 'created', 2076, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101034\"}}', NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36'),
(661, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Zidan Septiana Pratama (Username: ortu_2324101035)', 'App\\Models\\User', 'created', 2077, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101035\"}}', NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37'),
(662, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ZILDAN ABROR (Username: ortu_2324101036)', 'App\\Models\\User', 'created', 2078, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101036\"}}', NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37'),
(663, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ADE PEBRIANA (Username: ortu_2324101037)', 'App\\Models\\User', 'created', 2079, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101037\"}}', NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37'),
(664, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AFRIZAL HERLAMBANG (Username: ortu_2324101038)', 'App\\Models\\User', 'created', 2080, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101038\"}}', NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38'),
(665, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AFRIZAL ZAHRAN MULYANA (Username: ortu_2324101039)', 'App\\Models\\User', 'created', 2081, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101039\"}}', NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38'),
(666, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AKBAR AL FADILLAH (Username: ortu_2324101040)', 'App\\Models\\User', 'created', 2082, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101040\"}}', NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38'),
(667, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Alpi Purnama (Username: ortu_2324101041)', 'App\\Models\\User', 'created', 2083, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101041\"}}', NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38'),
(668, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ARIA RIZKY PERMANA (Username: ortu_2324101042)', 'App\\Models\\User', 'created', 2084, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101042\"}}', NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39'),
(669, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ATHALLAH WAFI RAFID FAADHILAH (Username: ortu_2324101043)', 'App\\Models\\User', 'created', 2085, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101043\"}}', NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39'),
(670, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari AYU HARTINI (Username: ortu_2324101044)', 'App\\Models\\User', 'created', 2086, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101044\"}}', NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39'),
(671, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DAFFA ARIEF NUGRAHA (Username: ortu_2324101045)', 'App\\Models\\User', 'created', 2087, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101045\"}}', NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39'),
(672, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DELIA SEKAR ARUM (Username: ortu_2324101046)', 'App\\Models\\User', 'created', 2088, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101046\"}}', NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40'),
(673, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari DIDAN RAMDHANI ABDUL MATIN (Username: ortu_2324101047)', 'App\\Models\\User', 'created', 2089, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101047\"}}', NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40'),
(674, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Dimas Hermawan (Username: ortu_2324101048)', 'App\\Models\\User', 'created', 2090, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101048\"}}', NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40'),
(675, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ERGIN KUSTIANA (Username: ortu_2324101049)', 'App\\Models\\User', 'created', 2091, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101049\"}}', NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40'),
(676, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Farid Al - Munawwar (Username: ortu_2324101050)', 'App\\Models\\User', 'created', 2092, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101050\"}}', NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41'),
(677, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari FATAN APRIYANA PRATAMA (Username: ortu_2324101051)', 'App\\Models\\User', 'created', 2093, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101051\"}}', NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41'),
(678, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Gian (Username: ortu_2324101052)', 'App\\Models\\User', 'created', 2094, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101052\"}}', NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41'),
(679, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari HAFIDZ AMAR ALFARIZZIE (Username: ortu_2324101053)', 'App\\Models\\User', 'created', 2095, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101053\"}}', NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41'),
(680, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Haikal Zaki Firmansyah (Username: ortu_2324101054)', 'App\\Models\\User', 'created', 2096, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101054\"}}', NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42'),
(681, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari JIHAD IRFANSYAH (Username: ortu_2324101055)', 'App\\Models\\User', 'created', 2097, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101055\"}}', NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42'),
(682, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari KENZ FELIX DJAYALARAS PUTRA (Username: ortu_2324101056)', 'App\\Models\\User', 'created', 2098, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101056\"}}', NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42'),
(683, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Kesya Arifatun Safanah (Username: ortu_2324101057)', 'App\\Models\\User', 'created', 2099, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101057\"}}', NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43'),
(684, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Mochammad Rifqi Tsani (Username: ortu_2324101058)', 'App\\Models\\User', 'created', 2100, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101058\"}}', NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43'),
(685, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MOHAMMAD ABHIE RAMDANI (Username: ortu_2324101059)', 'App\\Models\\User', 'created', 2101, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101059\"}}', NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43'),
(686, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari MUHAMMAD RASYA ARYADHINATA (Username: ortu_2324101060)', 'App\\Models\\User', 'created', 2102, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101060\"}}', NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43'),
(687, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Muhammad Ridwan (Username: ortu_2324101601)', 'App\\Models\\User', 'created', 2103, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101601\"}}', NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44'),
(688, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NABIL SEPTI RAMDHANI (Username: ortu_2324101061)', 'App\\Models\\User', 'created', 2104, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101061\"}}', NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44'),
(689, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari NAUFAL NURUL FAJAR (Username: ortu_2324101062)', 'App\\Models\\User', 'created', 2105, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101062\"}}', NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44'),
(690, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Nizar Firmansyah (Username: ortu_2324101063)', 'App\\Models\\User', 'created', 2106, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101063\"}}', NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44'),
(691, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari RAGIL FAIQ DWINA PUTRA (Username: ortu_2324101064)', 'App\\Models\\User', 'created', 2107, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101064\"}}', NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45'),
(692, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari REVAN SEPTIANSYAH RAMADHANI PUTRA (Username: ortu_2324101065)', 'App\\Models\\User', 'created', 2108, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101065\"}}', NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45'),
(693, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Rivaldy Fauzan (Username: ortu_2324101067)', 'App\\Models\\User', 'created', 2109, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101067\"}}', NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45'),
(694, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SELA SALAFIAH (Username: ortu_2324101068)', 'App\\Models\\User', 'created', 2110, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101068\"}}', NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45'),
(695, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari SENDI FEBRIANSYAH NUR HIDAYAT (Username: ortu_2324101069)', 'App\\Models\\User', 'created', 2111, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101069\"}}', NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46'),
(696, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari VICKY FACHRIZAL MUHARRAM (Username: ortu_2324101070)', 'App\\Models\\User', 'created', 2112, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101070\"}}', NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46'),
(697, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Wisnu Wardana sofyan (Username: ortu_2324101071)', 'App\\Models\\User', 'created', 2113, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101071\"}}', NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46'),
(698, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari ZULLUL ARDAN RAFAYANTO (Username: ortu_2324101072)', 'App\\Models\\User', 'created', 2114, 'App\\Models\\User', 531, '{\"attributes\": {\"username\": \"ortu_2324101072\"}}', NULL, '2025-12-18 03:04:47', '2025-12-18 03:04:47'),
(699, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari John Doe (Username: ortu_8573825709)', 'App\\Models\\User', 'created', 2115, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"ortu_8573825709\"}}', NULL, '2025-12-18 03:47:13', '2025-12-18 03:47:13'),
(700, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari Jane Smith (Username: ortu_0129392472)', 'App\\Models\\User', 'created', 2116, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"ortu_0129392472\"}}', NULL, '2025-12-18 03:47:13', '2025-12-18 03:47:13'),
(701, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari test (Username: ortu_test)', 'App\\Models\\User', 'created', 2117, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"ortu_test\"}}', NULL, '2025-12-18 03:47:14', '2025-12-18 03:47:14'),
(702, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: Orangtua dari jk (Username: ortu_6758)', 'App\\Models\\User', 'created', 2118, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"ortu_6758\"}}', NULL, '2025-12-18 03:47:14', '2025-12-18 03:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `dudis`
--

CREATE TABLE `dudis` (
  `id` bigint UNSIGNED NOT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED DEFAULT NULL,
  `nama_dudi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang_usaha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `radius` int NOT NULL DEFAULT '100' COMMENT 'Radius absensi dalam meter',
  `pimpinan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruktur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dudis`
--

INSERT INTO `dudis` (`id`, `sekolah_id`, `tahun_ajaran_id`, `nama_dudi`, `bidang_usaha`, `alamat`, `latitude`, `longitude`, `radius`, `pimpinan`, `instruktur`, `created_at`, `updated_at`) VALUES
(11, 5, 1, 'Robotic School', 'Robotic', 'Bantul', '-7.3708680', '108.5274258', 100, 'Joe', 'Ibnu', '2025-10-23 10:35:43', '2025-12-22 02:02:07'),
(12, 5, 1, 'Access Media', 'IT Software', 'Tasikmalaya', NULL, NULL, 100, 'Yana', 'Ayu', '2025-10-23 10:36:22', '2025-10-23 10:36:22'),
(14, 6, 1, 'Disnaker Banjar', 'Kedinasan', 'Banjar', '-7.3703263', '108.5404565', 100, 'Iriana', 'Asep', '2025-11-07 14:32:58', '2025-11-28 22:23:02'),
(16, 6, 1, 'Prilude Studio', 'IT Software', 'Tasikmalaya', '-7.3700504', '108.5407874', 100, 'Nanda', 'Lily', '2025-11-07 16:46:01', '2025-12-08 04:41:42'),
(17, 6, 1, 'test', 'test', 'test', '-7.3367552', '108.2228736', 100, 'test', 'test', '2025-12-16 09:59:32', '2025-12-16 10:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `dudi_pembimbings`
--

CREATE TABLE `dudi_pembimbings` (
  `id` bigint UNSIGNED NOT NULL,
  `dudi_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED DEFAULT NULL,
  `nama_pembimbing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dudi_pembimbings`
--

INSERT INTO `dudi_pembimbings` (`id`, `dudi_id`, `tahun_ajaran_id`, `nama_pembimbing`, `created_at`, `updated_at`) VALUES
(22, 11, 1, 'Ibnu', '2025-10-23 10:35:43', '2025-10-23 10:35:43'),
(23, 12, 1, 'Ayu', '2025-10-23 10:36:22', '2025-10-23 10:36:22'),
(24, 11, 1, 'malik', '2025-10-23 10:36:46', '2025-10-23 10:36:46'),
(25, 12, 1, 'malik', '2025-10-23 10:37:21', '2025-10-23 10:37:21'),
(31, 14, 1, 'Asep', '2025-11-07 14:32:58', '2025-11-07 14:32:58'),
(32, 14, 1, 'Malik', '2025-11-07 15:22:40', '2025-11-07 15:22:40'),
(35, 16, 1, 'Lily', '2025-11-07 16:46:01', '2025-11-07 16:46:01'),
(36, 16, 1, 'Malik', '2025-12-08 04:38:30', '2025-12-08 04:38:30'),
(37, 17, 1, 'test', '2025-12-16 09:59:33', '2025-12-16 09:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gurus`
--

CREATE TABLE `gurus` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_guru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kontak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gurus`
--

INSERT INTO `gurus` (`id`, `nama_guru`, `nip`, `kontak`, `jabatan`, `sekolah_id`, `tahun_ajaran_id`, `created_at`, `updated_at`) VALUES
(87, 'Aang Susbijantara Faizar', '197507152007011021', '0881023373017', 'Guru', 5, 1, '2025-10-01 01:39:16', '2025-10-08 02:17:38'),
(88, 'Ahmad Muhaimin Rajab', '199201192022211012', '089655234202', 'Guru', 5, 1, '2025-10-01 01:39:17', '2025-10-08 02:17:38'),
(89, 'Alis Nursaleh', '199108102024211028', '082120062600', 'Guru', 5, 1, '2025-10-01 01:39:17', '2025-10-08 02:17:38'),
(90, 'ALPAN', '198703122023211011', '081224988904', 'Guru', 5, 1, '2025-10-01 01:39:17', '2025-10-08 02:17:38'),
(91, 'Annisa Kurnia Damayu', '199107032025212006', '082115500200', 'Guru', 5, 1, '2025-10-01 01:39:18', '2025-10-08 02:17:38'),
(92, 'Ari Hendartika', '198911052022211006', '082216301869', 'Guru', 5, 1, '2025-10-01 01:39:18', '2025-10-08 02:17:38'),
(93, 'Arief Budiaistana Putra', '199504032022211004', '087830292103', 'Guru', 5, 1, '2025-10-01 01:39:18', '2025-10-08 02:17:38'),
(94, 'Asep Indra', '197412302009021002', '081395952200', 'Guru', 5, 1, '2025-10-01 01:39:19', '2025-10-08 02:17:38'),
(95, 'Aslim', '196908272005011003', '085220761868', 'Guru', 5, 1, '2025-10-01 01:39:19', '2025-10-08 02:17:38'),
(96, 'Ati Supiati', '434335342454535556', '082321325446', 'Guru', 5, 1, '2025-10-01 01:39:20', '2025-10-08 02:17:38'),
(97, 'Baiman Hadisucipto', '197606082023211002', '085223772220', 'Guru', 5, 1, '2025-10-01 01:39:20', '2025-10-08 02:17:38'),
(98, 'Barokatunnafiah R', '198312012009022007', '082315650265', 'Guru', 5, 1, '2025-10-01 01:39:20', '2025-10-08 02:17:38'),
(99, 'Beni Fitrianto Hidayat', '198406302022211004', '08172383026', 'Guru', 5, 1, '2025-10-01 01:39:21', '2025-10-08 02:17:38'),
(100, 'Dani Efendi', '198410292022211003', '081313356260', 'Guru', 5, 1, '2025-10-01 01:39:21', '2025-10-08 02:17:38'),
(101, 'Darsu', '198912282022211007', '082321190287', 'Guru', 5, 1, '2025-10-01 01:39:21', '2025-10-08 02:17:38'),
(102, 'Dede Rukmana', '199308232020121013', '082118518747', 'Guru', 5, 1, '2025-10-01 01:39:22', '2025-10-08 02:17:38'),
(103, 'Dedeh Kurniasih', '197712112024212004', '085794395374', 'Guru', 5, 1, '2025-10-01 01:39:22', '2025-10-08 02:17:38'),
(104, 'Deni Suharyanto', '198504132009021005', '082129293700', 'Guru', 5, 1, '2025-10-01 01:39:22', '2025-10-08 02:17:38'),
(105, 'Deti Haryati', '197508052006042004', '089663969585', 'Guru', 5, 1, '2025-10-01 01:39:22', '2025-10-08 02:17:38'),
(106, 'Dewi Fridawati', '198312242022212010', '085220333017', 'Guru', 5, 1, '2025-10-01 01:39:23', '2025-10-08 02:17:38'),
(107, 'Elin Roslianti', '198105052005012023', '082320663890', 'Guru', 5, 1, '2025-10-01 01:39:23', '2025-10-08 02:17:38'),
(108, 'Elis Fitriawati', '197909032005012007', '81320110170', 'Guru', 5, 1, '2025-10-01 01:39:23', '2025-10-08 02:17:38'),
(109, 'Elis Kusumahwati', '198202152007012005', '082115353074', 'Guru', 5, 1, '2025-10-01 01:39:24', '2025-10-08 02:17:38'),
(110, 'Elis Siti Nurjanah', '199401212022212009', '082226878016', 'Guru', 5, 1, '2025-10-01 01:39:24', '2025-10-08 02:17:38'),
(111, 'Endang Suhendar', '199203122022211002', '085323323226', 'Guru', 5, 1, '2025-10-01 01:39:24', '2025-10-08 02:17:38'),
(112, 'Eni Widyastuti', '196610041989032006', '081320671937', 'Guru', 5, 1, '2025-10-01 01:39:24', '2025-10-08 02:17:38'),
(113, 'Etin Rostika', '198106162007012007', '081320488719', 'Guru', 5, 1, '2025-10-01 01:39:25', '2025-10-08 02:17:38'),
(114, 'Fajar Akbar Yanto', '198412132023211008', '085224957933', 'Guru', 5, 1, '2025-10-01 01:39:25', '2025-10-08 02:17:38'),
(115, 'GUGUN GUNAWAN SAPII', '199501292022211007', '081320555474', 'Guru', 5, 1, '2025-10-01 01:39:25', '2025-10-08 02:17:38'),
(116, 'Gun Gun  Gurniwa Gautama', '198112312024211011', '085223350505', 'Guru', 5, 1, '2025-10-01 01:39:25', '2025-10-08 02:17:38'),
(117, 'Hany Fitriyanti', '198905072023212046', '085353204999', 'Guru', 5, 1, '2025-10-01 01:39:26', '2025-10-08 02:17:38'),
(118, 'Heni Rosmiati', '197404042025212004', '085321543442', 'Guru', 5, 1, '2025-10-01 01:39:26', '2025-10-08 02:17:38'),
(119, 'Hermin Hindayani', '197307262005012005', '81320726237', 'Guru', 5, 1, '2025-10-01 01:39:26', '2025-10-08 02:17:38'),
(120, 'Ibnu Gumilar', '199104282023211010', '081804846468', 'Guru', 5, 1, '2025-10-01 01:39:26', '2025-10-08 02:17:38'),
(121, 'Ihsan Zaenissalam', '199401042022211004', '082315447265', 'Guru', 5, 1, '2025-10-01 01:39:27', '2025-10-08 02:17:38'),
(122, 'Iis Tresnawati', '198101292025212004', '082217342381', 'Guru', 5, 1, '2025-10-01 01:39:27', '2025-10-08 02:17:38'),
(123, 'Ikah Atikah', '198605282009022005', '085223486339', 'Guru', 5, 1, '2025-10-01 01:39:27', '2025-10-08 02:17:38'),
(124, 'Imas Rohimah', '198407172022212040', '081321804377', 'Guru', 5, 1, '2025-10-01 01:39:27', '2025-10-08 02:17:38'),
(125, 'Iming Lasmini', '198402072009022004', '085223166062', 'Guru', 5, 1, '2025-10-01 01:39:28', '2025-10-08 02:17:38'),
(126, 'Ina Indriyani', '198703032024212017', '085255305433', 'Guru', 5, 1, '2025-10-01 01:39:28', '2025-10-08 02:17:38'),
(127, 'Isna Nurilah', '197501012005012014', '081324251134', 'Guru', 5, 1, '2025-10-01 01:39:28', '2025-10-08 02:17:38'),
(128, 'Juliarto', '198707162024211010', '085536893448', 'Guru', 5, 1, '2025-10-01 01:39:28', '2025-10-08 02:17:38'),
(129, 'Kusmawati', '197509162005012008', '082215682053', 'Guru', 5, 1, '2025-10-01 01:39:29', '2025-10-08 02:17:38'),
(130, 'Kuswandi', '196705252006041004', '081321928237', 'Guru', 5, 1, '2025-10-01 01:39:29', '2025-10-08 02:17:38'),
(131, 'Lala Maulana', '198201062007011004', '85223359825', 'Guru', 5, 1, '2025-10-01 01:39:29', '2025-10-08 02:17:38'),
(132, 'Lin Karlina Sri Martini', '198807102022212006', '0811242678', 'Guru', 5, 1, '2025-10-01 01:39:30', '2025-10-08 02:17:38'),
(133, 'Lina Herlina', '197904012023212014', '083897108860', 'Guru', 5, 1, '2025-10-01 01:39:30', '2025-10-08 02:17:38'),
(134, 'Meytasari', '199105282022212015', '087724901855', 'Guru', 5, 1, '2025-10-01 01:39:30', '2025-10-08 02:17:38'),
(135, 'Mohamad Abdul Basir Imam Basuki', '197912092005011003', '087767858792', 'Guru', 5, 1, '2025-10-01 01:39:30', '2025-10-08 02:17:38'),
(136, 'Nandang Hermana', '197806122003121005', '089510697284', 'Guru', 5, 1, '2025-10-01 01:39:31', '2025-10-08 02:17:38'),
(137, 'Nasrodin', '198106102024211005', '082320615528', 'Guru', 5, 1, '2025-10-01 01:39:31', '2025-10-08 02:17:38'),
(138, 'Neng Wida Nurdiani', '111222333344444555', '085720036380', 'Guru', 5, 1, '2025-10-01 01:39:31', '2025-10-08 02:17:38'),
(139, 'Neny Yunaeti', '198201252007012006', '081226895111', 'Guru', 5, 1, '2025-10-01 01:39:31', '2025-10-08 02:17:38'),
(140, 'Nia Kurniasih', '197903082025212002', '085322454465', 'Guru', 5, 1, '2025-10-01 01:39:32', '2025-10-08 02:17:38'),
(141, 'Niawati', '198103072022212025', '081368645870', 'Guru', 5, 1, '2025-10-01 01:39:32', '2025-10-08 02:17:38'),
(142, 'Ninik Kurniati', '198406062009022011', '085242912166', 'Guru', 5, 1, '2025-10-01 01:39:32', '2025-10-08 02:17:38'),
(143, 'Novi Maulani', '198611102024212028', '085222005432', 'Guru', 5, 1, '2025-10-01 01:39:32', '2025-10-08 02:17:38'),
(144, 'Novi Nur Istiqomah', '234232334365764786', '082217805643', 'Guru', 5, 1, '2025-10-01 01:39:33', '2025-10-08 02:17:38'),
(145, 'Nurhayati', '198205052009022008', '082322485558', 'Guru', 5, 1, '2025-10-01 01:39:33', '2025-10-08 02:17:38'),
(146, 'Nurul Hidayati', '198210252025212005', '081328796132', 'Guru', 5, 1, '2025-10-01 01:39:33', '2025-10-08 02:17:38'),
(147, 'Popi Suprapti', '198510182023212023', '085223570085', 'Guru', 5, 1, '2025-10-01 01:39:33', '2025-10-08 02:17:38'),
(148, 'Pribadi Ramadhan', '199502152020121007', '089659735637', 'Guru', 5, 1, '2025-10-01 01:39:34', '2025-10-08 02:17:38'),
(149, 'Pusparani', '197107282006042012', '81320055888', 'Guru', 5, 1, '2025-10-01 01:39:34', '2025-10-08 02:17:38'),
(150, 'Putri Marlistiasari', '199410132024212035', '082240330923', 'Guru', 5, 1, '2025-10-01 01:39:34', '2025-10-08 02:17:38'),
(151, 'Renita Wildy Hernanda', '786767677876767676', '082321535992', 'Guru', 5, 1, '2025-10-01 01:39:34', '2025-10-08 02:17:38'),
(152, 'Rian Fauzi', '199207072022211009', '085323338846', 'Guru', 5, 1, '2025-10-01 01:39:35', '2025-10-08 02:17:38'),
(153, 'Rini Dinarwati', '198207102022212024', '081280040745', 'Guru', 5, 1, '2025-10-01 01:39:35', '2025-10-08 02:17:38'),
(154, 'Rini Uswati', '197608252009022002', '082118536345', 'Guru', 5, 1, '2025-10-01 01:39:35', '2025-10-08 02:17:38'),
(155, 'Risdiyan', '197701172006041008', '85353222333', 'Guru', 5, 1, '2025-10-01 01:39:35', '2025-10-08 02:17:38'),
(156, 'Roni Susanto', '198401012023211015', '087712318071', 'Guru', 5, 1, '2025-10-01 01:39:36', '2025-10-08 02:17:38'),
(157, 'Ruslan Nur Iskandar', '196912171997021003', '81323450490', 'Guru', 5, 1, '2025-10-01 01:39:36', '2025-10-08 02:17:38'),
(158, 'Sandi Saputra', '199307212022211005', '083871769619', 'Guru', 5, 1, '2025-10-01 01:39:36', '2025-10-08 02:17:38'),
(159, 'Sintia', '199202182020122011', '081297634234', 'Guru', 5, 1, '2025-10-01 01:39:36', '2025-10-08 02:17:38'),
(160, 'Siska Rachmawati', '199611232022212013', '089686153206', 'Guru', 5, 1, '2025-10-01 01:39:37', '2025-10-08 02:17:38'),
(161, 'Siti Nurmei Muliati', '199505042023212024', '081949998138', 'Guru', 5, 1, '2025-10-01 01:39:37', '2025-10-08 02:17:38'),
(162, 'Siti Rodiah', '198601202009022009', '081223686137', 'Guru', 5, 1, '2025-10-01 01:39:37', '2025-10-08 02:17:38'),
(163, 'SITI ROHIMAH', '199506152022212007', '083856367400', 'Guru', 5, 1, '2025-10-01 01:39:38', '2025-10-08 02:17:38'),
(164, 'Solihudin', '198308152023211013', '085223297916', 'Guru', 5, 1, '2025-10-01 01:39:38', '2025-10-08 02:17:38'),
(165, 'Sukatmi', '197010152005012008', '085723677710', 'Guru', 5, 1, '2025-10-01 01:39:38', '2025-10-08 02:17:38'),
(166, 'Suryana', '196510012022211001', '081234567890', 'Guru', 5, 1, '2025-10-01 01:39:38', '2025-10-08 02:17:38'),
(167, 'Susi Rukhmiati', '198004292009022003', '081345919780', 'Guru', 5, 1, '2025-10-01 01:39:39', '2025-10-08 02:17:38'),
(168, 'Tiara Ristinasari', '098780778689978976', '089625115163', 'Guru', 5, 1, '2025-10-01 01:39:39', '2025-10-08 02:17:38'),
(169, 'Upen', '198808142022211007', '085232139102', 'Guru', 5, 1, '2025-10-01 01:39:39', '2025-10-08 02:17:38'),
(170, 'Vera Cahya Gumilar', '199204072022212017', '081320270844', 'Guru', 5, 1, '2025-10-01 01:39:39', '2025-10-08 02:17:38'),
(171, 'Vevi Supriyanti', '199410012022212017', '081223351052', 'Guru', 5, 1, '2025-10-01 01:39:40', '2025-10-08 02:17:38'),
(172, 'Wiwin Supriatin', '196707232005012001', '85223547696', 'Guru', 5, 1, '2025-10-01 01:39:40', '2025-10-08 02:17:38'),
(173, 'Yanti Kadaryati', '196609222005012003', '082218934864', 'Guru', 5, 1, '2025-10-01 01:39:40', '2025-10-08 02:17:38'),
(174, 'Yusup Zarkasi', '199312092023211005', '085353889358', 'Guru', 5, 1, '2025-10-01 01:39:40', '2025-10-08 02:17:38'),
(175, 'Damian', '198001012010011001', '1234567890', 'Guru Produktif', 5, 5, '2025-11-06 14:05:20', '2025-11-06 14:05:20'),
(176, 'Danang', '903275328975209', '6254721884', 'Guru Produktif', 6, 1, '2025-11-07 14:15:55', '2025-11-07 14:15:55'),
(177, 'Budi', '00924729864252', '1232518362', 'Guru Matematika', 6, 1, '2025-11-07 14:15:55', '2025-11-07 14:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_harians`
--

CREATE TABLE `jurnal_harians` (
  `id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `prakerin_siswa_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `kegiatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diverifikasi_pembimbing_dudi` tinyint(1) NOT NULL DEFAULT '0',
  `catatan_pembimbing_dudi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `diverifikasi_guru_pembimbing` tinyint(1) NOT NULL DEFAULT '0',
  `catatan_guru_pembimbing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jurnal_harians`
--

INSERT INTO `jurnal_harians` (`id`, `siswa_id`, `prakerin_siswa_id`, `tanggal`, `kegiatan`, `diverifikasi_pembimbing_dudi`, `catatan_pembimbing_dudi`, `diverifikasi_guru_pembimbing`, `catatan_guru_pembimbing`, `created_at`, `updated_at`) VALUES
(24, 2099, 88, '2025-11-29', '<p>rjeiwohgkobeqrkohyi34hrgjrsnbvioerwhtewiobnknweiohtigewhinbiewgioeohteiwngewihtiowhtewiohgeskngiowehgwier</p>', 0, NULL, 0, NULL, '2025-11-28 22:30:10', '2025-11-28 22:30:10'),
(27, 2100, 90, '2025-12-12', '<p>Test Untuk Penggunaan Fitur Cetak Jurnal Harian</p>', 0, NULL, 0, NULL, '2025-12-12 12:58:47', '2025-12-12 12:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `konsentrasi_keahlian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `konsentrasi_keahlian`, `sekolah_id`, `tahun_ajaran_id`, `created_at`, `updated_at`) VALUES
(1, '12 AK 1', 'Akuntansi dan Keuangan Lembaga', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(2, '12 AK 2', 'Akuntansi dan Keuangan Lembaga', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(3, '12 BD 1', 'Bisnis Digital', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(4, '12 BD 2', 'Bisnis Digital', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(5, '12 BD 3', 'Bisnis Digital', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(6, '12 DKV 1', 'Desain Komunikasi Visual', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(7, '12 DKV 2', 'Desain Komunikasi Visual', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(8, '12 DPB 1', 'Desain Produksi Busana', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(9, '12 DPB 2', 'Desain Produksi Busana', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(10, '12 MP 1', 'Manajemen Perkantoran', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(11, '12 MP 2', 'Manajemen Perkantoran', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(12, '12 MP 3', 'Manajemen Perkantoran', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(13, '12 PF', 'Produksi Film', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(14, '12 RPL 1', 'Rekayasa Perangkat Lunak', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(15, '12 RPL 2', 'Rekayasa Perangkat Lunak', 5, 1, '2025-10-08 01:01:21', '2025-10-13 02:52:27'),
(16, '12 AK 1', 'Akuntansi dan Keuangan Lembaga', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(17, '12 AK 2', 'Akuntansi dan Keuangan Lembaga', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(18, '12 BD 1', 'Bisnis Digital', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(19, '12 BD 2', 'Bisnis Digital', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(20, '12 BD 3', 'Bisnis Digital', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(21, '12 DKV 1', 'Desain Komunikasi Visual', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(22, '12 DKV 2', 'Desain Komunikasi Visual', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(23, '12 DPB 1', 'Desain Produksi Busana', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(24, '12 DPB 2', 'Desain Produksi Busana', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(25, '12 MP 1', 'Manajemen Perkantoran', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(26, '12 MP 2', 'Manajemen Perkantoran', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(27, '12 MP 3', 'Manajemen Perkantoran', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(28, '12 PF', 'Produksi Film', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(29, '12 RPL 1', 'Rekayasa Perangkat Lunak', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(30, '12 RPL 2', 'Rekayasa Perangkat Lunak', 5, 5, '2025-10-13 02:53:51', '2025-10-13 02:53:51'),
(31, '12 AK 1', 'Akuntansi dan Keuangan Lembaga', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(32, '12 AK 2', 'Akuntansi dan Keuangan Lembaga', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(33, '12 BD 1', 'Bisnis Digital', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(34, '12 BD 2', 'Bisnis Digital', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(35, '12 BD 3', 'Bisnis Digital', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(36, '12 DKV 1', 'Desain Komunikasi Visual', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(37, '12 DKV 2', 'Desain Komunikasi Visual', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(38, '12 DPB 1', 'Desain Produksi Busana', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(39, '12 DPB 2', 'Desain Produksi Busana', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(40, '12 MP 1', 'Manajemen Perkantoran', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(41, '12 MP 2', 'Manajemen Perkantoran', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(42, '12 MP 3', 'Manajemen Perkantoran', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(43, '12 PF', 'Produksi Film', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(44, '12 RPL 1', 'Rekayasa Perangkat Lunak', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(45, '12 RPL 2', 'Rekayasa Perangkat Lunak', 5, 6, '2025-10-13 02:55:15', '2025-10-13 02:55:15'),
(46, '12 Sosiologi 1', 'Sosiologi', 6, 1, '2025-11-06 14:30:13', '2025-11-06 14:30:13'),
(47, '12 Sosiologi 2', 'Sosiologi', 6, 1, '2025-11-07 14:10:45', '2025-11-07 14:10:45'),
(48, '12 Rekayasa 1', 'Rekayasa', 6, 1, '2025-11-10 01:07:35', '2025-11-10 01:07:35'),
(49, '12 Rekayasa 2', 'Rekayasa', 6, 1, '2025-11-10 01:07:55', '2025-11-10 01:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_mingguans`
--

CREATE TABLE `laporan_mingguans` (
  `id` bigint UNSIGNED NOT NULL,
  `prakerin_siswa_id` bigint UNSIGNED NOT NULL,
  `minggu_ke` int NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `tanggal_mulai_minggu` date NOT NULL,
  `tanggal_selesai_minggu` date NOT NULL,
  `laporan_guru` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `verifikasi_guru` tinyint(1) NOT NULL DEFAULT '0',
  `laporan_dudi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `verifikasi_dudi` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_mingguans`
--

INSERT INTO `laporan_mingguans` (`id`, `prakerin_siswa_id`, `minggu_ke`, `siswa_id`, `tanggal_mulai_minggu`, `tanggal_selesai_minggu`, `laporan_guru`, `verifikasi_guru`, `laporan_dudi`, `verifikasi_dudi`, `created_at`, `updated_at`) VALUES
(117, 86, 1, 2097, '2025-11-07', '2025-11-13', 'Ok ini berjalan di Kolom Guru', 1, 'Ok Bagus,Ini Sudah Berjalan', 1, '2025-11-07 17:10:07', '2025-11-08 14:33:02'),
(118, 86, 2, 2097, '2025-11-14', '2025-11-20', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(119, 86, 3, 2097, '2025-11-21', '2025-11-27', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(120, 86, 4, 2097, '2025-11-28', '2025-11-30', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(121, 87, 1, 2098, '2025-11-07', '2025-11-13', 'TEST', 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-10 03:06:15'),
(122, 87, 2, 2098, '2025-11-14', '2025-11-20', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(123, 87, 3, 2098, '2025-11-21', '2025-11-27', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(124, 87, 4, 2098, '2025-11-28', '2025-11-30', NULL, 0, NULL, 0, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(125, 88, 1, 2099, '2025-11-07', '2025-11-13', NULL, 0, NULL, 0, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(126, 88, 2, 2099, '2025-11-14', '2025-11-20', NULL, 0, NULL, 0, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(127, 88, 3, 2099, '2025-11-21', '2025-11-27', NULL, 0, NULL, 0, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(128, 88, 4, 2099, '2025-11-28', '2025-11-30', NULL, 0, NULL, 0, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(131, 90, 1, 2100, '2025-12-12', '2025-12-18', NULL, 0, NULL, 0, '2025-12-12 09:58:44', '2025-12-12 09:58:44'),
(132, 90, 2, 2100, '2025-12-19', '2025-12-25', NULL, 0, NULL, 0, '2025-12-12 09:58:44', '2025-12-12 09:58:44'),
(133, 90, 3, 2100, '2025-12-26', '2025-12-31', NULL, 0, NULL, 0, '2025-12-12 09:58:44', '2025-12-12 09:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_12_061450_create_sekolahs_table', 1),
(6, '2025_09_12_063829_create_tahun_ajarans_table', 1),
(7, '2025_09_12_071036_create_siswas_table', 1),
(8, '2025_09_12_072056_create_gurus_table', 1),
(9, '2025_09_12_073014_create_dudis_table', 1),
(10, '2025_09_12_073732_create_dudi_pembimbings_table', 1),
(11, '2025_09_12_074345_create_kelas_table', 1),
(12, '2025_09_15_070948_add_role_to_users', 1),
(13, '2025_09_17_023252_create_permission_tables', 1),
(14, '2025_09_17_030358_create_add_red_id_to_users_table', 1),
(15, '2025_09_17_040005_add_role_fields_to_users_table', 1),
(16, 'tambah_username', 2),
(18, '2025_09_17_040601_create_prakerins_table', 3),
(19, 'PrakerinSiswa', 4),
(20, 'tambah_role_type_ke_user', 5),
(21, '2025_09_18_054753_create_sessions_table', 6),
(22, '2025_09_24_043726_create_prakerin_siswas_table', 7),
(23, '2025_09_24_051843_create_prakerin_siswas_table', 8),
(24, '2025_09_24_053733_create_jurnal_harians_table', 9),
(25, '2025_09_24_054737_remove_foto_kegiatan_from_jurnal_harians_table', 10),
(26, '2025_09_24_055509_add_jam_masuk_dan_pulang_to_absensis_table', 11),
(27, '2025_10_01_091952_add_hari_kerja_to_prakerin_siswas_table', 12),
(28, '2025_10_01_092032_create_laporan_mingguans_table', 13),
(29, '2025_10_03_125621_create_tujuan_pembelajarans_table', 14),
(30, '2025_10_03_130319_create_penilaian_pkls_table', 15),
(31, '2025_10_03_132142_modify_penilaian_pkls_table_for_json_tujuan', 16),
(32, '2025_10_03_144031_revert_penilaian_pkls_table_again', 17),
(33, '2025_10_06_093307_modify_penilaian_pkls_table', 18),
(34, '2025_10_06_100455_create_penilaian_pkls_table_final', 19),
(35, '2025_10_08_080617_add_kelas_and_tahun_ajaran_to_siswas_table', 20),
(36, '2025_10_08_091220_add_tahun_ajaran_to_gurus_table', 21),
(37, '2025_10_08_093910_add_tahun_ajaran_to_dudis_table', 22),
(38, '2025_10_08_094727_add_tahun_ajaran_to_dudi_pembimbings_table', 23),
(39, '2025_10_09_111134_add_grade_to_penilaian_pkls_table', 24),
(40, '2025_10_13_083641_add_status_to_siswas_table', 25),
(41, '2025_10_13_084951_refactor_kelas_table', 26),
(42, '2025_10_13_090329_revert_refactor_kelas_table', 27),
(43, '2025_10_13_091954_add_tahun_ajaran_to_kelas_table', 28),
(44, '2025_10_14_073827_add_subscription_fields_to_sekolahs_table', 29),
(45, '2025_10_15_092055_add_no_sk_to_prakerin_tables', 30),
(46, '2025_10_16_141145_create_weekly_reflections_table', 31),
(47, '2025_10_17_082519_add_verification_to_weekly_reflections_table', 32),
(48, '2025_10_17_093545_add_minggu_ke_to_laporan_mingguans_table', 33),
(49, '2025_10_17_095437_add_verifikasi_to_laporan_mingguans_table', 34),
(50, '2025_10_17_144252_buat_detail_penilaian', 35),
(51, '2025_10_20_214537_create_activity_log_table', 36),
(52, '2025_10_20_214538_add_event_column_to_activity_log_table', 37),
(53, '2025_10_20_214539_add_batch_uuid_column_to_activity_log_table', 38),
(54, '2025_10_23_175918_create_notifications_table', 39),
(56, '2025_10_25_061403_add_location_to_dudis_table', 40),
(57, '2025_11_06_210218_add_kuota_bonus_to_sekolahs_table', 41),
(58, '2025_11_26_000001_add_foto_columns_to_absensis_table', 42),
(59, '2025_12_22_000001_add_indexes_for_dashboard_tables', 43);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('58ea1cd2-ce22-47b9-993f-492b20fc0136', 'App\\Notifications\\SekolahMasaAktifExpiringSoon', 'App\\Models\\User', 1554, '{\"actions\":[],\"body\":\"Masa aktif SMKN 1 BANJAR akan berakhir dalam 7 hari (tanggal 30\\/10\\/2025). Harap segera hubungi Super Admin untuk perpanjangan.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-exclamation-triangle\",\"iconColor\":\"warning\",\"status\":\"warning\",\"title\":\"\\u26a0\\ufe0f Masa Aktif Sekolah Akan Habis\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', NULL, '2025-10-23 11:35:22', '2025-10-23 11:35:22'),
('a5adfb04-d45a-41e5-8668-800992574ef6', 'App\\Notifications\\SekolahMasaAktifExpiringSoon', 'App\\Models\\User', 1551, '{\"actions\":[],\"body\":\"Masa aktif SMKN 1 BANJAR akan berakhir dalam 7 hari (tanggal 30\\/10\\/2025). Harap segera hubungi Super Admin untuk perpanjangan.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-exclamation-triangle\",\"iconColor\":\"warning\",\"status\":\"warning\",\"title\":\"\\u26a0\\ufe0f Masa Aktif Sekolah Akan Habis\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', NULL, '2025-10-23 11:35:22', '2025-10-23 11:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_details`
--

CREATE TABLE `penilaian_details` (
  `id` bigint UNSIGNED NOT NULL,
  `penilaian_pkl_id` bigint UNSIGNED NOT NULL,
  `tujuan_pembelajaran_id` bigint UNSIGNED NOT NULL,
  `skor_guru` tinyint UNSIGNED DEFAULT NULL,
  `skor_dudi` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penilaian_details`
--

INSERT INTO `penilaian_details` (`id`, `penilaian_pkl_id`, `tujuan_pembelajaran_id`, `skor_guru`, `skor_dudi`, `created_at`, `updated_at`) VALUES
(36, 8, 8, 76, 88, '2025-11-08 15:24:09', '2025-11-08 15:27:27'),
(37, 8, 9, 89, 58, '2025-11-08 15:24:09', '2025-11-08 15:27:27'),
(38, 9, 8, 86, 77, '2025-12-12 11:55:08', '2025-12-12 12:14:23'),
(39, 9, 9, 79, 89, '2025-12-12 11:55:08', '2025-12-12 12:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_pkls`
--

CREATE TABLE `penilaian_pkls` (
  `id` bigint UNSIGNED NOT NULL,
  `prakerin_siswa_id` bigint UNSIGNED NOT NULL,
  `skor_guru` int DEFAULT NULL,
  `keterangan_guru` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `grade_guru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dinilai_oleh_guru_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal_dinilai_guru` timestamp NULL DEFAULT NULL,
  `skor_dudi` int DEFAULT NULL,
  `keterangan_dudi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `grade_dudi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dinilai_oleh_dudi_id` bigint UNSIGNED DEFAULT NULL,
  `tanggal_dinilai_dudi` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penilaian_pkls`
--

INSERT INTO `penilaian_pkls` (`id`, `prakerin_siswa_id`, `skor_guru`, `keterangan_guru`, `grade_guru`, `dinilai_oleh_guru_id`, `tanggal_dinilai_guru`, `skor_dudi`, `keterangan_dudi`, `grade_dudi`, `dinilai_oleh_dudi_id`, `tanggal_dinilai_dudi`, `created_at`, `updated_at`) VALUES
(8, 86, 83, NULL, 'B', 1578, '2025-11-08 15:24:09', 73, NULL, 'C', 1582, '2025-11-08 15:27:27', '2025-11-08 15:24:09', '2025-11-08 15:27:27'),
(9, 90, 83, NULL, 'B', 1579, '2025-12-12 12:14:23', 83, NULL, 'B', 1588, '2025-12-12 11:55:08', '2025-12-12 11:55:07', '2025-12-12 12:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_sekolah', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(2, 'create_sekolah', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(3, 'edit_sekolah', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(4, 'delete_sekolah', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(5, 'view_guru', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(6, 'create_guru', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(7, 'edit_guru', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(8, 'delete_guru', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(9, 'view_siswa', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(10, 'create_siswa', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(11, 'edit_siswa', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(12, 'delete_siswa', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(13, 'view_kelas', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(14, 'create_kelas', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(15, 'edit_kelas', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(16, 'delete_kelas', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(17, 'view_dudi', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(18, 'create_dudi', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(19, 'edit_dudi', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(20, 'delete_dudi', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(21, 'view_prakerin', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(22, 'create_prakerin', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(23, 'edit_prakerin', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(24, 'delete_prakerin', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(25, 'view_monitoring', 'web', '2025-09-17 19:55:57', '2025-09-17 19:55:57'),
(26, 'create_monitoring', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(27, 'edit_monitoring', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(28, 'view_laporan', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(29, 'create_laporan', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(30, 'edit_laporan', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(31, 'kelola_sekolah', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(32, 'kelola_guru_siswa', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(33, 'kelola_kelas_tahun_ajaran', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(34, 'kelola_dudi_pembimbing', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(35, 'kelola_laporan_jurnal', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(36, 'kelola_laporan_penilaian', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(37, 'validasi_laporan_jurnal', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(38, 'penilaian_pkl', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(39, 'monitoring_reporting', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(40, 'crud_sekolah', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(41, 'crud_user', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(42, 'crud_guru', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25'),
(43, 'crud_siswa', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prakerins`
--

CREATE TABLE `prakerins` (
  `id` bigint UNSIGNED NOT NULL,
  `ketua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sekretaris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` timestamp NOT NULL,
  `tanggal_selesai` timestamp NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_sk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prakerins`
--

INSERT INTO `prakerins` (`id`, `ketua`, `sekretaris`, `tanggal_mulai`, `tanggal_selesai`, `keterangan`, `no_sk`, `sekolah_id`, `tahun_ajaran_id`, `created_at`, `updated_at`) VALUES
(12, 'Test', 'Ambacaf', '2025-11-06 17:00:00', '2025-11-29 17:00:00', 'Program Prakerin 2025/2026 Gelombang 1', '8327538920', 6, 1, '2025-11-07 16:51:52', '2025-11-10 01:54:24'),
(14, 'Testing', 'Testing', '2025-12-11 17:00:00', '2025-12-30 17:00:00', 'Prakerin Gelombang 2 Tahun 2025/2026', '43867209674209', 6, 1, '2025-12-12 09:57:55', '2025-12-12 09:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `prakerin_siswas`
--

CREATE TABLE `prakerin_siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `prakerin_id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `dudi_id` bigint UNSIGNED NOT NULL,
  `dudi_pembimbing_id` bigint UNSIGNED NOT NULL,
  `guru_pembimbing_id` bigint UNSIGNED NOT NULL,
  `status` enum('berjalan','selesai','dibatalkan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'berjalan',
  `no_sk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hari_kerja_per_minggu` tinyint NOT NULL DEFAULT '5',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prakerin_siswas`
--

INSERT INTO `prakerin_siswas` (`id`, `prakerin_id`, `siswa_id`, `dudi_id`, `dudi_pembimbing_id`, `guru_pembimbing_id`, `status`, `no_sk`, `hari_kerja_per_minggu`, `created_at`, `updated_at`) VALUES
(86, 12, 2097, 16, 35, 176, 'berjalan', '83275209', 5, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(87, 12, 2098, 16, 35, 176, 'berjalan', '83275209', 5, '2025-11-07 17:10:07', '2025-11-07 17:10:07'),
(88, 12, 2099, 14, 31, 177, 'berjalan', '73598582', 5, '2025-11-10 01:55:31', '2025-11-10 01:55:31'),
(90, 14, 2100, 16, 36, 177, 'berjalan', '3452', 5, '2025-12-12 09:58:44', '2025-12-12 09:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin_sekolah', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(3, 'guru', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(4, 'siswa', 'web', '2025-09-17 19:55:58', '2025-09-17 19:55:58'),
(5, 'super_admin', 'web', '2025-09-21 20:44:08', '2025-09-21 20:44:08'),
(6, 'dudi', 'web', '2025-09-21 22:50:25', '2025-09-21 22:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(41, 2),
(42, 2),
(43, 2),
(9, 3),
(13, 3),
(17, 3),
(21, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(36, 3),
(37, 3),
(21, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(35, 6),
(37, 6),
(38, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sekolahs`
--

CREATE TABLE `sekolahs` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `masa_aktif_mulai` date DEFAULT NULL,
  `masa_aktif_selesai` date DEFAULT NULL,
  `is_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `batas_akun` int NOT NULL DEFAULT '50',
  `kuota_bonus` int NOT NULL DEFAULT '50' COMMENT 'Kuota tambahan dengan peringatan',
  `alamat_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kepala_sekolah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sekolahs`
--

INSERT INTO `sekolahs` (`id`, `nama_sekolah`, `status_sekolah`, `masa_aktif_mulai`, `masa_aktif_selesai`, `is_aktif`, `batas_akun`, `kuota_bonus`, `alamat_sekolah`, `nama_kepala_sekolah`, `created_at`, `updated_at`) VALUES
(5, 'SMKN 1 BANJAR', 'negeri', '2025-10-14', '2025-12-31', 1, 2000, 50, 'Jl.Kyai Haji Mustopa', 'Dede Ruslianto', '2025-09-21 23:35:02', '2025-12-18 02:56:33'),
(6, 'SMA NEGERI PULAUKELAPA', 'negeri', '2025-11-06', '2026-11-30', 1, 50, 50, 'Jln Pulau Kelapa', 'Dara Syifa', '2025-11-06 14:23:12', '2025-12-08 04:35:09'),
(7, 'SEKOLAH TEST', 'negeri', '2025-11-09', '2025-11-19', 1, 50, 50, 'TEST', 'TEST', '2025-11-09 14:23:18', '2025-11-09 14:23:18'),
(8, 'SMA TEST', 'negeri', '2025-12-09', '2026-12-09', 1, 5000, 50, 'SMA TEST', 'SMA TEST', '2025-12-09 07:43:13', '2025-12-09 07:43:21');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Y01nIVAet0Z6nY5AKtX0Azuu0PAcKk2hGRjf9uU1', 1587, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMFRDajB1a1U0T0RDam9sYnpWZG95TjZiMFVBeFkzSzRkc2R2Qm1oaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vanVybmFsLXBrbC50ZXN0L2Fic2Vuc2lzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTU4NztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHRJeTJXTXFMWGt1UHhYMWppcUJiSmVrcXFZem9jUE15c1VOM2tlNk44UjllMUhqYW9YS3oyIjt9', 1766369035);

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_siswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED DEFAULT NULL,
  `tahun_ajaran_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `nama_siswa`, `nis`, `tempat_lahir`, `tanggal_lahir`, `sekolah_id`, `kelas_id`, `tahun_ajaran_id`, `status`, `created_at`, `updated_at`) VALUES
(1570, 'ALFIAH AZZAHRA', '2324101289', 'CILACAP', '2008-04-21', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1571, 'ALIKA RAHMAWATI', '2324101290', 'Banjar', '2007-01-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1572, 'ANISA RAHMA SAPITRI', '2324101291', 'CIAMIS', '2008-01-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1573, 'AYU SAKILA', '2324101292', 'CILACAP', '2007-02-07', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1574, 'DEVIA UTARI', '2324101293', 'BANDUNG', '2008-05-30', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1575, 'DINI AHIRUL DESTIANTI', '2324101294', 'CILACAP', '2007-12-31', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1576, 'Dzakir Azhar', '2324101295', 'Banjar', '2006-08-15', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1577, 'Elvira Khaerunissa', '2324101296', 'Banjar', '2008-04-17', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1578, 'FINANDA YUGA MANGGALA', '2324101297', 'CILACAP', '2007-10-11', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1579, 'FITRI SASKIA RAMADHANI', '2324101298', 'CIAMIS', '2007-09-22', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1580, 'GALANG', '2324101299', 'BANJAR', '2007-08-07', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1581, 'GALANG FIRMANSYAH', '2324101300', 'BANJAR', '2007-07-26', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1582, 'GISCA NAFISA DESTIANA', '2324101301', 'BANJAR', '2007-12-06', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1583, 'HAMIA NURALIA ZAHRA', '2324101302', 'CIAMIS', '2008-07-07', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1584, 'MARSHA ADELIA PUTRI RIDWANSYAH', '2324101303', 'CIAMIS', '2008-03-09', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1585, 'MARTESA PASKARIANTY', '2324101304', 'BANJAR', '2007-03-25', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1586, 'MEILINDA KHOERUNNISA', '2324101305', 'CIAMIS', '2007-05-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1587, 'MIFTAHUL KHOIR', '2324101306', 'BANJAR', '2007-11-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1588, 'MUHAMMAD FACHRI NUGRAHA', '2324101542', 'Banjar', '2007-09-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1589, 'MUTHYA PRATIWI', '2324101307', 'CIAMIS', '2008-03-03', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1590, 'Nafisa Salsabila Ramadhani', '2324101308', 'Ciamis', '2007-10-05', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1591, 'Nasya Saufika Wati', '2324101309', 'Bandung', '2008-04-19', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1592, 'Nazhara Syahida', '2324101310', 'Banjar', '2007-04-22', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1593, 'Nuri Awwaliah', '2324101312', 'Banjar', '2008-02-10', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1594, 'RACHEL PUTRI RAMADHANI', '2324101313', 'Banjar', '2007-10-08', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1595, 'RAIHAN SUPRYATNA', '2324101314', 'Bandung', '2008-02-23', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1596, 'Raisya Isni Masdiana', '2324101315', 'Banjar', '2007-11-23', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1597, 'Rapi Priatna', '2324101316', 'Banjar', '2007-05-15', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1598, 'RAYZA HUMAIRA', '2324101317', 'Banjar', '2008-07-10', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1599, 'Refan Pratama', '2324101318', 'Banjar', '2008-03-08', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1600, 'RINI APRIANI', '2324101319', 'Banjar', '2007-04-04', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1601, 'RIRIN CITRA NUR\'AENI', '2324101320', 'Banjar', '2007-12-26', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1602, 'SILPI HANDAYANI', '2324101321', 'BANJAR', '2008-06-14', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1603, 'Silva Julianty', '2324101322', 'Banjar', '2007-07-18', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1604, 'Wiliyanti Pergiwa', '2324101324', 'Banjar', '2007-02-28', 5, 1, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1605, 'AGNI DWI LISTYANTO', '2324101325', 'BANJAR', '2007-08-16', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1606, 'Alya Sahwa Nuralif', '2324101326', 'Banjar', '2008-09-01', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1607, 'AMELIA PUTRI', '2324101327', 'BANJAR', '2008-04-29', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1608, 'Ayunda Pramesty Setiawan', '2324101328', 'Banjar', '2008-06-22', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1609, 'Chelsi Aprilia Manik', '2324101329', 'Jambi', '2008-04-29', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1610, 'CHIKA AURELYA PUTRI ANJANI', '2324101330', 'BANJAR', '2007-08-18', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1611, 'Dianty Syarifah Mechdar', '2324101331', 'Banjar', '2008-08-23', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1612, 'Dini Septriani', '2324101332', 'Ciamis', '2008-02-26', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1613, 'DINNA NUR RAHMA', '2324101333', 'BANJAR', '2007-12-28', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1614, 'FATURROHMAN', '2324101334', 'Banjar', '2007-08-16', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1615, 'IKA OKTAVIANI', '2324101335', 'BANJAR', '2007-10-31', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1616, 'MARYAM PUSPA DEWI', '2324101336', 'Cilegon', '2007-04-17', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1617, 'MAYA SUPRIHATIN', '2324101337', 'BANJAR', '2007-10-29', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1618, 'MEILANA GUSTIANA', '2324101338', 'Banjar', '2008-05-09', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1619, 'MEILANI FITRIANI', '2324101339', 'Banjar', '2008-05-09', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1620, 'MUHAMMAD NADIP SUDIRMAN', '2324101340', 'BANJAR', '2007-05-24', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1621, 'NANDITA NOVELIA PUTRI SETIAWAN', '2324101341', 'BANJAR', '2007-11-13', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1622, 'NATHASYA ANANDIRA', '2324101342', 'BANJAR', '2008-05-09', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1623, 'NAYLA PUTRI MAHARANI', '2324101343', 'BANJAR', '2008-01-10', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1624, 'Nazwa Ramadhaniah', '2324101344', 'Banjar', '2007-10-05', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1625, 'Nida Fairuz Anisah', '2324101345', 'Banjar', '2008-12-03', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1626, 'NITA PUSPITASARI', '2324101346', 'BANJAR', '2007-09-15', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1627, 'NURUL NUR IHSAN', '2324101347', 'BANJAR', '2007-11-26', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1628, 'RACHMA PUSPITA', '2324101349', 'BANJAR', '2008-03-22', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1629, 'Rangga Saputra', '2324101350', 'Banjar', '2007-04-13', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1630, 'REPAN TRI RAHMAT', '2324101351', 'BANJAR', '2007-07-24', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1631, 'Reva Alkalivi', '2324101352', 'Banggai', '2007-06-05', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1632, 'REVA OCTA PRATIWI', '2324101353', 'BANJAR', '2007-10-17', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1633, 'REVAN TRAKASYA', '2324101354', 'Banjar', '2007-07-12', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1634, 'RIFA MEILANI', '2324101355', 'BANJAR', '2008-05-10', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1635, 'RISKA YULIANI', '2324101356', 'Banjar', '2007-08-31', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1636, 'SERLY HANDRAYANI', '2324101357', 'Banjar', '2007-09-21', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1637, 'SILVIANA PITRI MULYADI', '2324101358', 'BANJAR', '2007-10-13', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1638, 'SITI ROHMAYATI', '2324101359', 'BANJAR', '2007-05-07', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1639, 'Yunita Sari', '2324101360', 'Banjar', '2007-06-13', 5, 2, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1640, 'Ade vera latifah', '2324101073', 'Ciamis', '2007-12-05', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1641, 'ALIS AMELIA SARI', '2324101074', 'CIAMIS', '2007-07-22', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1642, 'Alsya Nurfadilah', '2324101075', 'Bandung', '2008-08-01', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1643, 'ANNISA ARTIKA FADILAH', '2324101076', 'BANJAR', '2008-06-22', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1644, 'ARIEF NURAHMAN', '2324101077', 'Banjar', '2008-06-12', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1645, 'Arta Yunita', '2324101078', 'Banjar', '2008-06-21', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1646, 'AYU LATIFA NURSABRINA', '2324101079', 'Banjar', '2007-07-06', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1647, 'AZARAH TUSITA YUSLIANI', '2324101080', 'BANJAR', '2008-04-19', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1648, 'BUNGA RISMA RAMADHANTY', '2324101081', 'BANJAR', '2007-09-21', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1649, 'Dinda Niken Pradita', '2324101082', 'Bandung', '2008-05-29', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1650, 'DWI NUGROHO', '2324101083', 'Ciamis', '2006-12-12', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1651, 'EGI NUGRAHA', '2324101084', 'BANJAR', '2007-11-26', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1652, 'HAZZA DWI NURHIDAYAT', '2324101085', 'BANJAR', '2007-06-11', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1653, 'Hilda Raditya Ramadani', '2324101086', 'Banjar', '2008-09-17', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1654, 'ILHAM HANAFI', '2324101087', 'BANJAR', '2008-01-20', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1655, 'JELITA RESTIANTY', '2324101088', 'Banjar', '2008-01-14', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1656, 'Juliyanti', '2324101089', 'Banjar', '2007-07-15', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1657, 'Khalisa Handini', '2324101090', 'Banjar', '2007-05-13', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1658, 'KIKIM PATIMAH', '2324101091', 'BANJAR', '2008-04-17', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1659, 'Miftahul Jannah', '2324101092', 'Banjar', '2007-04-02', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1660, 'Muhammad Fadillah Al Hijriyah', '2324101093', 'Banjar', '2008-01-15', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1661, 'NAURA ALIFA PUTRI RIZAL', '2324101094', 'Banjar', '2007-12-15', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1662, 'NAZLA SHERLY NOER ISMAYANTI', '2324101095', 'CILACAP', '2008-01-12', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1663, 'Nopa Juwita Indriyani', '2324101096', 'Ciamis', '2007-06-22', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1664, 'NURUL NURAZIZAH', '2324101097', 'BANJAR', '2007-07-21', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1665, 'Rayhan Nuryaqin', '2324101098', 'Banjar', '2008-07-02', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1666, 'RHOFIQ RAMDHANI', '2324101099', 'Banjar', '2007-09-25', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1667, 'RISTI NURSITA', '2324101100', 'CIMAHI', '2007-03-15', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1668, 'RIZKY FAHRIZA HAKIKI', '2324101101', 'Banjar', '2008-04-11', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1669, 'SASA ARI JUANDA', '2324101102', 'BANJAR', '2007-01-26', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1670, 'SINTA NURJANAH', '2324101103', 'Banjar', '2008-01-09', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1671, 'SYALWA SALSABILA', '2324101104', 'Banjar', '2007-11-03', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1672, 'TASYA APRIANI', '2324101106', 'CIAMIS', '2008-04-02', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1673, 'Tiara Ayu Herliana', '2324101107', 'Surabaya', '2008-03-08', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1674, 'WILDAN NUR FADILLAH', '2324101108', 'Banjar', '2007-11-03', 5, 3, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1675, 'ADI FITRIANA', '2324101109', 'BANJAR', '2007-10-13', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1676, 'ADINDA RAMADANI', '2324101110', 'MAJENANG', '2007-09-15', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1677, 'AMANDA RAENA DEWI', '2324101111', 'BANJAR', '2008-04-06', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1678, 'AMARA NUR APRILIA', '2324101112', 'BANJAR', '2008-04-03', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1679, 'AMELIA GUSTAMI', '2324101113', 'Banjar', '2007-08-22', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1680, 'ARGALIH SETIAWAN', '2324101115', 'BANJAR', '2007-11-10', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1681, 'Arvia Deswita Saripudin', '2324101116', 'Banjar', '2007-12-25', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1682, 'Asti Surastri', '2324101117', 'Banjar', '2008-08-09', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1683, 'AZKA SHIDDQIE HARUMAN', '2324101118', 'CIAMIS', '2007-11-20', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1684, 'Bunga Cinta Apriliani', '2324101119', 'Sukabumi', '2008-06-29', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1685, 'Danar Khusnul Khofiza', '2324101120', 'Banjar', '2007-08-31', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1686, 'DARA AYU LARASATI', '2324101121', 'Banjar', '2008-02-19', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1687, 'DELA HERLIAWATI', '2324101122', 'CIAMIS', '2008-01-04', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1688, 'EVA AISYAH RAHMAWATI', '2324101123', 'BANJAR', '2007-06-02', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1689, 'Fetti Rizki Lestari', '2324101124', 'Banjar', '2008-01-30', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1690, 'Fitri Oktaviani', '2324101125', 'Banjar', '2007-10-17', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1691, 'IDIN MUHYDIN', '2324101126', 'BANJAR', '2007-01-23', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1692, 'INTAN SRIWAHYUNI', '2324101127', 'Ciamis', '2007-07-05', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1693, 'JAJANG NUGRAHA', '2324101128', 'Ciamis', '2007-01-09', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1694, 'Milan Muhammad Miftah', '2324101129', 'Bandung', '2008-02-03', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1695, 'MONALISA PUTRI UTAMI', '2324101130', 'KARAWANG', '2008-05-14', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1696, 'NUR AYU WIDIASARI', '2324101131', 'CILACAP', '2007-08-21', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1697, 'Puput Maulana Habibah', '2324101132', 'Banjar', '2008-03-30', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1698, 'Reisya Zahrotusyitha', '2324101133', 'Ciamis', '2007-12-21', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1699, 'REZA', '2324101134', 'CIAMIS', '2007-04-19', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1700, 'RISMA YULIANIKA', '2324101135', 'BANJAR', '2007-07-25', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1701, 'SATRIA ARRAS', '2324101136', 'BANJAR', '2008-03-02', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1702, 'SHAZIA AULIA', '2324101137', 'TANGERANG', '2008-02-24', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1703, 'SHELLA AMELIA', '2324101138', 'BANJAR', '2007-12-12', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1704, 'SINTA RAHAYU', '2324101139', 'CIAMIS', '2007-03-30', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1705, 'Syaakira Naura Az zahra', '2324101140', 'Bandung', '2008-06-02', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1706, 'VASHA NAYSILA HIDAYAT', '2324101141', 'Banjar', '2007-09-14', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1707, 'Wegi Putra Prayitno', '2324101142', 'Banjar', '2007-11-23', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1708, 'YULIA ANDHANI', '2324101143', 'CILACAP', '2007-12-24', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1709, 'ZENAL ARIFIN', '2324101144', 'BANJAR', '2008-05-13', 5, 4, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1710, 'ADDIN HANIFA', '2324101145', 'BANJAR', '2008-08-29', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1711, 'Aditya Agung Nugraha', '2324101146', 'Kuningan', '2008-06-09', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1712, 'ADRIAN AFRIANSYAH', '2324101147', 'BANJAR', '2007-04-14', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1713, 'AKMAL APRILLIANA NUGRAHA', '2324101148', 'BANJAR', '2008-04-07', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1714, 'ANNISA FEBRIANI', '2324101149', 'Banjar', '2008-02-07', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1715, 'BELA SEFIRA', '2324101150', 'Banjar', '2007-07-21', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1716, 'DEBY JUANITA', '2324101151', 'Banjar', '2007-06-20', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1717, 'DELIA ANJANI', '2324101152', 'BANJAR', '2008-03-04', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1718, 'DERIS NURIYAN', '2324101153', 'Banjar', '2006-12-26', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1719, 'DERIS TRI OKTAPIANA', '2324101154', 'Banjar', '2007-10-29', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1720, 'DESTA EKKI SAPUTRA', '2324101155', 'Banjar', '2006-12-17', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1721, 'Diko Salman Alfarisi', '2324101156', 'Banjar', '2007-07-17', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1722, 'Eka Cindy Ariyanti', '2324101158', 'Ciamis', '2007-07-02', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1723, 'HANIF MAULANA', '2324101159', 'BANJAR', '2008-05-06', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1724, 'LUSY MAULUDINA FIRDAUS', '2324101160', 'BANJAR', '2008-03-22', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1725, 'M Pariz Ali Alvi Mubarok', '2324101161', 'Banjar', '2008-01-25', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1726, 'MUHAMAD RIFKI ARDIANSAH', '2324101162', 'BANJAR', '2008-01-08', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1727, 'Muhammad Dhika Fadillah', '2324101163', 'Banjar', '2008-01-03', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1728, 'NADIA SETIA ANANDA', '2324101164', 'Banjar', '2008-05-16', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1729, 'Nina Apriliani', '2324101165', 'Banjar', '2008-04-23', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1730, 'NINA HERLINA', '2324101166', 'BANJAR', '2007-11-15', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1731, 'NOVA APRILIANI', '2324101167', 'BANJAR', '2007-04-07', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1732, 'PUTRI LAFTAIN', '2324101168', 'Banjar', '2007-08-31', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1733, 'Putri Sauvikha Anjari', '2324101169', 'Sukabumi', '2008-04-26', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1734, 'RAIHAN RAFI KUSWANTO', '2324101170', 'BANJAR', '2007-06-01', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1735, 'REISA PUTRI RIZKIANI SAEPUDIN', '2324101171', 'BANJAR', '2008-02-05', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1736, 'RESA FITRIYAN', '2324101172', 'Banjar', '2007-06-09', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1737, 'RESNA ADELIA', '2324101173', 'BANJAR', '2008-05-15', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1738, 'SANTI SRI WININGSIH', '2324101174', 'BANJAR', '2007-04-24', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1739, 'Sela Merliyani', '2324101175', 'Banjar', '2008-03-31', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1740, 'Selvi Dwi Rahmawati', '2324101176', 'Tasikmalaya', '2008-01-15', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1741, 'SHIFA DWI MARYADI', '2324101177', 'BANJAR', '2008-04-26', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1742, 'TISA RAMDAN SEPTIA', '2324101178', 'Banjar', '2007-09-17', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1743, 'WINDI AISHA JAUHARAH', '2324101179', 'BANJAR', '2007-09-14', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1744, 'ZAHRA FATHONIA', '2324101180', 'BANJAR', '2008-03-24', 5, 5, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1745, 'Abdul Musholim Arraniry', '2324101361', 'Bekasi', '2007-11-06', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1746, 'Ade Ridwan Maulana', '2324101362', 'Banjar', '2007-08-06', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1747, 'Agni Aina Lukman', '2324101363', 'Banjar', '2007-06-02', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1748, 'ALIYA RAMADHANI', '2324101364', 'BANJAR', '2007-10-05', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1749, 'Andri Wiguna', '2324101365', 'Banjar', '2007-12-04', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1750, 'ANNISA NUUR QOLBI', '2425101541', 'BANJAR', '2007-11-22', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1751, 'Ayu Febriani', '2324101367', 'Banjar', '2008-02-07', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1752, 'CIPTO ADE RAMDANI', '2324101368', 'CILACAP', '2007-10-02', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1753, 'Dava Fauzan Aziz', '2324101369', 'Ciamis', '2007-06-29', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1754, 'Defa Fachrizal Ramadhan', '2324101370', 'Banjar', '2007-09-14', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1755, 'DINDA SILVI NURAPRIANI', '2324101371', 'CIAMIS', '2007-04-30', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1756, 'ERINA SRI ANJANI', '2324101372', 'BANJAR', '2007-03-26', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1757, 'Fadhil Ahmad Farizi', '2324101373', 'Banjar', '2007-03-18', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1758, 'FALIH MUHAMMAD NAZMI', '2324101374', 'BANJAR', '2008-05-09', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1759, 'FARIZ PAHRUDIN', '2324101375', 'BANJAR', '2008-02-07', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1760, 'FERGI ADITYA', '2324101376', 'Cilacap', '2007-06-21', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1761, 'GILANG ADRIAN PRATAMA', '2324101377', 'CIAMIS', '2007-10-22', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1762, 'IRFAN HASNIAR AZIS', '2324101379', 'BANJAR', '2008-07-27', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1763, 'IRGI ZAOZA SALSABILA', '2324101380', 'BANJAR', '2008-04-22', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1764, 'Kurnia Bela Agustina', '2324101381', 'Kendal', '2007-08-22', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1765, 'Leni Nuraeni', '2324101382', 'Banjar', '2007-06-03', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1766, 'Lutpika Puspitasari', '2324101383', 'Banjar', '2008-02-03', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1767, 'MUHAMMAD AGUSTIAN PUTRA', '2324101384', 'Banjar', '2007-08-20', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1768, 'NAUFAL ALIFIANTO', '2324101386', 'BEKASI', '2007-11-30', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1769, 'NAUFAL MUYASSAR YUMAS PUTRA', '2324101387', 'BANJAR', '2007-09-09', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1770, 'NISA MARSAL', '2324101388', 'Banjar', '2007-03-12', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1771, 'Raifal Fadliansyah Fauji', '2324101389', 'Banjar', '2008-05-02', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1772, 'RAYHAN DARUNNAZWA', '2324101390', 'BANJAR', '2007-02-26', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1773, 'RENI ANGGRAENI', '2324101391', 'Banjar', '2007-05-16', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1774, 'RIDHO TRIWILDAN', '2324101392', 'Banjar', '2006-12-20', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1775, 'Ririn Rindiani Puspitaningrum', '2324101393', 'Ciamis', '2007-10-24', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1776, 'Salsabila Aurelia Putri', '2324101394', 'Banjar', '2007-11-18', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1777, 'Sopianti Novita Usna', '2324101395', 'Banjar', '2007-11-07', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1778, 'Tasya Nurin Shadrina', '2324101396', 'Ciamis', '2007-09-08', 5, 6, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1779, 'Ade saepuloh', '2324101397', 'banjar', '2007-11-24', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1780, 'ADITYA FIRMANSYAH', '2324101398', 'Banjar', '2007-08-05', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1781, 'AGYL AZANI AKBAR', '2324101399', 'BANJAR', '2008-06-09', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1782, 'ALIFA SAEFURROHMAN', '2324101400', 'Banjar', '2008-06-19', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1783, 'ALIYA EKA GUSTIANI', '2324101401', 'BANJAR', '2007-08-23', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1784, 'ALMA DWI ALRIZKI', '2324101402', 'Banjar', '2007-07-12', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1785, 'Ariq Fathurrahman', '2324101403', 'Banjar', '2008-08-06', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1786, 'DAVA TISNA APRIZA', '2324101405', 'BANJAR', '2007-04-01', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1787, 'DAVIN ADHA PUTRA', '2324101406', 'BANJAR', '2006-12-27', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1788, 'DZAKY FAUZAN', '2324101407', 'Banjar', '2008-02-22', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1789, 'ELIS MAESAROH', '2324101408', 'BANJAR', '2007-06-14', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1790, 'ERWIN ALDRIANSYAH', '2324101409', 'BANJAR', '2007-05-07', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1791, 'Fabian Rizky Adriansyah', '2324101410', 'Banjar', '2007-05-27', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1792, 'FAHRANSYAH ABI SOPFIAN', '2324101411', 'BANJAR', '2008-04-12', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1793, 'FAREED AHMAD', '2324101412', 'Banjar', '2007-06-13', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1794, 'FAZRI MAULANA SAPUTRA', '2324101413', 'BANJAR', '2007-03-14', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1795, 'IIS NURHAYATI', '2324101414', 'Ciamis', '2007-09-13', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1796, 'Khansa Kamila', '2324101415', 'Kudus', '2008-04-06', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1797, 'Kiki Al Rizal Maulana', '2324101416', 'Bandung', '2007-03-08', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1798, 'MUHAMAD RAFLI ALFARIZI', '2324101417', 'TASIKMALAYA', '2007-03-26', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1799, 'NADIA ASPIYA SHAHIDAH', '2324101418', 'CIAMIS', '2007-05-20', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1800, 'NAZWA APRIANITA', '2324101419', 'BANJAR', '2008-04-08', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1801, 'NOVITA MANISORAYA', '2324101420', 'BANJAR', '2007-11-20', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1802, 'PADIL PRATAMA', '2324101421', 'BANJAR', '2007-09-16', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1803, 'RAIHAN AMARULLOH', '2324101422', 'BANJAR', '2007-06-05', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1804, 'Resa Akmal Gifari', '2324101423', 'Banjar', '2007-11-05', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1805, 'Resti Lestari', '2324101424', 'Banjar', '2007-12-12', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1806, 'SATRIA PUTRA NUGRAHA', '2324101425', 'BANJAR', '2008-01-20', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1807, 'Satya Rengga Pamungkas', '2324101426', 'Banjar', '2006-06-06', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1808, 'Silvi Amellina', '2324101427', 'Cilacap', '2008-07-24', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1809, 'Silvia Azahra', '2324101428', 'Banjar', '2007-10-30', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1810, 'SUCI NOVIANI', '2324101429', 'PURWOKERTO', '2007-11-15', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1811, 'SYIFA FATURROHMAH AZ-ZAHRA', '2324101430', 'BANJAR', '2008-11-01', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1812, 'Syiva Yasa Sakilla', '2324101431', 'Banjar', '2007-09-25', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1813, 'YUNIAR ARDIANSYAH MAULANA', '2324101432', 'Ciamis', '2007-06-20', 5, 7, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1814, 'ADVENDA SULISTYOWATI', '2324101469', 'Banjar', '2008-01-28', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1815, 'ALI APANDI', '2324101470', 'BANJAR', '2008-08-15', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1816, 'AMAL ASMARANI', '2324101471', 'CIAMIS', '2008-01-08', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1817, 'Andika Pebrian Pratama', '2324101472', 'Banjar', '2008-02-16', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1818, 'ANISA APRILIA', '2324101473', 'BANJAR', '2007-04-24', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1819, 'ARIF NUROHMAN', '2324101474', 'BANJAR', '2007-07-09', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1820, 'AULIA NURFADILA', '2324101475', 'Tasikmalaya', '2007-08-11', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1821, 'BILLY SULTAN DZULIANSYAH', '2324101476', 'BANJAR', '2007-12-11', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1822, 'CHANTIKA SALSANABILA', '2324101477', 'BANJAR', '2008-05-22', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1823, 'Egis Septiani', '2324101478', 'Banjar', '2007-09-25', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1824, 'ERRIL EVRILITA KURNIAWAN', '2324101479', 'CIAMIS', '2008-08-25', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1825, 'FANI FEBRIANI', '2324101480', 'CIAMIS', '2008-02-28', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1826, 'Fauziah Khirani', '2324101481', 'Banjar', '2008-06-15', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1827, 'FERA MAULANI', '2324101482', 'BANJAR', '2007-03-19', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1828, 'GISA RAJ SUMANTRI', '2324101483', 'TANGERANG', '2007-07-30', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1829, 'KANYASIH AYUNA IMANDRIA', '2324101484', 'BANJAR', '2007-06-03', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1830, 'Lutfiah Zulfa Nabila', '2324101485', 'Purwakarta', '2008-08-27', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1831, 'MEIDA WULANDARI', '2324101486', 'BANJAR', '2008-05-01', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1832, 'MELANI PUTRI', '2324101487', 'CILACAP', '2007-12-24', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1833, 'MIAR RACHMAWATI', '2324101488', 'BANJAR', '2008-05-04', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1834, 'Najwa Aina Fadiyah', '2324101489', 'Banjar', '2007-10-09', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1835, 'NIKEN ANJANI', '2324101490', 'BANJAR', '2007-07-23', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1836, 'Putri Keila Susanto', '2324101491', 'Banjar', '2008-01-13', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1837, 'PUTRI KUSUMANINGRUM', '2324101492', 'JAKARTA', '2007-09-05', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1838, 'RAHMA GANIA SYA\'BANIAH', '2324101493', 'BANJAR', '2007-08-20', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1839, 'Rahma Sulistiani', '2324101494', 'Banjar', '2008-01-28', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1840, 'RAISSYA YULIANI', '2324101495', 'BANJAR', '2007-07-19', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1841, 'Restu Sri Rahayu', '2324101496', 'Banjar', '2008-02-18', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1842, 'SALMA NUR PATIMAH', '2324101497', 'BANJAR', '2007-06-12', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1843, 'SELMA FITRIA OKTAVIANI', '2324101498', 'Banjar', '2007-10-16', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1844, 'Sifa Felisa Putri', '2324101499', 'Banjar', '2008-06-01', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1845, 'Silva Ari Ainur Vila Sevila', '2324101500', 'Banjar', '2007-09-11', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1846, 'Suci Octavia Azahra', '2324101501', 'Ciamis', '2007-10-21', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1847, 'THALITA APRILIA', '2324101502', 'GARUT', '2008-04-11', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1848, 'Widi Nur Fajrina', '2324101504', 'Banjar', '2008-07-19', 5, 8, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1849, 'ALIFA MAULIDA', '2324101505', 'CIAMIS', '2008-04-18', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1850, 'ALYA MELINDA', '2324101506', 'CIAMIS', '2010-01-01', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1851, 'ANISA ELIANDINI', '2324101507', 'BANJAR', '2007-12-15', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1852, 'Annisa Razahra Nurfadilah', '2324101508', 'Ciamis', '2007-08-14', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1853, 'AURORA JULIYANTI', '2324101509', 'Banjar', '2007-07-22', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1854, 'DESI JULIANTI', '2324101510', 'BANJAR', '2007-07-24', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1855, 'Diva Abilla', '2324101511', 'Bogor', '2007-12-10', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1856, 'DIVA NURUL ASSYIFA', '2324101512', 'CIAMIS', '2008-02-25', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1857, 'FITRI MULYANI', '2324101513', 'Banjar', '2007-03-15', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1858, 'KERIN RINDIANI', '2324101514', 'Banjar', '2008-01-03', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1859, 'KEYSYA FEBRY AULYA', '2324101515', 'BANJAR', '2008-02-24', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1860, 'MAHDA ZELILAH', '2324101516', 'BANJAR', '2007-12-21', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1861, 'Martha Eryana Putri', '2324101517', 'Banjar', '2008-03-27', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1862, 'MELISA KURNIASIH', '2324101518', 'Banjar', '2008-05-27', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1863, 'NADIA RAHMAWATI', '2324101519', 'BANJAR', '2007-07-15', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1864, 'Natisha Salsabilah', '2324101520', 'Banjar', '2007-05-09', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1865, 'NAYLA NAZWA CHAIRUNNISA', '2324101521', 'CIAMIS', '2007-12-24', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1866, 'NEZA AFRITA', '2324101522', 'SUBANG', '2008-05-02', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1867, 'PRILA MAULIDHA', '2324101523', 'Banjar', '2007-04-18', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1868, 'PUPUT PUTRIANI', '2324101524', 'BANJAR', '2007-05-25', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1869, 'RACEL LIANTY', '2324101525', 'BANJAR', '2006-12-03', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1870, 'RAHMA NUR KAMILA', '2324101526', 'CIAMIS', '2007-09-26', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1871, 'Rina', '2324101527', 'Banjar', '2007-02-19', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1872, 'SALSA DWI APRILIA', '2324101528', 'Banjar', '2007-04-10', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1873, 'Seny Selviyani', '2324101529', 'Banjar', '2007-04-03', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1874, 'SHINTA NABILLA RAHMA', '2324101530', 'BANJAR', '2008-05-14', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1875, 'SITI NUR HAYATI', '2324101531', 'BANJAR', '2007-09-28', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1876, 'SRI NURUL AWALIA', '2324101532', 'PANDEGLANG', '2008-04-12', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1877, 'SUCIA NURYANTI', '2324101533', 'Banjar', '2007-03-30', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1878, 'Syifa Mufidah', '2324101534', 'Bandung', '2008-01-06', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1879, 'TIARA CITRA', '2324101535', 'Bekasi', '2008-09-04', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1880, 'Tita Hanita', '2324101536', 'Banjar', '2007-10-07', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1881, 'Trie Amellia', '2324101537', 'Banjar', '2007-08-20', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1882, 'WIDYA ASTUTI', '2324101538', 'BANJAR', '2007-06-25', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1883, 'WINDI WULANDARI', '2324101539', 'SERANG', '2007-11-01', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1884, 'YOKA RAMADHAN HERFIANI', '2324101540', 'BANJAR', '2007-09-12', 5, 9, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1885, 'Ade Awaluddin', '2324101181', 'Banjar', '2007-07-09', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1886, 'ADITIA', '2324101182', 'Banjar', '2007-02-11', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1887, 'AFRIL DARMAYANTI', '2324101183', 'CIAMIS', '2007-04-21', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1888, 'ALAN NURFIKRI', '2324101184', 'BANJAR', '2008-01-08', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1889, 'ALMA NURAINI', '2324101185', 'CIAMIS', '2007-07-22', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1890, 'AMELIA DEVIANTY', '2324101186', 'Ciamis', '2008-05-08', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1891, 'ANDHARA FEBRIANY', '2324101187', 'Ciamis', '2008-02-04', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1892, 'Ayu Andini', '2324101188', 'Ciamis', '2007-12-31', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1893, 'Desta Rahma Agustin', '2324101189', 'banjar', '2007-08-08', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1894, 'Dwi Hartanti', '2324101190', 'Banjar', '2008-04-11', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1895, 'Fitria Rahmadhani', '2324101191', 'Banjar', '2007-10-09', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1896, 'Imel Asmaya', '2324101192', 'Ciamis', '2007-09-09', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1897, 'IQBAL ABDI AGUNG SAPUTRA', '2324101194', 'PEMALANG', '2007-06-15', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1898, 'Irfan Ferdiansyah', '2324101195', 'Banjar', '2008-04-28', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1899, 'LILIH HUMAIROTUL HABIBAH', '2324101196', 'BANJAR', '2007-06-15', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1900, 'Lusy Marsela', '2324101197', 'Banjar', '2008-03-25', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1901, 'MUHAMMAD ILHAM FIRDAUS', '2324101198', 'BANJAR', '2007-12-25', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1902, 'Naya Suci Septiani', '2324101199', 'Banjar', '2007-09-20', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1903, 'NAZA MAULANA MUHTAZ', '2324101200', 'CIAMIS', '2007-04-17', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1904, 'NAZAR FATHURROCHMAN', '2324101201', 'BANJAR', '2008-04-08', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1905, 'Nur Anida', '2324101202', 'Banjar', '2008-04-14', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1906, 'Nurlaila', '2324101203', 'Ciamis', '2008-05-05', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1907, 'RAISSYA DINA CAHYANABILA', '2324101204', 'CIAMIS', '2008-01-25', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1908, 'Resti Shintia Rahayu', '2324101205', 'Ciamis', '2008-03-09', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1909, 'RISNA NATASYA', '2324101206', 'BANJAR', '2007-03-03', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1910, 'Rizky Aditya Gumilang', '2324101207', 'Banjar', '2007-12-21', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1911, 'SEKAR RAHMAWATI', '2324101208', 'CIAMIS', '2008-05-29', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1912, 'SERRYN YOLANDHA PUSPITADEWI', '2324101209', 'BANJAR', '2008-02-13', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1913, 'Shalsa Astriani', '2324101210', 'Banjar', '2007-06-06', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1914, 'SITI VANIA PURWANTI', '2324101211', 'BANJAR', '2008-08-21', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1915, 'Tia Septiani', '2324101212', 'Banjar', '2006-09-29', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1916, 'Vina Nurhaliza', '2324101213', 'Banjar', '2008-03-14', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1917, 'Winnie Bunga Suci', '2324101214', 'Banjar', '2007-12-13', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1918, 'WULAN HAYATUN NISA', '2324101215', 'Brebes', '2008-12-27', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1919, 'Yuni Nuraeni', '2324101216', 'Banjar', '2008-06-10', 5, 10, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1920, 'Adi Purnama', '2324101217', 'Banjar', '2007-07-15', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1921, 'AISYAH NURSAFITRI', '2324101218', 'WONOGIRI', '2007-11-30', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1922, 'ALLYA ZAHRATUS SYIFA', '2324101219', 'Ciamis', '2008-05-15', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1923, 'Amelya Natashya', '2324101220', 'Ciamis', '2008-12-14', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1924, 'ARIN TIFFANY MEYLAN', '2324101221', 'BANJAR', '2008-05-06', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1925, 'CHANTIKA CHINTYA HERYANTI', '2324101222', 'BANJAR', '2008-05-28', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1926, 'Dany Irwansyah', '2324101223', 'Banjar', '2008-01-18', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1927, 'DELLA AMELIA AGUSTIN', '2324101224', 'BANJAR', '2007-08-14', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1928, 'DIKRI FAUZAN', '2425101542', 'CIAMIS', '2007-12-08', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1929, 'DINDA LESTARI', '2324101225', 'BANJAR', '2008-03-15', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1930, 'FARIZ MAULANA PRATAMA', '2324101226', 'BANJAR', '2008-04-24', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1931, 'FARREL ATTARSYAH', '2324101227', 'Ciamis', '2008-07-28', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1932, 'GISELA VIEKA INDRIANI', '2324101228', 'CILACAP', '2007-12-21', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1933, 'HESIN RAHMAWATI', '2324101229', 'CILACAP', '2007-08-12', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1934, 'Irma Rahmawati', '2324101230', 'Ciamis', '2007-02-27', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1935, 'LENY YULIANTI', '2324101231', 'BANJAR', '2007-07-05', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1936, 'Mega Retno Briliani', '2324101232', 'Ciamis', '2007-07-22', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1937, 'MUHAMMAD DESTA PRATAMA', '2324101233', 'JAKARTA', '2007-12-01', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1938, 'MUHAMMAD WALI ALKARIM', '2324101235', 'Ciamis', '2007-08-17', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1939, 'MUHAMMAD ZULFAN YANUAR', '2324101236', 'Banjar', '2008-01-24', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1940, 'Nikeisha Syifaaul Qomah', '2324101237', 'Ciamis', '2008-04-26', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1941, 'Nisya Dwi Utamy', '2324101238', 'Ciamis', '2008-03-10', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1942, 'Nita Amelia', '2324101239', 'Banjar', '2008-05-26', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1943, 'NIZAR ADIT TRIANSAH', '2324101240', 'BANJAR', '2007-01-10', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1944, 'NORY TASYA PRATIWI', '2324101241', 'CILACAP', '2008-01-01', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1945, 'QEYSHA QUINN SHAQUILLA SETIAJI', '2324101242', 'Bandung', '2008-09-18', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1946, 'Rainova Ibny Muyassar', '2324101243', 'Banjar', '2007-11-02', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1947, 'Raisya Suci Ramadani', '2324101244', 'Banjar', '2008-09-13', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1948, 'REVA LIANISHA SUPARMAN', '2324101245', 'Banjar', '2007-05-21', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1949, 'RIRIN NURAENI', '2324101246', 'CIAMIS', '2007-08-07', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1950, 'Risca Dwi Aryanti', '2324101247', 'Banjar', '2007-11-07', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1951, 'ROBY HERMANSYAH', '2324101248', 'CIAMIS', '2007-06-13', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1952, 'SAVANNAH CLARA MAULIKA', '2324101249', 'BANDAR LAMPUNG', '2008-03-26', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1953, 'SESILIA', '2324101250', 'Banjar', '2008-01-20', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1954, 'SIFA FAUJIAH', '2324101251', 'CIAMIS', '2008-07-09', 5, 11, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29');
INSERT INTO `siswas` (`id`, `nama_siswa`, `nis`, `tempat_lahir`, `tanggal_lahir`, `sekolah_id`, `kelas_id`, `tahun_ajaran_id`, `status`, `created_at`, `updated_at`) VALUES
(1955, 'ALFANDI ANDRIANSYAH', '2324101253', 'BANJAR', '2007-11-10', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1956, 'DESWITA VERAWATI', '2324101254', 'BANJAR', '2007-07-04', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1957, 'Devi Sulistia', '2324101255', 'Bandung', '2007-09-06', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1958, 'Dika Apriansyah', '2324101256', 'Banjar', '2008-04-14', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1959, 'ELIN NURAINI', '2324101257', 'Garut', '2007-08-06', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1960, 'ELINA AGUSTIN', '2324101258', 'CIAMIS', '2007-08-26', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1961, 'Elsa Khoerunnisa', '2324101259', 'Ciamis', '2007-04-26', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1962, 'Fahriel Muhamad Fauzan', '2324101260', 'Banjar', '2007-04-25', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1963, 'FAREL SYAFIQ ABRAR', '2324101261', 'Ciamis', '2008-02-05', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1964, 'Fita Oktafiani', '2324101262', 'Banjar', '2007-10-20', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1965, 'FITRIAH NURLATIFAH', '2324101263', 'Banjar', '2008-02-17', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1966, 'HANNY APRILA LESTARI', '2324101264', 'BANJAR', '2008-04-15', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1967, 'ILMI PIANDYA', '2324101265', 'BANJAR', '2008-08-21', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1968, 'Ismi Nurafiani', '2324101266', 'Ciamis', '2007-11-14', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1969, 'Lydia Rizkianti', '2324101267', 'Banjar', '2008-06-19', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1970, 'M. Khisyar Ma\'ali', '2324101268', 'Banjar', '2008-11-27', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1971, 'M. ZIA BAGUS PAMUNGKAS', '2324101269', 'BANJAR', '2007-06-15', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1972, 'MAULIDA CAHYA PRATAMI', '2324101270', 'Bandung', '2008-04-08', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1973, 'MUMUN MUNZIAH', '2324101271', 'BANJAR', '2007-04-08', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1974, 'NELA AULIA', '2324101272', 'BANJAR', '2008-02-28', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1975, 'NESYA NAZWA MAULID', '2324101273', 'BANJAR', '2007-03-30', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1976, 'NURUL SILVIANI SOLEHA', '2324101274', 'BANJARA', '2007-08-04', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1977, 'PHASYA RESTU VIGO AKHMATSYAH', '2324101275', 'TEGAL', '2008-09-10', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1978, 'RAISYA RAMDHANI', '2324101276', 'BANJAR', '2007-10-01', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1979, 'RARA RASIKAH', '2324101277', 'BANJAR', '2008-06-04', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1980, 'Resti Riska Diana', '2324101278', 'Banjar', '2008-03-24', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1981, 'RISQI SAPUTRA', '2324101280', 'CILACAP', '2007-06-02', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1982, 'RIZKI KHOLIK MUBAROK', '2324101281', 'Banjar', '2007-02-10', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1983, 'SENI PUSPA NURANI', '2324101282', 'Banjar', '2007-09-06', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1984, 'Shaira Oktavia', '2324101283', 'Banjar', '2007-10-16', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1985, 'Sheren Redina', '2324101284', 'Banjar', '2008-05-02', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1986, 'SRI ISMAYANTI', '2324101285', 'BANJAR', '2008-07-20', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1987, 'SURYA FALAH', '2324101286', 'BANJAR', '2007-11-20', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1988, 'Syifa Frananda Heryanto', '2324101287', 'Banjar', '2008-02-20', 5, 12, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1989, 'AA FAUDZAN NURSETIA', '2324101433', 'BANJAR', '2007-12-19', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1990, 'ADAM MUHAMMAD RIZKI', '2324101434', 'Ciamis', '2007-09-09', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1991, 'AJI WIDAYAT', '2324101435', 'Banjar', '2007-09-21', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1992, 'ALFHA RADJA YANUAR', '2324101436', 'BANJAR', '2008-01-08', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1993, 'Andiki Pratama', '2324101437', 'Banjar', '2008-02-27', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1994, 'AREL HENDARSYAH', '2324101438', 'BANJAR', '2007-08-08', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1995, 'ARIL GUNAWAN', '2324101439', 'CILACAP', '2008-03-03', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1996, 'Deni Anugrah', '2324101440', 'Ciamis', '2008-04-10', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1997, 'DIKA D ARIANTO', '2324101441', 'Banjar', '2007-12-31', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1998, 'Enditha Alifia Salsabila', '2324101443', 'Banjar', '2008-08-10', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(1999, 'ERVAN MAULANA', '2324101444', 'BANJAR', '2007-07-19', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2000, 'GALIH RAMADAN', '2324101445', 'BANJAR', '2007-10-02', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2001, 'GERIN RIANDY SOLIHIN', '2324101446', 'BANJAR', '2008-04-07', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2002, 'GHIN GIN ALAMSYAH', '2324101448', 'Banjar', '2008-03-22', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2003, 'ILHAM HUSNI', '2324101449', 'CIAMIS', '2007-10-11', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2004, 'Intan Nur Fadillah', '2324101450', 'Jakarta', '2008-04-17', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2005, 'Irpan Maulana', '2324101451', 'Banjar', '2007-07-30', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2006, 'IRPAN RIFAI', '2324101452', 'Banjar', '2008-01-06', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2007, 'Kaufanullah Almugni', '2324101453', 'Banjar', '2007-06-06', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2008, 'Keizha Adya Mecka', '2324101454', 'Ciamis', '2007-12-30', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2009, 'MARIO FEBRIAN', '2324101456', 'BANJAR', '2007-02-13', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2010, 'Muhammad Rasyid Ridlo', '2324101457', 'Tasikmalaya', '2008-03-28', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2011, 'NIZMA NURWAHIDAH', '2324101458', 'BANJAR', '2007-12-14', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2012, 'RENATA AURELLIA RAMADHANI', '2324101459', 'TULUNGAGUNG', '2008-09-15', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2013, 'RIFA GINASTIAR', '2324101460', 'BANJAR', '2008-08-02', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2014, 'Sandi Maulana Jalaludin', '2324101461', 'Banjar', '2008-03-14', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2015, 'SHINTA OKTAVIA', '2324101463', 'Ciamis', '2007-10-07', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2016, 'SULISTIANINGTIAS', '2324101464', 'Banjar', '2008-10-25', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2017, 'VELANI SUBEKTI', '2324101465', 'BANJAR', '2008-02-10', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2018, 'Wanda Putri Iwani', '2324101466', 'Bandung', '2007-07-22', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2019, 'YOGA MUHAMMAD FIKRI', '2324101467', 'Banjar', '2008-02-24', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2020, 'ZIKRI DELPIANA', '2324101468', 'BANJAR', '2007-12-23', 5, 13, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2021, 'Adelio Farrell Julistira', '2324101001', 'Bekasi', '2007-07-31', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2022, 'AKBAR MAULANA', '2324101002', 'BANJAR', '2007-11-14', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2023, 'AKMAL GHANI LAODA', '2324101003', 'Banjar', '2008-01-05', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2024, 'ALDI ALFAN FEBRIAN', '2324101004', 'BANJAR', '2007-02-17', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2025, 'ALDI RENALDI PRATAMA', '2324101005', 'Ciamis', '2007-03-17', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2026, 'Alya Ramadhani Nur Aini', '2324101006', 'Bandung', '2007-10-10', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2027, 'ANDIKA JAYA SAPUTRA', '2324101007', 'TANGGERANG', '2007-12-17', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2028, 'ANDIKA RAMDANI', '2324101008', 'BANJAR', '2007-10-03', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2029, 'ANGEL FRANSISCA JAYA PRATIWI', '2324101009', 'Ciamis', '2007-01-19', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2030, 'DEDE SUPRIATNA', '2324101010', 'Banjar', '2007-03-07', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2031, 'FAHRUL RIADU AMARULLOH', '2324101011', 'BOGOR', '2007-12-22', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2032, 'Farhan Fauzan', '2324101012', 'Banjar', '2007-05-19', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2033, 'FIKA RISCIANI', '2324101013', 'BANJAR', '2008-02-28', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2034, 'FIKKA APRILIANDINI', '2324101014', 'BANJAR', '2008-04-09', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2035, 'GALUH AGUNG PERMANA', '2324101015', 'BANJAR', '2008-11-30', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2036, 'HARIESTA FERNANDO', '2324101016', 'Banjar', '2007-04-11', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2037, 'Intan Dwi Sabila', '2324101017', 'Banjar', '2007-07-21', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2038, 'IRSYAL FATHUL MUBAROK', '2324101018', 'BANJAR', '2007-04-16', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2039, 'Jimi Ahmad Faturrahman', '2324101019', 'Ciamis', '2007-07-08', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2040, 'KAKA RAMADHANI SUHERMAN', '2324101020', 'BANJAR', '2007-09-19', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2041, 'KEISYA SHAORI NIANINDRA PUTRI', '2324101021', 'CIAMIS', '2007-11-28', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2042, 'Muhamad Aria Abdilah', '2324101022', 'Banjar', '2007-08-06', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2043, 'MUHAMAD FAUZAN NABIL', '2324101023', 'Ciamis', '2007-06-03', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2044, 'Muhammad Gifar', '2324101024', 'Banjar', '2007-09-21', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2045, 'MUHAMMAD RIZKY PRAWIRO', '2324101025', 'BEKASI', '2008-06-15', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2046, 'NADHIF DZAKI ABDILLAH', '2324101026', 'BANJAR', '2008-12-13', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2047, 'PANCA FERDIAN PAMUNGKAS', '2324101027', 'SIDOARJO', '2007-01-22', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2048, 'RADIKA RAYAGA WIGUNA', '2324101028', 'CIAMIS', '2007-11-23', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2049, 'Rega Nur Sidiq', '2324101029', 'Banjar', '2007-05-23', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2050, 'REVAL FADILAH', '2324101030', 'BANJAR', '2007-04-29', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2051, 'Rizky Fauzi', '2324101031', 'Ciamis', '2007-08-04', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2052, 'ROBI PERMANA ALAMSYAH', '2324101032', 'BANJAR', '2008-02-25', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2053, 'SANDI ARIZKI SAPUTRA', '2324101033', 'BANJAR', '2008-02-13', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2054, 'YOANA TRI MUNAJAT', '2324101034', 'BANJAR', '2007-12-28', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2055, 'Zidan Septiana Pratama', '2324101035', 'Ciamis', '2007-11-04', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2056, 'ZILDAN ABROR', '2324101036', 'Banjar', '2007-02-04', 5, 14, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2057, 'ADE PEBRIANA', '2324101037', 'CIAMIS', '2007-02-23', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2058, 'AFRIZAL HERLAMBANG', '2324101038', 'Banjar', '2008-02-29', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2059, 'AFRIZAL ZAHRAN MULYANA', '2324101039', 'Ciamis', '2007-11-22', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2060, 'AKBAR AL FADILLAH', '2324101040', 'BANJAR', '2008-01-31', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2061, 'Alpi Purnama', '2324101041', 'Banjar', '2007-07-02', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2062, 'ARIA RIZKY PERMANA', '2324101042', 'BANDUNG', '2008-04-27', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2063, 'ATHALLAH WAFI RAFID FAADHILAH', '2324101043', 'BANJAR', '2007-11-25', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2064, 'AYU HARTINI', '2324101044', 'BANJAR', '2007-05-14', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2065, 'DAFFA ARIEF NUGRAHA', '2324101045', 'BANJAR', '2008-08-19', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2066, 'DELIA SEKAR ARUM', '2324101046', 'Bojonegoro', '2007-12-04', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2067, 'DIDAN RAMDHANI ABDUL MATIN', '2324101047', 'CIAMIS', '2007-10-09', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2068, 'Dimas Hermawan', '2324101048', 'Banjar', '2008-07-24', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2069, 'ERGIN KUSTIANA', '2324101049', 'BANJAR', '2006-07-02', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2070, 'Farid Al - Munawwar', '2324101050', 'Banjar', '2008-05-21', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2071, 'FATAN APRIYANA PRATAMA', '2324101051', 'Banjar', '2008-04-10', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2072, 'Gian', '2324101052', 'Ciamis', '2007-02-19', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2073, 'HAFIDZ AMAR ALFARIZZIE', '2324101053', 'BANJAR', '2007-09-19', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2074, 'Haikal Zaki Firmansyah', '2324101054', 'Banjar', '2007-08-10', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2075, 'JIHAD IRFANSYAH', '2324101055', 'BOGOR', '2007-06-14', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2076, 'KENZ FELIX DJAYALARAS PUTRA', '2324101056', 'Banjar', '2008-06-29', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2077, 'Kesya Arifatun Safanah', '2324101057', 'Banjar', '2007-12-05', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2078, 'Mochammad Rifqi Tsani', '2324101058', 'Ciamis', '2007-05-20', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2079, 'MOHAMMAD ABHIE RAMDANI', '2324101059', 'KUNINGAN', '2007-09-12', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2080, 'MUHAMMAD RASYA ARYADHINATA', '2324101060', 'Banjar', '2008-03-03', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2081, 'Muhammad Ridwan', '2324101601', 'Batam', '2006-12-29', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2082, 'NABIL SEPTI RAMDHANI', '2324101061', 'BANJAR', '2007-09-29', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2083, 'NAUFAL NURUL FAJAR', '2324101062', 'BANJAR', '2008-06-03', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2084, 'Nizar Firmansyah', '2324101063', 'Depok', '2008-05-30', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2085, 'RAGIL FAIQ DWINA PUTRA', '2324101064', 'BANJAR', '2007-06-23', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2086, 'REVAN SEPTIANSYAH RAMADHANI PUTRA', '2324101065', 'BANJAR', '2007-09-15', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2087, 'Rivaldy Fauzan', '2324101067', 'Banjar', '2007-08-20', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2088, 'SELA SALAFIAH', '2324101068', 'BANJAR', '2008-01-07', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2089, 'SENDI FEBRIANSYAH NUR HIDAYAT', '2324101069', 'BANJAR', '2008-02-04', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2090, 'VICKY FACHRIZAL MUHARRAM', '2324101070', 'BANJAR', '2008-01-11', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2091, 'Wisnu Wardana sofyan', '2324101071', 'Banjar', '2007-02-10', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2092, 'ZULLUL ARDAN RAFAYANTO', '2324101072', 'BANJAR', '2007-10-08', 5, 15, 1, 'aktif', '2025-09-22 00:16:29', '2025-09-22 00:16:29'),
(2094, 'John Doe', '1234567890', 'Lampung', '2005-01-01', 5, 29, 5, 'aktif', '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(2095, 'Jane Smith', '0987654321', 'Bandung', '2006-05-15', 5, 30, 5, 'aktif', '2025-11-06 13:52:44', '2025-11-06 13:52:44'),
(2097, 'John Doe', '8573825709', 'Lampung', '2005-01-01', 6, 46, 1, 'aktif', '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(2098, 'Jane Smith', '0129392472', 'Bandung', '2006-05-15', 6, 47, 1, 'aktif', '2025-11-07 14:12:21', '2025-11-07 14:12:21'),
(2099, 'test', 'test', 'banjar', '2025-10-26', 6, 46, 1, 'aktif', '2025-11-08 13:41:42', '2025-11-08 13:41:42'),
(2100, 'jk', '6758', 'banjar', '2007-11-08', 6, 49, 1, 'aktif', '2025-12-08 04:38:01', '2025-12-08 04:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajarans`
--

CREATE TABLE `tahun_ajarans` (
  `id` bigint UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tahun_ajarans`
--

INSERT INTO `tahun_ajarans` (`id`, `tahun_ajaran`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', '2025-09-23 18:31:48', '2025-10-21 23:27:21'),
(5, '2026/2027', '2025-10-13 02:47:43', '2025-10-21 23:27:21'),
(6, '2027/2028', '2025-10-13 02:54:20', '2025-10-21 23:27:21'),
(9, '2028/2029', '2025-12-09 07:42:23', '2025-12-09 07:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `tujuan_pembelajarans`
--

CREATE TABLE `tujuan_pembelajarans` (
  `id` bigint UNSIGNED NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sekolah_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tujuan_pembelajarans`
--

INSERT INTO `tujuan_pembelajarans` (`id`, `deskripsi`, `sekolah_id`, `created_at`, `updated_at`) VALUES
(1, 'Menunjukkan etos kerja dan disiplin waktu yang tinggi', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(2, 'Mampu berkomunikasi secara efektif dan bekerja sama dalam tim', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(3, 'Menerapkan prosedur Keselamatan dan Kesehatan Kerja (K3) di tempat kerja', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(4, 'Menggunakan peralatan kerja sesuai dengan standar operasional prosedur (SOP)', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(5, 'Menunjukkan inisiatif dan tanggung jawab dalam menyelesaikan tugas', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(6, 'Membuat dokumentasi atau laporan sederhana terkait pekerjaan yang dilakukan', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(7, 'Menjaga kebersihan dan kerapian area kerja', 5, '2025-10-03 06:10:20', '2025-10-03 06:10:20'),
(8, 'Bersemangat', 6, '2025-11-07 17:17:07', '2025-11-07 17:17:07'),
(9, 'Belajar Beradaptasi', 6, '2025-11-07 17:18:08', '2025-11-07 17:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` enum('super_admin','admin_sekolah','guru','siswa','dudi','dudi_pembimbing','orangtua') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siswa',
  `sekolah_id` bigint UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ref_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(1, 'delia', 'admin', 'delia@admin.com', 'super_admin', NULL, NULL, '$2y$12$6en6l0m.Yj8eTU9ATHgBdOFkypYtFGnAKd944qkBavJhMsjWCv/Aa', 0, NULL, '2025-09-16 23:03:38', '2025-09-17 20:33:38', NULL),
(531, 'Admin SMKN 1 Banjar', 'smkn_1_banjar', 'smkn-1-banjar@admin.sekolah.com', 'admin_sekolah', 5, NULL, '$2y$12$CRprXCUMdx5sgkws64FHeO1aCwk2UMNfDZ2.IkluNFAaFMCAzApl.', 4, NULL, '2025-09-21 23:35:03', '2025-10-21 23:28:08', 5),
(836, 'ALFIAH AZZAHRA', '2324101289', '2324101289@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$sp1hlwn8IY07hmL0giXEpOBX0q.45UQPhbdy2ghH/OLgWoE.eOTIW', 1, NULL, '2025-09-22 00:37:07', '2025-09-22 00:37:07', 1570),
(837, 'ALIKA RAHMAWATI', '2324101290', '2324101290@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3MqtpZhbERkdd3IBt1Md..2kgKnv22n7trwMETvwumPPw6B3UPsPC', 1, NULL, '2025-09-22 00:37:07', '2025-09-22 00:37:07', 1571),
(838, 'ANISA RAHMA SAPITRI', '2324101291', '2324101291@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JJ8EnchaJ3a8K.ocU5R1neZZGGZMV0T2ShCT6aEansCF8.BkfhtQu', 1, NULL, '2025-09-22 00:37:07', '2025-09-22 00:37:07', 1572),
(839, 'AYU SAKILA', '2324101292', '2324101292@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wCN/PeeGMYbft6YSRI5z2O48uPy3knlvMPomDeEj/b6SX8JATQMTa', 1, NULL, '2025-09-22 00:37:08', '2025-09-22 00:37:08', 1573),
(840, 'DEVIA UTARI', '2324101293', '2324101293@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CwTFw4lWNUAGPSJbJosctOe05nRvuWvU3iuYV2ST0wgL4p97MSE5e', 1, NULL, '2025-09-22 00:37:08', '2025-09-22 00:37:08', 1574),
(841, 'DINI AHIRUL DESTIANTI', '2324101294', '2324101294@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$NJJaKJzwJbMAMZE4yBv48enscPHfCTRQODDkhm1X79djyQAn1iuci', 1, NULL, '2025-09-22 00:37:08', '2025-09-22 00:37:08', 1575),
(842, 'Dzakir Azhar', '2324101295', '2324101295@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JRym9fyxV82QnwnqvEuCIe3b0YQYbL8nMHEI5qyW00Kpft3JRgP0q', 1, NULL, '2025-09-22 00:37:08', '2025-09-22 00:37:08', 1576),
(843, 'Elvira Khaerunissa', '2324101296', '2324101296@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$coi9rYGB0ZSm384/Ml1X6./ce6rMixuNw1TeXm0ClXvF6862vCgLW', 1, NULL, '2025-09-22 00:37:08', '2025-09-22 00:37:08', 1577),
(844, 'FINANDA YUGA MANGGALA', '2324101297', '2324101297@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VwcR/b7Yy7BoVvf15IsW1eputUZ.2h.kS88mJxvYb2Ay4VbAg1mIS', 1, NULL, '2025-09-22 00:37:09', '2025-09-22 00:37:09', 1578),
(845, 'FITRI SASKIA RAMADHANI', '2324101298', '2324101298@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xEh11/dROBZPTS/64HUUTuMJ8zJYiVj0466vXQRVBEwxTQ9JZyyMC', 1, NULL, '2025-09-22 00:37:09', '2025-09-22 00:37:09', 1579),
(846, 'GALANG', '2324101299', '2324101299@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qCIv8IIhNwCZrsO.UJQ0t.Tqhrjvucet31KODPaw2JryroNKRby6u', 1, NULL, '2025-09-22 00:37:09', '2025-09-22 00:37:09', 1580),
(847, 'GALANG FIRMANSYAH', '2324101300', '2324101300@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$EKttwbC9HziRW3xD77u5XOlOo91PbkRb.R/itDNba7CMWonujxudi', 1, NULL, '2025-09-22 00:37:09', '2025-09-22 00:37:09', 1581),
(848, 'GISCA NAFISA DESTIANA', '2324101301', '2324101301@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$EgORsaxN3LwwyODwvzoyt.qS2pmHhXEjGEj2omLCxu/18qWHAor8e', 1, NULL, '2025-09-22 00:37:09', '2025-09-22 00:37:09', 1582),
(849, 'HAMIA NURALIA ZAHRA', '2324101302', '2324101302@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0q8yn/03GIKmZvkTd60Rve5WcEmgB1TZC8NESEBnmzKc/lSPjLzV2', 1, NULL, '2025-09-22 00:37:10', '2025-09-22 00:37:10', 1583),
(850, 'MARSHA ADELIA PUTRI RIDWANSYAH', '2324101303', '2324101303@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$eGfOVqBzX5FDsZdcmKH.ReFF95iGKd4o9umPi4WoeveqvSHp/e60q', 1, NULL, '2025-09-22 00:37:10', '2025-09-22 00:37:10', 1584),
(851, 'MARTESA PASKARIANTY', '2324101304', '2324101304@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$y1W3GSaSCGDPpEzp6Gy2uOCtq9oFPpewyyidVndmRjTHgJDcOR9We', 1, NULL, '2025-09-22 00:37:10', '2025-09-22 00:37:10', 1585),
(852, 'MEILINDA KHOERUNNISA', '2324101305', '2324101305@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$n9IqqRfILiNgmucHn.oyd.8BHCV26Qrg5AUVyJi3k5ch8Qdzcl7iu', 1, NULL, '2025-09-22 00:37:10', '2025-09-22 00:37:10', 1586),
(853, 'MIFTAHUL KHOIR', '2324101306', '2324101306@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AugdIgE4Nd9l.u56bZx0J.HX7.piuiB95FqaD0HzqsNtOtIJU2.92', 1, NULL, '2025-09-22 00:37:10', '2025-09-22 00:37:10', 1587),
(854, 'MUHAMMAD FACHRI NUGRAHA', '2324101542', '2324101542@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$F4KrjAvuDtXZTMJVSi2MoOcYYoT5Rje2tcGcZ1oP77lkO8HsZQ2m6', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1588),
(855, 'MUTHYA PRATIWI', '2324101307', '2324101307@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BtYHKGsuQ4WYP6uhuzZUR.Iy0a17u8TaBI4cpis63M39041TO.Tp2', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1589),
(856, 'Nafisa Salsabila Ramadhani', '2324101308', '2324101308@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$bHPD8rqYXAm3Jy.aC2Vv2u0138VTyHvWvxy9PafThViD2WyG3emGm', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1590),
(857, 'Nasya Saufika Wati', '2324101309', '2324101309@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kW4nHpUyELT0cJ/kMubV7Oq19KlqbMU59e37mJgMKw4aZmcomUPGG', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1591),
(858, 'Nazhara Syahida', '2324101310', '2324101310@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Q8dDy7FPiuK5avDuBTO2IOsZJ2tLsEEGtA4t29WFKTdwLRh4RxuNy', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1592),
(859, 'Nuri Awwaliah', '2324101312', '2324101312@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$K4NMXFKV96u/hQkkV0BBsedYrJ.zEZr..G8FQVd.gxzPDSkz8EDyy', 1, NULL, '2025-09-22 00:37:11', '2025-09-22 00:37:11', 1593),
(860, 'RACHEL PUTRI RAMADHANI', '2324101313', '2324101313@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vvCIwpobWSD.YFVOU4IHyeMbYOGh6nPtFrhe.vwpkCmkbmQSQ4Kw.', 1, NULL, '2025-09-22 00:37:12', '2025-09-22 00:37:12', 1594),
(861, 'RAIHAN SUPRYATNA', '2324101314', '2324101314@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ZN2LjAypDupRgOsNuNrQh.eTjkWLpIlALWoYgVj3K/CLm3oI3QGx6', 1, NULL, '2025-09-22 00:37:12', '2025-09-22 00:37:12', 1595),
(862, 'Raisya Isni Masdiana', '2324101315', '2324101315@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BvJw3WBYxJhfa/8A3RoYi.R5Tsxhkr3dUc51op9mpG/iS5ZHWK4My', 1, NULL, '2025-09-22 00:37:12', '2025-09-22 00:37:12', 1596),
(863, 'Rapi Priatna', '2324101316', '2324101316@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0I.9LBZf/1CUJ0c/lM/Dg.D5nu7KnNUdVMKTkSzrziROzesvQkz6u', 1, NULL, '2025-09-22 00:37:12', '2025-09-22 00:37:12', 1597),
(864, 'RAYZA HUMAIRA', '2324101317', '2324101317@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SehnRh2DkpBtdt5.80w6ruAMNmb7JPTGjyUWsv11JGNXcI9/4w68G', 1, NULL, '2025-09-22 00:37:12', '2025-09-22 00:37:12', 1598),
(865, 'Refan Pratama', '2324101318', '2324101318@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$s8qNG1cRcLnZouUL6mOIhuH0XKCxC9ynC/aZIjU/IvNpNqPQkR/7.', 1, NULL, '2025-09-22 00:37:13', '2025-09-22 00:37:13', 1599),
(866, 'RINI APRIANI', '2324101319', '2324101319@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nEDSMLMQZ/99vjDzywcqbOJ1Rb940YF2C74DETmVz7vGQN.hVZEXO', 1, NULL, '2025-09-22 00:37:13', '2025-09-22 00:37:13', 1600),
(867, 'RIRIN CITRA NUR\'AENI', '2324101320', '2324101320@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lxx4KGN4f1./DggJCWWESedHTspKZQiQnOphXUm3dt8mMn2w7WVOm', 1, NULL, '2025-09-22 00:37:13', '2025-09-22 00:37:13', 1601),
(868, 'SILPI HANDAYANI', '2324101321', '2324101321@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$uu8Vr10i3ia8Ni.q0utN7.hEzIxi/ieI8225uqOzt.Zh4O/.J8LGe', 1, NULL, '2025-09-22 00:37:13', '2025-09-22 00:37:13', 1602),
(869, 'Silva Julianty', '2324101322', '2324101322@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$oPh8hUgoSmyOJ55n2QrUPO6FeujKHZsBxumR6xIBpGeKGLIEmbCHW', 1, NULL, '2025-09-22 00:37:13', '2025-09-22 00:37:13', 1603),
(870, 'Wiliyanti Pergiwa', '2324101324', '2324101324@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MthkqqG3E2mIYa6OuPLSf.IPFDJYuz7UqCSvEReQvbbe1dMlCjQH2', 1, NULL, '2025-09-22 00:37:14', '2025-09-22 00:37:14', 1604),
(871, 'AGNI DWI LISTYANTO', '2324101325', '2324101325@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$frXaxUUX3CI7f/89LR4qhubA.goooW4rkAYmANo7YmKalmd/dQoUq', 1, NULL, '2025-09-22 00:37:14', '2025-09-22 00:37:14', 1605),
(872, 'Alya Sahwa Nuralif', '2324101326', '2324101326@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Zj43wdvy1QyPgjt/M4oQNOFgiJW8.CfsL7c8CxHLhhSQxH/sdYUxu', 1, NULL, '2025-09-22 00:37:14', '2025-09-22 00:37:14', 1606),
(873, 'AMELIA PUTRI', '2324101327', '2324101327@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$juGGX5FL8FESs4zoChfTu.mpJaWQ1P/9jtuV8TaEUkLuMOaWPFIri', 1, NULL, '2025-09-22 00:37:14', '2025-09-22 00:37:14', 1607),
(874, 'Ayunda Pramesty Setiawan', '2324101328', '2324101328@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$DlFa0/P3lMhqaldCNYlHsuDx8V4OO4y1nYPuB8gZrWSL5infni3Zy', 1, NULL, '2025-09-22 00:37:14', '2025-09-22 00:37:14', 1608),
(875, 'Chelsi Aprilia Manik', '2324101329', '2324101329@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$zQL1HCABWR4TUvJVR0lycOFo8DY/uZ.I8M0kMv35dh5Njt.9NiYOe', 1, NULL, '2025-09-22 00:37:15', '2025-09-22 00:37:15', 1609),
(876, 'CHIKA AURELYA PUTRI ANJANI', '2324101330', '2324101330@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$mHtVbQRLpKcT1C6oOxEsAeA.KN5dKDmrCnxaBkgpS.CSPIUPDzfg2', 1, NULL, '2025-09-22 00:37:15', '2025-09-22 00:37:15', 1610),
(877, 'Dianty Syarifah Mechdar', '2324101331', '2324101331@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dwgW8wzrn0cqnNh3YHa25OnQkWrSWbxbV0Yop.5q8ggF6qQ/H9Za6', 1, NULL, '2025-09-22 00:37:15', '2025-09-22 00:37:15', 1611),
(878, 'Dini Septriani', '2324101332', '2324101332@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$H.s1Nph7XI4LpLT6nJb6oOKXCpdKXrc.aZJ.iWnMZPFw.d97OZqR6', 1, NULL, '2025-09-22 00:37:15', '2025-09-22 00:37:15', 1612),
(879, 'DINNA NUR RAHMA', '2324101333', '2324101333@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hPWP0yHCVEPP.Et5Fues6unXb4stxR7T04AvBNMthQ77.sOWauUCa', 1, NULL, '2025-09-22 00:37:15', '2025-09-22 00:37:15', 1613),
(880, 'FATURROHMAN', '2324101334', '2324101334@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$93leJ.rVe.ai2HPcS4ll4e3u7pzG2dhIwOrKXUn9GcI6IMfkLyeVq', 1, NULL, '2025-09-22 00:37:16', '2025-09-22 00:37:16', 1614),
(881, 'IKA OKTAVIANI', '2324101335', '2324101335@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5Oq1ODLE07HryT5MPW8ZfeAMChV8keR.qU/hemYnxSTgKNSCyeCf.', 1, NULL, '2025-09-22 00:37:16', '2025-09-22 00:37:16', 1615),
(882, 'MARYAM PUSPA DEWI', '2324101336', '2324101336@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Skigexuz.tpWHY9NOFJd9ORcW8KWEdgoyUA0r.mepY9JGxmCVb7Bu', 1, NULL, '2025-09-22 00:37:16', '2025-09-22 00:37:16', 1616),
(883, 'MAYA SUPRIHATIN', '2324101337', '2324101337@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$114w92D2qn83sjWu6kaHW.qxATKbilwrHoS6EagraIZ/WOC.7Y9N.', 1, NULL, '2025-09-22 00:37:16', '2025-09-22 00:37:16', 1617),
(884, 'MEILANA GUSTIANA', '2324101338', '2324101338@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$QG1mb9rq058D/3ZG.O6Odu7yVqlwuiZCjlMgsk5mnvL1uSb5Ki8JG', 1, NULL, '2025-09-22 00:37:16', '2025-09-22 00:37:16', 1618),
(885, 'MEILANI FITRIANI', '2324101339', '2324101339@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ibFBJOILyk2DTVTYLk8pmu//qNMvPHpzR8BBqDcLVXLYAEUdT4JwC', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1619),
(886, 'MUHAMMAD NADIP SUDIRMAN', '2324101340', '2324101340@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Xmll8wdX31eY4v82RuzwNuAsVKVl3eHWCusGC5GprZynme0jKE3Aa', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1620),
(887, 'NANDITA NOVELIA PUTRI SETIAWAN', '2324101341', '2324101341@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/LhlrVMjlL1Drrdn6dwR1uyHqYth6zz8oZA4Z1OKlsMNRdld08fPy', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1621),
(888, 'NATHASYA ANANDIRA', '2324101342', '2324101342@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8kIDvsG3R9ES9nGs8ppLperS./DKf0yqAvBrjukeCBondzC8wee2C', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1622),
(889, 'NAYLA PUTRI MAHARANI', '2324101343', '2324101343@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$atZee11Z9cQ41beaF23JCuzRGI3sCBqa3R.ieOhJsFAieVtD6S4OG', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1623),
(890, 'Nazwa Ramadhaniah', '2324101344', '2324101344@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$oCvi7FKQHPjYe8JD9aYVgOTossxL2yLk2osRxzwMCx.u6smOzYeHa', 1, NULL, '2025-09-22 00:37:17', '2025-09-22 00:37:17', 1624),
(891, 'Nida Fairuz Anisah', '2324101345', '2324101345@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$KFfSYroi5YJ/yyz35AKh1.Nfk7T1vqDINBso0NWXdaW.w27kfo5h2', 1, NULL, '2025-09-22 00:37:18', '2025-09-22 00:37:18', 1625),
(892, 'NITA PUSPITASARI', '2324101346', '2324101346@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$g7mhHwJ2UcfGQUHGybMEUOWt0nUXlPO6vzM7.lWegZRea7KaOzala', 1, NULL, '2025-09-22 00:37:18', '2025-09-22 00:37:18', 1626),
(893, 'NURUL NUR IHSAN', '2324101347', '2324101347@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$L5evbxNtMN73DfSZROBpBeeAgpXKglX5Hp647LH1h8V2NcHY3NJ0.', 1, NULL, '2025-09-22 00:37:18', '2025-09-22 00:37:18', 1627),
(894, 'RACHMA PUSPITA', '2324101349', '2324101349@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CO6pVxazxz.zLyLvl0Lj9.4SmfZ17vxjBshbJDv2EHW8IhFMp4Euy', 1, NULL, '2025-09-22 00:37:18', '2025-09-22 00:37:18', 1628),
(895, 'Rangga Saputra', '2324101350', '2324101350@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/BzA0JyJ1EXmYcR6iPMh5O0xtg/oOTPlL72wk1u65E5pxbBqQX4xi', 1, NULL, '2025-09-22 00:37:18', '2025-09-22 00:37:18', 1629),
(896, 'REPAN TRI RAHMAT', '2324101351', '2324101351@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nu78A0IbTGM1WJEAaviXjexqV3iDbOJa4/fK6famg/QX8o8Umsow2', 1, NULL, '2025-09-22 00:37:19', '2025-09-22 00:37:19', 1630),
(897, 'Reva Alkalivi', '2324101352', '2324101352@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rWdI8ZfaA44rZ8V3/VJf0OT77YU.FghsBluwDRlZQ6sh/BJDBha9i', 1, NULL, '2025-09-22 00:37:19', '2025-09-22 00:37:19', 1631),
(898, 'REVA OCTA PRATIWI', '2324101353', '2324101353@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7E5jbfuKHxSyP1PqRaPyxeQgBqyzOUcGq31thrQtReiEGHguqhF.a', 1, NULL, '2025-09-22 00:37:19', '2025-09-22 00:37:19', 1632),
(899, 'REVAN TRAKASYA', '2324101354', '2324101354@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nG6XYu3LM7r6ZCQ.S6FAbOxFqGMZkw5NTVfL8CvPbAUW9duHJqa/.', 1, NULL, '2025-09-22 00:37:19', '2025-09-22 00:37:19', 1633),
(900, 'RIFA MEILANI', '2324101355', '2324101355@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XSlKTpIaDHeTeXZS3mikr.zFVZ3OLyrhDuwGizOPBPsZJXnd1gwca', 1, NULL, '2025-09-22 00:37:19', '2025-09-22 00:37:19', 1634),
(901, 'RISKA YULIANI', '2324101356', '2324101356@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qZyF7j782X/ShDcDbhgns.Sb7RXSYTOibC7rQyO1WrikaSdYm7wpG', 1, NULL, '2025-09-22 00:37:20', '2025-09-22 00:37:20', 1635),
(902, 'SERLY HANDRAYANI', '2324101357', '2324101357@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Kx.3i/vKzkcMGZzksXTp2eI5te3Mb3yMoOzxfhqXF/fyzAWOnB8vW', 1, NULL, '2025-09-22 00:37:20', '2025-09-22 00:37:20', 1636),
(903, 'SILVIANA PITRI MULYADI', '2324101358', '2324101358@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LKYAf5kPyl1yDfag4Xi.tOM7Ug0GlNErfH5gWfDOk2PuZ88I39DJy', 1, NULL, '2025-09-22 00:37:20', '2025-09-22 00:37:20', 1637),
(904, 'SITI ROHMAYATI', '2324101359', '2324101359@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$mA.4iCui8mLzQclq7yUFSutqnLw8XBtaAxwKsjY5DGkQN.EEqpTzS', 1, NULL, '2025-09-22 00:37:20', '2025-09-22 00:37:20', 1638),
(905, 'Yunita Sari', '2324101360', '2324101360@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LJG8prnMQjDS.5hnzDyNGe7ViOVIWMSNYMnOwNrHsyEHCspcLTUfm', 1, NULL, '2025-09-22 00:37:20', '2025-09-22 00:37:20', 1639),
(906, 'Ade vera latifah', '2324101073', '2324101073@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$YiUU6i79klPO9UU4lUNbgeIhx19YCjKnogoQuP2afj/dk0KSsSXSS', 1, NULL, '2025-09-22 00:37:21', '2025-09-22 00:37:21', 1640),
(907, 'ALIS AMELIA SARI', '2324101074', '2324101074@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lR9XVq2DNPSVGqHv3Z0H2uXBl1r3PuG6Dn27bIWTQrjSqpJy8xojy', 1, NULL, '2025-09-22 00:37:21', '2025-09-22 00:37:21', 1641),
(908, 'Alsya Nurfadilah', '2324101075', '2324101075@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VlPnAxukPGelCkOjTFWnZ.axQ.FFeBOZ6T9HAd2sj.C9Z9ITdeq/m', 1, NULL, '2025-09-22 00:37:21', '2025-09-22 00:37:21', 1642),
(909, 'ANNISA ARTIKA FADILAH', '2324101076', '2324101076@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$InnlzMhBZtP7vHpXgq6QauVkFcLZuxYk1tgXfOs45cZcZ6bQ38Bay', 1, NULL, '2025-09-22 00:37:21', '2025-09-22 00:37:21', 1643),
(910, 'ARIEF NURAHMAN', '2324101077', '2324101077@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$s23NdUFYTIjZp1J6.NXQ4eKWj8vJZ.yfG9bFYKR3pQx4tqb4Ry3qS', 1, NULL, '2025-09-22 00:37:21', '2025-09-22 00:37:21', 1644),
(911, 'Arta Yunita', '2324101078', '2324101078@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$jtcV4S8kGXVeD3WsOhsNK.QPxoUzy16/.TmZnwYi2Gsso65LshDpy', 1, NULL, '2025-09-22 00:37:22', '2025-09-22 00:37:22', 1645),
(912, 'AYU LATIFA NURSABRINA', '2324101079', '2324101079@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CVKWZ4Eww22H9QF.bYwiQeEIrKZzZ65UX1rGAbuBlF2DxdedydC0W', 1, NULL, '2025-09-22 00:37:22', '2025-09-22 00:37:22', 1646),
(913, 'AZARAH TUSITA YUSLIANI', '2324101080', '2324101080@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JSDQfDFaWzYXbT.wLMbgyOxDIK/v43AbiFhZDs0lML.qoV/YXaHMe', 1, NULL, '2025-09-22 00:37:22', '2025-09-22 00:37:22', 1647),
(914, 'BUNGA RISMA RAMADHANTY', '2324101081', '2324101081@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JKmUdOXPr838iSLKXGRIIuAC1hIq4vWFlmXpRZgcfYg75VYNC4cee', 1, NULL, '2025-09-22 00:37:22', '2025-09-22 00:37:22', 1648),
(915, 'Dinda Niken Pradita', '2324101082', '2324101082@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2yj5hs6jKZmR1udmsS.w8OsUfW5a2qeN5aXZWo8TIcwrkXT9i99Zy', 1, NULL, '2025-09-22 00:37:22', '2025-09-22 00:37:22', 1649),
(916, 'DWI NUGROHO', '2324101083', '2324101083@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XdADOidYJxwn7Mvs1RHX6.SZt3j35Kw2/QIaZPaADKA/43Y.PY5Vu', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1650),
(917, 'EGI NUGRAHA', '2324101084', '2324101084@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Fji9KpFMePa7IXIu7LJHVuvYVYCy0vD1AIFwBByYX8WyYOrgASZTm', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1651),
(918, 'HAZZA DWI NURHIDAYAT', '2324101085', '2324101085@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wyzvUdlUeTfZfMmOFJrMyeBrzBVNP5D/XSrxTnwanR4cpbP.VHhm6', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1652),
(919, 'Hilda Raditya Ramadani', '2324101086', '2324101086@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Y4A9/fISXOv05vGyyhPV..VNEA7O9x7KCYWkPvGTcFErazRPSFvuC', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1653),
(920, 'ILHAM HANAFI', '2324101087', '2324101087@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0OsWg4gDMwoKonTDGIMYSushKDmprIf7y6hNB7onaVR25HB/2DyU.', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1654),
(921, 'JELITA RESTIANTY', '2324101088', '2324101088@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kQuOzkTwgTqusP8ERNc.f.nXsQNGBCkDFnZZRytAH6mebf4xtwhoe', 1, NULL, '2025-09-22 00:37:23', '2025-09-22 00:37:23', 1655),
(922, 'Juliyanti', '2324101089', '2324101089@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hdINw9hsnNWmVK6.mAQzxeRVt1jLlApLHLpxQZzNU7iWoM8oAH1wS', 1, NULL, '2025-09-22 00:37:24', '2025-09-22 00:37:24', 1656),
(923, 'Khalisa Handini', '2324101090', '2324101090@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qKsoG.PK4Wupn/og269.xOf0VEdrF6OypNUQQB2fXYKvJtuVJv3Ru', 1, NULL, '2025-09-22 00:37:24', '2025-09-22 00:37:24', 1657),
(924, 'KIKIM PATIMAH', '2324101091', '2324101091@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8Hu9iyaB/FGYoQzf/vDu5ec9imdkGVgZDB/C3UNGJ836EjYPQAdX.', 1, NULL, '2025-09-22 00:37:24', '2025-09-22 00:37:24', 1658),
(925, 'Miftahul Jannah', '2324101092', '2324101092@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a.5dFtwJ7qJ2eLgsj5.0Re7FpjVYjjfdw9w05UU87vSygIKGrjUwe', 1, NULL, '2025-09-22 00:37:24', '2025-09-22 00:37:24', 1659),
(926, 'Muhammad Fadillah Al Hijriyah', '2324101093', '2324101093@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LFvBwV1FRYHTXiCiJsrx5.tvrGaWgLGnIyYGd8pmMThJPWG51TIPW', 1, NULL, '2025-09-22 00:37:24', '2025-09-22 00:37:24', 1660),
(927, 'NAURA ALIFA PUTRI RIZAL', '2324101094', '2324101094@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$y5iDC0jwVh1lJcB5RkHvq.Xz6XtBQWmTKxpOVfNm2SB0EuE66Tq2y', 1, NULL, '2025-09-22 00:37:25', '2025-09-22 00:37:25', 1661),
(928, 'NAZLA SHERLY NOER ISMAYANTI', '2324101095', '2324101095@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a4A8l1RYB759eEasPHwKs.9raKiHa8KRu.Dze55DrxEJBOP393ot2', 1, NULL, '2025-09-22 00:37:25', '2025-09-22 00:37:25', 1662),
(929, 'Nopa Juwita Indriyani', '2324101096', '2324101096@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$E4x7XtDgOSsFEz28SlSPfuLmA/PnLCp.KigYbRWLvpToLYC5Rlpbm', 1, NULL, '2025-09-22 00:37:25', '2025-09-22 00:37:25', 1663),
(930, 'NURUL NURAZIZAH', '2324101097', '2324101097@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SPz781X96go1Dp8W0qiwJelb.k8YOdNShEwiefjz2VGoUBPX/qkvu', 1, NULL, '2025-09-22 00:37:25', '2025-09-22 00:37:25', 1664),
(931, 'Rayhan Nuryaqin', '2324101098', '2324101098@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Wc5aNZqa04axN9T7iPrgK.wXIBr0RODYziUOJD0q4IZGRLcCBBCg2', 1, NULL, '2025-09-22 00:37:25', '2025-09-22 00:37:25', 1665),
(932, 'RHOFIQ RAMDHANI', '2324101099', '2324101099@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Way6AJr/1MmRC0Q07NG2YOQM/xN8mMe3C50juOUerSGSvKmGDlBxu', 1, NULL, '2025-09-22 00:37:26', '2025-09-22 00:37:26', 1666),
(933, 'RISTI NURSITA', '2324101100', '2324101100@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Ro/je7vF/ABbSqHY7lX36OBfi.bMUmloYIX67BYEG.ZxQ1YeosEMe', 1, NULL, '2025-09-22 00:37:26', '2025-09-22 00:37:26', 1667),
(934, 'RIZKY FAHRIZA HAKIKI', '2324101101', '2324101101@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a9vVQX5UD6XsNfWS1/Xd2.DcRLmutQiIM2rHiP6P4kI9VGHeeYsya', 1, NULL, '2025-09-22 00:37:26', '2025-09-22 00:37:26', 1668),
(935, 'SASA ARI JUANDA', '2324101102', '2324101102@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cJJkEyeK6DrrX96JPdiKM.8b3Gc6UHqNaaHq1RsYsytXNpxMRo5mS', 1, NULL, '2025-09-22 00:37:26', '2025-09-22 00:37:26', 1669),
(936, 'SINTA NURJANAH', '2324101103', '2324101103@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$44keSrVp60yvYJ.459c2O..l61nrTpv1YcG5zolGJVy7QLlGf2Pa2', 1, NULL, '2025-09-22 00:37:26', '2025-09-22 00:37:26', 1670),
(937, 'SYALWA SALSABILA', '2324101104', '2324101104@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$H9.PMO1CcVkncYfJYdUBpuNKMWpX9zUx4Rs7c.kC0KkM0mTHuibXy', 1, NULL, '2025-09-22 00:37:27', '2025-09-22 00:37:27', 1671),
(938, 'TASYA APRIANI', '2324101106', '2324101106@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$6WS2ns7xl51XgZy1cyDCneYG/GVBHFJVuqDSkzdfHceUyaDU95/1y', 1, NULL, '2025-09-22 00:37:27', '2025-09-22 00:37:27', 1672),
(939, 'Tiara Ayu Herliana', '2324101107', '2324101107@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LqH09xMJfrJDTX8ZwsUfXO4ccCAq71DaNQpY16KlcFmUCaMXNHdqa', 1, NULL, '2025-09-22 00:37:27', '2025-09-22 00:37:27', 1673),
(940, 'WILDAN NUR FADILLAH', '2324101108', '2324101108@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$sVkPwCb31nXdnoP2/zFXLeMybgN/8ga4QJvzNIC0HRQ7yuSM5fg2.', 1, NULL, '2025-09-22 00:37:27', '2025-09-22 00:37:27', 1674),
(941, 'ADI FITRIANA', '2324101109', '2324101109@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3ECO20PMv1xwgKC6/LTe0ODxOUM2uHxs1hHBoJJSxJqmV5LIed0xy', 1, NULL, '2025-09-22 00:37:27', '2025-09-22 00:37:27', 1675),
(942, 'ADINDA RAMADANI', '2324101110', '2324101110@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2i.DKYKpLpUhM4r9/ReF.uDL8bDcRWN70Y./d0XfDVCgtvKCcp5Sy', 1, NULL, '2025-09-22 00:37:28', '2025-09-22 00:37:28', 1676),
(943, 'AMANDA RAENA DEWI', '2324101111', '2324101111@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Nu5BmXLNvRZk1cF/pML7LugkpotdMUvIuc4aRdhcAzOAYmbZGLeQq', 1, NULL, '2025-09-22 00:37:28', '2025-09-22 00:37:28', 1677),
(944, 'AMARA NUR APRILIA', '2324101112', '2324101112@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$RR.g42fkSb9V0n1ImJMHquJjfzx.xjTdO48T.W0zXd3zGHx1fCVWK', 1, NULL, '2025-09-22 00:37:28', '2025-09-22 00:37:28', 1678),
(945, 'AMELIA GUSTAMI', '2324101113', '2324101113@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$mO2XeqY1ngz56AWWaLlXseTgmmCt1dg2iRxZwnj3OFcgBCNo6cBgC', 1, NULL, '2025-09-22 00:37:28', '2025-09-22 00:37:28', 1679),
(946, 'ARGALIH SETIAWAN', '2324101115', '2324101115@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$q6AKTGKSDxRRnOFgvYpqV.4Cu010wC3iY1G1RwazpWv.G6kqpR4lq', 1, NULL, '2025-09-22 00:37:28', '2025-09-22 00:37:28', 1680),
(947, 'Arvia Deswita Saripudin', '2324101116', '2324101116@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SQewYEmeCB0N5SfRuktvEeyKsWtB.3AV32phsIRmoPWkZ.nKDnqF6', 1, NULL, '2025-09-22 00:37:29', '2025-09-22 00:37:29', 1681),
(948, 'Asti Surastri', '2324101117', '2324101117@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Qf3JR4eAphe51Bkr09w2reO5.orGY0AbHW6tCmBeHIIpFoYPtffhK', 1, NULL, '2025-09-22 00:37:29', '2025-09-22 00:37:29', 1682),
(949, 'AZKA SHIDDQIE HARUMAN', '2324101118', '2324101118@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$22W7Sit6P0aLa3hGRXixkOtVMoE7OkSrAT4udDBzlPpKvMSJRLQey', 1, NULL, '2025-09-22 00:37:29', '2025-09-22 00:37:29', 1683),
(950, 'Bunga Cinta Apriliani', '2324101119', '2324101119@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PSdlLpyCxpKUuVT3zmc3uO9U.Eo3gxRP0Xrb9pcAuelg9lQ8L5kBK', 1, NULL, '2025-09-22 00:37:29', '2025-09-22 00:37:29', 1684),
(951, 'Danar Khusnul Khofiza', '2324101120', '2324101120@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$4akMc/H/jy1fuc8hDxNZ8.L.kRpJlFr.fWdvs2JoQMVr9z9x84XVe', 1, NULL, '2025-09-22 00:37:29', '2025-09-22 00:37:29', 1685),
(952, 'DARA AYU LARASATI', '2324101121', '2324101121@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2lDdWm3jwD6CO3oVIjzg5uRNoiLmM2lCL31J9ELDOyNNAcQ/ffOBu', 1, NULL, '2025-09-22 00:37:30', '2025-09-22 00:37:30', 1686),
(953, 'DELA HERLIAWATI', '2324101122', '2324101122@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ZRewDXrtismKRweQuZE3QepsYfc81oqznBRBjTY3RsAoOK7bIHsaa', 1, NULL, '2025-09-22 00:37:30', '2025-09-22 00:37:30', 1687),
(954, 'EVA AISYAH RAHMAWATI', '2324101123', '2324101123@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$z7A6LSpRsMifcrQRvrkPK.nodPKKlByvVgSFii.70uHsS24NHht3O', 1, NULL, '2025-09-22 00:37:30', '2025-09-22 00:37:30', 1688),
(955, 'Fetti Rizki Lestari', '2324101124', '2324101124@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xMz6hE81N6UXVfFNCOZdfepwGWbY7DRY583rtHAHmcxkdL3VE0Hbq', 1, NULL, '2025-09-22 00:37:30', '2025-09-22 00:37:30', 1689),
(956, 'Fitri Oktaviani', '2324101125', '2324101125@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VJVlxgMJ5uTlI1PtXYX1LucPgFQxskyZ4Rbz3uttLIeSOvNyjLZCO', 1, NULL, '2025-09-22 00:37:30', '2025-09-22 00:37:30', 1690),
(957, 'IDIN MUHYDIN', '2324101126', '2324101126@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$zQcq9BYnrr8JlR1zMju8kOyISt.cYk2IK2JSnvofcPqDMwLcQmobO', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1691),
(958, 'INTAN SRIWAHYUNI', '2324101127', '2324101127@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XXMZuPx42ikPdXzjnEmvIe06xWI/NcW7fIPZh9ZLPmS0FipDkrz6W', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1692),
(959, 'JAJANG NUGRAHA', '2324101128', '2324101128@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vlyXtr/C8/uY4wGE5ihQi.rNSUahSvcJIgy2EY9KsZUx4IQSeXouK', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1693),
(960, 'Milan Muhammad Miftah', '2324101129', '2324101129@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3sg09bQmVwZzgfHvYvHjh.U/kaDAgVAO0AKY1iSWEUJYr7zxBW4ry', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1694),
(961, 'MONALISA PUTRI UTAMI', '2324101130', '2324101130@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2JUnRKlY2WjmpYURjrOCM.4UDn0BDNZ/e4qOxsv/kx3908vEMtlby', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1695),
(962, 'NUR AYU WIDIASARI', '2324101131', '2324101131@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/.SIdzE9j19HV.GZrle5muyiCJqtMysQMWfcft8kwYX./4oTqn4V6', 1, NULL, '2025-09-22 00:37:31', '2025-09-22 00:37:31', 1696),
(963, 'Puput Maulana Habibah', '2324101132', '2324101132@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ghudWt/yI.veM7W1sSRuS.Czq/RgoUy.XkScyCUybSWqv1XlGmL8a', 1, NULL, '2025-09-22 00:37:32', '2025-09-22 00:37:32', 1697),
(964, 'Reisya Zahrotusyitha', '2324101133', '2324101133@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Hwd6AUQzV7139qCj424Kre0876RmqfK/4zizQwTqKQWyYm9QmsC46', 1, NULL, '2025-09-22 00:37:32', '2025-09-22 00:37:32', 1698),
(965, 'REZA', '2324101134', '2324101134@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3ftunvl2lqN8fSnV617hiujw6ftelvbIFqIegZJnza55pLOTm9oXC', 1, NULL, '2025-09-22 00:37:32', '2025-09-22 00:37:32', 1699),
(966, 'RISMA YULIANIKA', '2324101135', '2324101135@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$npbhlHFY4NaIEs2GmcH02unh1mAGdIrLxxfBqojMmpk7xjVUKxrLW', 1, NULL, '2025-09-22 00:37:32', '2025-09-22 00:37:32', 1700),
(967, 'SATRIA ARRAS', '2324101136', '2324101136@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$NrEQJaH9OxRIxDiA0WVcn.UbTMA6DBT7gRr5lm4OCu4IOiVNIs/Py', 1, NULL, '2025-09-22 00:37:32', '2025-09-22 00:37:32', 1701),
(968, 'SHAZIA AULIA', '2324101137', '2324101137@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5SxfJyNG5cQeyhIPBOv.6uMKZyvGfNM5Z3QB0y4RM3gYJmQT612mi', 1, NULL, '2025-09-22 00:37:33', '2025-09-22 00:37:33', 1702),
(969, 'SHELLA AMELIA', '2324101138', '2324101138@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WlrViXf77Ioe5EcT.JiD3Of1cZProK0k7uPgeGjUvx8hMFNSreCzu', 1, NULL, '2025-09-22 00:37:33', '2025-09-22 00:37:33', 1703),
(970, 'SINTA RAHAYU', '2324101139', '2324101139@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PH8bDB09snMRi8fUeSsLkeLNWFUCvcJ0hBBXbH94oYEk36GLS3.Da', 1, NULL, '2025-09-22 00:37:33', '2025-09-22 00:37:33', 1704),
(971, 'Syaakira Naura Az zahra', '2324101140', '2324101140@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VqcMxUjnjVdH4hOUH7q65OYnD0v438iydyWkDYGPrO562k7x4D.DS', 1, NULL, '2025-09-22 00:37:33', '2025-09-22 00:37:33', 1705),
(972, 'VASHA NAYSILA HIDAYAT', '2324101141', '2324101141@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GA9MioQtH8Wu6Lv8tpAC.Oe2RUcNI0KGFIJzMB3gig/LLqcx819/m', 1, NULL, '2025-09-22 00:37:33', '2025-09-22 00:37:33', 1706),
(973, 'Wegi Putra Prayitno', '2324101142', '2324101142@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GFaxlFkasDx0WxQUGH.yr.Gz1bRpAlKIZJTmGjxIaYFsHSZNsosaG', 1, NULL, '2025-09-22 00:37:34', '2025-09-22 00:37:34', 1707),
(974, 'YULIA ANDHANI', '2324101143', '2324101143@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$edBaMg99UwKeWJj7FZ1jzODZUiOqbOSp38NwdrDQ2EaJ4aj9jYS4m', 1, NULL, '2025-09-22 00:37:34', '2025-09-22 00:37:34', 1708),
(975, 'ZENAL ARIFIN', '2324101144', '2324101144@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XlFApuS7GXGEuNnaphY.y.Wm4v2TSS9mGPIO2dN8ZgVd0h3uF.HNS', 1, NULL, '2025-09-22 00:37:34', '2025-09-22 00:37:34', 1709),
(976, 'ADDIN HANIFA', '2324101145', '2324101145@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$mVXc1o.BHhU07kNyiSiNR.h2r3zWtEZ.msY9a6HIv.jLAC0utzgFm', 1, NULL, '2025-09-22 00:37:34', '2025-09-22 00:37:34', 1710),
(977, 'Aditya Agung Nugraha', '2324101146', '2324101146@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Cl28cvwblJvpdRHA9txxGelK0KwnOdGkt5IpEOF.70PFDcBpgZzVK', 1, NULL, '2025-09-22 00:37:34', '2025-09-22 00:37:34', 1711),
(978, 'ADRIAN AFRIANSYAH', '2324101147', '2324101147@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$1IVt07D7CeveYKe9ycG8KOyfUkBKgz8nVTr4U1XjcxnHOkn.ENGya', 1, NULL, '2025-09-22 00:37:35', '2025-09-22 00:37:35', 1712),
(979, 'AKMAL APRILLIANA NUGRAHA', '2324101148', '2324101148@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$19lzbcERQEc64sVlNV03DOc4gPH5W3i0tDmT0XYGO8sEKJwQIhCz.', 1, NULL, '2025-09-22 00:37:35', '2025-09-22 00:37:35', 1713),
(980, 'ANNISA FEBRIANI', '2324101149', '2324101149@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$k1ZjMMgxTjViUM43rDluP.PqxV4NsCbNv4HJcuh8QXdEYVW7Ts5mG', 1, NULL, '2025-09-22 00:37:35', '2025-09-22 00:37:35', 1714),
(981, 'BELA SEFIRA', '2324101150', '2324101150@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lKzO44LmhVGB3FdUMWkIee09vSWiB1Jwbq8L8AwHOWuByX7HxuRDG', 1, NULL, '2025-09-22 00:37:35', '2025-09-22 00:37:35', 1715),
(982, 'DEBY JUANITA', '2324101151', '2324101151@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$skM5BLRR3KAnq3cARJ5gHerMjXCX7yAZSN6xxA7u6iWBiMx30CaF.', 1, NULL, '2025-09-22 00:37:35', '2025-09-22 00:37:35', 1716),
(983, 'DELIA ANJANI', '2324101152', '2324101152@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$flafyvg/4.39E2N8e3zDoumi2ZMJh6oXlIZekkEPoaLRbNP5oag5.', 1, NULL, '2025-09-22 00:37:36', '2025-09-22 00:37:36', 1717),
(984, 'DERIS NURIYAN', '2324101153', '2324101153@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$pKZfvDbwy7W7kE0eP/cl0O4r1W9CmIqICFtukaoxcs3PpD1bltiNi', 1, NULL, '2025-09-22 00:37:36', '2025-09-22 00:37:36', 1718),
(985, 'DERIS TRI OKTAPIANA', '2324101154', '2324101154@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$sp1yibT1xjBYzGZ1YPeGVezsEgsmD2HqjbPLaB2e.pY0IX8e6QdQy', 1, NULL, '2025-09-22 00:37:36', '2025-09-22 00:37:36', 1719),
(986, 'DESTA EKKI SAPUTRA', '2324101155', '2324101155@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GnnZmOLgQF0raHNwK3cdh.1rxFcZN.OMD7L34Mp7i43RqqOwZF9ta', 1, NULL, '2025-09-22 00:37:36', '2025-09-22 00:37:36', 1720),
(987, 'Diko Salman Alfarisi', '2324101156', '2324101156@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UHVG/bZWBtWSwob18PPxqe4jIF/tRKtM6Gsn5thOJAoOyjL6r41sS', 1, NULL, '2025-09-22 00:37:36', '2025-09-22 00:37:36', 1721),
(988, 'Eka Cindy Ariyanti', '2324101158', '2324101158@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hu0LfCIfsGmj.dMalJeWPeqKnZ68ZPIRyDs/Q3pf25ggF3N/pHnmC', 1, NULL, '2025-09-22 00:37:37', '2025-09-22 00:37:37', 1722),
(989, 'HANIF MAULANA', '2324101159', '2324101159@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Pvy4UPNa8eCkZJ099F0lLetoEHAX0tH6jSLZyatpXr/WVPwFBmcfi', 1, NULL, '2025-09-22 00:37:37', '2025-09-22 00:37:37', 1723),
(990, 'LUSY MAULUDINA FIRDAUS', '2324101160', '2324101160@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SNgGXesyIFHkEudcdV0ycekxabiXI26OTo2mAm780F4VJEjXqJa9i', 1, NULL, '2025-09-22 00:37:37', '2025-09-22 00:37:37', 1724),
(991, 'M Pariz Ali Alvi Mubarok', '2324101161', '2324101161@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$d0tUSL0XJIw.gbzOqrDtWOHM41OKsG8jA2CqdaHQLLB3piJ3AZYOO', 1, NULL, '2025-09-22 00:37:37', '2025-09-22 00:37:37', 1725),
(992, 'MUHAMAD RIFKI ARDIANSAH', '2324101162', '2324101162@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$jTC.LYnB6Qxdi6Lk3.EGf.jLT7SZILajxmOudMoLkV/H3vsl/znOm', 1, NULL, '2025-09-22 00:37:37', '2025-09-22 00:37:37', 1726),
(993, 'Muhammad Dhika Fadillah', '2324101163', '2324101163@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xuDsX/9SVl8eT45xMwbIj.MazbVGwn32IkIR6OWigDqD2EWLWMb12', 1, NULL, '2025-09-22 00:37:38', '2025-09-22 00:37:38', 1727),
(994, 'NADIA SETIA ANANDA', '2324101164', '2324101164@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2JXOn1qxgV/W2zPLPzT5auHMUF6qdM2Wfpa4/k3B27mUiqPaRkHvu', 1, NULL, '2025-09-22 00:37:38', '2025-09-22 00:37:38', 1728),
(995, 'Nina Apriliani', '2324101165', '2324101165@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2yheTurYpazlgPfQHXuzuuNtmJ0ffj5IqJ9iiktvtdT7kdw9s06zi', 1, NULL, '2025-09-22 00:37:38', '2025-09-22 00:37:38', 1729),
(996, 'NINA HERLINA', '2324101166', '2324101166@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7j8iHh/NYDSgfU68NUaZRedsq1.EG2PhnlZKMh4R08INwQxvIB5k.', 1, NULL, '2025-09-22 00:37:38', '2025-09-22 00:37:38', 1730),
(997, 'NOVA APRILIANI', '2324101167', '2324101167@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JZ7v2kPY1BzyeeDGExXmuuRgDM27Y3/9CEzizoSNxls1t7sdw4tNm', 1, NULL, '2025-09-22 00:37:38', '2025-09-22 00:37:38', 1731),
(998, 'PUTRI LAFTAIN', '2324101168', '2324101168@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AhwDnJqJY.fntemtfUWESuasnmhJsGRuRMH7.yrSYyawKBuHz6tua', 1, NULL, '2025-09-22 00:37:39', '2025-09-22 00:37:39', 1732),
(999, 'Putri Sauvikha Anjari', '2324101169', '2324101169@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nX5wko0qy5XNu21rP5jAE.khK6UvRqzsSbowAqetxqdJbnEt19zNO', 1, NULL, '2025-09-22 00:37:39', '2025-09-22 00:37:39', 1733),
(1000, 'RAIHAN RAFI KUSWANTO', '2324101170', '2324101170@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GzjNjIzOG6DgUFr6pI0p0uy5c0zX0OMFbIx2qtSOQwwPcQR3PADda', 1, NULL, '2025-09-22 00:37:39', '2025-09-22 00:37:39', 1734),
(1001, 'REISA PUTRI RIZKIANI SAEPUDIN', '2324101171', '2324101171@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VPxVuCIZeKSjfi1xUK2joO/2swjR32RvbrGykPzIEZ4VqwVg0hJre', 1, NULL, '2025-09-22 00:37:39', '2025-09-22 00:37:39', 1735),
(1002, 'RESA FITRIYAN', '2324101172', '2324101172@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$uqpXyVMCdnGTGiJOmuhzvO34JA6sBYDZIRnhNlxpesdD2z5BW23Oe', 1, NULL, '2025-09-22 00:37:39', '2025-09-22 00:37:39', 1736),
(1003, 'RESNA ADELIA', '2324101173', '2324101173@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$.DQRDrqXf.0f.HHJSmJhfeYuQdoaFMmqnJTCqu5TwjaSQP6LBa4XO', 1, NULL, '2025-09-22 00:37:40', '2025-09-22 00:37:40', 1737),
(1004, 'SANTI SRI WININGSIH', '2324101174', '2324101174@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$J0Cwwr73YhFL48pi9O/l5uYUNHPTs7c4fglLoEW9bR8fBAt.aEDhK', 1, NULL, '2025-09-22 00:37:40', '2025-09-22 00:37:40', 1738),
(1005, 'Sela Merliyani', '2324101175', '2324101175@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VAD6a/P5fX6bKNQLeNMQ8eHtbg9fSPoz0a8dynroenkSNDZ8gG5ni', 1, NULL, '2025-09-22 00:37:40', '2025-09-22 00:37:40', 1739),
(1006, 'Selvi Dwi Rahmawati', '2324101176', '2324101176@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lczevojwX8Z8P01wC7oQ1uFKk117etMwgCTV3W0PUz20ydxd8aFNq', 1, NULL, '2025-09-22 00:37:40', '2025-09-22 00:37:40', 1740),
(1007, 'SHIFA DWI MARYADI', '2324101177', '2324101177@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ng8kFeQp4JEcYgxeyH5q4O1Io25Mtix3bPMqksQgaCmGVTM/21DLa', 1, NULL, '2025-09-22 00:37:40', '2025-09-22 00:37:40', 1741),
(1008, 'TISA RAMDAN SEPTIA', '2324101178', '2324101178@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nu7sr/nmOoEydmyFkWHtF.XUPQu4hSNmisJwpHmArJ0f5eEsDotfm', 1, NULL, '2025-09-22 00:37:41', '2025-09-22 00:37:41', 1742),
(1009, 'WINDI AISHA JAUHARAH', '2324101179', '2324101179@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$pIvkvB.0PtVy3Fx.3pwmjeOtyjb0DcBd8jVQrJRJ57PUXNzEbEWpi', 1, NULL, '2025-09-22 00:37:41', '2025-09-22 00:37:41', 1743),
(1010, 'ZAHRA FATHONIA', '2324101180', '2324101180@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3fCf8e7lc4QNy.WbQQUKHu.NWgnWTiYwpft/CpcJs8GJ0zfg03O4a', 1, NULL, '2025-09-22 00:37:41', '2025-09-22 00:37:41', 1744),
(1011, 'Abdul Musholim Arraniry', '2324101361', '2324101361@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8vnMB8tvq1RQDw3DawdGPuoo6vMdwnQKJQQ9ruGaHIRPQzRVRYWba', 1, NULL, '2025-09-22 00:37:41', '2025-09-22 00:37:41', 1745),
(1012, 'Ade Ridwan Maulana', '2324101362', '2324101362@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$tBYShne/ece4lIF.eRIvfu2tdiwZPmG4Sj5Oi4Sm7X1VVcMcRnsXO', 1, NULL, '2025-09-22 00:37:41', '2025-09-22 00:37:41', 1746),
(1013, 'Agni Aina Lukman', '2324101363', '2324101363@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qwPJ.0xE2dEZK.FoX80iJuab7HefYSexFOL47POFVq1g1x0LiKzni', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1747),
(1014, 'ALIYA RAMADHANI', '2324101364', '2324101364@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WnvyyK68s0UJwtvpOY9x5eZhlWfRceKTF.OpyadKkKCxmKKP7NTo2', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1748),
(1015, 'Andri Wiguna', '2324101365', '2324101365@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$6iVfCBzslA8s.EQ1hoKLNO7L9qAyZ2GHmZBWRv3lCDDMp1UcuyZGW', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1749),
(1016, 'ANNISA NUUR QOLBI', '2425101541', '2425101541@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$I2zlTeJaA6h16wkUQPKVn.ESxWUYyvDoylZnvAp4eZCwjQ.4nrkuW', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1750),
(1017, 'Ayu Febriani', '2324101367', '2324101367@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$eBAnDpfpHj.z905kPZUxCed1xL1.mKv23a0hTTdepD2w6sDAbZ33W', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1751),
(1018, 'CIPTO ADE RAMDANI', '2324101368', '2324101368@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qeOMbMZMxkiF0hpvulzKA.Ip2wHPMjU9i0Fy7.Lz38dtWYWQqdL2S', 1, NULL, '2025-09-22 00:37:42', '2025-09-22 00:37:42', 1752),
(1019, 'Dava Fauzan Aziz', '2324101369', '2324101369@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$m7vPjuD.C/dpcFGFeTXN..g8HlcZYyJ.giLvPfceGcX8e2COgLwOu', 1, NULL, '2025-09-22 00:37:43', '2025-09-22 00:37:43', 1753),
(1020, 'Defa Fachrizal Ramadhan', '2324101370', '2324101370@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dcINnjwgD2AhSpy8Dz7TKeIHZOBnpRjuXcvPieYl2EAsZCvAOkN7O', 1, NULL, '2025-09-22 00:37:43', '2025-09-22 00:37:43', 1754),
(1021, 'DINDA SILVI NURAPRIANI', '2324101371', '2324101371@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$RZNx1.4O0Vb1y0KTUpD8nuX0HvLfEneuk/7.6KbBRXrf7TwygUGnS', 1, NULL, '2025-09-22 00:37:43', '2025-09-22 00:37:43', 1755),
(1022, 'ERINA SRI ANJANI', '2324101372', '2324101372@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kigMQzvp1ecKGPjzrWlme.43g7IjSWrIpyqEY3KupTRcufcibyuIu', 1, NULL, '2025-09-22 00:37:43', '2025-09-22 00:37:43', 1756),
(1023, 'Fadhil Ahmad Farizi', '2324101373', '2324101373@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$McSAB0IjQXuBLQb3yjYKPed/xLZQCD5mrRDy4h9Ze9qjKqYMoLKr2', 1, NULL, '2025-09-22 00:37:43', '2025-09-22 00:37:43', 1757),
(1024, 'FALIH MUHAMMAD NAZMI', '2324101374', '2324101374@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Ak725Z6xeYZCuFo16Tgb/.j8z.74TT8KAcMNl4C5dSE8BSMVWQig2', 1, NULL, '2025-09-22 00:37:44', '2025-09-22 00:37:44', 1758),
(1025, 'FARIZ PAHRUDIN', '2324101375', '2324101375@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$k7jRQUbrIKQN.6vUAuI09O2ySFuCjAsD8htWpP9Viunn28e1v10fa', 1, NULL, '2025-09-22 00:37:44', '2025-09-22 00:37:44', 1759),
(1026, 'FERGI ADITYA', '2324101376', '2324101376@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MiOekb/Jeq.V7c5MXoyZyethjpH9NFcSTJ9Fqe16A/PEp3J26eSUy', 1, NULL, '2025-09-22 00:37:44', '2025-09-22 00:37:44', 1760),
(1027, 'GILANG ADRIAN PRATAMA', '2324101377', '2324101377@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yNl/CJVKGlps/JkmhWHoAuOnGRF9ovQgepJry3nwbtzgs03EQbn/2', 1, NULL, '2025-09-22 00:37:44', '2025-09-22 00:37:44', 1761),
(1028, 'IRFAN HASNIAR AZIS', '2324101379', '2324101379@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LV4RK5udStHbsdb5FA3I3eD.Z1IZ9tCOQYcIv2Z0moP.hVUMuR0Wy', 1, NULL, '2025-09-22 00:37:44', '2025-09-22 00:37:44', 1762),
(1029, 'IRGI ZAOZA SALSABILA', '2324101380', '2324101380@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wgJD64TfB31.SjE8uE.FAunqsOjIKF6/lKYhrObGEckpuJpUthAVq', 1, NULL, '2025-09-22 00:37:45', '2025-09-22 00:37:45', 1763),
(1030, 'Kurnia Bela Agustina', '2324101381', '2324101381@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WMzncTX1SvzsZjRv/UYJwurQBloWW249jmSgS8KS.5NKuxQw9ZoMe', 1, NULL, '2025-09-22 00:37:45', '2025-09-22 00:37:45', 1764),
(1031, 'Leni Nuraeni', '2324101382', '2324101382@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$oBiN4mI1FJ3AM.Pf7dgFGOglADPnBUegLYhNcOJ/HUrSApPQFIraW', 1, NULL, '2025-09-22 00:37:45', '2025-09-22 00:37:45', 1765),
(1032, 'Lutpika Puspitasari', '2324101383', '2324101383@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7q0um4IHiPisWv//MCkBZ.T2.zOWWEgThjL1TkHg05wojkSw0Gnkm', 1, NULL, '2025-09-22 00:37:45', '2025-09-22 00:37:45', 1766),
(1033, 'MUHAMMAD AGUSTIAN PUTRA', '2324101384', '2324101384@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$G0wsv5R7KPH7Jti522Ha0ewrqguXJo95QQEcDryqrfXvysnzY.iqC', 1, NULL, '2025-09-22 00:37:45', '2025-09-22 00:37:45', 1767),
(1034, 'NAUFAL ALIFIANTO', '2324101386', '2324101386@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rMyJcolyoKo9i5ZfXFNCruNkz/ckjwzIy8YD.NnFRsFH/0GVsnsHi', 1, NULL, '2025-09-22 00:37:46', '2025-09-22 00:37:46', 1768),
(1035, 'NAUFAL MUYASSAR YUMAS PUTRA', '2324101387', '2324101387@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$41YA7KvriNS0Jf55m5V.5uqbJLXphJuCD3zOXYMXRrWxyHkbcQdbq', 1, NULL, '2025-09-22 00:37:46', '2025-09-22 00:37:46', 1769),
(1036, 'NISA MARSAL', '2324101388', '2324101388@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BsF495HpbzLKzkUadxmlderuAfAQKpTExsiy8VRrP7fWdnIuPzJv2', 1, NULL, '2025-09-22 00:37:46', '2025-09-22 00:37:46', 1770),
(1037, 'Raifal Fadliansyah Fauji', '2324101389', '2324101389@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Mj6fZjKYURQaL2pxE6N.nuc.K2pAb7wcdznAO5WwgI9lLaCHgSB/C', 1, NULL, '2025-09-22 00:37:46', '2025-09-22 00:37:46', 1771),
(1038, 'RAYHAN DARUNNAZWA', '2324101390', '2324101390@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$isKHHyPpeCk9Deq7tx702eAnh7iGMdlOXxjuItxL.5Kc50I4ml0yu', 1, NULL, '2025-09-22 00:37:46', '2025-09-22 00:37:46', 1772),
(1039, 'RENI ANGGRAENI', '2324101391', '2324101391@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LnYJExe2FS0oiEBMrXbBHOhX4f4IbbEelx7HnhpR8fEDoj0kmruEe', 1, NULL, '2025-09-22 00:37:47', '2025-09-22 00:37:47', 1773),
(1040, 'RIDHO TRIWILDAN', '2324101392', '2324101392@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cS2INQR2ymOUGGAIl0w.TuBOh5m/WjyrsH2I4hNWailqe020tmrZK', 1, NULL, '2025-09-22 00:37:47', '2025-09-22 00:37:47', 1774),
(1041, 'Ririn Rindiani Puspitaningrum', '2324101393', '2324101393@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5pdO6wzVb5FM9b7mcDGeXOf1TumeP6CcT1SEPanndzTdWmQpUwWxO', 1, NULL, '2025-09-22 00:37:47', '2025-09-22 00:37:47', 1775),
(1042, 'Salsabila Aurelia Putri', '2324101394', '2324101394@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$964JkkLeLZo.jAU4rPKOE.cPWA9YL91nc1Xhu7bLoPOdwm4L/gtMq', 1, NULL, '2025-09-22 00:37:47', '2025-09-22 00:37:47', 1776),
(1043, 'Sopianti Novita Usna', '2324101395', '2324101395@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$bVG0Ckr0CQ30pR6.rfww9OlbaBMoIHMfuXLP8AVkzE9MsTlfaBB2W', 1, NULL, '2025-09-22 00:37:47', '2025-09-22 00:37:47', 1777),
(1044, 'Tasya Nurin Shadrina', '2324101396', '2324101396@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VO7vqzviXaLzU9q.Lx2mGO7z9IK4RYBMjJOlUSrZgItCJgxJJju.S', 1, NULL, '2025-09-22 00:37:48', '2025-09-22 00:37:48', 1778),
(1045, 'Ade saepuloh', '2324101397', '2324101397@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$aflY.WQ097uwsRlIr/sgw.6CCDYm2dzuuSKG/Q3Abe3pjTnrTVGPm', 1, NULL, '2025-09-22 00:37:48', '2025-09-22 00:37:48', 1779),
(1046, 'ADITYA FIRMANSYAH', '2324101398', '2324101398@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AnWNG9j.Z5svcK6leVtlI.7zqHcfaxxMYM8ECEYFrFmCuUI4dT90y', 1, NULL, '2025-09-22 00:37:48', '2025-09-22 00:37:48', 1780),
(1047, 'AGYL AZANI AKBAR', '2324101399', '2324101399@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a3vuegZNTMekFbAoN2WPX.4UxiYCZwYm1EozRAZ0ldcW4Uqjj/1G6', 1, NULL, '2025-09-22 00:37:48', '2025-09-22 00:37:48', 1781),
(1048, 'ALIFA SAEFURROHMAN', '2324101400', '2324101400@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vDS3lhhNBoBeuhEz5LSIu.BoSkUamDoMcSn1J5wXuCa.dasUqBhki', 1, NULL, '2025-09-22 00:37:48', '2025-09-22 00:37:48', 1782),
(1049, 'ALIYA EKA GUSTIANI', '2324101401', '2324101401@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$z4KWJTzuvLBjs0qCwu8Xb.G2gpEkv4awp2XznP04yBPYPVPoNHV5O', 1, NULL, '2025-09-22 00:37:49', '2025-09-22 00:37:49', 1783),
(1050, 'ALMA DWI ALRIZKI', '2324101402', '2324101402@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$.nwbtoYtcUOCcegxgYtgWu2ACc07QPq8oh7V4i3riMV/pEs1MzIpO', 1, NULL, '2025-09-22 00:37:49', '2025-09-22 00:37:49', 1784),
(1051, 'Ariq Fathurrahman', '2324101403', '2324101403@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$iPPK1PGLvD5Z3gfci8urs.7X1MouEPaGz/Yy341Fe06rMu2Mjc8Gi', 1, NULL, '2025-09-22 00:37:49', '2025-09-22 00:37:49', 1785),
(1052, 'DAVA TISNA APRIZA', '2324101405', '2324101405@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$unwmfFFwQXqATASQOqsyP.9/3Dhw2S38O5P7JnoG1nOy8/ODM17Tu', 1, NULL, '2025-09-22 00:37:49', '2025-09-22 00:37:49', 1786),
(1053, 'DAVIN ADHA PUTRA', '2324101406', '2324101406@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BJfgcZp7qyIFNCDfHxK1ue4dx9/jqdvnU85xoy6kP4xeEAxExeuL.', 1, NULL, '2025-09-22 00:37:49', '2025-09-22 00:37:49', 1787),
(1054, 'DZAKY FAUZAN', '2324101407', '2324101407@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$NSGByQ.TQ72KrjFLk2JiZO0Dug20aax6uxp.qMNsGM/7gBO8s2vSK', 1, NULL, '2025-09-22 00:37:50', '2025-09-22 00:37:50', 1788),
(1055, 'ELIS MAESAROH', '2324101408', '2324101408@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$EkGctdo2gedm.Fy164BF3u1Zy2/PA0cklp/KsuiQwQt0vq59RU2Aq', 1, NULL, '2025-09-22 00:37:50', '2025-09-22 00:37:50', 1789),
(1056, 'ERWIN ALDRIANSYAH', '2324101409', '2324101409@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9o46bewgjAIVW.MdAER61uLs5Uq.R.ZHrPFcGH3cxYSDYdjaro4Wm', 1, NULL, '2025-09-22 00:37:50', '2025-09-22 00:37:50', 1790),
(1057, 'Fabian Rizky Adriansyah', '2324101410', '2324101410@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xAql/9ULQBaAEq/fm6SpcOspxOel4lOg3cOhcxOkTq1T2KY.zptH.', 1, NULL, '2025-09-22 00:37:50', '2025-09-22 00:37:50', 1791),
(1058, 'FAHRANSYAH ABI SOPFIAN', '2324101411', '2324101411@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$tsqcFS4WNpBwZTyYJl/nv.GsUWJxEHFEqwe5I0AlZI4feicPBkj.6', 1, NULL, '2025-09-22 00:37:50', '2025-09-22 00:37:50', 1792),
(1059, 'FAREED AHMAD', '2324101412', '2324101412@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0TKnZpGXq4g4VsA/./LIwupSVl7lw/FlPXtvBi/ypAJEBcNjElXPa', 1, NULL, '2025-09-22 00:37:51', '2025-09-22 00:37:51', 1793),
(1060, 'FAZRI MAULANA SAPUTRA', '2324101413', '2324101413@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$L6FkATopvCu/TZqe9ORhqeODy9M0AGeIBE7gS8hW8Z8vw1bBbe9uK', 1, NULL, '2025-09-22 00:37:51', '2025-09-22 00:37:51', 1794),
(1061, 'IIS NURHAYATI', '2324101414', '2324101414@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vIRizNywqPZoMUuS4bLVlOb4/huRH6lIycxXw96xSOCeJHhudjuFC', 1, NULL, '2025-09-22 00:37:51', '2025-09-22 00:37:51', 1795),
(1062, 'Khansa Kamila', '2324101415', '2324101415@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2GZhw.3Mr.JN41UNRIXubewj4XJB3YjQAREDxx1Wo19Q0jDdb2rny', 1, NULL, '2025-09-22 00:37:51', '2025-09-22 00:37:51', 1796),
(1063, 'Kiki Al Rizal Maulana', '2324101416', '2324101416@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$jVnuVRY9u6G4UEkgNY3ijuXGxFmPr.6VIjjPvh8e0DDn/TiFJjahi', 1, NULL, '2025-09-22 00:37:51', '2025-09-22 00:37:51', 1797),
(1064, 'MUHAMAD RAFLI ALFARIZI', '2324101417', '2324101417@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a7tyChL3U3OmSiGhP8YyIuHYyXtQgq3I/l6pTb38OfhaMj.wyKQJq', 1, NULL, '2025-09-22 00:37:52', '2025-09-22 00:37:52', 1798);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(1065, 'NADIA ASPIYA SHAHIDAH', '2324101418', '2324101418@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xKBh.kFlbFDrmk0fhOlhV.l7PBin6AeVJ1./JSDRvy5GytlG86RtS', 1, NULL, '2025-09-22 00:37:52', '2025-09-22 00:37:52', 1799),
(1066, 'NAZWA APRIANITA', '2324101419', '2324101419@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cQI8EAKZYm37dak9/Rws1uPOjZKVpy6EfaQOX7joMmjB8xQ9ELnem', 1, NULL, '2025-09-22 00:37:52', '2025-09-22 00:37:52', 1800),
(1067, 'NOVITA MANISORAYA', '2324101420', '2324101420@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$.RJD7cNmeu1ikY06CFhEJesOUyboFDlYV50ow5jiKpr.yQJiQiYk2', 1, NULL, '2025-09-22 00:37:52', '2025-09-22 00:37:52', 1801),
(1068, 'PADIL PRATAMA', '2324101421', '2324101421@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$KJKzLeKS0lA7wEA6UcgEz.08bYT8b9IXZh/HiT3OVPUSHyyFIrs2q', 1, NULL, '2025-09-22 00:37:52', '2025-09-22 00:37:52', 1802),
(1069, 'RAIHAN AMARULLOH', '2324101422', '2324101422@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$pPbttcdQCgD4Dre2ebz53uKI3oUFh6T5f0lCPK9nnuGmL1KSIYNZu', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1803),
(1070, 'Resa Akmal Gifari', '2324101423', '2324101423@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$w3874rdUBjmgCdgrzlpTn.HoiXzGlLl53e8xBoiiziWO.sgdi3w0W', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1804),
(1071, 'Resti Lestari', '2324101424', '2324101424@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2zdPcug4Bmk1Kj9Lp5VRoect9HbB41j/D9DWlC/MB/m22VAY.Ir26', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1805),
(1072, 'SATRIA PUTRA NUGRAHA', '2324101425', '2324101425@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BFCBlOJHCMT1BzK6z.zvjesqvisbOgOEWtpIbh55zD5vsXIvwRbPC', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1806),
(1073, 'Satya Rengga Pamungkas', '2324101426', '2324101426@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0nKvyAhymKKzUDmvwu1lZ.8Mk01pXqpPaPT6j.lce/sdM1J2vfKtu', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1807),
(1074, 'Silvi Amellina', '2324101427', '2324101427@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$e3J0IWcOjqeq3TJWr.i49.BBy7qguK9vq8ANhwV/DaSB28baTh5Yi', 1, NULL, '2025-09-22 00:37:53', '2025-09-22 00:37:53', 1808),
(1075, 'Silvia Azahra', '2324101428', '2324101428@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2s5yPcKu0nu6/JxB1C21IOmx1Koixwh2MIYMwHtZZPBBnH82d6ayy', 1, NULL, '2025-09-22 00:37:54', '2025-09-22 00:37:54', 1809),
(1076, 'SUCI NOVIANI', '2324101429', '2324101429@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ALb7GASJN1fvsTdMBBDBL.n1lc6sEQBi6M/aL2.grPMro6n3wkwIa', 1, NULL, '2025-09-22 00:37:54', '2025-09-22 00:37:54', 1810),
(1077, 'SYIFA FATURROHMAH AZ-ZAHRA', '2324101430', '2324101430@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$X9xbnKet8EybrDzUtepz9.f7FEE.IuTy2M5nI0TDdLGWWDNycziie', 1, NULL, '2025-09-22 00:37:54', '2025-09-22 00:37:54', 1811),
(1078, 'Syiva Yasa Sakilla', '2324101431', '2324101431@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/M8lFdi3JAuZ44INP5Gb8eC5wKAszowvu6UUg617gWXyD/wXXUlhu', 1, NULL, '2025-09-22 00:37:54', '2025-09-22 00:37:54', 1812),
(1079, 'YUNIAR ARDIANSYAH MAULANA', '2324101432', '2324101432@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$RPCyMJDBFwKB0t8A1CPmj.GjFNfYp7DYv0ZVyhCG7jDexj0bF2GqC', 1, NULL, '2025-09-22 00:37:54', '2025-09-22 00:37:54', 1813),
(1080, 'ADVENDA SULISTYOWATI', '2324101469', '2324101469@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$R4N.ahVZrJsitg5Ade80venxA4OumUYqrki4pUwZ/Cvs/9gwFwNxq', 1, NULL, '2025-09-22 00:37:55', '2025-09-22 00:37:55', 1814),
(1081, 'ALI APANDI', '2324101470', '2324101470@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$y.X/t5xyjqje1BlM2GXqnefpc3ZkAOp0JuiFrcLTNsNo5UaMnwszq', 1, NULL, '2025-09-22 00:37:55', '2025-09-22 00:37:55', 1815),
(1082, 'AMAL ASMARANI', '2324101471', '2324101471@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$QxPP2OLDutxrq1Hpy6mbaextlIYPml7dFvQNcAdk32qELpNdamHXW', 1, NULL, '2025-09-22 00:37:55', '2025-09-22 00:37:55', 1816),
(1083, 'Andika Pebrian Pratama', '2324101472', '2324101472@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UqB1OKfcjesipeG30/In8e6TKbxQnQIvXT0Agmi4ZDo6E9lCNn1KO', 1, NULL, '2025-09-22 00:37:55', '2025-09-22 00:37:55', 1817),
(1084, 'ANISA APRILIA', '2324101473', '2324101473@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qA9kExFeeJYh/kMV//agzuS5Y4Y1/C8y0F4qpNP89sfAH9jBr5Vpe', 1, NULL, '2025-09-22 00:37:55', '2025-09-22 00:37:55', 1818),
(1085, 'ARIF NUROHMAN', '2324101474', '2324101474@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MWJTDpcJ2oM0TLqT53iafuY55biHYi3LpFt2Z6cYyEtPU1z2r8UB6', 1, NULL, '2025-09-22 00:37:56', '2025-09-22 00:37:56', 1819),
(1086, 'AULIA NURFADILA', '2324101475', '2324101475@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Gp34gMNefL0aqQq1llf.vOtmVLkIR1e.bXEvz7BleVx0wKWaOi.sW', 1, NULL, '2025-09-22 00:37:56', '2025-09-22 00:37:56', 1820),
(1087, 'BILLY SULTAN DZULIANSYAH', '2324101476', '2324101476@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$n18wUL.DkZ732QShdHxHyu/FfOVVqorJB6WdFZrXctpNpJiTUQ1h6', 1, NULL, '2025-09-22 00:37:56', '2025-09-22 00:37:56', 1821),
(1088, 'CHANTIKA SALSANABILA', '2324101477', '2324101477@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VsmOEvC0VFoHv0KZsRdAo.i.eZGT/YJBAFHs6kRufKqzxsSq0.Gp2', 1, NULL, '2025-09-22 00:37:56', '2025-09-22 00:37:56', 1822),
(1089, 'Egis Septiani', '2324101478', '2324101478@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$eyGchj6YMOrsmv1Iru.pP.MCLo2hVjxAbLJkUr1gqeamyMfU61yXq', 1, NULL, '2025-09-22 00:37:56', '2025-09-22 00:37:56', 1823),
(1090, 'ERRIL EVRILITA KURNIAWAN', '2324101479', '2324101479@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$bVQYOVN8Igo8hQ.IElBM/enh23m7tAbdGYCtixuLArWa.nhJKMzGu', 1, NULL, '2025-09-22 00:37:57', '2025-09-22 00:37:57', 1824),
(1091, 'FANI FEBRIANI', '2324101480', '2324101480@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5GmdSBpCh/NXVNMiNrLLIuGpomD4zCGWfuNaTv.W9y4DE5cy2uwpS', 1, NULL, '2025-09-22 00:37:57', '2025-09-22 00:37:57', 1825),
(1092, 'Fauziah Khirani', '2324101481', '2324101481@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fCQVQfMiUF/Iwy047l1Y/.zxh99wRl2nRHH1rly8S31yPqy/xzkGK', 1, NULL, '2025-09-22 00:37:57', '2025-09-22 00:37:57', 1826),
(1093, 'FERA MAULANI', '2324101482', '2324101482@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$HVYrFEhS9Ab3CabeTAh3iOKciMZmfL30vKUEDr5flYMSX7ef/jvHa', 1, NULL, '2025-09-22 00:37:57', '2025-09-22 00:37:57', 1827),
(1094, 'GISA RAJ SUMANTRI', '2324101483', '2324101483@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$EbQXhZLb.6zSxEIzMwWzguSidZhdN43AZfpUhKnrbA96xNfAqQeQO', 1, NULL, '2025-09-22 00:37:57', '2025-09-22 00:37:57', 1828),
(1095, 'KANYASIH AYUNA IMANDRIA', '2324101484', '2324101484@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Cm2Sm3eLhCMBDm5eNkLYZOBll1pQt6dPp.CkmfG2VVE6fSybCLtNC', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1829),
(1096, 'Lutfiah Zulfa Nabila', '2324101485', '2324101485@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/hBigJ9YU.edkS6I8W4s7.1X/jTDl4hvrki1Kl1oZxUCKtXe9nbF.', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1830),
(1097, 'MEIDA WULANDARI', '2324101486', '2324101486@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$QA6TGFUF5/wwxUIyeUv5LOMkugO3pWM.7qgkWrWQeY2bX4DUJcWsC', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1831),
(1098, 'MELANI PUTRI', '2324101487', '2324101487@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$U.uVSI62pIWyjYVmHeGT4uXZnXRDBKUIeoMCXM8AtMp7uh6TOE5zK', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1832),
(1099, 'MIAR RACHMAWATI', '2324101488', '2324101488@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$A9j5HHVaCa/fQ3F7Q3jYLejUuLYRXDAzH1aDZYfKWsAraIBU7xph6', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1833),
(1100, 'Najwa Aina Fadiyah', '2324101489', '2324101489@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$An/2t6lB3EzFwT7YmzbYBex5W0GmRjl5DNRERX0aV7xZgjRtmvDve', 1, NULL, '2025-09-22 00:37:58', '2025-09-22 00:37:58', 1834),
(1101, 'NIKEN ANJANI', '2324101490', '2324101490@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9HiooZfZRTqPBaQ9am4KrOAJ2JYz/BM71S9wgYyMOw7H/gawtEjLW', 1, NULL, '2025-09-22 00:37:59', '2025-09-22 00:37:59', 1835),
(1102, 'Putri Keila Susanto', '2324101491', '2324101491@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Hpk6dDtjbAZ9ixL6v7i68.qdryIHvaEehRp7ZZdwIFqoE5pHyqQl.', 1, NULL, '2025-09-22 00:37:59', '2025-09-22 00:37:59', 1836),
(1103, 'PUTRI KUSUMANINGRUM', '2324101492', '2324101492@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vbSfM.NXhRGCuAnwuEfGguVZQlU6/j546bv7Ot7roqXQfz9pLtk42', 1, NULL, '2025-09-22 00:37:59', '2025-09-22 00:37:59', 1837),
(1104, 'RAHMA GANIA SYA\'BANIAH', '2324101493', '2324101493@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$E8EuGBcwPlr63RqgNe3hEeKJyoK6qUrVi6zER9Jt.v43oLKyW1sg.', 1, NULL, '2025-09-22 00:37:59', '2025-09-22 00:37:59', 1838),
(1105, 'Rahma Sulistiani', '2324101494', '2324101494@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0Gz74dL2UtgZZy4s.XCxAeBeqkPvpRZHoBGi94mM0oR38K5lWtaw.', 1, NULL, '2025-09-22 00:37:59', '2025-09-22 00:37:59', 1839),
(1106, 'RAISSYA YULIANI', '2324101495', '2324101495@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XfPBkw5XeZ6rlyIbbEb7DOP1b/vDnvaAZoR2j5QO0EMCKZlpRa5IG', 1, NULL, '2025-09-22 00:38:00', '2025-09-22 00:38:00', 1840),
(1107, 'Restu Sri Rahayu', '2324101496', '2324101496@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9eeFepfUC/.jZ5AszZ68meAGse/vIryNbQzLyEY7K45ITdFqaLJbu', 1, NULL, '2025-09-22 00:38:00', '2025-09-22 00:38:00', 1841),
(1108, 'SALMA NUR PATIMAH', '2324101497', '2324101497@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$398t2ieKRBbwo8fZDLdTv.urqCc2peFS22PM7nLglxvzwRcXGsyTO', 1, NULL, '2025-09-22 00:38:00', '2025-09-22 00:38:00', 1842),
(1109, 'SELMA FITRIA OKTAVIANI', '2324101498', '2324101498@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AmTcY4u.RlcsQ/4KO/wFt.xr7a4YRJ7WNIC50JRIVyeq.9bDsh2mK', 1, NULL, '2025-09-22 00:38:00', '2025-09-22 00:38:00', 1843),
(1110, 'Sifa Felisa Putri', '2324101499', '2324101499@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kmucX8ZMAhPgZz0XG1zac.aPURDSLJLIo/57zgTElpnd6CsdcQmV6', 1, NULL, '2025-09-22 00:38:00', '2025-09-22 00:38:00', 1844),
(1111, 'Silva Ari Ainur Vila Sevila', '2324101500', '2324101500@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Q5XqyRTSVQd9AM/e/hmwM..0VFjdT11J/KVeACMLdxiN3GilQ1Xsi', 1, NULL, '2025-09-22 00:38:01', '2025-09-22 00:38:01', 1845),
(1112, 'Suci Octavia Azahra', '2324101501', '2324101501@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yeO42xanK6VlwmLPUcHAguP5TWWce0bYCkgcwSSxXs3kUz1okYOSm', 1, NULL, '2025-09-22 00:38:01', '2025-09-22 00:38:01', 1846),
(1113, 'THALITA APRILIA', '2324101502', '2324101502@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GgDAYYsxkwEP4V4ZRBukKOTZY9NNLo.3cIVVRaS4ewv4zaR07QWDS', 1, NULL, '2025-09-22 00:38:01', '2025-09-22 00:38:01', 1847),
(1114, 'Widi Nur Fajrina', '2324101504', '2324101504@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8RUKCNz2jNXE6eaDSto8Wuto240OhnmkQYBe6s30x7/EIvDpbrpaO', 1, NULL, '2025-09-22 00:38:01', '2025-09-22 00:38:01', 1848),
(1115, 'ALIFA MAULIDA', '2324101505', '2324101505@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$DYSsdPPwuENI/XCCtiIBounRhZw4.7hAI619.7v7/NtvdSL7l7pI6', 1, NULL, '2025-09-22 00:38:01', '2025-09-22 00:38:01', 1849),
(1116, 'ALYA MELINDA', '2324101506', '2324101506@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$YDBRsldg.RnzgPLHF5OMKOMIuk5kafTDFMFgV9EJ5MPc7HXsQ1wDu', 1, NULL, '2025-09-22 00:38:02', '2025-09-22 00:38:02', 1850),
(1117, 'ANISA ELIANDINI', '2324101507', '2324101507@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cm7awB34rgga0fmPGtuDYO7AxOpKWwXiWFnnDVPq2WBS9z3463x2a', 1, NULL, '2025-09-22 00:38:02', '2025-09-22 00:38:02', 1851),
(1118, 'Annisa Razahra Nurfadilah', '2324101508', '2324101508@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$QYiU9J/31qSnAAOuTE4fCOgLn827mG9YrbXZhYMNuiKOGAbmp5PMa', 1, NULL, '2025-09-22 00:38:02', '2025-09-22 00:38:02', 1852),
(1119, 'AURORA JULIYANTI', '2324101509', '2324101509@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$YVe00PJkDxbbGfO29B.nz.ys9A9AfcULHQ03IwY4xyrikYEF5o6h.', 1, NULL, '2025-09-22 00:38:02', '2025-09-22 00:38:02', 1853),
(1120, 'DESI JULIANTI', '2324101510', '2324101510@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SJYH9vPj3.R/o17TFPwef.kkv7RxsEhWNZqBzGrkt9FCBj2k1gd66', 1, NULL, '2025-09-22 00:38:02', '2025-09-22 00:38:02', 1854),
(1121, 'Diva Abilla', '2324101511', '2324101511@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$RLQ1iERXynG6MBZn0uQLcer3aVyMNR88ecReksVIFn2osUm7n4gmm', 1, NULL, '2025-09-22 00:38:03', '2025-09-22 00:38:03', 1855),
(1122, 'DIVA NURUL ASSYIFA', '2324101512', '2324101512@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$uUKfXtie1jOnJibhImxAvujYpTiu2l7x2qS8MkuiaWBQxFoALe9a.', 1, NULL, '2025-09-22 00:38:03', '2025-09-22 00:38:03', 1856),
(1123, 'FITRI MULYANI', '2324101513', '2324101513@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$F2HLKwSkycGKbSvQXOYS0ehzNsX/NtrgzEG7G8aIcS8rqsSNexfb6', 1, NULL, '2025-09-22 00:38:03', '2025-09-22 00:38:03', 1857),
(1124, 'KERIN RINDIANI', '2324101514', '2324101514@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dbG5NtcDRKTxgpQU66ECq.M.3qSEFqcP5u3DGF6BSWx.9BtNodCY2', 1, NULL, '2025-09-22 00:38:03', '2025-09-22 00:38:03', 1858),
(1125, 'KEYSYA FEBRY AULYA', '2324101515', '2324101515@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2JvRICucicTL.bfHR1OAzORmJRt7BbfowQTHFXD4eLZhlfI9bH4Uu', 1, NULL, '2025-09-22 00:38:03', '2025-09-22 00:38:03', 1859),
(1126, 'MAHDA ZELILAH', '2324101516', '2324101516@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wYLEfaIvbRFFqP441fYioOh9KGvZVe6QMOUzHHnL7fFTGpntsV2/G', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1860),
(1127, 'Martha Eryana Putri', '2324101517', '2324101517@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vAI6T9u4OQ6JhoVov2vO...5wCOvQh0h3wI47KEJDt9TXB.YIq4ee', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1861),
(1128, 'MELISA KURNIASIH', '2324101518', '2324101518@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9TB78CSfPlFpQjVsXq.mHepL2Q.uFXlPyheKfwIZ4DnKWu95HoMqq', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1862),
(1129, 'NADIA RAHMAWATI', '2324101519', '2324101519@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$gAXSHqZ.6EYtQPeDKOi3X.ylhCYaWxyUkwA531quLmpb/V5soctYW', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1863),
(1130, 'Natisha Salsabilah', '2324101520', '2324101520@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hvv7vfsfzITpPsu4C38k6ebMIcUmMKjernk3bMJnnYxRpUqUXLBFK', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1864),
(1131, 'NAYLA NAZWA CHAIRUNNISA', '2324101521', '2324101521@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5HtBvsQW4wf9K9b1jNq51.K27EiPxxLb7BP80FO0bpnbrQGP5rEDu', 1, NULL, '2025-09-22 00:38:04', '2025-09-22 00:38:04', 1865),
(1132, 'NEZA AFRITA', '2324101522', '2324101522@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$q6LvQ6hRlYMmO218X8TmLezv4pgohVsIiqzERTSbp6zWQzX/MBHXC', 1, NULL, '2025-09-22 00:38:05', '2025-09-22 00:38:05', 1866),
(1133, 'PRILA MAULIDHA', '2324101523', '2324101523@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$DVDh/7QnaViD.Y3SMcpijeNmu.XnNb.SKnqVBjGX3Lum8GFW/QA1u', 1, NULL, '2025-09-22 00:38:05', '2025-09-22 00:38:05', 1867),
(1134, 'PUPUT PUTRIANI', '2324101524', '2324101524@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LISbFB6CtnC8/oOz/E4ui.iHqOAFb2UaBf1LwKdHIZwhgyoGzScbi', 1, NULL, '2025-09-22 00:38:05', '2025-09-22 00:38:05', 1868),
(1135, 'RACEL LIANTY', '2324101525', '2324101525@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rSl2LmtLGY4SttXZY9yWx.T0muEGCNpjPXCt.1Vse6iE52OLfoaCi', 1, NULL, '2025-09-22 00:38:05', '2025-09-22 00:38:05', 1869),
(1136, 'RAHMA NUR KAMILA', '2324101526', '2324101526@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$32XlI5yHQ8o/4MpPR3z.b.TArIWZ3pTBE/hhM/XFP.6OXS.xhT0U.', 1, NULL, '2025-09-22 00:38:05', '2025-09-22 00:38:05', 1870),
(1137, 'Rina', '2324101527', '2324101527@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VkLTGh62tBsUVpIVVy4fMepiaG6pS2h0PtsA.uuu66m86MDow25gi', 1, NULL, '2025-09-22 00:38:06', '2025-09-22 00:38:06', 1871),
(1138, 'SALSA DWI APRILIA', '2324101528', '2324101528@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PdT4DqoGHRmA9KLI/chLgOBSJFHOay3fjmKzVOBxyu0JZKfDA9s7u', 1, NULL, '2025-09-22 00:38:06', '2025-09-22 00:38:06', 1872),
(1139, 'Seny Selviyani', '2324101529', '2324101529@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$KMQWQ/cvJbICoU/j.GhQ1.1kuvUZU85c7/6U9mAqSipGGMUV0EmOm', 1, NULL, '2025-09-22 00:38:06', '2025-09-22 00:38:06', 1873),
(1140, 'SHINTA NABILLA RAHMA', '2324101530', '2324101530@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$e/KoD2Q.HHgwiCNuAZH8ueE465bVtjjMJ6WejxIjmPeszMlH5/xxm', 1, NULL, '2025-09-22 00:38:06', '2025-09-22 00:38:06', 1874),
(1141, 'SITI NUR HAYATI', '2324101531', '2324101531@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9.Qp642zOpgUjdRuqNK42O/TH0BKztOITsBYx1WawmP6ei4sm358W', 1, NULL, '2025-09-22 00:38:06', '2025-09-22 00:38:06', 1875),
(1142, 'SRI NURUL AWALIA', '2324101532', '2324101532@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dsy4XoaPsiqDl1653qG3ae2P22f91vzILMwsJuOQimhJXGJ4rGBHi', 1, NULL, '2025-09-22 00:38:07', '2025-09-22 00:38:07', 1876),
(1143, 'SUCIA NURYANTI', '2324101533', '2324101533@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$D4TKDvnlr.ale5sTXL3v/.hVgeHH6gWZD.JTjjLgwFiYR8Bu3GZm2', 1, NULL, '2025-09-22 00:38:07', '2025-09-22 00:38:07', 1877),
(1144, 'Syifa Mufidah', '2324101534', '2324101534@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$FDbfT0JGaiu3kabxWECupu0xpuxB7xvwXmutBp4B8la4FMHOLHr6a', 1, NULL, '2025-09-22 00:38:07', '2025-09-22 00:38:07', 1878),
(1145, 'TIARA CITRA', '2324101535', '2324101535@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hC2/Y5CvDFqWWr4bjrILPuCxwVB61D9Lkaab.IsB/U7zh5BPWCcv.', 1, NULL, '2025-09-22 00:38:07', '2025-09-22 00:38:07', 1879),
(1146, 'Tita Hanita', '2324101536', '2324101536@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$w2Rp0J997eEey3gIDjm4ZejOJyWP/3s9SZQH/q.E3NQQ0HQy6EQKO', 1, NULL, '2025-09-22 00:38:07', '2025-09-22 00:38:07', 1880),
(1147, 'Trie Amellia', '2324101537', '2324101537@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UKMp67dY.ZA79zfo3.Wuy.fwE9m7Kh.GDzGlJ8sCKZrx/ukjKlDyK', 1, NULL, '2025-09-22 00:38:08', '2025-09-22 00:38:08', 1881),
(1148, 'WIDYA ASTUTI', '2324101538', '2324101538@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ZKtOJJVoBOlgn.5Q4gLsKOLA/8dMziSYcu8j1Rm7rIyHvJeaf9y56', 1, NULL, '2025-09-22 00:38:08', '2025-09-22 00:38:08', 1882),
(1149, 'WINDI WULANDARI', '2324101539', '2324101539@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$P8CviUDeM8Lv2KuRmZ5feuLzmkwIotrLklgkxcMHfMP/YMsAZF0s6', 1, NULL, '2025-09-22 00:38:08', '2025-09-22 00:38:08', 1883),
(1150, 'YOKA RAMADHAN HERFIANI', '2324101540', '2324101540@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PQtw.057QMUMqxR2RgkH2e9DJUdc8m8XElNFrH37dwG2P3PQTToA6', 1, NULL, '2025-09-22 00:38:08', '2025-09-22 00:38:08', 1884),
(1151, 'Ade Awaluddin', '2324101181', '2324101181@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GNSAYM8QgPRBcePBnba9eOPiNsO1ZhpJ3nFYyDQUrXB/KeP6tL7X6', 1, NULL, '2025-09-22 00:38:08', '2025-09-22 00:38:08', 1885),
(1152, 'ADITIA', '2324101182', '2324101182@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rZPoIeuaeaLqHkqOviFiYOg78.lv/a3GsLNHh/ybMmJUzYoOs4/vi', 1, NULL, '2025-09-22 00:38:09', '2025-09-22 00:38:09', 1886),
(1153, 'AFRIL DARMAYANTI', '2324101183', '2324101183@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ajbMvY4ArlGkKuYOayTyv.5WHqRvlzY.TAQJOKgXWysu6w0r7gZ9O', 1, NULL, '2025-09-22 00:38:09', '2025-09-22 00:38:09', 1887),
(1154, 'ALAN NURFIKRI', '2324101184', '2324101184@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UwmEeu2aU.VCGutDBPVUKuZqxQ1F8Q2FQ4S5iXG3w.qIelU.wlaf6', 1, NULL, '2025-09-22 00:38:09', '2025-09-22 00:38:09', 1888),
(1155, 'ALMA NURAINI', '2324101185', '2324101185@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5GXgjUSKzoPCPfFUby2GNe4QiE578jUMWKTRPQzRw2B5QhLM6sUY2', 1, NULL, '2025-09-22 00:38:09', '2025-09-22 00:38:09', 1889),
(1156, 'AMELIA DEVIANTY', '2324101186', '2324101186@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dOFweIDYIcefoQ2X0l4pcesgoRPDaIaqRsPxM7L5PD2qNuGtL/ROW', 1, NULL, '2025-09-22 00:38:09', '2025-09-22 00:38:09', 1890),
(1157, 'ANDHARA FEBRIANY', '2324101187', '2324101187@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$n2pHf1wybMdTJySIA8eiMeCd0Zg3VE9rkqVWKgvaLy1TnCYl0qniC', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1891),
(1158, 'Ayu Andini', '2324101188', '2324101188@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UUFmJkJMQ05BJs51K6NgMe1tws7oi3TmpGb9FFhOgzBZ.fcYGIuNi', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1892),
(1159, 'Desta Rahma Agustin', '2324101189', '2324101189@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dpsN8i/PBZegL4cb34/6p.ZFXzpCqKajWfrvFsmq2EroWdxEtyXCe', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1893),
(1160, 'Dwi Hartanti', '2324101190', '2324101190@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8J039OtE5gZtHrIpJ6lfe.pClQBhTO97p/x2hwc0L0C8/Ocah0xcy', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1894),
(1161, 'Fitria Rahmadhani', '2324101191', '2324101191@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3cm2ekbnq442gBuccN0jYu9a5ZypMsP/4Tw8ThN2mXPPbYveUAaT6', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1895),
(1162, 'Imel Asmaya', '2324101192', '2324101192@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$y42YnF2rnVDhanDUjcetWOhETjPGOuGxyTa8Ker78J/zqRlx3sl8.', 1, NULL, '2025-09-22 00:38:10', '2025-09-22 00:38:10', 1896),
(1163, 'IQBAL ABDI AGUNG SAPUTRA', '2324101194', '2324101194@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WFs29N4F1XPw02g0PypIG.XUyItOh8HDTMGCTKUVoKr30hk5Weds.', 1, NULL, '2025-09-22 00:38:11', '2025-09-22 00:38:11', 1897),
(1164, 'Irfan Ferdiansyah', '2324101195', '2324101195@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BlzpoK85VZc1o8UCAcTz0.tEhC5TkveztvORXhlDpB7amIBmzs1La', 1, NULL, '2025-09-22 00:38:11', '2025-09-22 00:38:11', 1898),
(1165, 'LILIH HUMAIROTUL HABIBAH', '2324101196', '2324101196@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$4QyZRsdoaB.z3A3PD7QlYuvf8.0/ipkWQlHdcLj34FK6M4cIUsMCm', 1, NULL, '2025-09-22 00:38:11', '2025-09-22 00:38:11', 1899),
(1166, 'Lusy Marsela', '2324101197', '2324101197@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$769TysNJaSY5eDOdqHUci.7pemymWjAsTxpyx95SPbo3HivWvqrGG', 1, NULL, '2025-09-22 00:38:11', '2025-09-22 00:38:11', 1900),
(1167, 'MUHAMMAD ILHAM FIRDAUS', '2324101198', '2324101198@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$IjPSLK9LlUnUSqJxdRtYluBfmqSJ2yIx2keiFb7G0CxsSIwpNy9nm', 1, NULL, '2025-09-22 00:38:11', '2025-09-22 00:38:11', 1901),
(1168, 'Naya Suci Septiani', '2324101199', '2324101199@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ki54EAXTKGT8LzZmTkR02Oi7M6gfv.lEPfAI4Uy86bYTTfeKbU6w.', 1, NULL, '2025-09-22 00:38:12', '2025-09-22 00:38:12', 1902),
(1169, 'NAZA MAULANA MUHTAZ', '2324101200', '2324101200@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$e7mpVVG/vrMhq//jjkXLZOnNdhGdM2TKIX9ix.d6u9PXA3SXUiMTG', 1, NULL, '2025-09-22 00:38:12', '2025-09-22 00:38:12', 1903),
(1170, 'NAZAR FATHURROCHMAN', '2324101201', '2324101201@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yd4YxWbalO8CgrK5OTVwjOpKrobUlqVGIaJhfx9GIIMnjMGbA3YYW', 1, NULL, '2025-09-22 00:38:12', '2025-09-22 00:38:12', 1904),
(1171, 'Nur Anida', '2324101202', '2324101202@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vzQn4A7P2BN32EVePaBzp.r6v2sYRSueUH5nwbWm7k8QTptHbqtm2', 1, NULL, '2025-09-22 00:38:12', '2025-09-22 00:38:12', 1905),
(1172, 'Nurlaila', '2324101203', '2324101203@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fk47RjH1uu6xY115kBU5J.24tytgduB6nFdrQicPGme8UXP8Fdyym', 1, NULL, '2025-09-22 00:38:12', '2025-09-22 00:38:12', 1906),
(1173, 'RAISSYA DINA CAHYANABILA', '2324101204', '2324101204@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PPXx4lV3QohPelZuI1J7g.IRgLP.b3Y3aDEL5CTaT8WS90iGM0F/i', 1, NULL, '2025-09-22 00:38:13', '2025-09-22 00:38:13', 1907),
(1174, 'Resti Shintia Rahayu', '2324101205', '2324101205@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qgoY02SlK8cayZ3xuN1ywuYz.isQo6uLyCRN/Jp7C9YwHD29Runf6', 1, NULL, '2025-09-22 00:38:13', '2025-09-22 00:38:13', 1908),
(1175, 'RISNA NATASYA', '2324101206', '2324101206@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3jGmioxXXddsdX3VX.Yol.dpkE5sA.CL.kiGDHPxP2h0FdQKwYPg.', 1, NULL, '2025-09-22 00:38:13', '2025-09-22 00:38:13', 1909),
(1176, 'Rizky Aditya Gumilang', '2324101207', '2324101207@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fHJGsx4rSZENjJuRbHUsz.Tus3pvuV9zkzUYUCeQor.RuzfQYyHlu', 1, NULL, '2025-09-22 00:38:13', '2025-09-22 00:38:13', 1910),
(1177, 'SEKAR RAHMAWATI', '2324101208', '2324101208@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WeumUQRZ6g2Wl1XTt3ieEOW6nQIYEPDTA8XA5q0v4ZG4W.ApCFode', 1, NULL, '2025-09-22 00:38:13', '2025-09-22 00:38:13', 1911),
(1178, 'SERRYN YOLANDHA PUSPITADEWI', '2324101209', '2324101209@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kFiAPPJ5UDPtmJCZv09aJunOJe9D9WA1dUo6nLfGVGrDOk/mFk7lO', 1, NULL, '2025-09-22 00:38:14', '2025-09-22 00:38:14', 1912),
(1179, 'Shalsa Astriani', '2324101210', '2324101210@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rSdqhRUOZmzWsF90baaGgu78BjLf2su5vG/VS4PDZcB8Qhr/NBZ6C', 1, NULL, '2025-09-22 00:38:14', '2025-09-22 00:38:14', 1913),
(1180, 'SITI VANIA PURWANTI', '2324101211', '2324101211@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XkhZgpqvSFRYeMq1z1CgPO44aPq6LzxWlphH2xjprFvsYFkBz4syy', 1, NULL, '2025-09-22 00:38:14', '2025-09-22 00:38:14', 1914),
(1181, 'Tia Septiani', '2324101212', '2324101212@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AUNP8ZjUF88Pd31MJfqDlOvwnhlOL6STRUBb..HH48.nkCuOkipeW', 1, NULL, '2025-09-22 00:38:14', '2025-09-22 00:38:14', 1915),
(1182, 'Vina Nurhaliza', '2324101213', '2324101213@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5RXZ1kQfBeXmCDky5uZj.ei8QNQHzuDSEwAgpExUEgWmzwxqhweIe', 1, NULL, '2025-09-22 00:38:14', '2025-09-22 00:38:14', 1916),
(1183, 'Winnie Bunga Suci', '2324101214', '2324101214@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$1A4KmiY2DOI545LD3EHTkeCQiCLkm8cU5JR3gKa1jB7P8TMm8GoP.', 1, NULL, '2025-09-22 00:38:15', '2025-09-22 00:38:15', 1917),
(1184, 'WULAN HAYATUN NISA', '2324101215', '2324101215@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GlkgHyfUMeyvRtHGoJgMROViERscp37Ntp7dENtALXDne8sRlOl3O', 1, NULL, '2025-09-22 00:38:15', '2025-09-22 00:38:15', 1918),
(1185, 'Yuni Nuraeni', '2324101216', '2324101216@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Ae8grCKhnhbFsKx2c4zoG.V.n6v/OSunI4HR17p4njwBggs1f3Qna', 1, NULL, '2025-09-22 00:38:15', '2025-09-22 00:38:15', 1919),
(1186, 'Adi Purnama', '2324101217', '2324101217@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$YAYM9V2ZRAyvOFgUp3onkuMVNOMzMO2Zrnv6dlJE5qhBHbRK4blFC', 1, NULL, '2025-09-22 00:38:15', '2025-09-22 00:38:15', 1920),
(1187, 'AISYAH NURSAFITRI', '2324101218', '2324101218@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$frOYsbX.03pIN9F4ZFQivONQhguDt.Sg4w988ZSWDpyStFgwBGnRO', 1, NULL, '2025-09-22 00:38:15', '2025-09-22 00:38:15', 1921),
(1188, 'ALLYA ZAHRATUS SYIFA', '2324101219', '2324101219@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Y2LXbw2xAmkpBIcOO6wfJusZswMMBcMMmjp3KWk/ZqKJrlTjP1Ufu', 1, NULL, '2025-09-22 00:38:16', '2025-09-22 00:38:16', 1922),
(1189, 'Amelya Natashya', '2324101220', '2324101220@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JxbLxZYWyWL/79PCvY7rqeXDZsqdKhOZvMXvPUT/skzGCXS1DpGHu', 1, NULL, '2025-09-22 00:38:16', '2025-09-22 00:38:16', 1923),
(1190, 'ARIN TIFFANY MEYLAN', '2324101221', '2324101221@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0Yw5WsLHH4EaS9Bnq59cMONoyp//r2bFTLngih0MvnIMIOHfADlz2', 1, NULL, '2025-09-22 00:38:16', '2025-09-22 00:38:16', 1924),
(1191, 'CHANTIKA CHINTYA HERYANTI', '2324101222', '2324101222@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dzK9XE7kCtNCEFaJ88e.l.i/aFGMjCQmnBV4brzro4q0UWf7EVNze', 1, NULL, '2025-09-22 00:38:16', '2025-09-22 00:38:16', 1925),
(1192, 'Dany Irwansyah', '2324101223', '2324101223@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PPI2zVPoQreRMlb/VGtM2OtnRWTzMCVSp3Rgf0HFf21wpKVyX9/82', 1, NULL, '2025-09-22 00:38:16', '2025-09-22 00:38:16', 1926),
(1193, 'DELLA AMELIA AGUSTIN', '2324101224', '2324101224@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BieexFyWhc28ES1kLz1iFedRepEvc3UBcLCU0WLs2ObgliBu66xtS', 1, NULL, '2025-09-22 00:38:17', '2025-09-22 00:38:17', 1927),
(1194, 'DIKRI FAUZAN', '2425101542', '2425101542@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$YfvMjLSirThaLrESPjI1/OOKiFEqay6bcjrDgPWjhAQl/5wqxLW/u', 1, NULL, '2025-09-22 00:38:17', '2025-09-22 00:38:17', 1928),
(1195, 'DINDA LESTARI', '2324101225', '2324101225@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hldW26xBl81QJ0l.8K.0aOn2y2ygo1O2mHbISufBfXH6PO7shUGNe', 1, NULL, '2025-09-22 00:38:17', '2025-09-22 00:38:17', 1929),
(1196, 'FARIZ MAULANA PRATAMA', '2324101226', '2324101226@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Yvu3Ihu2A65rWSrmNElnceyh.NxCxWI7kwejPAS5IX3/GU37Y.tey', 1, NULL, '2025-09-22 00:38:17', '2025-09-22 00:38:17', 1930),
(1197, 'FARREL ATTARSYAH', '2324101227', '2324101227@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$.epH/sIw3MuSbpYnFiF9OOcs8X/.2VdOshJ.P0FiGvsiR340Eo1nK', 1, NULL, '2025-09-22 00:38:17', '2025-09-22 00:38:17', 1931),
(1198, 'GISELA VIEKA INDRIANI', '2324101228', '2324101228@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Pxh/UBnqizbTi95cHcmJZe0LfAyEf/87tv3GCliZ5wld/nNJGV8e6', 1, NULL, '2025-09-22 00:38:18', '2025-09-22 00:38:18', 1932),
(1199, 'HESIN RAHMAWATI', '2324101229', '2324101229@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$zQu7xMnT18S7EnjNs5srBuc4X3IRWmBXqLwAIfMepeqNXYlvTUBlu', 1, NULL, '2025-09-22 00:38:18', '2025-09-22 00:38:18', 1933),
(1200, 'Irma Rahmawati', '2324101230', '2324101230@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$/lZ3ksPLJ2ugxuBq57lGtOcEcer2cL8qfM.T2WXreggin0dTWXGhm', 1, NULL, '2025-09-22 00:38:18', '2025-09-22 00:38:18', 1934),
(1201, 'LENY YULIANTI', '2324101231', '2324101231@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Gcl5FVUP2XFgB0nYNHTdUu8Dr68PIMIRk4AHjOdeUskXYTc2Wq2ry', 1, NULL, '2025-09-22 00:38:18', '2025-09-22 00:38:18', 1935),
(1202, 'Mega Retno Briliani', '2324101232', '2324101232@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$KhWxiC1jfi/uWdBQNHU0nefaZsA6GrZ857dSVnfQQZ8D/8pY6DmU6', 1, NULL, '2025-09-22 00:38:18', '2025-09-22 00:38:18', 1936),
(1203, 'MUHAMMAD DESTA PRATAMA', '2324101233', '2324101233@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$AazbNxbGoelhzgOFg3ask.lmru22cwXVoX8nOxsl0rmo8SZdv/Vr2', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1937),
(1204, 'MUHAMMAD WALI ALKARIM', '2324101235', '2324101235@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2/5lLfzmjKJGG3bGtvWRI.nd34IDNPPNEVR.sxAVOEeayxKdqFMFa', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1938),
(1205, 'MUHAMMAD ZULFAN YANUAR', '2324101236', '2324101236@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Rkl4kTc0NkH6meDa6okkt.QZTpxky2LheOoLqeuutP2tsuTGHrZyq', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1939),
(1206, 'Nikeisha Syifaaul Qomah', '2324101237', '2324101237@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fNBQ.XzO.Y2MC27MZ1PO3.GxW/5IZ2S2Jo.QHRdInt6kmbYcl8hty', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1940),
(1207, 'Nisya Dwi Utamy', '2324101238', '2324101238@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yN3yk4kgmXRxnnVJK.CgVOjonVAcdj1z9mUv9f2VCkkqKzWJsGPM6', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1941),
(1208, 'Nita Amelia', '2324101239', '2324101239@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Bz6Xp0uXtVya5Fso/QwRv.lVgVlQJUBaZe/ZhEsGken2E7qpKvbrm', 1, NULL, '2025-09-22 00:38:19', '2025-09-22 00:38:19', 1942),
(1209, 'NIZAR ADIT TRIANSAH', '2324101240', '2324101240@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$G3viPVeIC.f3rmSndCXVxucODblsyOAU9mvvvB1N9.wQ7Zo1sYnre', 1, NULL, '2025-09-22 00:38:20', '2025-09-22 00:38:20', 1943),
(1210, 'NORY TASYA PRATIWI', '2324101241', '2324101241@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$GqTLr8eAR7YkeSz68fWvmeh9OnFfiR9Y2V4f.9DhBXcgUf4LSWRxe', 1, NULL, '2025-09-22 00:38:20', '2025-09-22 00:38:20', 1944),
(1211, 'QEYSHA QUINN SHAQUILLA SETIAJI', '2324101242', '2324101242@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$WgqQ.itPjOItaUyVvR8X9.AQxK6qz5RC49jZfR7P7XGjBjX.e.aoS', 1, NULL, '2025-09-22 00:38:20', '2025-09-22 00:38:20', 1945),
(1212, 'Rainova Ibny Muyassar', '2324101243', '2324101243@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9f01DhTD226U2vp.5YMmJu55N7DWofIoG56QgWiec8Ap8f4PZqS0m', 1, NULL, '2025-09-22 00:38:20', '2025-09-22 00:38:20', 1946),
(1213, 'Raisya Suci Ramadani', '2324101244', '2324101244@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$zQsrsrdPQ5k7QgfSxbn9/uGy5g/ZPJUfJwRzx/fr2NKaxn0iv32UW', 1, NULL, '2025-09-22 00:38:20', '2025-09-22 00:38:20', 1947),
(1214, 'REVA LIANISHA SUPARMAN', '2324101245', '2324101245@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JO2BJk7aNETL89frGRcQi.z8Gx2DUIk7ybV.V6YnqnrxSmmvyyG1u', 1, NULL, '2025-09-22 00:38:21', '2025-09-22 00:38:21', 1948),
(1215, 'RIRIN NURAENI', '2324101246', '2324101246@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Y7ALq4wGQVx6xDj0TGk06.f6bE43EhxOAL4ZqETk63Y5esvTtygci', 1, NULL, '2025-09-22 00:38:21', '2025-09-22 00:38:21', 1949),
(1216, 'Risca Dwi Aryanti', '2324101247', '2324101247@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$G5tj.C/ILxKsAlxkEC.vauuWAbsf2qG6qErS.u85bbpTkhsMPCMvK', 1, NULL, '2025-09-22 00:38:21', '2025-09-22 00:38:21', 1950),
(1217, 'ROBY HERMANSYAH', '2324101248', '2324101248@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7/mWf8XVifGnsaFCkzoz8u2clrWLAX3bEKjFl8fhgc2SbwIEzNIui', 1, NULL, '2025-09-22 00:38:21', '2025-09-22 00:38:21', 1951),
(1218, 'SAVANNAH CLARA MAULIKA', '2324101249', '2324101249@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$oXjOC21IUcDjvUpiT52WL.ubwTObL75eUJCuZPZtGK8PiZFceKWKa', 1, NULL, '2025-09-22 00:38:21', '2025-09-22 00:38:21', 1952),
(1219, 'SESILIA', '2324101250', '2324101250@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7EX/DvOaP2Kn9UzKCd2uSOHeij5qIKuuuIScJbwAEPDJ4crD6LNKO', 1, NULL, '2025-09-22 00:38:22', '2025-09-22 00:38:22', 1953),
(1220, 'SIFA FAUJIAH', '2324101251', '2324101251@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$eLgkraaFS8GvQJ3WyXTGsekwFLcz7Z2mWb7hA3lD/IuHwQF6icdxS', 1, NULL, '2025-09-22 00:38:22', '2025-09-22 00:38:22', 1954),
(1221, 'ALFANDI ANDRIANSYAH', '2324101253', '2324101253@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$q0343VEXuq..cpUrSSfH/.RYdktOk7xIdR6EXfxZHd6p3I/TWigkK', 1, NULL, '2025-09-22 00:38:22', '2025-09-22 00:38:22', 1955),
(1222, 'DESWITA VERAWATI', '2324101254', '2324101254@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Rjns2BbrjkJZhRY6OZEqy.aNqKEVFFf/s7Lbia8QHMGqsqzOEHe/2', 1, NULL, '2025-09-22 00:38:22', '2025-09-22 00:38:22', 1956),
(1223, 'Devi Sulistia', '2324101255', '2324101255@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$48jQu2Xc49ymmy55yeiokO.sNjhot5uq7LiAWA2E4pmUHWtq/186a', 1, NULL, '2025-09-22 00:38:22', '2025-09-22 00:38:22', 1957),
(1224, 'Dika Apriansyah', '2324101256', '2324101256@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qNmDVq5AJ13XeFHfty5A5uolDbPjdIApR8ZjIQkYmVlt9rJrkys/a', 1, NULL, '2025-09-22 00:38:23', '2025-09-22 00:38:23', 1958),
(1225, 'ELIN NURAINI', '2324101257', '2324101257@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CS.W3j/kABf/5PRb1LGcXudoe.uvJgnism55LAROnkpsAM8xJd.zW', 1, NULL, '2025-09-22 00:38:23', '2025-09-22 00:38:23', 1959),
(1226, 'ELINA AGUSTIN', '2324101258', '2324101258@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3S7eKoDiM88mDkfSO76tiuvEhVES.hDnFWPGFAZ.ziRuya0Lmz7Ti', 1, NULL, '2025-09-22 00:38:23', '2025-09-22 00:38:23', 1960),
(1227, 'Elsa Khoerunnisa', '2324101259', '2324101259@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$idIGdjOfPQl8Lp7uK1IDm.3NZ9ye0fLsIdnLgILcQyFFg./O3gxHe', 1, NULL, '2025-09-22 00:38:23', '2025-09-22 00:38:23', 1961),
(1228, 'Fahriel Muhamad Fauzan', '2324101260', '2324101260@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dF3DPO.VsBwncxoIi2/xCOj8eBz/L0rMJyFe3sKVAAHrh056iz6Vm', 1, NULL, '2025-09-22 00:38:23', '2025-09-22 00:38:23', 1962),
(1229, 'FAREL SYAFIQ ABRAR', '2324101261', '2324101261@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$DVjvyP8N7.zD7/woMpDcFednBq0m/jZ46jmcQLMamt7VY3cyAZNRe', 1, NULL, '2025-09-22 00:38:24', '2025-09-22 00:38:24', 1963),
(1230, 'Fita Oktafiani', '2324101262', '2324101262@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$HXtK7rnk9razFHBUk3Bo1u69KIGHcxFqWLdSqzFMpvtrn7JrncUhy', 1, NULL, '2025-09-22 00:38:24', '2025-09-22 00:38:24', 1964),
(1231, 'FITRIAH NURLATIFAH', '2324101263', '2324101263@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lEWJca3832JsPIKeG1YjHOGVUH3Z0y0y.5bewKyiWDU4/RmdjLPcS', 1, NULL, '2025-09-22 00:38:24', '2025-09-22 00:38:24', 1965),
(1232, 'HANNY APRILA LESTARI', '2324101264', '2324101264@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$HjlIJBaTMkkKRZI/VMYFp.ZEKX7B8HaDhxROyuvyfmqaf.A8PRFpy', 1, NULL, '2025-09-22 00:38:24', '2025-09-22 00:38:24', 1966),
(1233, 'ILMI PIANDYA', '2324101265', '2324101265@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JININGZC33j8vBA86w5wIOzwc1tGToP8ZQEZVO2yOQTYX.X1BKsTu', 1, NULL, '2025-09-22 00:38:24', '2025-09-22 00:38:24', 1967),
(1234, 'Ismi Nurafiani', '2324101266', '2324101266@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MobNJsCPAoZk7vHm7Bq4TuXCB4mHv8ySrPAm/qMikQvDYzZggH5GO', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1968),
(1235, 'Lydia Rizkianti', '2324101267', '2324101267@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$z.RbjVp1RawWyjvQLFQjD.8nyn9KpxYuQEPJ3In8U6HuJ44KYm7BW', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1969),
(1236, 'M. Khisyar Ma\'ali', '2324101268', '2324101268@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LUSKewClwdAo8e2s.BnuAeAUAQ7upBbSbg8t62W0WtLRMx/vNRDeq', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1970),
(1237, 'M. ZIA BAGUS PAMUNGKAS', '2324101269', '2324101269@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yiGlXV/jYqe25dWkEYv/3uF15HTjXoZ6CpvMRTOXPX8qwO9uJv27a', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1971),
(1238, 'MAULIDA CAHYA PRATAMI', '2324101270', '2324101270@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$R5oQf.lUn1.6eb2b7P0TP.MT61pc12445lUiSpkpj/IG/I5pIa.WS', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1972),
(1239, 'MUMUN MUNZIAH', '2324101271', '2324101271@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$gZttQ1kv/gEJg.fkgs.SOe27Aq1zIj0Tc.YFldOGF7YAusmvcc9pK', 1, NULL, '2025-09-22 00:38:25', '2025-09-22 00:38:25', 1973),
(1240, 'NELA AULIA', '2324101272', '2324101272@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$HEVw2lNG9U5UEVNzqo3BW.B3ywOCmThDCJg.35XF9Xo0LGDWE1xkq', 1, NULL, '2025-09-22 00:38:26', '2025-09-22 00:38:26', 1974),
(1241, 'NESYA NAZWA MAULID', '2324101273', '2324101273@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$FNZ6rVQVLQir9u.UYXiRme5AvSBpI5.elXyLvt8y9jrx5QUlHkxgi', 1, NULL, '2025-09-22 00:38:26', '2025-09-22 00:38:26', 1975),
(1242, 'NURUL SILVIANI SOLEHA', '2324101274', '2324101274@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8vuGfXdCa.ze7/YZUtFkI.chSODK1B3BCzrGSyTSHouNDggno5pby', 1, NULL, '2025-09-22 00:38:26', '2025-09-22 00:38:26', 1976),
(1243, 'PHASYA RESTU VIGO AKHMATSYAH', '2324101275', '2324101275@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3ETM85hoXbA.AgAiUVlOJOmjpdRgLGPDKYLH3uyWHy4uEZ1Kkrt1e', 1, NULL, '2025-09-22 00:38:26', '2025-09-22 00:38:26', 1977),
(1244, 'RAISYA RAMDHANI', '2324101276', '2324101276@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rRHDxn7f//BnDeWes18ASOFdMJORkbqpIYg4dgrFdDCTNtfB3d5ey', 1, NULL, '2025-09-22 00:38:26', '2025-09-22 00:38:26', 1978),
(1245, 'RARA RASIKAH', '2324101277', '2324101277@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$sy4qCDiaLzUcIgxzpMqD7epym/lXttHcYIi73vk8VqGAuHEIq2Jjy', 1, NULL, '2025-09-22 00:38:27', '2025-09-22 00:38:27', 1979),
(1246, 'Resti Riska Diana', '2324101278', '2324101278@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$gigmu0NAUjixO9rzcu9d8.b1Dqx3PtsedQ8Z2T9NkuM7yodAfn/Pq', 1, NULL, '2025-09-22 00:38:27', '2025-09-22 00:38:27', 1980),
(1247, 'RISQI SAPUTRA', '2324101280', '2324101280@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$a3suvrC40DO/slthno0b9u5kwHdSwkL4naAZrkfqRqV97l7rXdzr6', 1, NULL, '2025-09-22 00:38:27', '2025-09-22 00:38:27', 1981),
(1248, 'RIZKI KHOLIK MUBAROK', '2324101281', '2324101281@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$FQQ9Ot5LQ7dVzfQduz/Xm.evmYWTsSSpmDSPiM2lWrYEaAg3PP6uy', 1, NULL, '2025-09-22 00:38:27', '2025-09-22 00:38:27', 1982),
(1249, 'SENI PUSPA NURANI', '2324101282', '2324101282@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$FW29CiQW37bA3Q29ltfhF.lynsiMyOSo246L3m14VVOpOalzvG/KG', 1, NULL, '2025-09-22 00:38:27', '2025-09-22 00:38:27', 1983),
(1250, 'Shaira Oktavia', '2324101283', '2324101283@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$A0ysM0S.zwH1L83qnE0b.ex5suIUlaeFqX9aNXdjVWGfTY76jeQV.', 1, NULL, '2025-09-22 00:38:28', '2025-09-22 00:38:28', 1984),
(1251, 'Sheren Redina', '2324101284', '2324101284@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$30DITucVzKR57PPV1sG5mepWM9Xox5Lq5WYn19xZZr1f.N/YBhwoe', 1, NULL, '2025-09-22 00:38:28', '2025-09-22 00:38:28', 1985),
(1252, 'SRI ISMAYANTI', '2324101285', '2324101285@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$BiUiNB4eECQBS2xo6MpjheVI7wXgkqxIQku3tMlIaVwNHHG6kHPX6', 1, NULL, '2025-09-22 00:38:28', '2025-09-22 00:38:28', 1986),
(1253, 'SURYA FALAH', '2324101286', '2324101286@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$17lwt6V5D90pJn0LFxZ0MOwW13ZK3E.I9fN7fudrjD.xOAwL3rT4q', 1, NULL, '2025-09-22 00:38:28', '2025-09-22 00:38:28', 1987),
(1254, 'Syifa Frananda Heryanto', '2324101287', '2324101287@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$pdg/xSrbJfNsvHQ7VqPaYuIpC717mrxqEdYn2yRWtL0x.0/HwydiK', 1, NULL, '2025-09-22 00:38:28', '2025-09-22 00:38:28', 1988),
(1255, 'AA FAUDZAN NURSETIA', '2324101433', '2324101433@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$NKsyy8kh4UboS3w2bGx1dOy.h3HLR.Y6sKNa0a59JM1RMK3B84pVe', 1, NULL, '2025-09-22 00:38:29', '2025-09-22 00:38:29', 1989),
(1256, 'ADAM MUHAMMAD RIZKI', '2324101434', '2324101434@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$M4i.MtYvPlllbq6I2Q4Su.89f0eE0v4j3IdOcmcqTRbKdg0W2SjEW', 1, NULL, '2025-09-22 00:38:29', '2025-09-22 00:38:29', 1990),
(1257, 'AJI WIDAYAT', '2324101435', '2324101435@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qxK9CyuRENuGQwFWOi1y/eS7MNzWrCBzzgT5WvvS0auH0TnFMp/WW', 1, NULL, '2025-09-22 00:38:29', '2025-09-22 00:38:29', 1991),
(1258, 'ALFHA RADJA YANUAR', '2324101436', '2324101436@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0y.qbylVlNnfm74dPeZlMeV85j9KpKLuAwH6ZhjQ6G1vFZBAPiAcK', 1, NULL, '2025-09-22 00:38:29', '2025-09-22 00:38:29', 1992),
(1259, 'Andiki Pratama', '2324101437', '2324101437@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$eul6AW.9cn6T.K.ZGeKJSu7L2zs0EYvNdQ6joXXZxxfOh9OSGq1jS', 1, NULL, '2025-09-22 00:38:29', '2025-09-22 00:38:29', 1993),
(1260, 'AREL HENDARSYAH', '2324101438', '2324101438@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$z9fYsaVf0Ot27gIRP2lwcOBMG7hxe4ucNRh/jgDw.uFIa2H1/2/6W', 1, NULL, '2025-09-22 00:38:30', '2025-09-22 00:38:30', 1994),
(1261, 'ARIL GUNAWAN', '2324101439', '2324101439@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$suMXZCSN6VQ.hfoaCFXuHuxKwcwV5X/qgJhYGEsRUqBOEGGk3SWtq', 1, NULL, '2025-09-22 00:38:30', '2025-09-22 00:38:30', 1995),
(1262, 'Deni Anugrah', '2324101440', '2324101440@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$J2P9N2DYOJcw5hWMEKpdJeHys741LT73QHDM768xvVOJyvGZsTc16', 1, NULL, '2025-09-22 00:38:30', '2025-09-22 00:38:30', 1996),
(1263, 'DIKA D ARIANTO', '2324101441', '2324101441@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XlVdBL0Kl4QkGfIDcYrXOeSl5F88/eolPJsbOIg0dqRdkij1Xd8W2', 1, NULL, '2025-09-22 00:38:30', '2025-09-22 00:38:30', 1997),
(1264, 'Enditha Alifia Salsabila', '2324101443', '2324101443@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$A2cwNbOksxE4a/j5ZZ3I7.NDnFzLowCqY7TRCBc9reCWsC.nuBse.', 1, NULL, '2025-09-22 00:38:30', '2025-09-22 00:38:30', 1998),
(1265, 'ERVAN MAULANA', '2324101444', '2324101444@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$q1aBMxx7zpaEVYUrejuCqOC7H.7Kmvlwioj0MiciF3/hakZp.7seS', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 1999),
(1266, 'GALIH RAMADAN', '2324101445', '2324101445@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$HURFt4HSGe/acofIBPWf9.H23f2YjPkllIduaWdt0pt4v98EKaZkK', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 2000),
(1267, 'GERIN RIANDY SOLIHIN', '2324101446', '2324101446@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7.ids1bz6Y4CGIJdtgAO5.L3trSOWBNeNbRl4EF9VI8YfBHOlHt.S', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 2001),
(1268, 'GHIN GIN ALAMSYAH', '2324101448', '2324101448@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JdeofaJDfO4sJJd16G/vduFYND8ZpR5klN6nnOw/2BG.Cn.xz7jfG', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 2002),
(1269, 'ILHAM HUSNI', '2324101449', '2324101449@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cIAXYEbZagVmr72bsFixl.N0Oo9foFDN3MsG8B.ca.9aPwNickG/.', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 2003),
(1270, 'Intan Nur Fadillah', '2324101450', '2324101450@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$kGShuT8RtF3VS9SiHdXEDuLRQ0T4JcdL.bZv5TjCaLgEcLv07VuGa', 1, NULL, '2025-09-22 00:38:31', '2025-09-22 00:38:31', 2004),
(1271, 'Irpan Maulana', '2324101451', '2324101451@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$yNusLpTUZ7KSfGoZAmvJNuy310rZZbVajuLn4U0gQkTiHfSKJEqta', 1, NULL, '2025-09-22 00:38:32', '2025-09-22 00:38:32', 2005),
(1272, 'IRPAN RIFAI', '2324101452', '2324101452@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$K113Kp5eNlNWu9RMNzBsfeNT/4PxlbplT0o/L517Pynv4W0ifbHnG', 1, NULL, '2025-09-22 00:38:32', '2025-09-22 00:38:32', 2006),
(1273, 'Kaufanullah Almugni', '2324101453', '2324101453@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5H7nBioGV/F6xRL0TdcGh.k2OgOBmPvE7fBtiPBn9uhgS620nSCtm', 1, NULL, '2025-09-22 00:38:32', '2025-09-22 00:38:32', 2007),
(1274, 'Keizha Adya Mecka', '2324101454', '2324101454@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3zPKKdCF4OvMTRafs2XQ6u5Bk9i0fgOlhTntZv8xMjoJsAFC9Z1Sa', 1, NULL, '2025-09-22 00:38:32', '2025-09-22 00:38:32', 2008),
(1275, 'MARIO FEBRIAN', '2324101456', '2324101456@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$gZubl85zhPSQhIc3IIqWv.ywQMXCQsQaB8pTJt7CtXk4n751JH/iu', 1, NULL, '2025-09-22 00:38:32', '2025-09-22 00:38:32', 2009),
(1276, 'Muhammad Rasyid Ridlo', '2324101457', '2324101457@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wF/K1erAUoMtkrRvhKplmuwiLipkVLErLPuxHHMrim3P3kscLYtvC', 1, NULL, '2025-09-22 00:38:33', '2025-09-22 00:38:33', 2010),
(1277, 'NIZMA NURWAHIDAH', '2324101458', '2324101458@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$dc2VS/MjSZsp6BBp89t0HO/BD1rYWUJMTfY89EO6Knwz.rcCSbh7u', 1, NULL, '2025-09-22 00:38:33', '2025-09-22 00:38:33', 2011),
(1278, 'RENATA AURELLIA RAMADHANI', '2324101459', '2324101459@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$.ZH4MGWYEjL6/upxBj9bI.ghhJFjeiiL3wbdL41jZwqASstvqRLHy', 1, NULL, '2025-09-22 00:38:33', '2025-09-22 00:38:33', 2012),
(1279, 'RIFA GINASTIAR', '2324101460', '2324101460@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$19bVYRyz.S7J/EqLXHy1.uwtXeID204httNl5aeYQpLOwGnIkzO4.', 1, NULL, '2025-09-22 00:38:33', '2025-09-22 00:38:33', 2013),
(1280, 'Sandi Maulana Jalaludin', '2324101461', '2324101461@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SSWVvLWRMy7x5Q9R4MVvwu4yMwnoDxWaD2sX/rC9qMZVZ38vVehVK', 1, NULL, '2025-09-22 00:38:33', '2025-09-22 00:38:33', 2014),
(1281, 'SHINTA OKTAVIA', '2324101463', '2324101463@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fk8YzJiG51/Af5fO5QSL5uOgmyYC0oZDUWr1igFxNyCPoAETN..E.', 1, NULL, '2025-09-22 00:38:34', '2025-09-22 00:38:34', 2015),
(1282, 'SULISTIANINGTIAS', '2324101464', '2324101464@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$tn4HHxRomfJPdiX9i36NPOz0z/dJItTYaqSX3SNRGOLSXuuu0YrTi', 1, NULL, '2025-09-22 00:38:34', '2025-09-22 00:38:34', 2016),
(1283, 'VELANI SUBEKTI', '2324101465', '2324101465@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cBzLwybR9.vNqIMV.oEuz.yRo8A4iNgllCYAVBI6Hqr0.7ls4v6vu', 1, NULL, '2025-09-22 00:38:34', '2025-09-22 00:38:34', 2017),
(1284, 'Wanda Putri Iwani', '2324101466', '2324101466@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$41rt.cn7Zqu9Gvl6ZJe9DelnP91J2zG1yMcCy//W.WB34l5jf37zi', 1, NULL, '2025-09-22 00:38:34', '2025-09-22 00:38:34', 2018),
(1285, 'YOGA MUHAMMAD FIKRI', '2324101467', '2324101467@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$58ut2eo.S5nEUnDmOwfH4.KEQwYr9cnPiMJov65D2oQ9aNqAGkgWG', 1, NULL, '2025-09-22 00:38:34', '2025-09-22 00:38:34', 2019),
(1286, 'ZIKRI DELPIANA', '2324101468', '2324101468@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$4j3SkCMgZQagmawwS7zBjeM9krlCC7H2qRCv01CjRBD/OXWQ4ibsy', 1, NULL, '2025-09-22 00:38:35', '2025-09-22 00:38:35', 2020),
(1287, 'Adelio Farrell Julistira', '2324101001', '2324101001@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$LWQv8.ZRhV4hg4IjI.KPQOpt4FYtN3rJceYKuen3MU7Dyx12k6VZS', 1, NULL, '2025-09-22 00:38:35', '2025-09-22 00:38:35', 2021),
(1288, 'AKBAR MAULANA', '2324101002', '2324101002@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Fpq7bykbU/eUwm9Fs2HP7.gRMw6TdQomN6y8oZmdcGaCDV8W56JSm', 1, NULL, '2025-09-22 00:38:35', '2025-09-22 00:38:35', 2022),
(1289, 'AKMAL GHANI LAODA', '2324101003', '2324101003@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Rr6RzbD9LcPCui/bjVfaBuP/CwQU./nfMAo7x9CVz9mykAnJKI9eO', 1, NULL, '2025-09-22 00:38:35', '2025-09-22 00:38:35', 2023),
(1290, 'ALDI ALFAN FEBRIAN', '2324101004', '2324101004@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$8GfXbn51QQRoP7XNPsUBouGD8HyPU8QhR2F1k4WiapA7oBJlO9ev.', 1, NULL, '2025-09-22 00:38:35', '2025-09-22 00:38:35', 2024),
(1291, 'ALDI RENALDI PRATAMA', '2324101005', '2324101005@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CgBG2D3tlsL5Bw3der7GWu2x4pvjfsDsYCa0t2pFkIifndPufMRlW', 1, NULL, '2025-09-22 00:38:36', '2025-09-22 00:38:36', 2025),
(1292, 'Alya Ramadhani Nur Aini', '2324101006', '2324101006@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$XCd98rqvz9I2XrpKEl1jIevT28O1eVgAnBv3AwRNu.o8fu3v1dVde', 1, NULL, '2025-09-22 00:38:36', '2025-09-22 00:38:36', 2026),
(1293, 'ANDIKA JAYA SAPUTRA', '2324101007', '2324101007@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5xSPuvWPO0yYLucwHvX2B.pLBnY0onH2ZulEv7d/KLOcITFfiaoa2', 1, NULL, '2025-09-22 00:38:36', '2025-09-22 00:38:36', 2027),
(1294, 'ANDIKA RAMDANI', '2324101008', '2324101008@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$0ZLqcwMPIbU38xnk68rfzeaRD8jXRUUcDKO6RBtupbG3W46LJ1LDO', 1, NULL, '2025-09-22 00:38:36', '2025-09-22 00:38:36', 2028),
(1295, 'ANGEL FRANSISCA JAYA PRATIWI', '2324101009', '2324101009@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$lCDhcvaIq9yDzvNuZd6kou9YhkC.ZG.Rvk.k0lyrN9xjjC.xAqRoS', 1, NULL, '2025-09-22 00:38:36', '2025-09-22 00:38:36', 2029);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(1296, 'DEDE SUPRIATNA', '2324101010', '2324101010@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$z.DGpERhzjDPIHUMPS6pCOY8MM6lqDqgnPTd2NAXGo7aCxS8YdcVO', 1, NULL, '2025-09-22 00:38:37', '2025-09-22 00:38:37', 2030),
(1297, 'FAHRUL RIADU AMARULLOH', '2324101011', '2324101011@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$JmbXgBdgqkcD2XaE96.Qd.wOv2JTmZAXqR/z7mVHL0lcM8g0PBazC', 1, NULL, '2025-09-22 00:38:37', '2025-09-22 00:38:37', 2031),
(1298, 'Farhan Fauzan', '2324101012', '2324101012@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$xDjFBeOuSWgUPTM1zw5Dj.3qCaj.lCWGy7viTxXhHqEy1c/e24fHC', 1, NULL, '2025-09-22 00:38:37', '2025-09-22 00:38:37', 2032),
(1299, 'FIKA RISCIANI', '2324101013', '2324101013@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3.sFiuYQiWkfbW.3ZSUmje5OCBtJEmhJmkUOWnUK04QxTS6oNLDXi', 1, NULL, '2025-09-22 00:38:37', '2025-09-22 00:38:37', 2033),
(1300, 'FIKKA APRILIANDINI', '2324101014', '2324101014@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$9JmwMiBsKlwCDO5CvCuyKek/uvPjwDgc9ChvwnxbTAJ9jBqoN.acC', 1, NULL, '2025-09-22 00:38:37', '2025-09-22 00:38:37', 2034),
(1301, 'GALUH AGUNG PERMANA', '2324101015', '2324101015@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$NWBM80eZuiSdeEl1UDeUf.MRzZLLdFr0ds6LjNrq0NgG9jpyql3tC', 1, NULL, '2025-09-22 00:38:38', '2025-09-22 00:38:38', 2035),
(1302, 'HARIESTA FERNANDO', '2324101016', '2324101016@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$2hOPg1iJs4QkI4lORKec0u4C3pwm1y9NbMftQLavYKb/Kz2YUwxBq', 1, NULL, '2025-09-22 00:38:38', '2025-09-22 00:38:38', 2036),
(1303, 'Intan Dwi Sabila', '2324101017', '2324101017@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$C/Vx4nb3KspemnH8m1iOLOyr3c4sEDM1IP39S7qt/inMj6i/r5Fju', 1, NULL, '2025-09-22 00:38:38', '2025-09-22 00:38:38', 2037),
(1304, 'IRSYAL FATHUL MUBAROK', '2324101018', '2324101018@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CRGLc4gB9FTQ/IUgqoW7T.4Cd5GRXzCE1yuy/ihF6FqsPgJNPSU/2', 1, NULL, '2025-09-22 00:38:38', '2025-09-22 00:38:38', 2038),
(1305, 'Jimi Ahmad Faturrahman', '2324101019', '2324101019@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$gKElgV8jIoea7GAtAwCU2eWkYvEAVAs4/eAQrF1W.uxExQuIqyzjW', 1, NULL, '2025-09-22 00:38:38', '2025-09-22 00:38:38', 2039),
(1306, 'KAKA RAMADHANI SUHERMAN', '2324101020', '2324101020@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$iDwFl2g9i3swBZn6vdmGveze48J5P2tFO/bO.FZYcg1IKsefcP2iK', 1, NULL, '2025-09-22 00:38:39', '2025-09-22 00:38:39', 2040),
(1307, 'KEISYA SHAORI NIANINDRA PUTRI', '2324101021', '2324101021@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$4LcdHmR9irdgW7FwT58d4uz81CJ4Ct.wIAKHZ.9o5QQ.jXqVkwKmW', 1, NULL, '2025-09-22 00:38:39', '2025-09-22 00:38:39', 2041),
(1308, 'Muhamad Aria Abdilah', '2324101022', '2324101022@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$fLOTU4tYPM2Ad2m8yYAlXeXFp1//VBwWqQzGBNWNA60/.kMXWBqX6', 1, NULL, '2025-09-22 00:38:39', '2025-09-22 00:38:39', 2042),
(1309, 'MUHAMAD FAUZAN NABIL', '2324101023', '2324101023@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$TNDAo3nTDagjcdubpmeWZuGKYjE/R/TLqe.sY6nxPmjWqMhtl1gq.', 1, NULL, '2025-09-22 00:38:39', '2025-09-22 00:38:39', 2043),
(1310, 'Muhammad Gifar', '2324101024', '2324101024@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$tu34hVFV4VN3/5oJT7ktMe8Up4KjGhAt8Qnpri2bMs8ZCTqsCSfOO', 1, NULL, '2025-09-22 00:38:39', '2025-09-22 00:38:39', 2044),
(1311, 'MUHAMMAD RIZKY PRAWIRO', '2324101025', '2324101025@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$vrlfDj0vc2PKmMrfGW9.X.6F3NhN.HTmWXL8mHrZUccuOXIUKrF.2', 1, NULL, '2025-09-22 00:38:40', '2025-09-22 00:38:40', 2045),
(1312, 'NADHIF DZAKI ABDILLAH', '2324101026', '2324101026@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qh76XpvOC.6Ifs1fzDfrzewFt.VQj7OUDvrk4P6ZerD.eO/6o7k3y', 1, NULL, '2025-09-22 00:38:40', '2025-09-22 00:38:40', 2046),
(1313, 'PANCA FERDIAN PAMUNGKAS', '2324101027', '2324101027@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Ro.j2t/pmXS9CpbSOUULU.EI/nQv.5sr4ADOjE5mmThtNWJ2GtZ16', 1, NULL, '2025-09-22 00:38:40', '2025-09-22 00:38:40', 2047),
(1314, 'RADIKA RAYAGA WIGUNA', '2324101028', '2324101028@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$L/LFXK9x.C.Ojf1x4rUFYediUzTC4DLdyS/4dsEcP8CJzLMvcGXkm', 1, NULL, '2025-09-22 00:38:40', '2025-09-22 00:38:40', 2048),
(1315, 'Rega Nur Sidiq', '2324101029', '2324101029@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$oSTw8zSMImrsPXhBpRqe5eim5lEEw4Ban/lmLLWHTY1VWAXvnPtba', 1, NULL, '2025-09-22 00:38:40', '2025-09-22 00:38:40', 2049),
(1316, 'REVAL FADILAH', '2324101030', '2324101030@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VIlTzKY1zrOmc0Jlblrp5OBUB.PDJojRq1rEeAXmywVnpTT1li2QW', 1, NULL, '2025-09-22 00:38:41', '2025-09-22 00:38:41', 2050),
(1317, 'Rizky Fauzi', '2324101031', '2324101031@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Ft.ZLtuopf7AmAah10S.MuvN/N8qfrPnE1.xiIDaHMnrnPoglo8Eu', 1, NULL, '2025-09-22 00:38:41', '2025-09-22 00:38:41', 2051),
(1318, 'ROBI PERMANA ALAMSYAH', '2324101032', '2324101032@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$V0xkMh.q/oSfxcmFmtF84u.qNTsvZo4HH/6R.cBge1lO/6/YSFDoG', 1, NULL, '2025-09-22 00:38:41', '2025-09-22 00:38:41', 2052),
(1319, 'SANDI ARIZKI SAPUTRA', '2324101033', '2324101033@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$qNyayN1pLRjn1H.3GwXAGuU8iY8w6/GSe1o5KV6jo5lxupUn.RVmC', 1, NULL, '2025-09-22 00:38:41', '2025-09-22 00:38:41', 2053),
(1320, 'YOANA TRI MUNAJAT', '2324101034', '2324101034@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ZJr7.Kq1jvaEfbD3CsXtTOn.yS4qvy/Ft/XiYSODk0nhpVdq0cZzG', 1, NULL, '2025-09-22 00:38:41', '2025-09-22 00:38:41', 2054),
(1321, 'Zidan Septiana Pratama', '2324101035', '2324101035@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$Yk/9Lm.S/E0TToE2GBNIeuiZ31R7KLxVaQwMhZWcuuXFQnB9VwUgy', 1, NULL, '2025-09-22 00:38:42', '2025-09-22 00:38:42', 2055),
(1322, 'ZILDAN ABROR', '2324101036', '2324101036@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$CWIQs2T4jv9O2tPIk7ung.clyq6RhdV7.lkx/T5xopLLCgGsqxyem', 1, NULL, '2025-09-22 00:38:42', '2025-09-22 00:38:42', 2056),
(1323, 'ADE PEBRIANA', '2324101037', '2324101037@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$1wq8NuLNIXt4gCqcgFbYb.yJnfkkYN9GFvL6t3oDJpm5hxU6V/Kd2', 1, NULL, '2025-09-22 00:38:42', '2025-09-22 00:38:42', 2057),
(1324, 'AFRIZAL HERLAMBANG', '2324101038', '2324101038@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$UGBSsii6XLR6thz8TPvIfeL9X/6GFqXZoXseFJ54jbPFu7btSj7.e', 1, NULL, '2025-09-22 00:38:42', '2025-09-22 00:38:42', 2058),
(1325, 'AFRIZAL ZAHRAN MULYANA', '2324101039', '2324101039@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hffFDYxOVi94tEAG2I0ESOLhXHT/7yEIvcwrTEwMUgaDjHU3baNRG', 1, NULL, '2025-09-22 00:38:42', '2025-09-22 00:38:42', 2059),
(1326, 'AKBAR AL FADILLAH', '2324101040', '2324101040@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$SSKMTIv85vzYCw5RCD2NLeetKsolp673z/DHl3HYqHCxWDUTRj1FC', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2060),
(1327, 'Alpi Purnama', '2324101041', '2324101041@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3TbQQ8bdcQH/uhKEYyqR7Ot9oOORAsVYWrZ7DeSe5nqRmqOPq4iO2', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2061),
(1328, 'ARIA RIZKY PERMANA', '2324101042', '2324101042@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ZFP7aWJXf4OVlCYHzlWGkez1scZm0xFW37WYlBKM8hGiPTsk1QZpS', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2062),
(1329, 'ATHALLAH WAFI RAFID FAADHILAH', '2324101043', '2324101043@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$4cEQ3b9deALe8aflkzhu3eCnGnTzkiIQeK/eAmKxrpE/1Zfmvg5zC', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2063),
(1330, 'AYU HARTINI', '2324101044', '2324101044@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$S682A/L/8D8K8M7qHcROU.5ANFWcZzZr1hh/YDFAr6a2BcxHfEQ4q', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2064),
(1331, 'DAFFA ARIEF NUGRAHA', '2324101045', '2324101045@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3AYIPDqwsKVEACcmmG6sYe.2T3Ymk.51RlEpF1DoLUJ2tjRbwQZuC', 1, NULL, '2025-09-22 00:38:43', '2025-09-22 00:38:43', 2065),
(1332, 'DELIA SEKAR ARUM', 'deliasekararum', '2324101046@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cLTwu5fU6e9NHAUaRtFKbe.X8PH1Edq.y7Inlygv0gAGr08nxafIS', 1, NULL, '2025-09-22 00:38:44', '2025-10-15 01:32:59', 2066),
(1333, 'DIDAN RAMDHANI ABDUL MATIN', '2324101047', '2324101047@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$bweAEHfUMUoQu7cabxWLPOmfKZJuSDhPb0HloSxYT1QnchRNmQrf6', 1, NULL, '2025-09-22 00:38:44', '2025-09-22 00:38:44', 2067),
(1334, 'Dimas Hermawan', '2324101048', '2324101048@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$wLSW5r3ZwThXgzd1vXfN8./n2EucNwehRCReXAfMoz/NcRtteI7h6', 1, NULL, '2025-09-22 00:38:44', '2025-09-22 00:38:44', 2068),
(1335, 'ERGIN KUSTIANA', '2324101049', '2324101049@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$H6APqk6W.gFaBC4l3PWP7uO145.aO6Yg6OzHabI26XGBqZ5Jx2WlK', 1, NULL, '2025-09-22 00:38:44', '2025-09-22 00:38:44', 2069),
(1336, 'Farid Al - Munawwar', '2324101050', '2324101050@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$7FrvY3YUVZDqcCoPp4XGwOWfmJAS8KaK5ryUosOXih89exnHIbxbG', 1, NULL, '2025-09-22 00:38:44', '2025-09-22 00:38:44', 2070),
(1337, 'FATAN APRIYANA PRATAMA', '2324101051', '2324101051@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$nD1YRhUCaXipG.VMHXcnTeEXpypvOo31zF2P.pVRY3dLcy9HMfRii', 1, NULL, '2025-09-22 00:38:45', '2025-09-22 00:38:45', 2071),
(1338, 'Gian', '2324101052', '2324101052@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$hhKvwULQ.h52rGfjb74PNub0BiJGBw0BDmEMKWW4tnHAyqqEpoIzi', 1, NULL, '2025-09-22 00:38:45', '2025-09-22 00:38:45', 2072),
(1339, 'HAFIDZ AMAR ALFARIZZIE', '2324101053', '2324101053@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$mpERsgOWHdx6484ts13zuO0I.KppnAzPN7.hO.pmNwSIQFoO.bojy', 1, NULL, '2025-09-22 00:38:45', '2025-09-22 00:38:45', 2073),
(1340, 'Haikal Zaki Firmansyah', '2324101054', '2324101054@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$IoAJXfk2H8YYnlP5VoJbhu6NBN9bnBM/gCM95VgueqqW76AVvIbWm', 1, NULL, '2025-09-22 00:38:45', '2025-09-22 00:38:45', 2074),
(1341, 'JIHAD IRFANSYAH', '2324101055', '2324101055@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$QbHeysywB7gvLudcIT33X.HgdT71glSG95CwH2Ze2klXsPoB1b7Fa', 1, NULL, '2025-09-22 00:38:45', '2025-09-22 00:38:45', 2075),
(1342, 'KENZ FELIX DJAYALARAS PUTRA', '2324101056', '2324101056@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$VLW5I8sHx9AywgvQgfLNkeJURXoqSiHeLwQ0xwSOYcDzICNBNIfva', 1, NULL, '2025-09-22 00:38:46', '2025-09-22 00:38:46', 2076),
(1343, 'Kesya Arifatun Safanah', '2324101057', '2324101057@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$IoTHvDIld993Al/wdZYXve1yW8GrFG0x0/layyTQ5LyO9KDu6TDEy', 1, NULL, '2025-09-22 00:38:46', '2025-09-22 00:38:46', 2077),
(1344, 'Mochammad Rifqi Tsani', '2324101058', '2324101058@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$aWEINg1JPgiChghvtGg9Fu/1/6K/b7hCMqDDmXYHZDGLjCHHHeyeS', 1, NULL, '2025-09-22 00:38:46', '2025-09-22 00:38:46', 2078),
(1345, 'MOHAMMAD ABHIE RAMDANI', '2324101059', '2324101059@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MucMwkMTGz.OwcFQz43JLeL9chwBbAgt0MERlS36JC.9K816xCVUe', 1, NULL, '2025-09-22 00:38:46', '2025-09-22 00:38:46', 2079),
(1346, 'MUHAMMAD RASYA ARYADHINATA', '2324101060', '2324101060@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$cNRKShD0QS1w9RGkfdsJTevFll39o66Z3uXg4LP8pAX4mikY5zq4i', 1, NULL, '2025-09-22 00:38:46', '2025-09-22 00:38:46', 2080),
(1347, 'Muhammad Ridwan', '2324101601', '2324101601@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$5OSxGxT/cYXPl41pCAObkOXfUtnuTMWMEGeeRs23WOLrAWEnvFsFC', 1, NULL, '2025-09-22 00:38:47', '2025-09-22 00:38:47', 2081),
(1348, 'NABIL SEPTI RAMDHANI', '2324101061', '2324101061@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MPZ2dnK8iByNXeIhZVrlwOW.hTZuCGxbCP0KisNFS5PRDcyhzRuAW', 1, NULL, '2025-09-22 00:38:47', '2025-09-22 00:38:47', 2082),
(1349, 'NAUFAL NURUL FAJAR', '2324101062', '2324101062@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$iHPwUXAS0.j1ZcjoxzxN9OyY7U6ky3WE80GJ/USvv5K4Via6ZvYza', 1, NULL, '2025-09-22 00:38:47', '2025-09-22 00:38:47', 2083),
(1350, 'Nizar Firmansyah', '2324101063', '2324101063@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$iK9FRebDkRrnqjn.76BSPe78RMsmEqfrxEgBFtcdUSGRZUb92jEqi', 1, NULL, '2025-09-22 00:38:47', '2025-09-22 00:38:47', 2084),
(1351, 'RAGIL FAIQ DWINA PUTRA', '2324101064', '2324101064@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$MsO1jGXMo1Ziooq6c8VCTuylFunGDjZmp298Y7XMoREUrYxgGqG7.', 1, NULL, '2025-09-22 00:38:47', '2025-09-22 00:38:47', 2085),
(1352, 'REVAN SEPTIANSYAH RAMADHANI PUTRA', '2324101065', '2324101065@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$rEQ4XSHkjopxDOSEnq2yP.6YCbi0DH0LvN1R0PqeHwG0TDTdNvLdW', 1, NULL, '2025-09-22 00:38:48', '2025-09-22 00:38:48', 2086),
(1353, 'Rivaldy Fauzan', '2324101067', '2324101067@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$ke/eHBzVnUURlana1jaYGen3Wev0KzOTPEIsLF3uJwa1DG..oCtSO', 1, NULL, '2025-09-22 00:38:48', '2025-09-22 00:38:48', 2087),
(1354, 'SELA SALAFIAH', '2324101068', '2324101068@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$TT8OsqupXl4QJncvdZNd1uEPScgdevgtjqm5QlCnXvy2duiRD8aLe', 1, NULL, '2025-09-22 00:38:48', '2025-09-22 00:38:48', 2088),
(1355, 'SENDI FEBRIANSYAH NUR HIDAYAT', '2324101069', '2324101069@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$zbD2QiyPqKbZo2ytqjS8LekUJq3mbVew5xGPrBeP9o.kPjMALIrum', 1, NULL, '2025-09-22 00:38:48', '2025-09-22 00:38:48', 2089),
(1356, 'VICKY FACHRIZAL MUHARRAM', '2324101070', '2324101070@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3z7usOlA5h/W4MkwQFf7xeHM3mZlaFRbj85teLa3074h516ufm1bS', 1, NULL, '2025-09-22 00:38:48', '2025-09-22 00:38:48', 2090),
(1357, 'Wisnu Wardana sofyan', '2324101071', '2324101071@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$3NngkW3YGNznzXPFbtlWP.VORLrjuRMXNOgzjB9B91lc/eZaYSg2C', 1, NULL, '2025-09-22 00:38:49', '2025-09-22 00:38:49', 2091),
(1358, 'ZULLUL ARDAN RAFAYANTO', '2324101072', '2324101072@siswa.sekolah.com', 'siswa', 5, NULL, '$2y$12$PDhAxUJdf/S9.YoiTihdFO.Ih7sQKjoMBtBFsmAVIky4qYIc90Bd2', 1, NULL, '2025-09-22 00:38:49', '2025-09-22 00:38:49', 2092),
(1462, 'Aang Susbijantara Faizar', '197507152007011021', 'aang-susbijantara-faizar.@guru.com', 'guru', 5, NULL, '$2y$12$UDVYsemBekCNGVtJhcSI4u6KpsJfD.iNKzgG0o0WgfLWvxcO31W1y', 2, NULL, '2025-10-01 01:39:17', '2025-10-01 01:39:17', 87),
(1463, 'Ahmad Muhaimin Rajab', '199201192022211012', 'ahmad-muhaimin-rajab.@guru.com', 'guru', 5, NULL, '$2y$12$pqYa5CwDusuSG3/kaPV67uy7uemSq74X3rPRZqVcw3aglK9/d4mwK', 2, NULL, '2025-10-01 01:39:17', '2025-10-01 01:39:17', 88),
(1464, 'Alis Nursaleh', '199108102024211028', 'alis-nursaleh.@guru.com', 'guru', 5, NULL, '$2y$12$lGFxII.Rn0otcIzXV3MqIuKGE.GyFt2osMjY3D6gFdYoNpH8dI6GK', 2, NULL, '2025-10-01 01:39:17', '2025-10-01 01:39:17', 89),
(1465, 'ALPAN', '198703122023211011', 'alpan.@guru.com', 'guru', 5, NULL, '$2y$12$dpxRBlxHGv79o4yrEFYEqeuuDrtOyhCFgJGLrhiwjogpjEZ5gjWgi', 2, NULL, '2025-10-01 01:39:18', '2025-10-01 01:39:18', 90),
(1466, 'Annisa Kurnia Damayu', '199107032025212006', 'annisa-kurnia-damayu.@guru.com', 'guru', 5, NULL, '$2y$12$Mk2rXp77Le5Oq84Ci7sT4uPZ7rTYNTrBRbwvneQfWvk3MxgZumS0W', 2, NULL, '2025-10-01 01:39:18', '2025-10-01 01:39:18', 91),
(1467, 'Ari Hendartika', '198911052022211006', 'ari-hendartika.@guru.com', 'guru', 5, NULL, '$2y$12$oBi6vAC8bQLFuh504Cw9Y./e7AedDyo0uuNus6ATIExdlxxa4FVca', 2, NULL, '2025-10-01 01:39:18', '2025-10-01 01:39:18', 92),
(1468, 'Arief Budiaistana Putra', '199504032022211004', 'arief-budiaistana-putra.@guru.com', 'guru', 5, NULL, '$2y$12$OJ3QNxYVxjsoMjHpBKWMzOWqy9n06nCCvum/uPenr/w1Ikt5qRmne', 2, NULL, '2025-10-01 01:39:19', '2025-10-01 01:39:19', 93),
(1469, 'Asep Indra', '197412302009021002', 'asep-indra.@guru.com', 'guru', 5, NULL, '$2y$12$m5Y80NexGaZ28MTyFZPVKu9SMTmNyHEihNBF9WPBnssRFVQOK.isC', 2, NULL, '2025-10-01 01:39:19', '2025-10-01 01:39:19', 94),
(1470, 'Aslim', '196908272005011003', 'aslim.@guru.com', 'guru', 5, NULL, '$2y$12$wvnUnqPqWn5sbWH6.Q3vX.2zCXpOdOESvcT1xBNc.2hanCp4FZ7BK', 2, NULL, '2025-10-01 01:39:20', '2025-10-01 01:39:20', 95),
(1471, 'Ati Supiati', '434335342454535556', 'ati-supiati.@guru.com', 'guru', 5, NULL, '$2y$12$Fq36UmwIZR7lHFYOWAKbJe9VZLLL8J/QKP9NHzSAo3E4CSWhcKY4i', 2, NULL, '2025-10-01 01:39:20', '2025-10-01 01:39:20', 96),
(1472, 'Baiman Hadisucipto', '197606082023211002', 'baiman-hadisucipto.@guru.com', 'guru', 5, NULL, '$2y$12$33CngAb/tBshpsO5fyU/LO1awWukG4UKTZut7ia02nFbQ8CeBOTpu', 2, NULL, '2025-10-01 01:39:20', '2025-10-01 01:39:20', 97),
(1473, 'Barokatunnafiah R', '198312012009022007', 'barokatunnafiah-r.@guru.com', 'guru', 5, NULL, '$2y$12$Rt6R4kM1Wo.EwGgK80UrEegH/dnkx0iY/kdw0GRP1Nmhc6JrDyxd6', 2, NULL, '2025-10-01 01:39:21', '2025-10-01 01:39:21', 98),
(1474, 'Beni Fitrianto Hidayat', '198406302022211004', 'beni-fitrianto-hidayat.@guru.com', 'guru', 5, NULL, '$2y$12$9nFuiNEuU65LjCXlYNvjUubeCU6xiuA00I0SlrdzeXOlAFU2f3czi', 2, NULL, '2025-10-01 01:39:21', '2025-10-01 01:39:21', 99),
(1475, 'Dani Efendi', '198410292022211003', 'dani-efendi.@guru.com', 'guru', 5, NULL, '$2y$12$SnkfJrJEPreV/clau37EkOHQBlcDoSgW8akKMb7YEiBGr/lwFp.Be', 2, NULL, '2025-10-01 01:39:21', '2025-10-01 01:39:21', 100),
(1476, 'Darsu', '198912282022211007', 'darsu.@guru.com', 'guru', 5, NULL, '$2y$12$Ib9xI8oEBZaC7bR9XvEHAOzbA77xwtlF6XVumB20RsAPhglTv6MZ6', 2, NULL, '2025-10-01 01:39:22', '2025-10-01 01:39:22', 101),
(1477, 'Dede Rukmana', '199308232020121013', 'dede-rukmana.@guru.com', 'guru', 5, NULL, '$2y$12$2pyv2agehg5sCc3Z3o/gcuhpo/O51jLRTy23vuNyL7lqpUVV/8eVa', 2, NULL, '2025-10-01 01:39:22', '2025-10-01 01:39:22', 102),
(1478, 'Dedeh Kurniasih', '197712112024212004', 'dedeh-kurniasih.@guru.com', 'guru', 5, NULL, '$2y$12$t9GvGuLBhbGVVuNPpI4sl.6TjzNb2GkNE93rtDz9kLrS6Sjrof9fi', 2, NULL, '2025-10-01 01:39:22', '2025-10-01 01:39:22', 103),
(1479, 'Deni Suharyanto', '198504132009021005', 'deni-suharyanto.@guru.com', 'guru', 5, NULL, '$2y$12$RjVZ/RhZalASZC2HQ71I8.Gz2e3iY.mw2OBkdiduh2Qp1oKlhXbYC', 2, NULL, '2025-10-01 01:39:22', '2025-10-01 01:39:22', 104),
(1480, 'Deti Haryati', '197508052006042004', 'deti-haryati.@guru.com', 'guru', 5, NULL, '$2y$12$ex8ig3zV6HoyAHQQMUHOD.5JgsFiqqKPECYPsaqq7RN0j3jKWKdOW', 2, NULL, '2025-10-01 01:39:23', '2025-10-01 01:39:23', 105),
(1481, 'Dewi Fridawati', '198312242022212010', 'dewi-fridawati.@guru.com', 'guru', 5, NULL, '$2y$12$BN/lr6BXN695KnK024g7EuVK3XBtUCUYZ/vVHSwO.pJ8QbM1YH8Qi', 2, NULL, '2025-10-01 01:39:23', '2025-10-01 01:39:23', 106),
(1482, 'Elin Roslianti', '198105052005012023', 'elin-roslianti.@guru.com', 'guru', 5, NULL, '$2y$12$cuMU4xQMqKRQ9rQ4PzpokO8u8U0tIxXXL8YtJjmLGODRAm9Ve16IK', 2, NULL, '2025-10-01 01:39:23', '2025-10-01 01:39:23', 107),
(1483, 'Elis Fitriawati', '197909032005012007', 'elis-fitriawati.@guru.com', 'guru', 5, NULL, '$2y$12$4qu/gE5zmvTuVfX07Z0G1.7V9rbe.bA.Nj6d2cx/GfZPTUXK/zJj2', 2, NULL, '2025-10-01 01:39:24', '2025-10-01 01:39:24', 108),
(1484, 'Elis Kusumahwati', '198202152007012005', 'elis-kusumahwati.@guru.com', 'guru', 5, NULL, '$2y$12$JpKdWsqkz8BIWTnFo9AbiOw/doeHee6Xk.wR.JDwkfd5sm2BSXzgO', 2, NULL, '2025-10-01 01:39:24', '2025-10-01 01:39:24', 109),
(1485, 'Elis Siti Nurjanah', '199401212022212009', 'elis-siti-nurjanah.@guru.com', 'guru', 5, NULL, '$2y$12$IG07YJqQFtU2c0hO7FLqSO355hPmWOzAV0cqtEgH6nmpl5A0h5BVC', 2, NULL, '2025-10-01 01:39:24', '2025-10-01 01:39:24', 110),
(1486, 'Endang Suhendar', '199203122022211002', 'endang-suhendar.@guru.com', 'guru', 5, NULL, '$2y$12$XVvkF/kEU5.jpoEUbwW7lOQpFKrV3UY2SGrKr9FD.USCCGtgGtA8O', 2, NULL, '2025-10-01 01:39:24', '2025-10-01 01:39:24', 111),
(1487, 'Eni Widyastuti', '196610041989032006', 'eni-widyastuti.@guru.com', 'guru', 5, NULL, '$2y$12$6D98AgGIGB4d2MzpRTEFBeM3Q54gz42.6LFurygw.DXQutpQ2zwgu', 2, NULL, '2025-10-01 01:39:25', '2025-10-01 01:39:25', 112),
(1488, 'Etin Rostika', '198106162007012007', 'etin-rostika.@guru.com', 'guru', 5, NULL, '$2y$12$C6iCwsmhTEE4GCKH9AqlAO241Jr9lnXCR/gJSeLMStMqeCnExNKgC', 2, NULL, '2025-10-01 01:39:25', '2025-10-01 01:39:25', 113),
(1489, 'Fajar Akbar Yanto', '198412132023211008', 'fajar-akbar-yanto.@guru.com', 'guru', 5, NULL, '$2y$12$y/rt2jD8aVkW57aGpfVMpeO.Uj9NXHwzovxIOongv33ie2i3m/nEy', 2, NULL, '2025-10-01 01:39:25', '2025-10-01 01:39:25', 114),
(1490, 'GUGUN GUNAWAN SAPII', '199501292022211007', 'gugun-gunawan-sapii.@guru.com', 'guru', 5, NULL, '$2y$12$hWZZeeQiSuUOmKmI9OqIQuBjb6RwWyM5oUn7aFk0j.1sV67DqMxt.', 2, NULL, '2025-10-01 01:39:25', '2025-10-01 01:39:25', 115),
(1491, 'Gun Gun  Gurniwa Gautama', '198112312024211011', 'gun-gun-gurniwa-gautama.@guru.com', 'guru', 5, NULL, '$2y$12$GbPYUjjhjdiYT03jdTvF3.ytjiZylh9G./kT0Scm6xw2.1nC1ErhS', 2, NULL, '2025-10-01 01:39:26', '2025-10-01 01:39:26', 116),
(1492, 'Hany Fitriyanti', '198905072023212046', 'hany-fitriyanti.@guru.com', 'guru', 5, NULL, '$2y$12$oX29IDZRQsCHRgceb8E94.Iq.9KUtPd9mHC6OtRdI/.UXjtJPEbxe', 2, NULL, '2025-10-01 01:39:26', '2025-10-01 01:39:26', 117),
(1493, 'Heni Rosmiati', '197404042025212004', 'heni-rosmiati.@guru.com', 'guru', 5, NULL, '$2y$12$K7nBztYLRCV0ewA6KPNwwuPKM1JDAHVg2DykWbbxbMZwAoOKezG7K', 2, NULL, '2025-10-01 01:39:26', '2025-10-01 01:39:26', 118),
(1494, 'Hermin Hindayani', '197307262005012005', 'hermin-hindayani.@guru.com', 'guru', 5, NULL, '$2y$12$QbKyHoF7plbGHEXn63TCy.guguTAJIRcW69DwxAHo0b8YkxEJQAVW', 2, NULL, '2025-10-01 01:39:26', '2025-10-01 01:39:26', 119),
(1495, 'Ibnu Gumilar', '199104282023211010', 'ibnu-gumilar.@guru.com', 'guru', 5, NULL, '$2y$12$GxY//n3OgXVeRvI2xhFtK.jEMZ3AbB1W8djo8Bm/7BHv2xVOBdRrq', 2, NULL, '2025-10-01 01:39:27', '2025-10-01 01:39:27', 120),
(1496, 'Ihsan Zaenissalam', '199401042022211004', 'ihsan-zaenissalam.@guru.com', 'guru', 5, NULL, '$2y$12$FlIWL88HPVhcjwXa.fvdSelqbhx/09SIhrU7y2IBTu9pegNhYSt1y', 2, NULL, '2025-10-01 01:39:27', '2025-10-01 01:39:27', 121),
(1497, 'Iis Tresnawati', '198101292025212004', 'iis-tresnawati.@guru.com', 'guru', 5, NULL, '$2y$12$yYUTTe7r9YhjCZAaISDqMusDbY3irtWi.UI2Z5ZgUvxe6mitG8owy', 2, NULL, '2025-10-01 01:39:27', '2025-10-01 01:39:27', 122),
(1498, 'Ikah Atikah', '198605282009022005', 'ikah-atikah.@guru.com', 'guru', 5, NULL, '$2y$12$u9Q2fq1lucDOTpEjexPwgex5nRv6PPfozD9S8ZqUkgvhyUEpWReuC', 2, NULL, '2025-10-01 01:39:27', '2025-10-01 01:39:27', 123),
(1499, 'Imas Rohimah', '198407172022212040', 'imas-rohimah.@guru.com', 'guru', 5, NULL, '$2y$12$1j9D5GO0/o7kLZXcdTeDA.99yf3srUTTw0tJYHMrjmCN4wQnkH0yi', 2, NULL, '2025-10-01 01:39:28', '2025-10-01 01:39:28', 124),
(1500, 'Iming Lasmini', '198402072009022004', 'iming-lasmini.@guru.com', 'guru', 5, NULL, '$2y$12$nKzQvw0MqyirE4gJIyjkY.rpT3IqPjRiyrzvcXzHvROnmzSObKfae', 2, NULL, '2025-10-01 01:39:28', '2025-10-01 01:39:28', 125),
(1501, 'Ina Indriyani', '198703032024212017', 'ina-indriyani.@guru.com', 'guru', 5, NULL, '$2y$12$6MH2M76fdJ.4wWDD4EIujOMJVq/M2HemAIvBQ.y0ADcbDvvy92IDi', 2, NULL, '2025-10-01 01:39:28', '2025-10-01 01:39:28', 126),
(1502, 'Isna Nurilah', '197501012005012014', 'isna-nurilah.@guru.com', 'guru', 5, NULL, '$2y$12$u7YpRf4GKS6uutz/lg0kdunwZ/Xiz8bDhiE/sc9Ym/6oxjX0mV6UG', 2, NULL, '2025-10-01 01:39:28', '2025-10-01 01:39:28', 127),
(1503, 'Juliarto', '198707162024211010', 'juliarto.@guru.com', 'guru', 5, NULL, '$2y$12$yglmlAZAGhgDYe9VWRDdwejR/5Nzt.tWyZV0WBIwxnl2vt/Zb29pG', 2, NULL, '2025-10-01 01:39:29', '2025-10-01 01:39:29', 128),
(1504, 'Kusmawati', '197509162005012008', 'kusmawati.@guru.com', 'guru', 5, NULL, '$2y$12$rvbAMhn9Gevrsgvh79eBr.4THvYkvdejV9XSDpGGvkPQUTBDyRtuu', 2, NULL, '2025-10-01 01:39:29', '2025-10-01 01:39:29', 129),
(1505, 'Kuswandi', '196705252006041004', 'kuswandi.@guru.com', 'guru', 5, NULL, '$2y$12$pIopcFzeT3Im3qZ49J6.h.L6rgUiUyTci0ntKFSwtbI2KGiOORATO', 2, NULL, '2025-10-01 01:39:29', '2025-10-01 01:39:29', 130),
(1506, 'Lala Maulana', '198201062007011004', 'lala-maulana.@guru.com', 'guru', 5, NULL, '$2y$12$fr0H1uwu7sdU7nY8ct01b.RP8lTLcz28WV7NAJZLuz4EFmXqHOYzu', 2, NULL, '2025-10-01 01:39:29', '2025-10-01 01:39:29', 131),
(1507, 'Lin Karlina Sri Martini', '198807102022212006', 'lin-karlina-sri-martini.@guru.com', 'guru', 5, NULL, '$2y$12$XcelyD4db3iNKGXGWIW92eoCHkBVXt8PHmpkRWv2hD82wkFFypvFy', 2, NULL, '2025-10-01 01:39:30', '2025-10-01 01:39:30', 132),
(1508, 'Lina Herlina', '197904012023212014', 'lina-herlina.@guru.com', 'guru', 5, NULL, '$2y$12$kSyeX5AyExit4Gk6FsWjMuo0ytp.VaPFUGLnsoTJQU9FiXfzNvq7O', 2, NULL, '2025-10-01 01:39:30', '2025-10-01 01:39:30', 133),
(1509, 'Meytasari', '199105282022212015', 'meytasari.@guru.com', 'guru', 5, NULL, '$2y$12$.b.v4HbQa1KtxVm.8BMc1..BXCmGNQRI551Xziw3fVd/TROQWk.Bm', 2, NULL, '2025-10-01 01:39:30', '2025-10-01 01:39:30', 134),
(1510, 'Mohamad Abdul Basir Imam Basuki', '197912092005011003', 'mohamad-abdul-basir-imam-basuki.@guru.com', 'guru', 5, NULL, '$2y$12$GUqPSAyoyH3F4faKrcPQeeKr3xHMgtuDkYfOMV8k3oXV6XPAj/h7S', 2, NULL, '2025-10-01 01:39:31', '2025-10-01 01:39:31', 135),
(1511, 'Nandang Hermana', '197806122003121005', 'nandang-hermana.@guru.com', 'guru', 5, NULL, '$2y$12$qco/d9EOiH56SJkK.e9PReinz4CwM4rXkFzkc1lGRLX43AhZcpR4G', 2, NULL, '2025-10-01 01:39:31', '2025-10-01 01:39:31', 136),
(1512, 'Nasrodin', '198106102024211005', 'nasrodin.@guru.com', 'guru', 5, NULL, '$2y$12$c7qXnyT1BK5hy45q0EGXOeRMYWPSbl.4WyDsgPxZ0U0X0oxWp9eVG', 2, NULL, '2025-10-01 01:39:31', '2025-10-01 01:39:31', 137),
(1513, 'Neng Wida Nurdiani', '111222333344444555', 'neng-wida-nurdiani.@guru.com', 'guru', 5, NULL, '$2y$12$H1h.QXiuay6JeFdCmMnznuUNzcvG7HHE8NyLEKuPuhwMaSRiNFVFO', 2, NULL, '2025-10-01 01:39:31', '2025-10-01 01:39:31', 138),
(1514, 'Neny Yunaeti', '198201252007012006', 'neny-yunaeti.@guru.com', 'guru', 5, NULL, '$2y$12$lful62532q07vyp.nQoEJOGAsdPREV1.T38I8.8PWD.hhaswOU6FS', 2, NULL, '2025-10-01 01:39:32', '2025-10-01 01:39:32', 139),
(1515, 'Nia Kurniasih', '197903082025212002', 'nia-kurniasih.@guru.com', 'guru', 5, NULL, '$2y$12$SYX6FJQr4Sfxl8U4nRzVROaDaM3oq3NaATe5td0N.ma8hpAyLPPle', 2, NULL, '2025-10-01 01:39:32', '2025-10-01 01:39:32', 140),
(1516, 'Niawati', '198103072022212025', 'niawati.@guru.com', 'guru', 5, NULL, '$2y$12$A5el0F2NFUKJcDhKPzBOLO2xw0XL2hobw.X.Fs4P6uzYrb7eGpWZO', 2, NULL, '2025-10-01 01:39:32', '2025-10-01 01:39:32', 141),
(1517, 'Ninik Kurniati', '198406062009022011', 'ninik-kurniati.@guru.com', 'guru', 5, NULL, '$2y$12$Q2m9JKtikl.VXLOUEzzcBeEVd8mwN9HEerX4KKjNtMsv/uboZGRCa', 2, NULL, '2025-10-01 01:39:32', '2025-10-01 01:39:32', 142),
(1518, 'Novi Maulani', '198611102024212028', 'novi-maulani.@guru.com', 'guru', 5, NULL, '$2y$12$8ne.2dmO2jrTBWuKm4axXuKAUt8RnDTvjNaSPgZWcQVNRuhee6hwa', 2, NULL, '2025-10-01 01:39:33', '2025-10-01 01:39:33', 143),
(1519, 'Novi Nur Istiqomah', '234232334365764786', 'novi-nur-istiqomah.@guru.com', 'guru', 5, NULL, '$2y$12$ED51sczuK0w0fDekxe.a1u4AfY0cM3IgqbeN5zunUuWZwK.xf9K2K', 2, NULL, '2025-10-01 01:39:33', '2025-10-01 01:39:33', 144),
(1520, 'Nurhayati', '198205052009022008', 'nurhayati.@guru.com', 'guru', 5, NULL, '$2y$12$LFa.DgdHmaH9bShks28vee9oA2ArV.7Iu4ip44F9OWvAH8sPku/IS', 2, NULL, '2025-10-01 01:39:33', '2025-10-01 01:39:33', 145),
(1521, 'Nurul Hidayati', '198210252025212005', 'nurul-hidayati.@guru.com', 'guru', 5, NULL, '$2y$12$GJsd8tpRJNV8Xlu77.KriO7o/wnCcAIXKB.CFyu5Y7nuCTbC1S/ce', 2, NULL, '2025-10-01 01:39:33', '2025-10-01 01:39:33', 146),
(1522, 'Popi Suprapti', '198510182023212023', 'popi-suprapti.@guru.com', 'guru', 5, NULL, '$2y$12$bOAEIgsA5K3tv9jMEyXLS.ifEtTMpvNmVZ.MxtTgngbAFi.zaHWjW', 2, NULL, '2025-10-01 01:39:34', '2025-10-01 01:39:34', 147),
(1523, 'Pribadi Ramadhan', '199502152020121007', 'pribadi-ramadhan.@guru.com', 'guru', 5, NULL, '$2y$12$JZTWBrUyih5hISB0haWkWOaPP3NgdjsHYehv1k32GK9Gfb76J4Tne', 2, NULL, '2025-10-01 01:39:34', '2025-10-01 01:39:34', 148),
(1524, 'Pusparani', '197107282006042012', 'pusparani.@guru.com', 'guru', 5, NULL, '$2y$12$XJw2j6DcJVvHJKOlyLG4K.Yv5n42oH30gt5ldlQfR1wwPtj.kqEXO', 2, NULL, '2025-10-01 01:39:34', '2025-10-01 01:39:34', 149),
(1525, 'Putri Marlistiasari', '199410132024212035', 'putri-marlistiasari.@guru.com', 'guru', 5, NULL, '$2y$12$vnrXREfk0MlO0XeeNoiUSeCryN9AWweyF6xX32Ji1EGqRxZZc/MtK', 2, NULL, '2025-10-01 01:39:34', '2025-10-01 01:39:34', 150),
(1526, 'Renita Wildy Hernanda', '786767677876767676', 'renita-wildy-hernanda.@guru.com', 'guru', 5, NULL, '$2y$12$7PvdUSrtQ5ypFAb1cKKZ7.hSV6Bw47YtLe5JjsF2YAoe.5OlzyrSe', 2, NULL, '2025-10-01 01:39:35', '2025-10-01 01:39:35', 151),
(1527, 'Rian Fauzi', '199207072022211009', 'rian-fauzi.@guru.com', 'guru', 5, NULL, '$2y$12$aEMhxdNWoZgQ8LzaDsJefuSc5tTxnWr0uUpLoEp4KGkcIquZIMp/m', 2, NULL, '2025-10-01 01:39:35', '2025-10-01 01:39:35', 152),
(1528, 'Rini Dinarwati', '198207102022212024', 'rini-dinarwati.@guru.com', 'guru', 5, NULL, '$2y$12$lheTlN2iE5rGPkOIKYbQge2WlLao9YnGDOCFDUh4qMVSv3AulKOKW', 2, NULL, '2025-10-01 01:39:35', '2025-10-01 01:39:35', 153),
(1529, 'Rini Uswati', '197608252009022002', 'rini-uswati.@guru.com', 'guru', 5, NULL, '$2y$12$24atCU/wqnHhy2f6GdkzIOmiOdzlhxFuagFKAfN2T6q86UyOX5aRq', 2, NULL, '2025-10-01 01:39:35', '2025-10-01 01:39:35', 154),
(1530, 'Risdiyan', '197701172006041008', 'risdiyan.@guru.com', 'guru', 5, NULL, '$2y$12$.RKMYRe3KXJBnLPBcd5t/OUSLXQ.jCQHPAIb8xpFjFiAJn7fSTI8q', 2, NULL, '2025-10-01 01:39:36', '2025-10-01 01:39:36', 155),
(1531, 'Roni Susanto', '198401012023211015', 'roni-susanto.@guru.com', 'guru', 5, NULL, '$2y$12$LwvRKn7B2wDlxh.f9iERPunAkXozY2czLfJNwmcqV6nU0ySY30562', 2, NULL, '2025-10-01 01:39:36', '2025-10-01 01:39:36', 156),
(1532, 'Ruslan Nur Iskandar', '196912171997021003', 'ruslan-nur-iskandar.@guru.com', 'guru', 5, NULL, '$2y$12$3dYGMIhaX4JAGd9kfKa2.uDCess9PdTikd2qjvpQ/75mX/w4G1zry', 2, NULL, '2025-10-01 01:39:36', '2025-10-01 01:39:36', 157),
(1533, 'Sandi Saputra', '199307212022211005', 'sandi-saputra.@guru.com', 'guru', 5, NULL, '$2y$12$ShVtgwG80fT26QqQ0f.RVewgDcILI9RjnzkAuqLCMNyIZIiUu7Isq', 2, NULL, '2025-10-01 01:39:36', '2025-10-01 01:39:36', 158),
(1534, 'Sintia', '199202182020122011', 'sintia.@guru.com', 'guru', 5, NULL, '$2y$12$BBHJjqp8.v8bc8H6koQGUuM1/Oix.mBEaYhrGu3JpsB41hIz.r.dS', 2, NULL, '2025-10-01 01:39:37', '2025-10-01 01:39:37', 159),
(1535, 'Siska Rachmawati', '199611232022212013', 'siska-rachmawati.@guru.com', 'guru', 5, NULL, '$2y$12$KWh4T2NvcsOikl1sYSK74.QCeFgVT3rBeQ/XdupifR2SKHwLrOUw2', 2, NULL, '2025-10-01 01:39:37', '2025-10-01 01:39:37', 160),
(1536, 'Siti Nurmei Muliati', '199505042023212024', 'siti-nurmei-muliati.@guru.com', 'guru', 5, NULL, '$2y$12$ZnvAPhkbdORmVqpgNskid.O6IexSUPf.BOJ3aIVXYRTc.dr9gYCzK', 2, NULL, '2025-10-01 01:39:37', '2025-10-01 01:39:37', 161),
(1537, 'Siti Rodiah', '198601202009022009', 'siti-rodiah.@guru.com', 'guru', 5, NULL, '$2y$12$7SCG6hQ7EidXxrw0MF909.QlDalocmrqlXBi1c3ZO1wlAasrjqQrW', 2, NULL, '2025-10-01 01:39:38', '2025-10-01 01:39:38', 162),
(1538, 'SITI ROHIMAH', '199506152022212007', 'siti-rohimah.@guru.com', 'guru', 5, NULL, '$2y$12$En3oQyjpqOyuo3otFm4ns.0Vw/uL/wiU1OyvAjE15fsm/V2KDTeya', 2, NULL, '2025-10-01 01:39:38', '2025-10-01 01:39:38', 163),
(1539, 'Solihudin', '198308152023211013', 'solihudin.@guru.com', 'guru', 5, NULL, '$2y$12$UxQ9e666g74zlR45/Ve71.E2R8SuHxNZgqct8uakhBo5GrcyikyRe', 2, NULL, '2025-10-01 01:39:38', '2025-10-01 01:39:38', 164),
(1540, 'Sukatmi', '197010152005012008', 'sukatmi.@guru.com', 'guru', 5, NULL, '$2y$12$sn4KcXITZlOBuPoYs3KJauToEQQ/GJSadSOrvwR/q5dk0s.Epfur6', 2, NULL, '2025-10-01 01:39:38', '2025-10-01 01:39:38', 165),
(1541, 'Suryana', '196510012022211001', 'suryana.@guru.com', 'guru', 5, NULL, '$2y$12$3p5h57diweUmA27jjVVn1eI6m6rG8vpNnbOVskmGroMPPqLp.nfO.', 2, NULL, '2025-10-01 01:39:39', '2025-10-01 01:39:39', 166),
(1542, 'Susi Rukhmiati', '198004292009022003', 'susi-rukhmiati.@guru.com', 'guru', 5, NULL, '$2y$12$sqif3SDcrWRX59QP2MM49uHdR5sSvr/BjWTPLW5uMqQt6N8EqMaim', 2, NULL, '2025-10-01 01:39:39', '2025-10-01 01:39:39', 167),
(1543, 'Tiara Ristinasari', '098780778689978976', 'tiara-ristinasari.@guru.com', 'guru', 5, NULL, '$2y$12$CrMw4c1Sw3leSmys4Iaxzu7DtGW.PzfIHxQuQoYDfKdrgA1RS9y/q', 2, NULL, '2025-10-01 01:39:39', '2025-10-01 01:39:39', 168),
(1544, 'Upen', '198808142022211007', 'upen.@guru.com', 'guru', 5, NULL, '$2y$12$l.NsehJ9CdjAuzfTK6tuHeWY3mb8jDNoHyTa1c8R9EVIIm3uUPcdy', 2, NULL, '2025-10-01 01:39:39', '2025-10-01 01:39:39', 169),
(1545, 'Vera Cahya Gumilar', '199204072022212017', 'vera-cahya-gumilar.@guru.com', 'guru', 5, NULL, '$2y$12$7zBKTtllMHVL1zXS5qcayed.JUlYDKHtt69DWr0/rPc/aIrrCnQKy', 2, NULL, '2025-10-01 01:39:40', '2025-10-01 01:39:40', 170),
(1546, 'Vevi Supriyanti', '199410012022212017', 'vevi-supriyanti.@guru.com', 'guru', 5, NULL, '$2y$12$s0nPJhrPwarg5/8vMAzyT.2QEyLm2DCVWrENGIAaag3yudqq6mN5C', 2, NULL, '2025-10-01 01:39:40', '2025-10-01 01:39:40', 171),
(1547, 'Wiwin Supriatin', '196707232005012001', 'wiwin-supriatin.@guru.com', 'guru', 5, NULL, '$2y$12$F4PCfrKJjZdK4bBiaXf1GefyuNxlvfhOzYk/lbuj8GIVqmDh6mogy', 2, NULL, '2025-10-01 01:39:40', '2025-10-01 01:39:40', 172),
(1548, 'Yanti Kadaryati', '196609222005012003', 'yanti-kadaryati.@guru.com', 'guru', 5, NULL, '$2y$12$lclDuWFFS.1ZS7/A.UDJ.uR1I.5.ztLrx9suI4YiSbj4WQHfDQSIm', 2, NULL, '2025-10-01 01:39:40', '2025-10-01 01:39:40', 173),
(1549, 'Yusup Zarkasi', '199312092023211005', 'yusup-zarkasi.@guru.com', 'guru', 5, NULL, '$2y$12$FcJ7n6WkYpnRY6g4xLmtBuzGvzzaEh.ontre9uD02CEfCXzZOc./a', 2, NULL, '2025-10-01 01:39:41', '2025-10-01 01:39:41', 174),
(1551, 'humas', 'humas', 'admin@humas', 'admin_sekolah', 5, NULL, '$2y$12$GIJeAuEKgCay0vMs8XBn3O.TtjcohIfcyvlL2RgOYE5wtzCLTBeNK', 4, NULL, '2025-10-08 00:48:35', '2025-10-08 00:48:35', NULL),
(1554, 'humas 1 ', 'humassmea', 'delia@gmail.com', 'admin_sekolah', 5, NULL, '$2y$12$Kz3PAPGYnqO/3H1PYcCSVOHBrGB0nO1QXG3fa56lpZVcQ8md2ivuS', 4, NULL, '2025-10-13 07:07:27', '2025-10-13 07:07:27', NULL),
(1563, 'Ibnu (Robotic School)', 'ibnu.robotic-school', 'ibnu.robotic-school@dudi.pembimbing.com', 'dudi_pembimbing', 5, NULL, '$2y$12$6ZaU/HYsZdQIpnN9IlOk0.JCilaH/uBZheddhRKtTrqKEgeovuoRS', 5, NULL, '2025-10-23 10:35:44', '2025-10-23 10:35:44', 22),
(1564, 'Ayu (Access Media)', 'ayu.access-media', 'ayu.access-media@dudi.pembimbing.com', 'dudi_pembimbing', 5, NULL, '$2y$12$9BN1/IQ3LlKK0.LU9F9A0..Kvp8vJ6iQhr1MJBXSXaQoKv.a3vFgu', 5, NULL, '2025-10-23 10:36:22', '2025-10-23 10:36:22', 23),
(1565, 'malik (Robotic School)', 'malik.robotic-school', 'malik.robotic-school@dudi.pembimbing.com', 'dudi_pembimbing', 5, NULL, '$2y$12$7rgpEiW2a1EgSdZZVqoN2e.NwLqvamAu5IPhWK9YLhQOBUYj6cgJ2', 5, NULL, '2025-10-23 10:36:46', '2025-10-23 10:36:46', 24),
(1566, 'malik (Access Media)', 'malik.access-media', 'malik.access-media@dudi.pembimbing.com', 'dudi_pembimbing', 5, NULL, '$2y$12$3oso.b5mu4Ckk9OtSmpXSOtJ7toq4mnKhNLmXzANDeosqX7RVeqHy', 5, NULL, '2025-10-23 10:37:21', '2025-10-23 10:37:21', 25),
(1572, 'John Doe', '1234567890', '1234567890@siswa.com', 'siswa', 5, NULL, '$2y$12$LV0DTGxX4JEuIQb.OPRkqOcp7jWvjt6NIAzjRptMAdEROADEkpi4u', 1, NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44', 2094),
(1573, 'Jane Smith', '0987654321', '0987654321@siswa.com', 'siswa', 5, NULL, '$2y$12$h2soUEyZW3IRn/6Fm1zQUOFvybD3kaS1DgFBQT9gdsxPknSd4kg/m', 1, NULL, '2025-11-06 13:52:44', '2025-11-06 13:52:44', 2095),
(1574, 'Damian', '198001012010011001', 'damian.@guru.com', 'guru', 5, NULL, '$2y$12$LAdH.H75Zw9rY3V06ylzLuT7kOfIGx0WtlOgdWLEJ80IxBMJjjOkW', 2, NULL, '2025-11-06 14:05:20', '2025-11-06 14:05:20', 175),
(1575, 'Admin SMA NEGERI PULAUKELAPA', 'sma_negeri_pulaukelapa', 'sma-negeri-pulaukelapa@admin.sekolah.com', 'admin_sekolah', 6, NULL, '$2y$12$t0Z4cHq5JFRdioc7DHhG/e9h3E8sRNVFbIbW3oUrc6BufLrZ0iVtq', 4, NULL, '2025-11-06 14:23:13', '2025-11-06 14:23:13', 6),
(1576, 'John Doe', '8573825709', '8573825709@siswa.com', 'siswa', 6, NULL, '$2y$12$E9e6Ecttx37Ehg3UgLtA3OmoCl745Tx1hQiW6/wcTcAFlamWgK6vG', 1, NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21', 2097),
(1577, 'Jane Smith', '0129392472', '0129392472@siswa.com', 'siswa', 6, NULL, '$2y$12$pllTGVjnt7oJizkJbsTpSeNDXP943t0JrGsoThNqS2HnbkQVwU6Ai', 1, NULL, '2025-11-07 14:12:21', '2025-11-07 14:12:21', 2098),
(1578, 'Danang', '903275328975209', 'danang.@guru.com', 'guru', 6, NULL, '$2y$12$YtGj5djgsM4yihFhVw3LdeLDsC4obv90S9T97ab2pKvFWtq8apQ5C', 2, NULL, '2025-11-07 14:15:55', '2025-11-07 14:15:55', 176),
(1579, 'Budi', '00924729864252', 'budi.@guru.com', 'guru', 6, NULL, '$2y$12$AnfIGnpbB1XHlqtl43vcXu4UmHeOw2/dymNSkrIcUQ/3LROk7q/Wy', 2, NULL, '2025-11-07 14:15:56', '2025-11-07 14:15:56', 177),
(1580, 'Asep (Disnaker Banjar)', 'asep.disnaker-banjar', 'asep.disnaker-banjar@dudi.pembimbing.com', 'dudi_pembimbing', 6, NULL, '$2y$12$ALrLYVmZme4lyz49jvHMEeNw1VY/m9qyUuvlY8Lf7f/IUKeeRlX4G', 5, NULL, '2025-11-07 14:32:58', '2025-11-07 14:32:58', 31),
(1581, 'Malik (Disnaker Banjar)', 'Malik Mantap', 'malik.disnaker-banjar@dudi.pembimbing.com', 'dudi_pembimbing', 6, NULL, '$2y$12$p2hYS3E8bdPpF2RPoAibeeyXkhGYwDmNTEKVQ.VWp1zEm76EgLjTm', 5, NULL, '2025-11-07 15:22:41', '2025-11-08 12:57:34', 32),
(1582, 'Lily (Prilude Studio)', 'lily.prilude-studio', 'lily.prilude-studio@dudi.pembimbing.com', 'dudi_pembimbing', 6, NULL, '$2y$12$JanXp0sZRkzuxap54Gbi6.mdZ4x/HRAXJOe/.4.IKWfWtELv86oh.', 5, NULL, '2025-11-07 16:46:02', '2025-11-07 16:46:02', 35),
(1583, 'test', 'test', 'test@siswa.com', 'siswa', 6, NULL, '$2y$12$vdq4azUwHwV8c/pczn4pE.kMAIOC.u9lpLAnTUacFuixEWNXdVCXi', 1, NULL, '2025-11-08 13:41:43', '2025-11-08 13:41:43', 2099),
(1584, 'Admin SEKOLAH TEST', 'sekolah_test', 'sekolah-test@admin.sekolah.com', 'admin_sekolah', 7, NULL, '$2y$12$jv1s3g9DpuW9PsgCehfEge3PnDps9Fa3upiCxG9hx0wUEDXZ5H0x.', 4, NULL, '2025-11-09 14:23:18', '2025-11-09 14:23:18', 7),
(1585, 'TEST 1', 'TEST1234', 'TEST@gmail.com', 'admin_sekolah', 7, NULL, '$2y$12$n08ULwJ7Rk8rAjpw9OKbeeBwkmCkDj2LbMl8Cq1oBCbr6cNp7l40e', 4, NULL, '2025-11-09 14:25:21', '2025-11-09 14:25:21', NULL),
(1586, 'TESTING', 'TESTING123', 'TESTING@gmail.com', 'admin_sekolah', 6, NULL, '$2y$12$YWuVRc/mU92BpstN9oAvnuLHvrtVD1jlDHk8hpbA.9pW/5gJYtd.e', 4, NULL, '2025-11-10 02:23:49', '2025-11-10 02:23:49', NULL),
(1587, 'jk', '6758', '6758@siswa.com', 'siswa', 6, NULL, '$2y$12$tIy2WMqLXkuPxX1jiqBbJekqqYzocPMysUN3ke6N8R9e1HjaoXKz2', 1, NULL, '2025-12-08 04:38:02', '2025-12-08 04:38:02', 2100),
(1588, 'Malik (Prilude Studio)', 'malik.prilude-studio', 'malik.prilude-studio@dudi.pembimbing.com', 'dudi_pembimbing', 6, NULL, '$2y$12$.zPSjpbX47Xn7tunIBABzu7jasFfBfcGJ/0qaO8QeVUeDhkgOEGgu', 5, NULL, '2025-12-08 04:38:31', '2025-12-08 04:38:31', 36),
(1589, 'Admin SMA TEST', 'sma_test', 'sma-test@admin.sekolah.com', 'admin_sekolah', 8, NULL, '$2y$12$MsZT0N4EJllBC2NrdCnXH.bDyllSKZ1yVAusS2cYmzUogpB3845Gm', 4, NULL, '2025-12-09 07:43:14', '2025-12-09 07:43:14', 8),
(1590, 'test (test)', 'test.test', 'test.test@jurnalpkl.id', 'dudi_pembimbing', 6, NULL, '$2y$12$bHFAWBD02A.m623vz/iMduLdApLCt9tk6wEq89cQAxDh2fgUEzvzW', 5, NULL, '2025-12-16 09:59:33', '2025-12-16 09:59:33', 37),
(1591, 'AdminJurnal.id', 'adminjurnal', 'adminjurnal@jurnalpkl.id', 'super_admin', NULL, NULL, '$2y$12$UmQ5Tb6EMaOABdMJC47WfeKZdwEZnE6JWMgMTMkr8pBvVYzWP1ECW', 0, NULL, NULL, NULL, NULL),
(1592, 'Orangtua dari ALFIAH AZZAHRA', 'ortu_2324101289', 'ortu_2324101289@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3VH2ESbj4LlHO6yhDzYK2u3zNmiWC.DOkRvp9nyr1f.9eotmKxoLC', 6, NULL, '2025-12-18 03:02:26', '2025-12-18 03:02:26', 1570),
(1593, 'Orangtua dari ALIKA RAHMAWATI', 'ortu_2324101290', 'ortu_2324101290@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$rg06GO6l9uyxSlKqozGDFOVtbCBud4avZ61NTw0V0FcmhvpOPdaau', 6, NULL, '2025-12-18 03:02:26', '2025-12-18 03:02:26', 1571),
(1594, 'Orangtua dari ANISA RAHMA SAPITRI', 'ortu_2324101291', 'ortu_2324101291@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$dKEHVVXxQCmpcsxdx.iEce/ZjYZcR0tQ6fh71223wpI7VlRPeP9B6', 6, NULL, '2025-12-18 03:02:27', '2025-12-18 03:02:27', 1572),
(1595, 'Orangtua dari AYU SAKILA', 'ortu_2324101292', 'ortu_2324101292@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$p/WgudXIJ8ibiYZiqbKu6eHxVgVHtqasPKaSKZ9L.rCJ02E4tMR.K', 6, NULL, '2025-12-18 03:02:27', '2025-12-18 03:02:27', 1573),
(1596, 'Orangtua dari DEVIA UTARI', 'ortu_2324101293', 'ortu_2324101293@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$XkxBwMsjcJQnDni03Ssdp.v296cqy4mOby4ZQ1ipL4OjJHn3yIq8C', 6, NULL, '2025-12-18 03:02:27', '2025-12-18 03:02:27', 1574),
(1597, 'Orangtua dari DINI AHIRUL DESTIANTI', 'ortu_2324101294', 'ortu_2324101294@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$KdPWJ4uACOxzDfuIcRrh4Ofm21eb3vej1n.Lc6uBTSoqeludCuKVO', 6, NULL, '2025-12-18 03:02:28', '2025-12-18 03:02:28', 1575),
(1598, 'Orangtua dari Dzakir Azhar', 'ortu_2324101295', 'ortu_2324101295@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$A1B0joM5DeWvxMQ48zyR2u/bst58IDhOhEcIg70iDfnEIhdgX0Lzu', 6, NULL, '2025-12-18 03:02:28', '2025-12-18 03:02:28', 1576),
(1599, 'Orangtua dari Elvira Khaerunissa', 'ortu_2324101296', 'ortu_2324101296@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wh..yyC1szznhzG3AFwTkuOStribhAvUbz2iuKSO.X33p0tX7DWbm', 6, NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29', 1577),
(1600, 'Orangtua dari FINANDA YUGA MANGGALA', 'ortu_2324101297', 'ortu_2324101297@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$TzJSDRShxFzBTZ1LHDSs5uAG7IBkS.qLFFY.UQJABVwAg9TuKB5Om', 6, NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29', 1578),
(1601, 'Orangtua dari FITRI SASKIA RAMADHANI', 'ortu_2324101298', 'ortu_2324101298@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3UOjgLlxARkGlCIUR78uZ.CvxaVpszRbWb3XMPIK7RG3SgiM1EoLS', 6, NULL, '2025-12-18 03:02:29', '2025-12-18 03:02:29', 1579),
(1602, 'Orangtua dari GALANG', 'ortu_2324101299', 'ortu_2324101299@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$G0JdZbVBsYZAU.wsimd4cOkFNk2nis3niS1vksG6htg9tv17aiMl6', 6, NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30', 1580),
(1603, 'Orangtua dari GALANG FIRMANSYAH', 'ortu_2324101300', 'ortu_2324101300@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$cMcbtaWfZSvX4BSEVbnqwuv7siRqWsITYh4T9ln5VaBhPXUvA5DV6', 6, NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30', 1581),
(1604, 'Orangtua dari GISCA NAFISA DESTIANA', 'ortu_2324101301', 'ortu_2324101301@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wnQG./XwVfJrdVqG3ncJVOFnnbZXv4j4fjvn4o0VGEL0aSd2EmfFu', 6, NULL, '2025-12-18 03:02:30', '2025-12-18 03:02:30', 1582),
(1605, 'Orangtua dari HAMIA NURALIA ZAHRA', 'ortu_2324101302', 'ortu_2324101302@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zWsl.EgaOY9BK6UZgHI0eO6KZmsTewsb759gFiCOexEaZndLRCBC2', 6, NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31', 1583),
(1606, 'Orangtua dari MARSHA ADELIA PUTRI RIDWANSYAH', 'ortu_2324101303', 'ortu_2324101303@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Olp7LPTljvxOticb3BefQOgG9hJ84gKVCAcYFJ/PbbTdWOpKrB7Rq', 6, NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31', 1584),
(1607, 'Orangtua dari MARTESA PASKARIANTY', 'ortu_2324101304', 'ortu_2324101304@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4wFl8ywfo/WtGTIbrkzp7u0QiDlAkzUP/3nQKnXPQ37CNnkan48E6', 6, NULL, '2025-12-18 03:02:31', '2025-12-18 03:02:31', 1585),
(1608, 'Orangtua dari MEILINDA KHOERUNNISA', 'ortu_2324101305', 'ortu_2324101305@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$aLepsS6ko5BdX0LJwtd6TO7S9.ME1itLien0h3sGmBb4qCV5A./De', 6, NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32', 1586),
(1609, 'Orangtua dari MIFTAHUL KHOIR', 'ortu_2324101306', 'ortu_2324101306@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3JrbWI/RPBKXowIIMDiK2eas38lfIpSfTpO9hnrI2uTyLlbIngJqC', 6, NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32', 1587),
(1610, 'Orangtua dari MUHAMMAD FACHRI NUGRAHA', 'ortu_2324101542', 'ortu_2324101542@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$n45ZikNx4cda3y3FtGqY6OpFT2HfyI/F6eINoI5S8qGsJYmU4qbj.', 6, NULL, '2025-12-18 03:02:32', '2025-12-18 03:02:32', 1588),
(1611, 'Orangtua dari MUTHYA PRATIWI', 'ortu_2324101307', 'ortu_2324101307@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jGRlMAn0CgIt4RmVlWaMtuG6zK8Dy/lDlcJay12w9LEAak78vpjPK', 6, NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33', 1589),
(1612, 'Orangtua dari Nafisa Salsabila Ramadhani', 'ortu_2324101308', 'ortu_2324101308@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8W.ZnoSsIJDFg/J06nfoouykg2tNId/0m04WdrWRRqa1YAJzUhSNO', 6, NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33', 1590),
(1613, 'Orangtua dari Nasya Saufika Wati', 'ortu_2324101309', 'ortu_2324101309@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BUZG3.YtHjxS/E4bFV974uXGPZM/zQ56fw.yc0ZPd53SKhmgaK2pG', 6, NULL, '2025-12-18 03:02:33', '2025-12-18 03:02:33', 1591),
(1614, 'Orangtua dari Nazhara Syahida', 'ortu_2324101310', 'ortu_2324101310@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Crlga9MN8LD1dJZuMz4IRuuCW35evWjMJH9Do4bC0Q/ITwnEgyvXq', 6, NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34', 1592),
(1615, 'Orangtua dari Nuri Awwaliah', 'ortu_2324101312', 'ortu_2324101312@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$guDT8f/J0fcM32Z8OMSNIu.XYjEtJEbaEFUeOys/xMJpxq//MCJ0S', 6, NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34', 1593),
(1616, 'Orangtua dari RACHEL PUTRI RAMADHANI', 'ortu_2324101313', 'ortu_2324101313@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vZ0f9YNByGQmAq5nOidgc.UJwlX/1tdeg..Ys1y07ST5Bf/GFY8VK', 6, NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34', 1594),
(1617, 'Orangtua dari RAIHAN SUPRYATNA', 'ortu_2324101314', 'ortu_2324101314@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ylXfqlh0W9jEEGs0N23yzOgDZ3t5/ZbCKcP0DPiX2tPG3GkPiokuG', 6, NULL, '2025-12-18 03:02:34', '2025-12-18 03:02:34', 1595),
(1618, 'Orangtua dari Raisya Isni Masdiana', 'ortu_2324101315', 'ortu_2324101315@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$aPqRi6ErnbJPFAnv2SjKH.RjYwidGoF1TnSDDQK6SqYNj6vMqNcAC', 6, NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35', 1596),
(1619, 'Orangtua dari Rapi Priatna', 'ortu_2324101316', 'ortu_2324101316@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lT8zPnTE6i0Gr2fVpeJ2M.8C2UdUL2QgDWl1nMKNTI9MENAeRdbH.', 6, NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35', 1597),
(1620, 'Orangtua dari RAYZA HUMAIRA', 'ortu_2324101317', 'ortu_2324101317@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jvem4Ea2NceGAedXQLgyLe0p5xWQGV.PTJGmyYvlAugZ3V2zGlD7a', 6, NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35', 1598),
(1621, 'Orangtua dari Refan Pratama', 'ortu_2324101318', 'ortu_2324101318@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CfiZYMvBmq2.WbHaHlqfU.OLrgikBF1i8CgenXQl8QDe4S1UzMJlm', 6, NULL, '2025-12-18 03:02:35', '2025-12-18 03:02:35', 1599),
(1622, 'Orangtua dari RINI APRIANI', 'ortu_2324101319', 'ortu_2324101319@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BXWwYctxXm0IJqp/Ac7mY.lDWADZMD9yW7eJFjykisMYGGFsFZDZu', 6, NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36', 1600),
(1623, 'Orangtua dari RIRIN CITRA NUR\'AENI', 'ortu_2324101320', 'ortu_2324101320@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$YQ5ERwNmZTjN5usDV0iyA.2q3ypA3VK9ai3YCMppdAWXvr/i97B0e', 6, NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36', 1601),
(1624, 'Orangtua dari SILPI HANDAYANI', 'ortu_2324101321', 'ortu_2324101321@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hxNndtVqqEvWAQAy1vyY3.A/.5lp5mCqWsAFIB.9oDUj.G2xCki4e', 6, NULL, '2025-12-18 03:02:36', '2025-12-18 03:02:36', 1602),
(1625, 'Orangtua dari Silva Julianty', 'ortu_2324101322', 'ortu_2324101322@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DVNlkZ9TbS3OoJMo75xeJOy4tNexJqMsKRlgVPZIEoN41xmZ4Urhe', 6, NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37', 1603),
(1626, 'Orangtua dari Wiliyanti Pergiwa', 'ortu_2324101324', 'ortu_2324101324@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$z/OvDn.AEjU3xYSqPl/i.OxTOLUBIDftpOOXAspTvKZK6O6b9q.62', 6, NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37', 1604),
(1627, 'Orangtua dari AGNI DWI LISTYANTO', 'ortu_2324101325', 'ortu_2324101325@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hQLAMOb90Ip527.sY1uLP.V.FB6lKgY0lU6vS5lLf.71qkrAPqICC', 6, NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37', 1605),
(1628, 'Orangtua dari Alya Sahwa Nuralif', 'ortu_2324101326', 'ortu_2324101326@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$GYifKXM38D7VPsLYZgKy5OsSoUptR3La0vDGSADOG97psCtyAjnMC', 6, NULL, '2025-12-18 03:02:37', '2025-12-18 03:02:37', 1606),
(1629, 'Orangtua dari AMELIA PUTRI', 'ortu_2324101327', 'ortu_2324101327@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8ElywYTGTT79ElDnROJyuejmzkVCKiaLj2KXiO3NrcJ6TN4oiCwUm', 6, NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38', 1607),
(1630, 'Orangtua dari Ayunda Pramesty Setiawan', 'ortu_2324101328', 'ortu_2324101328@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Z6KYUu5ZTmJ/vVnKOWlEiOD3KNgWzGFZP8k4P6ESohC.BnuDFyNJy', 6, NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38', 1608),
(1631, 'Orangtua dari Chelsi Aprilia Manik', 'ortu_2324101329', 'ortu_2324101329@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9ha0oupe99ToJ7uQASYURuMApACm5oxvXs/40mKC9i8211lJR5icm', 6, NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38', 1609),
(1632, 'Orangtua dari CHIKA AURELYA PUTRI ANJANI', 'ortu_2324101330', 'ortu_2324101330@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$SNUCFjzYA4vKxdrAtMi1tu8GiL4wrubf8af3DMOKIONaQ1OA6lEhG', 6, NULL, '2025-12-18 03:02:38', '2025-12-18 03:02:38', 1610),
(1633, 'Orangtua dari Dianty Syarifah Mechdar', 'ortu_2324101331', 'ortu_2324101331@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BGLues3g/Ny4rUmcuNrAVeHVs9oJgs84zx8fV8v6L3T0Jd3bHTOFe', 6, NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39', 1611),
(1634, 'Orangtua dari Dini Septriani', 'ortu_2324101332', 'ortu_2324101332@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bjq1uN3AxlQ3JQ5NheL1Ne0jxN2k3J7Ohb0T3z4a3fIi6szH7RfKu', 6, NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39', 1612),
(1635, 'Orangtua dari DINNA NUR RAHMA', 'ortu_2324101333', 'ortu_2324101333@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$N3HmVHYoWXSdurCejMPEh.4hOkUMhaWel0g60nnZI8moCQy8fWDN6', 6, NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39', 1613),
(1636, 'Orangtua dari FATURROHMAN', 'ortu_2324101334', 'ortu_2324101334@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$dc4Jk9XX.uJVa3kLBrJrwuaeWi5qUYe4/3EyzAERIPDiGAYeY8lLG', 6, NULL, '2025-12-18 03:02:39', '2025-12-18 03:02:39', 1614),
(1637, 'Orangtua dari IKA OKTAVIANI', 'ortu_2324101335', 'ortu_2324101335@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Q8qjHDL7eaG6yCVljPOFA.YVU58vxNyKlriNcAvB0yNK.zuVCzrD2', 6, NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40', 1615),
(1638, 'Orangtua dari MARYAM PUSPA DEWI', 'ortu_2324101336', 'ortu_2324101336@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$tNiBF1t/0HrPi9UTKtBsN.ktXkss4SmQ5taaPSd1lZ8fJbZ/UAmoa', 6, NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40', 1616),
(1639, 'Orangtua dari MAYA SUPRIHATIN', 'ortu_2324101337', 'ortu_2324101337@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$eWd2RLhpmVSHZM452Jczle/RQfS9utgr8wuy.DkivZoHXuaVd78CW', 6, NULL, '2025-12-18 03:02:40', '2025-12-18 03:02:40', 1617);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(1640, 'Orangtua dari MEILANA GUSTIANA', 'ortu_2324101338', 'ortu_2324101338@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/eCZjNQRkPRBpbjttNtLZuCzsmA4Z1iATkE/xr8jtir41OHEDOnaq', 6, NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41', 1618),
(1641, 'Orangtua dari MEILANI FITRIANI', 'ortu_2324101339', 'ortu_2324101339@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$i4a2hDE9/nIQ0uNVdG67J.uINNYlVgArD.ybscaOjzbhEUN69/Ise', 6, NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41', 1619),
(1642, 'Orangtua dari MUHAMMAD NADIP SUDIRMAN', 'ortu_2324101340', 'ortu_2324101340@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wq5pteaiSC1ZE9uODXC6gObQnkbifLVLbGiabA35yVIwS5qAho2Zu', 6, NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41', 1620),
(1643, 'Orangtua dari NANDITA NOVELIA PUTRI SETIAWAN', 'ortu_2324101341', 'ortu_2324101341@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ewIye2W0TAJtpElAM9pJ2.LUbCVaXOxqviPJRFuP5ZfopWrKCiGCa', 6, NULL, '2025-12-18 03:02:41', '2025-12-18 03:02:41', 1621),
(1644, 'Orangtua dari NATHASYA ANANDIRA', 'ortu_2324101342', 'ortu_2324101342@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZMMXXu13hQIb.asZA8HlVeDKhJETkidpjKtPKZ.vXgqNtFcgCjeki', 6, NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42', 1622),
(1645, 'Orangtua dari NAYLA PUTRI MAHARANI', 'ortu_2324101343', 'ortu_2324101343@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.EU0ock8HfOM.ctUFm82keuogecQJaebfG6PxPSSPbccxgCIU8DGe', 6, NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42', 1623),
(1646, 'Orangtua dari Nazwa Ramadhaniah', 'ortu_2324101344', 'ortu_2324101344@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$O1kYOS.BsyMXExUm01ItHub0J4bMy5b6Qh7rvspvA3wQYamp/c8oa', 6, NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42', 1624),
(1647, 'Orangtua dari Nida Fairuz Anisah', 'ortu_2324101345', 'ortu_2324101345@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$plfd86K2oU2oEN0rFGofDe4sma2HuM.MI0ntGXsg/9ikTeKkJ6hHO', 6, NULL, '2025-12-18 03:02:42', '2025-12-18 03:02:42', 1625),
(1648, 'Orangtua dari NITA PUSPITASARI', 'ortu_2324101346', 'ortu_2324101346@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$A3NFP.r1oQEwNijDhjtgSOBJ3Cqbrt6FQJRHeN.T7JTk4xSsF18eC', 6, NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43', 1626),
(1649, 'Orangtua dari NURUL NUR IHSAN', 'ortu_2324101347', 'ortu_2324101347@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vtx3qyxYBwTKNorWNRjCeOsGPUVX5PojQmUC9cq0xiT4Lv1NMgawW', 6, NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43', 1627),
(1650, 'Orangtua dari RACHMA PUSPITA', 'ortu_2324101349', 'ortu_2324101349@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VMRYEVPwSBfa4dsGlZ9aPOj43Y5WjqecSmGRZpVOXW/.8BGgL3kTS', 6, NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43', 1628),
(1651, 'Orangtua dari Rangga Saputra', 'ortu_2324101350', 'ortu_2324101350@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Vep0yMzFP9K.r9oObDz6EuW6NtKzSARhZKMbfcHi3fDIoHeIjG.PW', 6, NULL, '2025-12-18 03:02:43', '2025-12-18 03:02:43', 1629),
(1652, 'Orangtua dari REPAN TRI RAHMAT', 'ortu_2324101351', 'ortu_2324101351@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CDAi4wfbTZHFO85SFtoiievcze4Nihbi9lyqNnO6PuZXoOXTthsc2', 6, NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44', 1630),
(1653, 'Orangtua dari Reva Alkalivi', 'ortu_2324101352', 'ortu_2324101352@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$sxjUh9dkzVtU2GL1qJy1zePx1wU3MwMVMOwnvbXlE/0Ch2S24j63e', 6, NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44', 1631),
(1654, 'Orangtua dari REVA OCTA PRATIWI', 'ortu_2324101353', 'ortu_2324101353@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$iITtOG43Y.yGecHYDc/Vz.swL8R9pOtVrTXd4IKoVxkBPLu/3Z9qO', 6, NULL, '2025-12-18 03:02:44', '2025-12-18 03:02:44', 1632),
(1655, 'Orangtua dari REVAN TRAKASYA', 'ortu_2324101354', 'ortu_2324101354@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2MlZxzgmFj.HnwUCQkfdqePRfFhYwpptaf4UTiyLhW2EsJQps6teO', 6, NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45', 1633),
(1656, 'Orangtua dari RIFA MEILANI', 'ortu_2324101355', 'ortu_2324101355@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qC2q5jQTH4DIVnFGRFzxAefJXc/UZlXOpFygCUtmnjLYUUWECx1Nu', 6, NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45', 1634),
(1657, 'Orangtua dari RISKA YULIANI', 'ortu_2324101356', 'ortu_2324101356@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$pUL84AkcY86S2J8gqOqSIuEOpBryqTOB0hdU/6hVUevubslHUwOgC', 6, NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45', 1635),
(1658, 'Orangtua dari SERLY HANDRAYANI', 'ortu_2324101357', 'ortu_2324101357@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$o7OoHRA51/E91MdFXlWRsORhsUADJ/13mVoI7fzxlQYlsTpCCsdCm', 6, NULL, '2025-12-18 03:02:45', '2025-12-18 03:02:45', 1636),
(1659, 'Orangtua dari SILVIANA PITRI MULYADI', 'ortu_2324101358', 'ortu_2324101358@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3oJK24spBQe06nfLjKICOOp0Qe1gdVy/hjZiFfw30DxVswxEYGioC', 6, NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46', 1637),
(1660, 'Orangtua dari SITI ROHMAYATI', 'ortu_2324101359', 'ortu_2324101359@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kJNxPjt7ZyAhc/1DTql/S.yBmhldb3Lts0p961TfIRlz/j.uVJre.', 6, NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46', 1638),
(1661, 'Orangtua dari Yunita Sari', 'ortu_2324101360', 'ortu_2324101360@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$han98UsQLEuR/pgMeh5qCOOJjglWkkqrW1qPG3ys4pRHV8DcTSA2i', 6, NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46', 1639),
(1662, 'Orangtua dari Ade vera latifah', 'ortu_2324101073', 'ortu_2324101073@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bH5xjRLE3iurvh3oPJ6tUOVcsjiOEMxFAzKWEt0Y2I5thKaFZwzRq', 6, NULL, '2025-12-18 03:02:46', '2025-12-18 03:02:46', 1640),
(1663, 'Orangtua dari ALIS AMELIA SARI', 'ortu_2324101074', 'ortu_2324101074@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hD..A/St6qkiO8Umbu2mVehWxYaQho2OBSPVP.7Tu3Dha80UR/tke', 6, NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47', 1641),
(1664, 'Orangtua dari Alsya Nurfadilah', 'ortu_2324101075', 'ortu_2324101075@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$c4Ifek2AOysd/e/8655.f.CM41hjIUbCh9UQyh6/mhHSsktJe95n2', 6, NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47', 1642),
(1665, 'Orangtua dari ANNISA ARTIKA FADILAH', 'ortu_2324101076', 'ortu_2324101076@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Vn89KXzJrsKZJxx9JAxkjukazBydTEqONFKcgqK6NNOAGhFlfEsmy', 6, NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47', 1643),
(1666, 'Orangtua dari ARIEF NURAHMAN', 'ortu_2324101077', 'ortu_2324101077@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$t4dbXWPTqKZ7VKw0E32.zOf2VigxqB8TQCYupUghFj95fiHr3Q9Ee', 6, NULL, '2025-12-18 03:02:47', '2025-12-18 03:02:47', 1644),
(1667, 'Orangtua dari Arta Yunita', 'ortu_2324101078', 'ortu_2324101078@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mzd9peb2HzP8HpyxfjtJTuOmAJdxjLkk6qW0T8tvyEZAbXSLcF1Km', 6, NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48', 1645),
(1668, 'Orangtua dari AYU LATIFA NURSABRINA', 'ortu_2324101079', 'ortu_2324101079@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$i752y80MVhJGa367btgUJ.jUrE/QuGGhQrscZIAum3x2u.QwR8G7i', 6, NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48', 1646),
(1669, 'Orangtua dari AZARAH TUSITA YUSLIANI', 'ortu_2324101080', 'ortu_2324101080@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$QH65B7IOZpAuSmtvnu8LQe2vlEDdt909gefN78OXSfQu0HoU5IwUi', 6, NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48', 1647),
(1670, 'Orangtua dari BUNGA RISMA RAMADHANTY', 'ortu_2324101081', 'ortu_2324101081@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$yDl9taJw8Yqfsm7FnPl1IeCe4uaKL0y26AmIOePTh95GggDdm8FUe', 6, NULL, '2025-12-18 03:02:48', '2025-12-18 03:02:48', 1648),
(1671, 'Orangtua dari Dinda Niken Pradita', 'ortu_2324101082', 'ortu_2324101082@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$08Wt.sU4h3h7JTz/LQMAHe.qTd59F3P073hz6zoPOGR3TJ.LvNple', 6, NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49', 1649),
(1672, 'Orangtua dari DWI NUGROHO', 'ortu_2324101083', 'ortu_2324101083@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qH40wdeP6MI8l9i0C57b1eYM9Z9KrJude9r6iuyQJGj38yyZfSDUa', 6, NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49', 1650),
(1673, 'Orangtua dari EGI NUGRAHA', 'ortu_2324101084', 'ortu_2324101084@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$O/rQ6vrZEbHHHz36/hwTw.txmC.VyH/fmhnHLzCNBMjWpD4H3Bac2', 6, NULL, '2025-12-18 03:02:49', '2025-12-18 03:02:49', 1651),
(1674, 'Orangtua dari HAZZA DWI NURHIDAYAT', 'ortu_2324101085', 'ortu_2324101085@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Vo4cYtcxVk.1qKq0ECIQO.a4JAUuhIg9bEmi4H1TmGHox18U8O0bi', 6, NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50', 1652),
(1675, 'Orangtua dari Hilda Raditya Ramadani', 'ortu_2324101086', 'ortu_2324101086@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4n1GYEZl1469SenZDly9tuHm2FDQfcwBvwODFnO6d2HxCqJ.Z1.6i', 6, NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50', 1653),
(1676, 'Orangtua dari ILHAM HANAFI', 'ortu_2324101087', 'ortu_2324101087@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$UXGXS23cbsKjx/dVwBrAsOcGt0nN3iFfmnGy1Qs5kUEeEzzzx0UdG', 6, NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50', 1654),
(1677, 'Orangtua dari JELITA RESTIANTY', 'ortu_2324101088', 'ortu_2324101088@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hbxma8gQLWKiOXx8OlvwpOs8YwDH4TquzrCowPLKRt15HXTmvhPpq', 6, NULL, '2025-12-18 03:02:50', '2025-12-18 03:02:50', 1655),
(1678, 'Orangtua dari Juliyanti', 'ortu_2324101089', 'ortu_2324101089@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BHyDyWd/95CI4N39GiOeY.ItAlB4uKiNLB3ylM8eMTTQtWrAPHXe.', 6, NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51', 1656),
(1679, 'Orangtua dari Khalisa Handini', 'ortu_2324101090', 'ortu_2324101090@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$IGLYS5RaUZMKIktiiwY5a.mygPYdHvM.9dUkPArGAJ8iga8SZvXKC', 6, NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51', 1657),
(1680, 'Orangtua dari KIKIM PATIMAH', 'ortu_2324101091', 'ortu_2324101091@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BSmAmaqBMR8kf5xKT1ASJOPZmX3RyZCvOrx5qUliuIjSyCnPwzqMi', 6, NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51', 1658),
(1681, 'Orangtua dari Miftahul Jannah', 'ortu_2324101092', 'ortu_2324101092@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vpA85eVRHgKKcwLMDBlnX.BrZ8GhiRSBjuLJcm9sT2A3twG3p8JjG', 6, NULL, '2025-12-18 03:02:51', '2025-12-18 03:02:51', 1659),
(1682, 'Orangtua dari Muhammad Fadillah Al Hijriyah', 'ortu_2324101093', 'ortu_2324101093@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZD7QUgnR3BPakmtv6ZE2Oe382kiiWm8/Q5MU.C9bSi30AlgoyUfSu', 6, NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52', 1660),
(1683, 'Orangtua dari NAURA ALIFA PUTRI RIZAL', 'ortu_2324101094', 'ortu_2324101094@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$SmKZoWlOluFnNRfLmHQLbOGZAhkCzNyDiGzrn4XD4xbXcT/OL.uNy', 6, NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52', 1661),
(1684, 'Orangtua dari NAZLA SHERLY NOER ISMAYANTI', 'ortu_2324101095', 'ortu_2324101095@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$JQrLL5UH4iafBl6ZWEzvF.EpSGEgEWaXsFn4Zp5vUwoG8lrcRztmC', 6, NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52', 1662),
(1685, 'Orangtua dari Nopa Juwita Indriyani', 'ortu_2324101096', 'ortu_2324101096@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Walo.G6Kkho3csCr50OsbeCWzLdqCrlzGGID7W2l2cpCsgPbOmpXO', 6, NULL, '2025-12-18 03:02:52', '2025-12-18 03:02:52', 1663),
(1686, 'Orangtua dari NURUL NURAZIZAH', 'ortu_2324101097', 'ortu_2324101097@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3sXq5iGuVk4BN.qAFpp54.MDBb/OTGhI6cytUBlphWN0s6Kc3AmtK', 6, NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53', 1664),
(1687, 'Orangtua dari Rayhan Nuryaqin', 'ortu_2324101098', 'ortu_2324101098@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9HJCaLZKdAu2uaCVD9D1DuPqbDCrygX9no6Yxve0RW2.8fIxHU06C', 6, NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53', 1665),
(1688, 'Orangtua dari RHOFIQ RAMDHANI', 'ortu_2324101099', 'ortu_2324101099@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VvpqPf7GfAvtaSJsE6MiouvKrFLi29U4Hd/C4iSZQx360a3N0RHya', 6, NULL, '2025-12-18 03:02:53', '2025-12-18 03:02:53', 1666),
(1689, 'Orangtua dari RISTI NURSITA', 'ortu_2324101100', 'ortu_2324101100@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VZHQ0hzc/75bjajybikTROiAFosGQ2hDVulIXW8/3loZqOjJBYTya', 6, NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54', 1667),
(1690, 'Orangtua dari RIZKY FAHRIZA HAKIKI', 'ortu_2324101101', 'ortu_2324101101@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$52bU8.Ntetvx1db1H2SunOxOEbbIY6SQ7xRJoIc/oPrJnO1Fls3HO', 6, NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54', 1668),
(1691, 'Orangtua dari SASA ARI JUANDA', 'ortu_2324101102', 'ortu_2324101102@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3AXX55HzT8HAfGgXJfd1Puy5wpeNFGegym/SglDv5VUN/WuDMFHuu', 6, NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54', 1669),
(1692, 'Orangtua dari SINTA NURJANAH', 'ortu_2324101103', 'ortu_2324101103@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DYEUqZJuVyj1tIgGConnSeCOGNRaRfaHInNtmhVjEtxqoUvIvUPma', 6, NULL, '2025-12-18 03:02:54', '2025-12-18 03:02:54', 1670),
(1693, 'Orangtua dari SYALWA SALSABILA', 'ortu_2324101104', 'ortu_2324101104@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$KoiI9Lx.aGuFuUrN2ITiyOU8Fmczp4k3eYPM1FteWaIAUb2OFkgeG', 6, NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55', 1671),
(1694, 'Orangtua dari TASYA APRIANI', 'ortu_2324101106', 'ortu_2324101106@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hoos/g/qH4AZfv9z1n0gJ.V2LVpj84p/Rjn8.clBunPyu7gEY.AKm', 6, NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55', 1672),
(1695, 'Orangtua dari Tiara Ayu Herliana', 'ortu_2324101107', 'ortu_2324101107@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$sJdg7nJVezm/tlj4yaU50O4DHbRtr8EhIeOIA8HuPX.tkvIRzHuqO', 6, NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55', 1673),
(1696, 'Orangtua dari WILDAN NUR FADILLAH', 'ortu_2324101108', 'ortu_2324101108@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bi8ag0gStvdG37cNF./45u2aho1.PA2EApo9RvHlWUWcx8Hh61SUi', 6, NULL, '2025-12-18 03:02:55', '2025-12-18 03:02:55', 1674),
(1697, 'Orangtua dari ADI FITRIANA', 'ortu_2324101109', 'ortu_2324101109@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$M.hIS9IG176vxia1b6VgtuFmDxRofsYKzHtlrhe8pdUCD.Xb7TB5O', 6, NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56', 1675),
(1698, 'Orangtua dari ADINDA RAMADANI', 'ortu_2324101110', 'ortu_2324101110@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PSPcKRY68hP8kh.T/dzOiuYpeASCX2xVmYXl4thaJLbbvWCrghY8O', 6, NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56', 1676),
(1699, 'Orangtua dari AMANDA RAENA DEWI', 'ortu_2324101111', 'ortu_2324101111@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$dGMAVhRAI6bhWIvg60xicuQpmgtrAKqOm4rdXKUdtxkavsoYjoLo2', 6, NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56', 1677),
(1700, 'Orangtua dari AMARA NUR APRILIA', 'ortu_2324101112', 'ortu_2324101112@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qDY3pT1YWnNvFTTnO.20PuLDGZ3KUh8DS3MMMSU0U7uamHadec7L6', 6, NULL, '2025-12-18 03:02:56', '2025-12-18 03:02:56', 1678),
(1701, 'Orangtua dari AMELIA GUSTAMI', 'ortu_2324101113', 'ortu_2324101113@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$64.KrzgVNOIyjvimzmBY6usZyDx/MmW8FmhWUE6SRzOJAataCZzUS', 6, NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57', 1679),
(1702, 'Orangtua dari ARGALIH SETIAWAN', 'ortu_2324101115', 'ortu_2324101115@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wbElMY5q0TV2aUoDn9FIEePV97y6Y3PL51R32FJR5.kpe2RCpECqi', 6, NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57', 1680),
(1703, 'Orangtua dari Arvia Deswita Saripudin', 'ortu_2324101116', 'ortu_2324101116@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nrth.6oPEkmhEzJzxtZJFurXy.CGkfbreLxPwRhEam7CGzpA4JeNG', 6, NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57', 1681),
(1704, 'Orangtua dari Asti Surastri', 'ortu_2324101117', 'ortu_2324101117@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4Cx4yozwAazkUxYEOGUnZu/034XgqHIqpNQyDK8nT8UFEYzJD9uOG', 6, NULL, '2025-12-18 03:02:57', '2025-12-18 03:02:57', 1682),
(1705, 'Orangtua dari AZKA SHIDDQIE HARUMAN', 'ortu_2324101118', 'ortu_2324101118@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nkWUdmxGf.oNuhdbD/N8UedwSYnlq6iYqRTU16aDuMiEsefcj1wjq', 6, NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58', 1683),
(1706, 'Orangtua dari Bunga Cinta Apriliani', 'ortu_2324101119', 'ortu_2324101119@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6zv99Pus5xv6G15NldoQqeYNcaeHFtdBf8lgPzchuDwzlwPAqhOpe', 6, NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58', 1684),
(1707, 'Orangtua dari Danar Khusnul Khofiza', 'ortu_2324101120', 'ortu_2324101120@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mflq5BRWMzC.sGnBBoyON.ccjr9d1tok4biGiZK4eFdZ/wwdDEIGW', 6, NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58', 1685),
(1708, 'Orangtua dari DARA AYU LARASATI', 'ortu_2324101121', 'ortu_2324101121@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$21278/iy0rhdlVTbdceejeFEcR2uC72ezx51aoLZOzKAFHa7F/tGW', 6, NULL, '2025-12-18 03:02:58', '2025-12-18 03:02:58', 1686),
(1709, 'Orangtua dari DELA HERLIAWATI', 'ortu_2324101122', 'ortu_2324101122@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fJYx.U0DdZRaOl21U4BUjOEo5i9bOfIDA5haENbikk7VNuLwUvtai', 6, NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59', 1687),
(1710, 'Orangtua dari EVA AISYAH RAHMAWATI', 'ortu_2324101123', 'ortu_2324101123@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$IfGNU5QwBgn7Yf4UUV2To.rBH5LVJcXPmSuNMSPlUt.AcmAhJKBKm', 6, NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59', 1688),
(1711, 'Orangtua dari Fetti Rizki Lestari', 'ortu_2324101124', 'ortu_2324101124@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$M.Xcbhym0Kynokq1YSDOOeI9wj1/tdNrSF3Fuflrt1y0cjgrX2dCa', 6, NULL, '2025-12-18 03:02:59', '2025-12-18 03:02:59', 1689),
(1712, 'Orangtua dari Fitri Oktaviani', 'ortu_2324101125', 'ortu_2324101125@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6BKNTI.zahoKB60hILIkm.ZG/JKMGk2ObY6T2mNgWgLO6WxyC.aIq', 6, NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00', 1690),
(1713, 'Orangtua dari IDIN MUHYDIN', 'ortu_2324101126', 'ortu_2324101126@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PykoM1omWtth1j5cgjxCyOs5DlLDVSKy8tc6pPLTbCBlinFTYqDyy', 6, NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00', 1691),
(1714, 'Orangtua dari INTAN SRIWAHYUNI', 'ortu_2324101127', 'ortu_2324101127@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$HHQs..rfstW3qqmY.uT9P..sdYw0lEgypoIlG2FRYChpb951DcjC.', 6, NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00', 1692),
(1715, 'Orangtua dari JAJANG NUGRAHA', 'ortu_2324101128', 'ortu_2324101128@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6JE/jtnLdeAxwrKWPXLaCOky/.p8bGI3rsR11t6u.QzxejGvDneJm', 6, NULL, '2025-12-18 03:03:00', '2025-12-18 03:03:00', 1693),
(1716, 'Orangtua dari Milan Muhammad Miftah', 'ortu_2324101129', 'ortu_2324101129@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fbs2fwuTX6FmOApGNIKZTuYv8jdRFPKgA7Qa5NyMSrN5/Cj07J8Bm', 6, NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01', 1694),
(1717, 'Orangtua dari MONALISA PUTRI UTAMI', 'ortu_2324101130', 'ortu_2324101130@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/zG3a0XrIBRkLkkHeKtOjuZNuGsDKpAlH9fcgz3eKJb3tE4cTXSUG', 6, NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01', 1695),
(1718, 'Orangtua dari NUR AYU WIDIASARI', 'ortu_2324101131', 'ortu_2324101131@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wCERZ09GrBlrH4Oq1hmpXul2RMI9dTsSgJQmZ3CxE5YG54yaACSQC', 6, NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01', 1696),
(1719, 'Orangtua dari Puput Maulana Habibah', 'ortu_2324101132', 'ortu_2324101132@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Fx06P/NF0KWxSIN/h47VjeoaN33KvOcC7xICWVG8wjV6itpGuJSP6', 6, NULL, '2025-12-18 03:03:01', '2025-12-18 03:03:01', 1697),
(1720, 'Orangtua dari Reisya Zahrotusyitha', 'ortu_2324101133', 'ortu_2324101133@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NJ1ehAST.ecmzxc.qs.sw.jmu/hmChjxSqSLD8153AD8cKAJVm0Wa', 6, NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02', 1698),
(1721, 'Orangtua dari REZA', 'ortu_2324101134', 'ortu_2324101134@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Gs79Gf.V5xlQfu/OXJ.tE.0iqehXHAMu2uY5aqLgGHzTuM1NxP9XG', 6, NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02', 1699),
(1722, 'Orangtua dari RISMA YULIANIKA', 'ortu_2324101135', 'ortu_2324101135@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ijqo5exB9RT9AIX.Z3tyEOLpj1Bm9f/tOmNRlgPlDKFDbYCT7hRcy', 6, NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02', 1700),
(1723, 'Orangtua dari SATRIA ARRAS', 'ortu_2324101136', 'ortu_2324101136@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LkHmtuWZZXSP4DJmVcDST.XLSiDlmDvZVFNHkiD71r1kEQBqO..Ve', 6, NULL, '2025-12-18 03:03:02', '2025-12-18 03:03:02', 1701),
(1724, 'Orangtua dari SHAZIA AULIA', 'ortu_2324101137', 'ortu_2324101137@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5zArnYK2srhY6qku7d.2jer95ZaoAQcabmZIqHTe4aJOdthYIOfUK', 6, NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03', 1702),
(1725, 'Orangtua dari SHELLA AMELIA', 'ortu_2324101138', 'ortu_2324101138@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PXJfRGs4wVCc89XQNEpjOOxIZ0itbv.oJEpe1j.HwcZk57JKpWBQe', 6, NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03', 1703),
(1726, 'Orangtua dari SINTA RAHAYU', 'ortu_2324101139', 'ortu_2324101139@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$RUieEejB7N2bTHgzvhYbaOWZJkBDeWVNoRi/VorwKRY8SUSh5GCz6', 6, NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03', 1704),
(1727, 'Orangtua dari Syaakira Naura Az zahra', 'ortu_2324101140', 'ortu_2324101140@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$05WkUJJNGr7ciIbeYZJSTe5xN/puB6T4Xb3GqwZ3rekT5ZwlG4n42', 6, NULL, '2025-12-18 03:03:03', '2025-12-18 03:03:03', 1705),
(1728, 'Orangtua dari VASHA NAYSILA HIDAYAT', 'ortu_2324101141', 'ortu_2324101141@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nwlANuHc2PProRxhTYpwjO2/hherhajZEhEGWiEp2maCO9r6T7J36', 6, NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04', 1706),
(1729, 'Orangtua dari Wegi Putra Prayitno', 'ortu_2324101142', 'ortu_2324101142@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ous1gbKWuR1zeoQJypl2.OwPxgri/Hy0RlNSAUcrjqRhqeA0vVYbK', 6, NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04', 1707),
(1730, 'Orangtua dari YULIA ANDHANI', 'ortu_2324101143', 'ortu_2324101143@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$U1aqufBhdmXqrkb7vmnOUuPNu686ZumzieAVUZ9fzQ7/uRE412FMy', 6, NULL, '2025-12-18 03:03:04', '2025-12-18 03:03:04', 1708),
(1731, 'Orangtua dari ZENAL ARIFIN', 'ortu_2324101144', 'ortu_2324101144@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vpbZv7bYzDx8hkrktyVCl.jC04pT.ZEJsPIJUMExNpsg0G6c9Bna6', 6, NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05', 1709),
(1732, 'Orangtua dari ADDIN HANIFA', 'ortu_2324101145', 'ortu_2324101145@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nhN172L0mHXsw.PCNuHXt.q4oxGV3uE9NMtsl5voXXfjHZu.04ZSq', 6, NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05', 1710),
(1733, 'Orangtua dari Aditya Agung Nugraha', 'ortu_2324101146', 'ortu_2324101146@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VPGhcqKz495.uLl1eqsiY.PFl8vZJCnCA0Lp9Xfdwedtmoa0pKQCG', 6, NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05', 1711),
(1734, 'Orangtua dari ADRIAN AFRIANSYAH', 'ortu_2324101147', 'ortu_2324101147@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZR8gphsnbZdkcthBrVGmIOvunHI4QSPbtQfmsU/u4Bqw9wt1dWJWm', 6, NULL, '2025-12-18 03:03:05', '2025-12-18 03:03:05', 1712),
(1735, 'Orangtua dari AKMAL APRILLIANA NUGRAHA', 'ortu_2324101148', 'ortu_2324101148@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bUMHi51N8sxVUj2D/vIzguy/4Z.0q5Qj36C8/WG9SqQliUBCncQA6', 6, NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06', 1713),
(1736, 'Orangtua dari ANNISA FEBRIANI', 'ortu_2324101149', 'ortu_2324101149@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$IvLptruvpuDbYm61Jl5XZ..65s4i5r2w0GEdOtLjXndqm0u187d0m', 6, NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06', 1714),
(1737, 'Orangtua dari BELA SEFIRA', 'ortu_2324101150', 'ortu_2324101150@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$oUVOfA/kT9RrEGBeBsfKQeXaPc140ao30dIUSuK4b8u.O33qvM2AO', 6, NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06', 1715),
(1738, 'Orangtua dari DEBY JUANITA', 'ortu_2324101151', 'ortu_2324101151@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bRexbEtOQIVT/V.ghfvVzuHdIiUEhh4Wpgni65sGNjQVx4e02ldgy', 6, NULL, '2025-12-18 03:03:06', '2025-12-18 03:03:06', 1716),
(1739, 'Orangtua dari DELIA ANJANI', 'ortu_2324101152', 'ortu_2324101152@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Ech4GKGgrBaZwzv7o8UKOud5YGCRKqodexbsJ8WqWlKFEH2lPqh3q', 6, NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07', 1717),
(1740, 'Orangtua dari DERIS NURIYAN', 'ortu_2324101153', 'ortu_2324101153@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EYIprBj0bfhsqB65cHgtPuIc3.YDmQxwwNiRR8ekOvAN3YdWU2g1q', 6, NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07', 1718),
(1741, 'Orangtua dari DERIS TRI OKTAPIANA', 'ortu_2324101154', 'ortu_2324101154@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$1LGp5a0bFEiiGcUxU3Nb8e5ycddjtwa4qGEnrFM966L5kRcAe5ISu', 6, NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07', 1719),
(1742, 'Orangtua dari DESTA EKKI SAPUTRA', 'ortu_2324101155', 'ortu_2324101155@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3FDvwmoWR2MHthqLd0uZfuIT0kjwHx5rI7pGIuxoIyF94Es5RxtQa', 6, NULL, '2025-12-18 03:03:07', '2025-12-18 03:03:07', 1720),
(1743, 'Orangtua dari Diko Salman Alfarisi', 'ortu_2324101156', 'ortu_2324101156@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$KT.lXvXPIFxe6q06rxlUB.38yZ7yda/1tYTWnb8A7Q0fLFVVwrQtG', 6, NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08', 1721),
(1744, 'Orangtua dari Eka Cindy Ariyanti', 'ortu_2324101158', 'ortu_2324101158@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$k5iZPIIYEYQ4wSswpsri3.zd/lXO7NOI8WnaADlvM/WaPp9mQKCN6', 6, NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08', 1722),
(1745, 'Orangtua dari HANIF MAULANA', 'ortu_2324101159', 'ortu_2324101159@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$XqQJNoohxVg9yxWWJA.7HOZrK8mXsXgckQzQAX4YzIQ5ftpktD4Ma', 6, NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08', 1723),
(1746, 'Orangtua dari LUSY MAULUDINA FIRDAUS', 'ortu_2324101160', 'ortu_2324101160@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$E7AjDluY84bsXQCL8SIMCOEwh2RxtgOtXL3GMkMPjg1jEYOLrs6Wm', 6, NULL, '2025-12-18 03:03:08', '2025-12-18 03:03:08', 1724),
(1747, 'Orangtua dari M Pariz Ali Alvi Mubarok', 'ortu_2324101161', 'ortu_2324101161@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ns2yq3m1R70qX0vshIqC0ucfX0yuE4iJJ57CeHYl3QhZbizMr0e9m', 6, NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09', 1725),
(1748, 'Orangtua dari MUHAMAD RIFKI ARDIANSAH', 'ortu_2324101162', 'ortu_2324101162@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8eaxthRcc25kL17pXYWJzeTL3qv1wWEr8lu8nu/BCrMd91J03tJwK', 6, NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09', 1726),
(1749, 'Orangtua dari Muhammad Dhika Fadillah', 'ortu_2324101163', 'ortu_2324101163@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$FFobnKbbSsL17hPxnFS0CeIZDJiZcrBqF/GeLjOzoLm/Kc/cwCLRK', 6, NULL, '2025-12-18 03:03:09', '2025-12-18 03:03:09', 1727),
(1750, 'Orangtua dari NADIA SETIA ANANDA', 'ortu_2324101164', 'ortu_2324101164@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$laWQkWobQZGJxUXLNrFHk.IDkdD.eu7Frv00vfgpwyLI.AN4f.heK', 6, NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10', 1728),
(1751, 'Orangtua dari Nina Apriliani', 'ortu_2324101165', 'ortu_2324101165@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8PSVxdMKgNvanxUlB8R.w.Vu9.2O3ZYbi2Is5fr.VlThF9LP1JCdW', 6, NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10', 1729),
(1752, 'Orangtua dari NINA HERLINA', 'ortu_2324101166', 'ortu_2324101166@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$doKoJRqW2fvbHnmyM2TfDOZ2BQi1amhoTwI/xbVK4ySgHo6tsgSfy', 6, NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10', 1730),
(1753, 'Orangtua dari NOVA APRILIANI', 'ortu_2324101167', 'ortu_2324101167@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VXBb0mfnI0xi4C0cPvhcm.FsQDKGVqnYbhywSNyEcPlk/Yi1H/hta', 6, NULL, '2025-12-18 03:03:10', '2025-12-18 03:03:10', 1731),
(1754, 'Orangtua dari PUTRI LAFTAIN', 'ortu_2324101168', 'ortu_2324101168@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CxNvpH8vkNllEi7fI62A4un/2xRUEPOgu.Ifp0MmNH/LKzr3DtRNO', 6, NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11', 1732),
(1755, 'Orangtua dari Putri Sauvikha Anjari', 'ortu_2324101169', 'ortu_2324101169@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Edl5AlAkvf2FzTRQIiat9ejietgXu3wtAEyqbgM/GbBFhA7kFh7gi', 6, NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11', 1733),
(1756, 'Orangtua dari RAIHAN RAFI KUSWANTO', 'ortu_2324101170', 'ortu_2324101170@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$35EBzpE7sYQgzansFUb59./K6k2IF8toWJQ/hsYG98snMKswicQvu', 6, NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11', 1734),
(1757, 'Orangtua dari REISA PUTRI RIZKIANI SAEPUDIN', 'ortu_2324101171', 'ortu_2324101171@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lvuGBTPrXxHBSQcA2is/bukjYFc1vpX718/7TqdWPWASUiHsyHVM.', 6, NULL, '2025-12-18 03:03:11', '2025-12-18 03:03:11', 1735),
(1758, 'Orangtua dari RESA FITRIYAN', 'ortu_2324101172', 'ortu_2324101172@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7N.STsl.pM9ijDFoKkVlm.vZsRpy8yGCssE.wVLLrO6BVvAmKi65.', 6, NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12', 1736),
(1759, 'Orangtua dari RESNA ADELIA', 'ortu_2324101173', 'ortu_2324101173@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$0.CRSBihf3dJnoolU0DycujsaRWKHLy70cRCM38obiroM2FF1/ogO', 6, NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12', 1737),
(1760, 'Orangtua dari SANTI SRI WININGSIH', 'ortu_2324101174', 'ortu_2324101174@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CJno6TV4HelHpraIz0aSauzdfc8zy5x011wFi8Yw0/jr/t6zo1d0a', 6, NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12', 1738),
(1761, 'Orangtua dari Sela Merliyani', 'ortu_2324101175', 'ortu_2324101175@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4oU1MCEHJhUamxDZG1dOE.4OAh6LzydxIT8.bZwtmzY6MYWhHIud6', 6, NULL, '2025-12-18 03:03:12', '2025-12-18 03:03:12', 1739),
(1762, 'Orangtua dari Selvi Dwi Rahmawati', 'ortu_2324101176', 'ortu_2324101176@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$elvsPyouilzlejIz4Gvywu5zC9XVooeVL7igf.B3Ly0.SF9.rJSzm', 6, NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13', 1740),
(1763, 'Orangtua dari SHIFA DWI MARYADI', 'ortu_2324101177', 'ortu_2324101177@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4KUg7BL9CvIYSAa.n.3rqerJqVsAQTa2TgqtE4AQlGGqYi2870Vs2', 6, NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13', 1741),
(1764, 'Orangtua dari TISA RAMDAN SEPTIA', 'ortu_2324101178', 'ortu_2324101178@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/qU91gSxiTngY64TS14F8.iJosue/IMyaQpxCOmZqD2/7jYzsL.2q', 6, NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13', 1742),
(1765, 'Orangtua dari WINDI AISHA JAUHARAH', 'ortu_2324101179', 'ortu_2324101179@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Yw8StlGO5ugUXT/fpuzsMeuXfTrafLtSGYNVqZeUT.pxGSMoC5TVu', 6, NULL, '2025-12-18 03:03:13', '2025-12-18 03:03:13', 1743),
(1766, 'Orangtua dari ZAHRA FATHONIA', 'ortu_2324101180', 'ortu_2324101180@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$FsDh48PV/geRn/pzmOUhme4/YABE6C5ICf2F..jEc33lyE.TkzowK', 6, NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14', 1744),
(1767, 'Orangtua dari Abdul Musholim Arraniry', 'ortu_2324101361', 'ortu_2324101361@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ar5h3Ojko.bgxZrdbHkY9u5/OhJ7pZzSOO61BBEVVARRe3yCG2TPi', 6, NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14', 1745),
(1768, 'Orangtua dari Ade Ridwan Maulana', 'ortu_2324101362', 'ortu_2324101362@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$f/8fkgs/Dpxi3piN.kvZdeI3UdB9Oyq2XYZAqGUIf38jztnj40/1G', 6, NULL, '2025-12-18 03:03:14', '2025-12-18 03:03:14', 1746),
(1769, 'Orangtua dari Agni Aina Lukman', 'ortu_2324101363', 'ortu_2324101363@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Rn0luuyT0LtHw6rKLleGOuhJ//74VWiRlF9IpMcPusZmXnbIRJ2eS', 6, NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15', 1747),
(1770, 'Orangtua dari ALIYA RAMADHANI', 'ortu_2324101364', 'ortu_2324101364@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$GOuh.Qsox4zuyYJoD/L3vudxVwMBeW67YOifwq3r8nU8d.s5ABaZa', 6, NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15', 1748),
(1771, 'Orangtua dari Andri Wiguna', 'ortu_2324101365', 'ortu_2324101365@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6tA0JyVfPa16e1lUtfjUvu0wnG6m6gkU0sCJad1oEA.ITA89kcY1e', 6, NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15', 1749),
(1772, 'Orangtua dari ANNISA NUUR QOLBI', 'ortu_2425101541', 'ortu_2425101541@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$e42nkfQjg5H3jOdCArGLpe3n6XaGtXN60hV9X5yra6CdJmHFkbXYq', 6, NULL, '2025-12-18 03:03:15', '2025-12-18 03:03:15', 1750),
(1773, 'Orangtua dari Ayu Febriani', 'ortu_2324101367', 'ortu_2324101367@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8IaKJhGFr1eKL5BGNXLFjec4pz8sJr.Q0nwf3gX/TaI97O7HHZJsi', 6, NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16', 1751),
(1774, 'Orangtua dari CIPTO ADE RAMDANI', 'ortu_2324101368', 'ortu_2324101368@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$XAsYKD6PqwmIOVnswdm6gOS7nSgEk5UJ4WTUnuSehhGYTEvhZdcPa', 6, NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16', 1752),
(1775, 'Orangtua dari Dava Fauzan Aziz', 'ortu_2324101369', 'ortu_2324101369@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$S79WQ.BKeIHQF/D71bwJduPf7RfvXGhVeTCqYTLT2G/jlyX4kKvLm', 6, NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16', 1753),
(1776, 'Orangtua dari Defa Fachrizal Ramadhan', 'ortu_2324101370', 'ortu_2324101370@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EK3MBn5ClS/5K/1X.8dfOueX6dfas4OEjz00AYVCMl1gRpMdZoDfq', 6, NULL, '2025-12-18 03:03:16', '2025-12-18 03:03:16', 1754),
(1777, 'Orangtua dari DINDA SILVI NURAPRIANI', 'ortu_2324101371', 'ortu_2324101371@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$MTe7nH6RJ9vENrshJ.0nqOlwLHfrvTUQtIowXyNJr1Nb9mdZrpGNy', 6, NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17', 1755),
(1778, 'Orangtua dari ERINA SRI ANJANI', 'ortu_2324101372', 'ortu_2324101372@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$QmOzqZfQ6Tdb9N9wI5Rf.Oo3IP9gSPlTbbzEBGK.kgO4EPWKzvnda', 6, NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17', 1756),
(1779, 'Orangtua dari Fadhil Ahmad Farizi', 'ortu_2324101373', 'ortu_2324101373@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BLotn9rUD21vl96l2r/h..qMxV2PIr0X5Pnr8KVyObG7TUhB9qEeu', 6, NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17', 1757),
(1780, 'Orangtua dari FALIH MUHAMMAD NAZMI', 'ortu_2324101374', 'ortu_2324101374@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$SsLz0/HZT9StDjtmEaoVDeRlVCSGw04ILUZPo5qj9DG8OK57wWGTa', 6, NULL, '2025-12-18 03:03:17', '2025-12-18 03:03:17', 1758),
(1781, 'Orangtua dari FARIZ PAHRUDIN', 'ortu_2324101375', 'ortu_2324101375@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$eu2sc..iMurroT6mwM9euumLaSV8FzE.7Rt6QVoepjckTmL6vfG36', 6, NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18', 1759),
(1782, 'Orangtua dari FERGI ADITYA', 'ortu_2324101376', 'ortu_2324101376@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6pjAf/EuFbb.tkQSmxASkeBkqpqJVECsFIFY.arnMck5Q2VN8.SqW', 6, NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18', 1760),
(1783, 'Orangtua dari GILANG ADRIAN PRATAMA', 'ortu_2324101377', 'ortu_2324101377@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Wv3qwhJY.5OnQj2BQkWCbO9yaqgiNGDvZ7tlylZ6hfxSYReZ74c6i', 6, NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18', 1761),
(1784, 'Orangtua dari IRFAN HASNIAR AZIS', 'ortu_2324101379', 'ortu_2324101379@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.18qWn6QVpyxpmA59Av25u86oXHChsEvEahUe3R4Xhf9LtOgjTe1i', 6, NULL, '2025-12-18 03:03:18', '2025-12-18 03:03:18', 1762),
(1785, 'Orangtua dari IRGI ZAOZA SALSABILA', 'ortu_2324101380', 'ortu_2324101380@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5liTWcX3gUZCiSfhsK12NO32uTCX1uLUJ1YpOWlvTPI5r6JGwmYT6', 6, NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19', 1763),
(1786, 'Orangtua dari Kurnia Bela Agustina', 'ortu_2324101381', 'ortu_2324101381@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7ykTi73bREBMbQFTPQzmbuC0BaBDqZjyZcWTK709RSK.pbVSWJcwe', 6, NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19', 1764),
(1787, 'Orangtua dari Leni Nuraeni', 'ortu_2324101382', 'ortu_2324101382@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2ieseQ29ZUBpoLAzgWWcZe2QdIrmfKhIFvvvAPoIKasH1F3hL9HJi', 6, NULL, '2025-12-18 03:03:19', '2025-12-18 03:03:19', 1765),
(1788, 'Orangtua dari Lutpika Puspitasari', 'ortu_2324101383', 'ortu_2324101383@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BKwLSZzseBEktGjycRgX5OHPf7UZlO7jMUtA9LcqAurJzroIhPgSC', 6, NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20', 1766),
(1789, 'Orangtua dari MUHAMMAD AGUSTIAN PUTRA', 'ortu_2324101384', 'ortu_2324101384@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$88FLkqtXDTjJyTLBKd1awOjj05ELx4vi4FcJHm6RQS3DrFa9hHXx.', 6, NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20', 1767),
(1790, 'Orangtua dari NAUFAL ALIFIANTO', 'ortu_2324101386', 'ortu_2324101386@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$k.SOKjoMmvj9.6CZjXyYpu7Y8ms6DfhfccVX22SYjiMWkIknidUYW', 6, NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20', 1768),
(1791, 'Orangtua dari NAUFAL MUYASSAR YUMAS PUTRA', 'ortu_2324101387', 'ortu_2324101387@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Ym1apVHLSNlp9bmsXiq.8eGOsCvyzc7RtcdyTMBJ9cQ6.emfzmgBe', 6, NULL, '2025-12-18 03:03:20', '2025-12-18 03:03:20', 1769),
(1792, 'Orangtua dari NISA MARSAL', 'ortu_2324101388', 'ortu_2324101388@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$s8FDCDHtCdCwBQ9XvcjQE.dwRwOt4CmfDYz.qEVDMImNJTOEdkNcK', 6, NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21', 1770),
(1793, 'Orangtua dari Raifal Fadliansyah Fauji', 'ortu_2324101389', 'ortu_2324101389@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$66Muu4D7r4z0RG5kibHvcut7JESZzBn36G4Nr.uR42xZcQ20FQCIS', 6, NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21', 1771),
(1794, 'Orangtua dari RAYHAN DARUNNAZWA', 'ortu_2324101390', 'ortu_2324101390@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NvsGvKsQqCMcjMGZILtUk.n57NBWWjJc.rArVFxn69lvGrD6RnFdC', 6, NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21', 1772),
(1795, 'Orangtua dari RENI ANGGRAENI', 'ortu_2324101391', 'ortu_2324101391@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$WROVe7SOfZaYIIC8ny4lZuIBNWL5QilOJlAwgeuZ/0wDtw.bsCrlG', 6, NULL, '2025-12-18 03:03:21', '2025-12-18 03:03:21', 1773),
(1796, 'Orangtua dari RIDHO TRIWILDAN', 'ortu_2324101392', 'ortu_2324101392@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$AOpQFvAxLVfVaLuWAuT1EeFXm3tUhE3f6eIRWmfvvu28luUyzA3Ce', 6, NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22', 1774),
(1797, 'Orangtua dari Ririn Rindiani Puspitaningrum', 'ortu_2324101393', 'ortu_2324101393@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.sFheRy1fsDBr1Pm/rXDR.yv01yQdhsAXzHYZssH.pUHPuLImjWGe', 6, NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22', 1775),
(1798, 'Orangtua dari Salsabila Aurelia Putri', 'ortu_2324101394', 'ortu_2324101394@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$o8OiiAwUM2PB4TI4D9G/kuOfvWb6rdCYum4oW/EMFIWkKkOZvnx5W', 6, NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22', 1776),
(1799, 'Orangtua dari Sopianti Novita Usna', 'ortu_2324101395', 'ortu_2324101395@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Nd8crKedbPApLkXij0rzJuIg4.E9kloN9cnw/JNWvppeyopliqepu', 6, NULL, '2025-12-18 03:03:22', '2025-12-18 03:03:22', 1777),
(1800, 'Orangtua dari Tasya Nurin Shadrina', 'ortu_2324101396', 'ortu_2324101396@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$TrFeTWLVyuEG6hTHGKfTO.5ovQOqoSmqWsmQYEdzgKuu0yEooVu4S', 6, NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23', 1778),
(1801, 'Orangtua dari Ade saepuloh', 'ortu_2324101397', 'ortu_2324101397@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bs7GUIxK32B1gbcSZZS2iOz6mzUCQ72q0AOjbJtI0sENvpSTW7czy', 6, NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23', 1779),
(1802, 'Orangtua dari ADITYA FIRMANSYAH', 'ortu_2324101398', 'ortu_2324101398@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/A4hE7nd9jl8PNSN/urmiuPkNpO1.a6iQ2AiF4Ps0zmJO/4Wb67im', 6, NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23', 1780),
(1803, 'Orangtua dari AGYL AZANI AKBAR', 'ortu_2324101399', 'ortu_2324101399@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3GaEdmFChyeVpS3Hz4l1tOGm7go8i4xUX1eQbZfUpMhOPPaR4T.I.', 6, NULL, '2025-12-18 03:03:23', '2025-12-18 03:03:23', 1781),
(1804, 'Orangtua dari ALIFA SAEFURROHMAN', 'ortu_2324101400', 'ortu_2324101400@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ifJEZDrSCZTWoas8tv1S7udwcp8S7O9OmmcR1mEgl2O69TZCTBqtW', 6, NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24', 1782),
(1805, 'Orangtua dari ALIYA EKA GUSTIANI', 'ortu_2324101401', 'ortu_2324101401@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hPdI51iqTJc2YtRc317LHuW5vZVAyRsCSrfhpHO.YoLxgzA5Wf9sq', 6, NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24', 1783),
(1806, 'Orangtua dari ALMA DWI ALRIZKI', 'ortu_2324101402', 'ortu_2324101402@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ymImYjxZnQMublLRIuiiEO3uNSDhJKPG5/XaKuVEkvByfdYW6DkQ6', 6, NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24', 1784),
(1807, 'Orangtua dari Ariq Fathurrahman', 'ortu_2324101403', 'ortu_2324101403@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VoqKC6b/K40hl/Et/r2MMezWlRsDudBXXL0Vl1rjdyk1UamQJkeuK', 6, NULL, '2025-12-18 03:03:24', '2025-12-18 03:03:24', 1785),
(1808, 'Orangtua dari DAVA TISNA APRIZA', 'ortu_2324101405', 'ortu_2324101405@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6kgFPKKFCgBTW0L/PstBxeBt3d.vRUN/MweBxqP0OZvIvmqFAaWIG', 6, NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25', 1786),
(1809, 'Orangtua dari DAVIN ADHA PUTRA', 'ortu_2324101406', 'ortu_2324101406@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$oTK2/vkemLnIJqAYDQCq1.bo6xBUt7K8LYFUvXw7vrF6CXv38xfuu', 6, NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25', 1787),
(1810, 'Orangtua dari DZAKY FAUZAN', 'ortu_2324101407', 'ortu_2324101407@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ksQfWB.MkZS2BM/sck84Yu6OnyFDHW1mvb0swCehyjmUNJbtyrh8q', 6, NULL, '2025-12-18 03:03:25', '2025-12-18 03:03:25', 1788),
(1811, 'Orangtua dari ELIS MAESAROH', 'ortu_2324101408', 'ortu_2324101408@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$h15ub3Mw22BQ2Z8waeDNc.Ax9gg3VCwAut2Wgq/X9m9met/iO.Eke', 6, NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26', 1789),
(1812, 'Orangtua dari ERWIN ALDRIANSYAH', 'ortu_2324101409', 'ortu_2324101409@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$e.2QApeJJf65foOACyVWm.3lRB.QwpT4WxrxNjYAk1tPEXIIx/RWW', 6, NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26', 1790),
(1813, 'Orangtua dari Fabian Rizky Adriansyah', 'ortu_2324101410', 'ortu_2324101410@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$OeeeIqrX5zXPYogSe.KvPOxu4gTE2UvRjg0bnrHc6JRz5foT/EZtS', 6, NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26', 1791),
(1814, 'Orangtua dari FAHRANSYAH ABI SOPFIAN', 'ortu_2324101411', 'ortu_2324101411@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$XhW/gKkyAu6Cn8Ke.YfVH.3O2N31Ojh/y.QKraO7GHvUfd1AhIWpe', 6, NULL, '2025-12-18 03:03:26', '2025-12-18 03:03:26', 1792),
(1815, 'Orangtua dari FAREED AHMAD', 'ortu_2324101412', 'ortu_2324101412@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$WKDlnIDBufxtS4u2.KrWH.CyNEyBzZ3vagnsJmawpT9KItoEqbuCu', 6, NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27', 1793),
(1816, 'Orangtua dari FAZRI MAULANA SAPUTRA', 'ortu_2324101413', 'ortu_2324101413@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LIgUFz7Zu/rjvKr/9sqZQe9.Wg6CltT0ABm2lU5wpZRenogZqnHEe', 6, NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27', 1794),
(1817, 'Orangtua dari IIS NURHAYATI', 'ortu_2324101414', 'ortu_2324101414@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$c4zT3LOFueWcUHkftJeQ2.2ViqSrbTEV9aFqoDjjz5jMtwDE4pzSS', 6, NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27', 1795),
(1818, 'Orangtua dari Khansa Kamila', 'ortu_2324101415', 'ortu_2324101415@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PXrPdrvRIYrBiyl3y64UAOHjqK6JRjULTLdRNf9jR2hFlsFsZbwja', 6, NULL, '2025-12-18 03:03:27', '2025-12-18 03:03:27', 1796),
(1819, 'Orangtua dari Kiki Al Rizal Maulana', 'ortu_2324101416', 'ortu_2324101416@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CdNoAJgtQRPusFDwSrYm9eM7lmLjcRAnb7Ht2FStepTZElElOe1hK', 6, NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28', 1797),
(1820, 'Orangtua dari MUHAMAD RAFLI ALFARIZI', 'ortu_2324101417', 'ortu_2324101417@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$TZ/l6sErvDLg39YBtXdMIedC7ziuF3Asm1tI3lV.0WzJcptWlL9re', 6, NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28', 1798),
(1821, 'Orangtua dari NADIA ASPIYA SHAHIDAH', 'ortu_2324101418', 'ortu_2324101418@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$HU9eq9wCxFvVj7nEYmp8behcBqWXLSmKtH8nVJrnNX5Fa4UCpfpyC', 6, NULL, '2025-12-18 03:03:28', '2025-12-18 03:03:28', 1799),
(1822, 'Orangtua dari NAZWA APRIANITA', 'ortu_2324101419', 'ortu_2324101419@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BmUm36ZtmzsQX6aoPvVT.eRicDToPtruU5zvIO5lasLqgAVVemn5u', 6, NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29', 1800),
(1823, 'Orangtua dari NOVITA MANISORAYA', 'ortu_2324101420', 'ortu_2324101420@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$53dkCC5NuNmwNx6/k//yM.96BG6u0VNemZ9YDdheVrSk9OKRwD4Ce', 6, NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29', 1801),
(1824, 'Orangtua dari PADIL PRATAMA', 'ortu_2324101421', 'ortu_2324101421@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5f2nuvLhoFuyni23OWgnP.wNQ8.U.2TM3Pl/JBI3.26kPDM3Plb1u', 6, NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29', 1802),
(1825, 'Orangtua dari RAIHAN AMARULLOH', 'ortu_2324101422', 'ortu_2324101422@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Qyv.xCO48srX0jAyL..BY.v.jzff4s4VIm2n1SlwgmPjw/5gQx1VK', 6, NULL, '2025-12-18 03:03:29', '2025-12-18 03:03:29', 1803),
(1826, 'Orangtua dari Resa Akmal Gifari', 'ortu_2324101423', 'ortu_2324101423@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5GSuDmiNUShETjUhmZEeAOZDiLlA5jFBIVeBjmmtKlyml5Cl8uqoi', 6, NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30', 1804),
(1827, 'Orangtua dari Resti Lestari', 'ortu_2324101424', 'ortu_2324101424@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$W8b6OdTmqZAGVt14C8AboOXBvsSvvl9SbwJWHtNcXXeNNffp3Ng9m', 6, NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30', 1805),
(1828, 'Orangtua dari SATRIA PUTRA NUGRAHA', 'ortu_2324101425', 'ortu_2324101425@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nFME25uRPoTmDazJF4tMk.iBp1m9WmTJM/QYX84H4zxVAY5ufjY5m', 6, NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30', 1806),
(1829, 'Orangtua dari Satya Rengga Pamungkas', 'ortu_2324101426', 'ortu_2324101426@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nLoYubdms5ttmwvgm8GYiuHRqBqHC0kC9jao0aSCUd67tOCVUnHku', 6, NULL, '2025-12-18 03:03:30', '2025-12-18 03:03:30', 1807),
(1830, 'Orangtua dari Silvi Amellina', 'ortu_2324101427', 'ortu_2324101427@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$b4FJXEvpnmm0TiDDFVPDhez/smOypTxN8l5ykbctxfC35DvxlVXiC', 6, NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31', 1808),
(1831, 'Orangtua dari Silvia Azahra', 'ortu_2324101428', 'ortu_2324101428@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$e026xWrnLRgxkw4hjpgtr.BS0tWINk6yoENKiJgrazPUekG0KPe62', 6, NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31', 1809),
(1832, 'Orangtua dari SUCI NOVIANI', 'ortu_2324101429', 'ortu_2324101429@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BN0hvJF.sYgaIjXhCR6kmeevwq0R5f0UEV56nxyu2o0WiNjhTXCzu', 6, NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31', 1810),
(1833, 'Orangtua dari SYIFA FATURROHMAH AZ-ZAHRA', 'ortu_2324101430', 'ortu_2324101430@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$1mtXsWo9C7VEKtGNe63P3OhEoe8bc1PJrp247iJG6rI.kAFKYBzaa', 6, NULL, '2025-12-18 03:03:31', '2025-12-18 03:03:31', 1811),
(1834, 'Orangtua dari Syiva Yasa Sakilla', 'ortu_2324101431', 'ortu_2324101431@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$utoT0KhAD6ZV0XcsbT84yeh6FGRDmVNiEiMoM0VXWE/Vw0EI1ynzu', 6, NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32', 1812),
(1835, 'Orangtua dari YUNIAR ARDIANSYAH MAULANA', 'ortu_2324101432', 'ortu_2324101432@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/3e9EJqolESRL2uTP05HrOSZYyzHzb3oN12jdngDp8LUchTRh9wh6', 6, NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32', 1813),
(1836, 'Orangtua dari ADVENDA SULISTYOWATI', 'ortu_2324101469', 'ortu_2324101469@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ykuD9YdASOS4xn0IVb28SOE87G5Le48SGmXJLAkePfdoIqcFQS7yC', 6, NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32', 1814),
(1837, 'Orangtua dari ALI APANDI', 'ortu_2324101470', 'ortu_2324101470@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Yb10psnLrzk.PiL2SQ.OzuCeNXMFfamejh5AUho7NRjXQPMs.MHhS', 6, NULL, '2025-12-18 03:03:32', '2025-12-18 03:03:32', 1815),
(1838, 'Orangtua dari AMAL ASMARANI', 'ortu_2324101471', 'ortu_2324101471@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$k2U9vwSYpQ8vxSdrz5HTbePfk/EuiWbToGUgJL6OAiaeIXYqMKj9q', 6, NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33', 1816),
(1839, 'Orangtua dari Andika Pebrian Pratama', 'ortu_2324101472', 'ortu_2324101472@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nueCTruRAxaTvgGMHnEtsONjrlC8jB5VZf1ZlIyhFklOm1VIzT/5q', 6, NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33', 1817),
(1840, 'Orangtua dari ANISA APRILIA', 'ortu_2324101473', 'ortu_2324101473@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$tpjXZvaoOIWNZTXdhovcyO4a118aIQvQgia3SDcyjY6iWz3lJYCPW', 6, NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33', 1818),
(1841, 'Orangtua dari ARIF NUROHMAN', 'ortu_2324101474', 'ortu_2324101474@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$SfeLayPTRsGjMkBGQS2ph.SKtcB6rC98X7jYloSmuvVBXMl4sJgdS', 6, NULL, '2025-12-18 03:03:33', '2025-12-18 03:03:33', 1819),
(1842, 'Orangtua dari AULIA NURFADILA', 'ortu_2324101475', 'ortu_2324101475@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$f55vd8KhahUyodohKF3iSOzFVtV.Xg5fa6CmDqAqy4ryKimvKYQTC', 6, NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34', 1820),
(1843, 'Orangtua dari BILLY SULTAN DZULIANSYAH', 'ortu_2324101476', 'ortu_2324101476@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vw0bBy.7ZvAGz2YVMTJ0Len64aZ8UxP928MHvCZyK6iEO34crQnam', 6, NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34', 1821),
(1844, 'Orangtua dari CHANTIKA SALSANABILA', 'ortu_2324101477', 'ortu_2324101477@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Dfoyn2S.V0ZZfyiN9GutuezSgrKQ94LWRzfsMhmE7cTtWcTckgY7S', 6, NULL, '2025-12-18 03:03:34', '2025-12-18 03:03:34', 1822),
(1845, 'Orangtua dari Egis Septiani', 'ortu_2324101478', 'ortu_2324101478@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$UT0U5fq/HzOpUizrWZjYjOy/4PxoWG5yvUi3R9RZxqt5tC8VtvWwS', 6, NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35', 1823),
(1846, 'Orangtua dari ERRIL EVRILITA KURNIAWAN', 'ortu_2324101479', 'ortu_2324101479@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6nEAAyBPF35sgTHcbCbC4eza/fwxM558jzOQl78KUAsTSof7Frdr6', 6, NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35', 1824),
(1847, 'Orangtua dari FANI FEBRIANI', 'ortu_2324101480', 'ortu_2324101480@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$WR057sj6ieFm7uNgnqym4OBN2Ggy6CLlIO.0aMxI/cgnqg/TZs.xy', 6, NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35', 1825),
(1848, 'Orangtua dari Fauziah Khirani', 'ortu_2324101481', 'ortu_2324101481@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9RIy8UxOzD0t8JgjU8CAMe8DCk/JfZJ5gB6wMmYQN9b9PV.HoGwOa', 6, NULL, '2025-12-18 03:03:35', '2025-12-18 03:03:35', 1826);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(1849, 'Orangtua dari FERA MAULANI', 'ortu_2324101482', 'ortu_2324101482@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.SmF1dNtL9GFCncFEWDFKOZj6N8v.WK0exmqan1cwQgimMb6gqiPC', 6, NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36', 1827),
(1850, 'Orangtua dari GISA RAJ SUMANTRI', 'ortu_2324101483', 'ortu_2324101483@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$d7or.FdSEjCC1vOSs3xVHeV1Q3aS2ZMwMGlUodrnnaTnY61yDgr3G', 6, NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36', 1828),
(1851, 'Orangtua dari KANYASIH AYUNA IMANDRIA', 'ortu_2324101484', 'ortu_2324101484@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/FOzyyAH1FbHleyyqXiQmeDFtEOGYu9G.7OdJzQKthQQ8nY/iLale', 6, NULL, '2025-12-18 03:03:36', '2025-12-18 03:03:36', 1829),
(1852, 'Orangtua dari Lutfiah Zulfa Nabila', 'ortu_2324101485', 'ortu_2324101485@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$tX4RshOIiRHEmBBwZOOeeeMhaXuLmp9b7C6riJFL6Pks6h2B0rhm2', 6, NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37', 1830),
(1853, 'Orangtua dari MEIDA WULANDARI', 'ortu_2324101486', 'ortu_2324101486@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jVBbOECZ067adsTxhRQg9.0qdMZH/xxNbMa/fXNokD7WdTl/cuBDq', 6, NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37', 1831),
(1854, 'Orangtua dari MELANI PUTRI', 'ortu_2324101487', 'ortu_2324101487@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9wRqMT..mBwa0JFmVUM9oelnTJVmi426FxRNh/oxeTKELhSNgmbCq', 6, NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37', 1832),
(1855, 'Orangtua dari MIAR RACHMAWATI', 'ortu_2324101488', 'ortu_2324101488@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2SPOdxHJ.l0bYlH7Or7xRulCf2/UkijgPmcWLl/l9/N1keZrTiBQa', 6, NULL, '2025-12-18 03:03:37', '2025-12-18 03:03:37', 1833),
(1856, 'Orangtua dari Najwa Aina Fadiyah', 'ortu_2324101489', 'ortu_2324101489@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$yrp8VdE0.PxLPml539gNregynh7ddRrNfhNp5jKvrtM/0jwlpKaRO', 6, NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38', 1834),
(1857, 'Orangtua dari NIKEN ANJANI', 'ortu_2324101490', 'ortu_2324101490@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3Sttb5tp84w.6bB9YQTL9O8zor/IJ3XZt1s8BL8SccpX6xt9bFU6i', 6, NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38', 1835),
(1858, 'Orangtua dari Putri Keila Susanto', 'ortu_2324101491', 'ortu_2324101491@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7CLIpC1rS2UWziNklOxSLe5wqwwrkU8FFRvLHzbAyvnhA/AZNAyim', 6, NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38', 1836),
(1859, 'Orangtua dari PUTRI KUSUMANINGRUM', 'ortu_2324101492', 'ortu_2324101492@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DTB2Gdd1/fiL5.8G.SQA5uIlzsc8WHFkKJIShDsLYMHIOwBt6I5T6', 6, NULL, '2025-12-18 03:03:38', '2025-12-18 03:03:38', 1837),
(1860, 'Orangtua dari RAHMA GANIA SYA\'BANIAH', 'ortu_2324101493', 'ortu_2324101493@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$iYPKOKpbB040MhzPE/CM5OGVOcP7R841t/.Xq8HaMYXsO5QPClMAq', 6, NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39', 1838),
(1861, 'Orangtua dari Rahma Sulistiani', 'ortu_2324101494', 'ortu_2324101494@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$JMT68HkPYfGxsuejZwLBtOe5m71Qou7PRankNr3EDv2TRsHZIn1.S', 6, NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39', 1839),
(1862, 'Orangtua dari RAISSYA YULIANI', 'ortu_2324101495', 'ortu_2324101495@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PnwiMNA5CbRGq0H7DG.tVO7xX2L4iVyCi5eOdauPDzoSPI9e6XqMi', 6, NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39', 1840),
(1863, 'Orangtua dari Restu Sri Rahayu', 'ortu_2324101496', 'ortu_2324101496@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$gvgU.aFTKjGkWP9q3aqm5ujMvFaogQOGs9tnAlZ04t7Xc56cvZKo6', 6, NULL, '2025-12-18 03:03:39', '2025-12-18 03:03:39', 1841),
(1864, 'Orangtua dari SALMA NUR PATIMAH', 'ortu_2324101497', 'ortu_2324101497@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$n.dIELvwMd0IXEZTJwkDdObH0Uuzm1xOOaPNKQHfS1J7yTa9e0ko.', 6, NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40', 1842),
(1865, 'Orangtua dari SELMA FITRIA OKTAVIANI', 'ortu_2324101498', 'ortu_2324101498@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$aYVGgiEjuXxDuROa/CdGeeVQp6MExWEFcstguVYa2Kcgbz/XcagFm', 6, NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40', 1843),
(1866, 'Orangtua dari Sifa Felisa Putri', 'ortu_2324101499', 'ortu_2324101499@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$97vmhfZBziwIKAaYb66Xnu7JOfUEKkB8tNcWiwuVAVGLU6x3dmimO', 6, NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40', 1844),
(1867, 'Orangtua dari Silva Ari Ainur Vila Sevila', 'ortu_2324101500', 'ortu_2324101500@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/gfrD.DoDR9vbwpsuoFEdu1medEHKOMkAVEF97OzxLCgkzo32/M8e', 6, NULL, '2025-12-18 03:03:40', '2025-12-18 03:03:40', 1845),
(1868, 'Orangtua dari Suci Octavia Azahra', 'ortu_2324101501', 'ortu_2324101501@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9g4VCc9rHqm6te2nveUF6eu7KFBW9Op86CZtswYE3zkvAb4PdEBRW', 6, NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41', 1846),
(1869, 'Orangtua dari THALITA APRILIA', 'ortu_2324101502', 'ortu_2324101502@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$392CdUC7f9GQhTcu7rW2Xepbx7IGNu1OhAzyXA/tGKSUyb/dfcU4y', 6, NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41', 1847),
(1870, 'Orangtua dari Widi Nur Fajrina', 'ortu_2324101504', 'ortu_2324101504@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hVrlgvvt5pLJoxkHr5hkCec.9Amjtq92dFIJu78lsj8I9NYM2U5NC', 6, NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41', 1848),
(1871, 'Orangtua dari ALIFA MAULIDA', 'ortu_2324101505', 'ortu_2324101505@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7CFebI2YfNuAUz1.g7KP5u97konjniCZogBsvLE1bgXDruBloCxfK', 6, NULL, '2025-12-18 03:03:41', '2025-12-18 03:03:41', 1849),
(1872, 'Orangtua dari ALYA MELINDA', 'ortu_2324101506', 'ortu_2324101506@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ivWfMIsJGKxmmAlmTandROrM7GaIKNDEu6nAbL4Mgtaw1Ysa3cLUa', 6, NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42', 1850),
(1873, 'Orangtua dari ANISA ELIANDINI', 'ortu_2324101507', 'ortu_2324101507@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$RBApmp9nMxq8sfgz7oXmo.aCXxhKbCdMd23MBoROPoSV/jiB36j8i', 6, NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42', 1851),
(1874, 'Orangtua dari Annisa Razahra Nurfadilah', 'ortu_2324101508', 'ortu_2324101508@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$MHQW.hDtijFxliJMbqJ2Se1mFVNEGgJH2V0h/lpm.0e6cdHL9pLSy', 6, NULL, '2025-12-18 03:03:42', '2025-12-18 03:03:42', 1852),
(1875, 'Orangtua dari AURORA JULIYANTI', 'ortu_2324101509', 'ortu_2324101509@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Q1h/ej12gzPnxI/3oBQz6e66QRZMSUAx92VVBWU5b9xHQSTli8tvm', 6, NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43', 1853),
(1876, 'Orangtua dari DESI JULIANTI', 'ortu_2324101510', 'ortu_2324101510@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3OAB1EX2GsBNK1JIPIPqme9MlSx4Ihkj8h63DHBIiZkqIiNwg0zIq', 6, NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43', 1854),
(1877, 'Orangtua dari Diva Abilla', 'ortu_2324101511', 'ortu_2324101511@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VDMQfrZlMC/fKEy.FvrlWOW6T0tryewMrcInAAWAb9VcY66KD9D5.', 6, NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43', 1855),
(1878, 'Orangtua dari DIVA NURUL ASSYIFA', 'ortu_2324101512', 'ortu_2324101512@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Yu5LV08F9NMwi0EEa/3ZIu7AMIP5NmQiutpgNkKFG/ZFVUN7z/kZS', 6, NULL, '2025-12-18 03:03:43', '2025-12-18 03:03:43', 1856),
(1879, 'Orangtua dari FITRI MULYANI', 'ortu_2324101513', 'ortu_2324101513@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$r3qlToat0RjNUNyvzM.u5O9QimLTQVBkdstIFAos5yECDe1dlG3Ja', 6, NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44', 1857),
(1880, 'Orangtua dari KERIN RINDIANI', 'ortu_2324101514', 'ortu_2324101514@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$XK8sUHPBuurMgwZLvbbWmeuMj7IgIRE170eUafaakMBGHToupwoZS', 6, NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44', 1858),
(1881, 'Orangtua dari KEYSYA FEBRY AULYA', 'ortu_2324101515', 'ortu_2324101515@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lmdOLGryhVxwTFvXtqc8hOWRS8kAtKssl73WslQ9u774FRtV7zQai', 6, NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44', 1859),
(1882, 'Orangtua dari MAHDA ZELILAH', 'ortu_2324101516', 'ortu_2324101516@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$v9DtPRrPi7f.C/BfVtOWRePzYtKQ5OQnb9HjN0Jrv3X2oRXDfFCX.', 6, NULL, '2025-12-18 03:03:44', '2025-12-18 03:03:44', 1860),
(1883, 'Orangtua dari Martha Eryana Putri', 'ortu_2324101517', 'ortu_2324101517@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$q23/HOTCvQbLNJTFSdu3AOsWYasAAKF9LkKDiP9WD5fn6buvNV.BC', 6, NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45', 1861),
(1884, 'Orangtua dari MELISA KURNIASIH', 'ortu_2324101518', 'ortu_2324101518@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$pkVVoNeAIfbmCNL54qP//Oe7/wbbNKgUZTYm2h08STWqJRn6QHWIW', 6, NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45', 1862),
(1885, 'Orangtua dari NADIA RAHMAWATI', 'ortu_2324101519', 'ortu_2324101519@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zO/N75.drPRt6P3.mq3B7.cqTbfOo03JCcX1i5NdngnDedp4NAGlW', 6, NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45', 1863),
(1886, 'Orangtua dari Natisha Salsabilah', 'ortu_2324101520', 'ortu_2324101520@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$hlEA8rcJSSJrvZAQpi4bo.tNyCeFWmqgq4.5/hIPhkcX4DbxPZQIu', 6, NULL, '2025-12-18 03:03:45', '2025-12-18 03:03:45', 1864),
(1887, 'Orangtua dari NAYLA NAZWA CHAIRUNNISA', 'ortu_2324101521', 'ortu_2324101521@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$JrUtKfoFnU/nCa978lL1ZOqWKgelb0PVX9WFSD.g6TgYEM8RDv0qm', 6, NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46', 1865),
(1888, 'Orangtua dari NEZA AFRITA', 'ortu_2324101522', 'ortu_2324101522@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5bmMURCC8rF8OKO98bYc5uF03pfA7rzqlcNqlA0dBQdLkb/Tpra0G', 6, NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46', 1866),
(1889, 'Orangtua dari PRILA MAULIDHA', 'ortu_2324101523', 'ortu_2324101523@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qECB9709s2Wozj/NviOs8u0uNw0k5FBTjyi4OIsD94Neq/yONN/u2', 6, NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46', 1867),
(1890, 'Orangtua dari PUPUT PUTRIANI', 'ortu_2324101524', 'ortu_2324101524@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$rFOAoEHuXPPO7RbFYcVq6OSC5KjtLw7x3piFLSXuO6cKtBvkO.Ke6', 6, NULL, '2025-12-18 03:03:46', '2025-12-18 03:03:46', 1868),
(1891, 'Orangtua dari RACEL LIANTY', 'ortu_2324101525', 'ortu_2324101525@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DBxhXhZGVge3w2YYszWiqOKz9AmYid0Dzxq4yUa4KVE5qeKyOEQ/K', 6, NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47', 1869),
(1892, 'Orangtua dari RAHMA NUR KAMILA', 'ortu_2324101526', 'ortu_2324101526@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$tXThCPOw8slwEYXw6Cx1Devhx58Ffr8awC3cVwHMwXB/ZXtsUTc9e', 6, NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47', 1870),
(1893, 'Orangtua dari Rina', 'ortu_2324101527', 'ortu_2324101527@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.vaVahyMEHj1jI/a5JawsOfr3KYWUY8A6C44CFux5LQ1E8AG8ykmK', 6, NULL, '2025-12-18 03:03:47', '2025-12-18 03:03:47', 1871),
(1894, 'Orangtua dari SALSA DWI APRILIA', 'ortu_2324101528', 'ortu_2324101528@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$dyPg7IizxlPdDI/1yXcFSe1ajJuCB8RrEgrYC6t62JvcRQ4ofQ21u', 6, NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48', 1872),
(1895, 'Orangtua dari Seny Selviyani', 'ortu_2324101529', 'ortu_2324101529@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$our2gbTTzOkItbHAnAP9QuT7sPFZxZl1pxJmqQNPRM8.DKFCEtQta', 6, NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48', 1873),
(1896, 'Orangtua dari SHINTA NABILLA RAHMA', 'ortu_2324101530', 'ortu_2324101530@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Tkjot1Llj/J9SJLDLx5T4.foT5VdXcpnw38XdzI3cKQhW4h2Jj56y', 6, NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48', 1874),
(1897, 'Orangtua dari SITI NUR HAYATI', 'ortu_2324101531', 'ortu_2324101531@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$RGpJvccD1ImikqH9d6dUJ.2x438a0HIG4nA4d8Wt1w0gA8tb6GMF.', 6, NULL, '2025-12-18 03:03:48', '2025-12-18 03:03:48', 1875),
(1898, 'Orangtua dari SRI NURUL AWALIA', 'ortu_2324101532', 'ortu_2324101532@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$iSwa5q2lKQXjfjl.63EwTOXbDhOjp00QLidGPENykELCLhVGo..8C', 6, NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49', 1876),
(1899, 'Orangtua dari SUCIA NURYANTI', 'ortu_2324101533', 'ortu_2324101533@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$TreAzAxY0o1/fuf2d4fYnODSgQqXGKrMXa47lB9zjKpnUmbF4ByDK', 6, NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49', 1877),
(1900, 'Orangtua dari Syifa Mufidah', 'ortu_2324101534', 'ortu_2324101534@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7bVAWHvkMbmyFhyTakUgX.qj6KKdgd8P4DLYesS2j//kFmMtz7jue', 6, NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49', 1878),
(1901, 'Orangtua dari TIARA CITRA', 'ortu_2324101535', 'ortu_2324101535@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nX/MOLyFbnOBFQfoX9bbZ.5EeyLnS1165jP4QOV7Y3/HdNoqEtGoK', 6, NULL, '2025-12-18 03:03:49', '2025-12-18 03:03:49', 1879),
(1902, 'Orangtua dari Tita Hanita', 'ortu_2324101536', 'ortu_2324101536@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$1F6DJuDmJpBYu9eZ0t4SouwmthnbtQfWo52917gVzEjfzjmeM96W6', 6, NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50', 1880),
(1903, 'Orangtua dari Trie Amellia', 'ortu_2324101537', 'ortu_2324101537@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$z1W6C6zcYYK0AB4DTZKmK.hMJMIFjC8STjGIjAzHJioSkOSzSFp6e', 6, NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50', 1881),
(1904, 'Orangtua dari WIDYA ASTUTI', 'ortu_2324101538', 'ortu_2324101538@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$yZMY58vOeMGttJxCQtxlkeO4OrcqDa3hPpiZV/a9NXzNHPBN1Dc.K', 6, NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50', 1882),
(1905, 'Orangtua dari WINDI WULANDARI', 'ortu_2324101539', 'ortu_2324101539@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$YSPcCNheoIqraXvN45LRve1pHVoB.inVc/mBsdTrMGthU2Sd5vSL2', 6, NULL, '2025-12-18 03:03:50', '2025-12-18 03:03:50', 1883),
(1906, 'Orangtua dari YOKA RAMADHAN HERFIANI', 'ortu_2324101540', 'ortu_2324101540@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DJcqVdU5p5v6HI6ErU9JTOmIzG.BLFuU0FojLZqicLQKWJ.fp5Gua', 6, NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51', 1884),
(1907, 'Orangtua dari Ade Awaluddin', 'ortu_2324101181', 'ortu_2324101181@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Lte5lxmnqtLy1fX671NfCeZBjrSwUA09UZDks7Jfr0qzfmasIR1uy', 6, NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51', 1885),
(1908, 'Orangtua dari ADITIA', 'ortu_2324101182', 'ortu_2324101182@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vDX08CsBl6qaUoIm8NsPbeV7GTW3IS9ffq5rs/UnTP/rGE9J0PWom', 6, NULL, '2025-12-18 03:03:51', '2025-12-18 03:03:51', 1886),
(1909, 'Orangtua dari AFRIL DARMAYANTI', 'ortu_2324101183', 'ortu_2324101183@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$C/hMlTk/3keqpHBFriIkcu0cGhwaepRI4rpf3.SKrdeKaTLKY4j8m', 6, NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52', 1887),
(1910, 'Orangtua dari ALAN NURFIKRI', 'ortu_2324101184', 'ortu_2324101184@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$GjDbOw6AKZlWU90y2tIOm.5CSNwM1fZk0UciPmcq/j/X8H4QdXWH2', 6, NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52', 1888),
(1911, 'Orangtua dari ALMA NURAINI', 'ortu_2324101185', 'ortu_2324101185@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PhXB1gMj9LkhYCjF4NhgmecMD2a3BAXWaCJBzRMF1.1b04s/cO/L.', 6, NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52', 1889),
(1912, 'Orangtua dari AMELIA DEVIANTY', 'ortu_2324101186', 'ortu_2324101186@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$d8dD38emPP9lwvvt93D5aet.ZlxTQVNHbFI.J/ofC6E3K8cWkFZ3q', 6, NULL, '2025-12-18 03:03:52', '2025-12-18 03:03:52', 1890),
(1913, 'Orangtua dari ANDHARA FEBRIANY', 'ortu_2324101187', 'ortu_2324101187@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZB5NadQiLXr0zXCoi8y4eOHSOxHJoljYtRmYfXBpIqC07l6B.AEVC', 6, NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53', 1891),
(1914, 'Orangtua dari Ayu Andini', 'ortu_2324101188', 'ortu_2324101188@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6WGRWFVqtfmWu2mDIqXrXONuxPKJtpUHW7LfMy.lQkQqNnA/rHBSC', 6, NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53', 1892),
(1915, 'Orangtua dari Desta Rahma Agustin', 'ortu_2324101189', 'ortu_2324101189@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LW.0aIns2puZthZO2CEg/eqtVh/0R2zg1vdZ3bA1AG.QBFTaR/TpS', 6, NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53', 1893),
(1916, 'Orangtua dari Dwi Hartanti', 'ortu_2324101190', 'ortu_2324101190@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VWemmchkeDSDMHzKAm4w5eicgQ8xveyC0etGd4JmXvTn/bHBc6maS', 6, NULL, '2025-12-18 03:03:53', '2025-12-18 03:03:53', 1894),
(1917, 'Orangtua dari Fitria Rahmadhani', 'ortu_2324101191', 'ortu_2324101191@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$li1iDld9PBpmkFcxQI957OCSDIc7xjHkEv32IxFoU7p8OwLwLQ3ey', 6, NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54', 1895),
(1918, 'Orangtua dari Imel Asmaya', 'ortu_2324101192', 'ortu_2324101192@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$G8nbt2jKUPvJuyIrCR6r..bNzZZyEChvfMFz5xULz/Eo1zDlvfew.', 6, NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54', 1896),
(1919, 'Orangtua dari IQBAL ABDI AGUNG SAPUTRA', 'ortu_2324101194', 'ortu_2324101194@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$l2ihjfnJbAMUiReIJ8ajlOa724YFoRGdF0y6mGkn3BcyeRWqJ/E8e', 6, NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54', 1897),
(1920, 'Orangtua dari Irfan Ferdiansyah', 'ortu_2324101195', 'ortu_2324101195@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$pj0ladWcZNThLWn.TZ5o1eDkLx22NMIXSNIwSLy5nf2J6dcUHKOzW', 6, NULL, '2025-12-18 03:03:54', '2025-12-18 03:03:54', 1898),
(1921, 'Orangtua dari LILIH HUMAIROTUL HABIBAH', 'ortu_2324101196', 'ortu_2324101196@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xKALZsIBGhrgSOh6dF/vP.ln9DCfsv5mZ3m89Yuex5.ua.eLtIdq2', 6, NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55', 1899),
(1922, 'Orangtua dari Lusy Marsela', 'ortu_2324101197', 'ortu_2324101197@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DxQQQ7OaKsTr1o1ZeLnjK.0LSvbi5tSdmar.EnmnGrTdfz92eXRia', 6, NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55', 1900),
(1923, 'Orangtua dari MUHAMMAD ILHAM FIRDAUS', 'ortu_2324101198', 'ortu_2324101198@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kTfl45j87wHlOrCAUjjTKeWJPhRk3H2q7dnSTlrCZUUBXDe0jcG2u', 6, NULL, '2025-12-18 03:03:55', '2025-12-18 03:03:55', 1901),
(1924, 'Orangtua dari Naya Suci Septiani', 'ortu_2324101199', 'ortu_2324101199@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$gMZT0YOLBPCWabjK6z4HPOLw0rQkAt2OUIdndljOKPNpcZkJjdGam', 6, NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56', 1902),
(1925, 'Orangtua dari NAZA MAULANA MUHTAZ', 'ortu_2324101200', 'ortu_2324101200@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Q2Iq3BSeKlj1LDFoq1jy2.UhUSLrtHYCZe352eQe6MvX/.3X4kfyi', 6, NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56', 1903),
(1926, 'Orangtua dari NAZAR FATHURROCHMAN', 'ortu_2324101201', 'ortu_2324101201@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kznXSVO8vH84Slehla0Rhe.VUd8TYyadCvjXS9jHO.dkfoH.Gfo2e', 6, NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56', 1904),
(1927, 'Orangtua dari Nur Anida', 'ortu_2324101202', 'ortu_2324101202@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mExVTjwOkubwRgtEWZTG3u76wfQEyG5Z37SlPnISPlMxtmeiUnKna', 6, NULL, '2025-12-18 03:03:56', '2025-12-18 03:03:56', 1905),
(1928, 'Orangtua dari Nurlaila', 'ortu_2324101203', 'ortu_2324101203@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wIUYVzGzEi6sTu/QDkadsOlaaQCIJZBFl0LbeRk/sjb7ls67ag8Ta', 6, NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57', 1906),
(1929, 'Orangtua dari RAISSYA DINA CAHYANABILA', 'ortu_2324101204', 'ortu_2324101204@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$FkFg7AN1TLELNv6DPnail.qDpBevWPa4XQrL87KW5/7wwyAMWl9sa', 6, NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57', 1907),
(1930, 'Orangtua dari Resti Shintia Rahayu', 'ortu_2324101205', 'ortu_2324101205@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kX2B5DFJtlXldlaYmN68huJcnsVS4h8zoeIuxQmDsKuKwyYA1qF0e', 6, NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57', 1908),
(1931, 'Orangtua dari RISNA NATASYA', 'ortu_2324101206', 'ortu_2324101206@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$HEzfqdC5PU156JhP4BrDc.9lKC0BodaDKdm/hPReBCh5AgTSQ61UC', 6, NULL, '2025-12-18 03:03:57', '2025-12-18 03:03:57', 1909),
(1932, 'Orangtua dari Rizky Aditya Gumilang', 'ortu_2324101207', 'ortu_2324101207@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2ncbuLmvOAMFcTIKdIcrzeOgyAeIm7RJzSBufkshDghnjnxr0o7X6', 6, NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58', 1910),
(1933, 'Orangtua dari SEKAR RAHMAWATI', 'ortu_2324101208', 'ortu_2324101208@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EcS9WmTeMK5PmUJpYDCovOOkiLWe/ZUBY4rL21szDtscE3VOo/19e', 6, NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58', 1911),
(1934, 'Orangtua dari SERRYN YOLANDHA PUSPITADEWI', 'ortu_2324101209', 'ortu_2324101209@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$s9hqc0LOUYlbRJRAI./Oq.DUDoUyc8CmZGOtA80xtBF1nRUeJchF6', 6, NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58', 1912),
(1935, 'Orangtua dari Shalsa Astriani', 'ortu_2324101210', 'ortu_2324101210@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kGEJTsXV/4PoXt3AFYLW9umMDM/CfxARWbffYQLArMEV/tiOVPu4a', 6, NULL, '2025-12-18 03:03:58', '2025-12-18 03:03:58', 1913),
(1936, 'Orangtua dari SITI VANIA PURWANTI', 'ortu_2324101211', 'ortu_2324101211@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5OZ54fnZTmHVdlP62hE/wu7uw1yZhJ/93DELC2IGsSQE5TBBV8vI2', 6, NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59', 1914),
(1937, 'Orangtua dari Tia Septiani', 'ortu_2324101212', 'ortu_2324101212@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$SzhG.EdWkPC19uLpE/Bsv.JuCbHhaOQcVkYLmZNuzqDItqU88efKK', 6, NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59', 1915),
(1938, 'Orangtua dari Vina Nurhaliza', 'ortu_2324101213', 'ortu_2324101213@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$3XCwD2faDGIpQgE.09FaOeLrsKEQsyXHlL9vf9LNM0ZnSNbTL1vra', 6, NULL, '2025-12-18 03:03:59', '2025-12-18 03:03:59', 1916),
(1939, 'Orangtua dari Winnie Bunga Suci', 'ortu_2324101214', 'ortu_2324101214@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ciWjkTdk0kK689Gk3ZOLre5NjHXscQWEu2WzMK1TQDBsS5n5xAdpO', 6, NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00', 1917),
(1940, 'Orangtua dari WULAN HAYATUN NISA', 'ortu_2324101215', 'ortu_2324101215@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jt6SA/ThlOZnjfw/WLJEte6eJfTiNizjPR1q.ww7f76yHjNeusVkS', 6, NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00', 1918),
(1941, 'Orangtua dari Yuni Nuraeni', 'ortu_2324101216', 'ortu_2324101216@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jdinPPnHkh2YEATerYgdseD6D28VUTWw6w6sNZnJcrE0.nAun8cpa', 6, NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00', 1919),
(1942, 'Orangtua dari Adi Purnama', 'ortu_2324101217', 'ortu_2324101217@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$wN6PT.UFzK7KFqmsidVhHekS0X5W1iOWuT8Q9JsHV.5WQ3e91DMqi', 6, NULL, '2025-12-18 03:04:00', '2025-12-18 03:04:00', 1920),
(1943, 'Orangtua dari AISYAH NURSAFITRI', 'ortu_2324101218', 'ortu_2324101218@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5g/ILejZsMxNbcjS2RsSe.KnxKjmw9NuF2Xyb7rDLFJYEix.Ese72', 6, NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01', 1921),
(1944, 'Orangtua dari ALLYA ZAHRATUS SYIFA', 'ortu_2324101219', 'ortu_2324101219@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$TMMEKQArOyhXpzG/6kGOSeIqW6D2ccPU/72oQv8uk7STkZCU39QZO', 6, NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01', 1922),
(1945, 'Orangtua dari Amelya Natashya', 'ortu_2324101220', 'ortu_2324101220@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4WFIP6VQKZfNMlZzLwO/ju5OXC99lUbFWqN7rth01wp6b5/5ggM0O', 6, NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01', 1923),
(1946, 'Orangtua dari ARIN TIFFANY MEYLAN', 'ortu_2324101221', 'ortu_2324101221@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$yMDNCu.WciQGZPSo5gWiJOo/zWgzxhzVKgi7ybHnjl1ZxZvIrH.9O', 6, NULL, '2025-12-18 03:04:01', '2025-12-18 03:04:01', 1924),
(1947, 'Orangtua dari CHANTIKA CHINTYA HERYANTI', 'ortu_2324101222', 'ortu_2324101222@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$43RbEvDwWuxruzRQYzjW2e8pL0bmLbAXvNH.ELzJBPDP4mDR/CXDG', 6, NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02', 1925),
(1948, 'Orangtua dari Dany Irwansyah', 'ortu_2324101223', 'ortu_2324101223@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$aYI4r7BSeyP8nlRJX3Li7uYyerREiAFSJYNfO2qIKnEufKca5Exea', 6, NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02', 1926),
(1949, 'Orangtua dari DELLA AMELIA AGUSTIN', 'ortu_2324101224', 'ortu_2324101224@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$roLzfAiAG5fvg3vzxUOk1uRmOB4NNMCMLBH89rebKZx2WAvTdK8OC', 6, NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02', 1927),
(1950, 'Orangtua dari DIKRI FAUZAN', 'ortu_2425101542', 'ortu_2425101542@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EUI.SUu/OO4C55Lbu3QefeHO7rmrGnMOHPsDHvt3FrzzZ2onCHW0m', 6, NULL, '2025-12-18 03:04:02', '2025-12-18 03:04:02', 1928),
(1951, 'Orangtua dari DINDA LESTARI', 'ortu_2324101225', 'ortu_2324101225@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fwZ/y9PyMKpqFtHVBAbs/Ov.Eo8uirwUIVkCwYIrUlYS7RzzcKurq', 6, NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03', 1929),
(1952, 'Orangtua dari FARIZ MAULANA PRATAMA', 'ortu_2324101226', 'ortu_2324101226@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jdA6NIkNCLfkqEYMCAm5cuGlTwzTKkG1wpCB8N9JEyKHBPN0XpsvO', 6, NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03', 1930),
(1953, 'Orangtua dari FARREL ATTARSYAH', 'ortu_2324101227', 'ortu_2324101227@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$rNT2NpMu7MME6okp2wzAgOG9YNM8phgb6RH44UCCJbMpvcyn.5O7m', 6, NULL, '2025-12-18 03:04:03', '2025-12-18 03:04:03', 1931),
(1954, 'Orangtua dari GISELA VIEKA INDRIANI', 'ortu_2324101228', 'ortu_2324101228@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$sjf2eSKcZ3N90VgIm3EVJuRKqvk2mlQD1NynqNXBgAaFROYaWeKcm', 6, NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04', 1932),
(1955, 'Orangtua dari HESIN RAHMAWATI', 'ortu_2324101229', 'ortu_2324101229@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$cTy6/4Il16DOcqeKkJyDneZ0iua4l0E/vWNgSvVWg3qUvGCU8EC8i', 6, NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04', 1933),
(1956, 'Orangtua dari Irma Rahmawati', 'ortu_2324101230', 'ortu_2324101230@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$g9kUEodsUKvKVdh.R.ZbPedOtgnSk1nCihuCnPr4B3A4RSSOhpGZi', 6, NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04', 1934),
(1957, 'Orangtua dari LENY YULIANTI', 'ortu_2324101231', 'ortu_2324101231@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5cZuMrlGJMTtweUFkvGO1O4y01Ff1Qv4AqbHHcVAOdIZ8.kAgsUp.', 6, NULL, '2025-12-18 03:04:04', '2025-12-18 03:04:04', 1935),
(1958, 'Orangtua dari Mega Retno Briliani', 'ortu_2324101232', 'ortu_2324101232@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$1ymkcS5UzwWnSPPTvwqVZu5cWkYCYm9dmEF3UCPkh.phesyiUkWTe', 6, NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05', 1936),
(1959, 'Orangtua dari MUHAMMAD DESTA PRATAMA', 'ortu_2324101233', 'ortu_2324101233@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Y2Lo12YMk.44uz/J4ZRAaOzESzjLK8nLBKj82nzPEFSAnD66NMqma', 6, NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05', 1937),
(1960, 'Orangtua dari MUHAMMAD WALI ALKARIM', 'ortu_2324101235', 'ortu_2324101235@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lM0/.7l4y3Ucso6R4tXhYOXmgggkh4kuZEQG8Xte2NoYsSjgtlf1G', 6, NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05', 1938),
(1961, 'Orangtua dari MUHAMMAD ZULFAN YANUAR', 'ortu_2324101236', 'ortu_2324101236@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$okt/RhtCQSgyZihaFsFxzuTixEv/Y5bOZNi6Q/J.LB2i1ceHsgdn2', 6, NULL, '2025-12-18 03:04:05', '2025-12-18 03:04:05', 1939),
(1962, 'Orangtua dari Nikeisha Syifaaul Qomah', 'ortu_2324101237', 'ortu_2324101237@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NAkavq2SUMVCPtIHtjbGVORKpUW56PfKRtp7V72y5gyXufyAQWtJy', 6, NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06', 1940),
(1963, 'Orangtua dari Nisya Dwi Utamy', 'ortu_2324101238', 'ortu_2324101238@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6ZjlluLunQ2CUjNCtTz37.J8pd0wYjVopBPHf.DR/vYCNnWqj528K', 6, NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06', 1941),
(1964, 'Orangtua dari Nita Amelia', 'ortu_2324101239', 'ortu_2324101239@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ydlvvvrwRwKK8YUcpwJRE.6JjDRIMhd0kGmtZemmpO7sNmDgwCS8m', 6, NULL, '2025-12-18 03:04:06', '2025-12-18 03:04:06', 1942),
(1965, 'Orangtua dari NIZAR ADIT TRIANSAH', 'ortu_2324101240', 'ortu_2324101240@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VHyVjEXANil.WQUPFALc/OXOjwvILjWDnu1T7sASS4sEuPiZYWVoK', 6, NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07', 1943),
(1966, 'Orangtua dari NORY TASYA PRATIWI', 'ortu_2324101241', 'ortu_2324101241@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$N.fpyoqK.uTGjmln0Bmqaugut1.RYCSYYRDraC1TapGM1L8Y2Nczm', 6, NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07', 1944),
(1967, 'Orangtua dari QEYSHA QUINN SHAQUILLA SETIAJI', 'ortu_2324101242', 'ortu_2324101242@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$OghiABGNHx2oyCXHPO8/g.YaivTxkAHZ4AZTBNUd1uHMRVzi7Xb5O', 6, NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07', 1945),
(1968, 'Orangtua dari Rainova Ibny Muyassar', 'ortu_2324101243', 'ortu_2324101243@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LlOdJZhgfoQcSqQEonPpeOetfhp4SouRNcw6QVpCrPcAXgJaWqeAW', 6, NULL, '2025-12-18 03:04:07', '2025-12-18 03:04:07', 1946),
(1969, 'Orangtua dari Raisya Suci Ramadani', 'ortu_2324101244', 'ortu_2324101244@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lMt7ihpAufeyHNzQgHKicu.sXOc4j2SMA0SEa7LDIV5uPx6CV3Qy6', 6, NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08', 1947),
(1970, 'Orangtua dari REVA LIANISHA SUPARMAN', 'ortu_2324101245', 'ortu_2324101245@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bzX2hjMB0yOUsY13tMNx0.7ygkPdQVYJV56bLP9Q/FcF8vyI6bvEO', 6, NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08', 1948),
(1971, 'Orangtua dari RIRIN NURAENI', 'ortu_2324101246', 'ortu_2324101246@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7ROFn6V.g8M9fii7wRRpuuhJSbkrJQESBEJ/d9LXd6cettW5vxHcC', 6, NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08', 1949),
(1972, 'Orangtua dari Risca Dwi Aryanti', 'ortu_2324101247', 'ortu_2324101247@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EbK55HoDyWsnW5wyEKpvrO8lAqgF3Ixv7WmVcTYU3bATqwFYtVctG', 6, NULL, '2025-12-18 03:04:08', '2025-12-18 03:04:08', 1950),
(1973, 'Orangtua dari ROBY HERMANSYAH', 'ortu_2324101248', 'ortu_2324101248@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4PQTuRf/PHKy4tR2KhSlUeBxwXqAkpuSUqu5KA/ExiOSkFeX7K7HK', 6, NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09', 1951),
(1974, 'Orangtua dari SAVANNAH CLARA MAULIKA', 'ortu_2324101249', 'ortu_2324101249@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$gQLDhKRhTBZNYvqAuo5pb.U0GBSBT1W5w8ODEPRo/z0yyVaovhAmy', 6, NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09', 1952),
(1975, 'Orangtua dari SESILIA', 'ortu_2324101250', 'ortu_2324101250@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$tmxQVgXtIRYC2kDJhUXz3uz5wm2ZA9WyqtI8wXNNK/lxOmxZUkjEa', 6, NULL, '2025-12-18 03:04:09', '2025-12-18 03:04:09', 1953),
(1976, 'Orangtua dari SIFA FAUJIAH', 'ortu_2324101251', 'ortu_2324101251@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$KjXU0m86ButS6SSzWKYHcurU3H2X1OiP.utoKQiAU6PFT0pNxPjt6', 6, NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10', 1954),
(1977, 'Orangtua dari ALFANDI ANDRIANSYAH', 'ortu_2324101253', 'ortu_2324101253@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$UAD5mC1A5Pb7KPIQtWWU9em9Jg5zpohNNW2iqsTwKsyEyM82swUye', 6, NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10', 1955),
(1978, 'Orangtua dari DESWITA VERAWATI', 'ortu_2324101254', 'ortu_2324101254@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4Yn4DbKMGkXJMBuJAYexseCF0Mstxreu7C34DwJYHN6jrI1rT/JWy', 6, NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10', 1956),
(1979, 'Orangtua dari Devi Sulistia', 'ortu_2324101255', 'ortu_2324101255@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fo3sYgrv16Sez1kOiED9p.PJg7hcf7P4HRsnl2BhHwxryd6B2W9H2', 6, NULL, '2025-12-18 03:04:10', '2025-12-18 03:04:10', 1957),
(1980, 'Orangtua dari Dika Apriansyah', 'ortu_2324101256', 'ortu_2324101256@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8PP9vCL5YLW63ciSAHe9EeiBK1mEfV.0gFlHMgtObgfdsX0tV3Q5e', 6, NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11', 1958),
(1981, 'Orangtua dari ELIN NURAINI', 'ortu_2324101257', 'ortu_2324101257@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$n77LmWn6g7ihzas0CkYD2e.U.UN1fDoJuJ.Tilv7f.88uWZ.0P3GG', 6, NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11', 1959),
(1982, 'Orangtua dari ELINA AGUSTIN', 'ortu_2324101258', 'ortu_2324101258@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xCg/SOHozoh944eYyxPvUuGhFxdgdijMuKGP5gfK7xkKK9Dd7srsy', 6, NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11', 1960),
(1983, 'Orangtua dari Elsa Khoerunnisa', 'ortu_2324101259', 'ortu_2324101259@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$gBfmvZaBriZ2hl62rQqp3eGTg9RrQdLjNSAIxKea952UQy/Pj9YyG', 6, NULL, '2025-12-18 03:04:11', '2025-12-18 03:04:11', 1961),
(1984, 'Orangtua dari Fahriel Muhamad Fauzan', 'ortu_2324101260', 'ortu_2324101260@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$c7E.35LanpHyPbI9kW7tluTKDXh/E0xOuINTzeERkZxmHoQS5Sari', 6, NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12', 1962),
(1985, 'Orangtua dari FAREL SYAFIQ ABRAR', 'ortu_2324101261', 'ortu_2324101261@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$APOdwvpKuASaib7D4BVYt.mhN6sTFxHw/C3HPbMtYRpme0d7s6RfS', 6, NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12', 1963),
(1986, 'Orangtua dari Fita Oktafiani', 'ortu_2324101262', 'ortu_2324101262@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$7JiKJiDNclorBJ25K7aDbOBFnzWPlAurZphmsRoJUjttR0j8Funei', 6, NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12', 1964),
(1987, 'Orangtua dari FITRIAH NURLATIFAH', 'ortu_2324101263', 'ortu_2324101263@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$RxSYU062AHgrkY2X9d4EVeg2QaG3UcMdfpIQY9ftIR8CcqivazJgu', 6, NULL, '2025-12-18 03:04:12', '2025-12-18 03:04:12', 1965),
(1988, 'Orangtua dari HANNY APRILA LESTARI', 'ortu_2324101264', 'ortu_2324101264@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Ij3/Dr.I3mroIofsLyr09e5oR9.lLnQ0uIrh.WiGKihl0mxeQNmFm', 6, NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13', 1966),
(1989, 'Orangtua dari ILMI PIANDYA', 'ortu_2324101265', 'ortu_2324101265@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$C8AAWeVtaFGKGT1kJfT.juaDyaqwEeDa5.D.tw5sQ3D/rbOjMnbZy', 6, NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13', 1967),
(1990, 'Orangtua dari Ismi Nurafiani', 'ortu_2324101266', 'ortu_2324101266@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bs.3c5f5Oou25iy6GdYAMe1BlKEAeLCC9Ie3/kvUKqPiGfrcN/ZRW', 6, NULL, '2025-12-18 03:04:13', '2025-12-18 03:04:13', 1968),
(1991, 'Orangtua dari Lydia Rizkianti', 'ortu_2324101267', 'ortu_2324101267@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/11GN1U9PFFpay94L2/fNeg64QQ4VplFkdXWnOI.u7gHW2DW3or7q', 6, NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14', 1969),
(1992, 'Orangtua dari M. Khisyar Ma\'ali', 'ortu_2324101268', 'ortu_2324101268@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VdK6orhdLPkHntX4ezZWaueG4f3f94oett9czeKcq.ymeeHdevlTi', 6, NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14', 1970),
(1993, 'Orangtua dari M. ZIA BAGUS PAMUNGKAS', 'ortu_2324101269', 'ortu_2324101269@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Uf583E0SykzCST8IEP/JU.AU1NO3ygg.a8qGb0Sl8/9aIErCre7F6', 6, NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14', 1971),
(1994, 'Orangtua dari MAULIDA CAHYA PRATAMI', 'ortu_2324101270', 'ortu_2324101270@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$vrSlH6o50RxIaUyQjUdree1I8qlQxSQmjCja3Kxay8a5lr.hNxbPK', 6, NULL, '2025-12-18 03:04:14', '2025-12-18 03:04:14', 1972),
(1995, 'Orangtua dari MUMUN MUNZIAH', 'ortu_2324101271', 'ortu_2324101271@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$sIG18cLBM2fKh0V98t.MT.XW3Zjiit7Lb7HY277kvldJogWPqeL7S', 6, NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15', 1973),
(1996, 'Orangtua dari NELA AULIA', 'ortu_2324101272', 'ortu_2324101272@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xhk5/N1xDduMk708.cF5S.O/aHyYUjUT/sSxIUMf8cL4/fAMYhjwu', 6, NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15', 1974),
(1997, 'Orangtua dari NESYA NAZWA MAULID', 'ortu_2324101273', 'ortu_2324101273@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zXR8/Wzi7S6ABmoQEdf9MegLgr0CCX/1EsMRp4M1qb8QxZYtHxzVO', 6, NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15', 1975),
(1998, 'Orangtua dari NURUL SILVIANI SOLEHA', 'ortu_2324101274', 'ortu_2324101274@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$KOCneXVnEc7vgBZNTdnTjuLYNYVrKPs1QVxevGEtzd0RGU/jG/846', 6, NULL, '2025-12-18 03:04:15', '2025-12-18 03:04:15', 1976),
(1999, 'Orangtua dari PHASYA RESTU VIGO AKHMATSYAH', 'ortu_2324101275', 'ortu_2324101275@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$N2SrQhzwG3ln82dD4.UhJ..BAl6sD9yD6n9KU1tesifKiA8nM7RYm', 6, NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16', 1977),
(2000, 'Orangtua dari RAISYA RAMDHANI', 'ortu_2324101276', 'ortu_2324101276@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LcKkBU9jITBmkRTEeOCSxu9mn4aGIYt468Cbg7Gnjz2d..YXNEdY2', 6, NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16', 1978),
(2001, 'Orangtua dari RARA RASIKAH', 'ortu_2324101277', 'ortu_2324101277@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$j2eRIX1fz3RZ2fArWUp5NeyJX3zX0l.28lGztV7WSY35dKe7wyx.e', 6, NULL, '2025-12-18 03:04:16', '2025-12-18 03:04:16', 1979),
(2002, 'Orangtua dari Resti Riska Diana', 'ortu_2324101278', 'ortu_2324101278@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.SI1xI063ttTerDuOci5m.sAnzJPtd1Aa7Cl23pM1hmtztxsjU15i', 6, NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17', 1980),
(2003, 'Orangtua dari RISQI SAPUTRA', 'ortu_2324101280', 'ortu_2324101280@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$EwxLda44f59IJ/pyGm1TeOuNwAPm0gb3vRvEVLMF5I67c/onjbDyy', 6, NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17', 1981),
(2004, 'Orangtua dari RIZKI KHOLIK MUBAROK', 'ortu_2324101281', 'ortu_2324101281@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$i96jXiDA2wNEo8bSPik2He5xubICIyB3jkOgtZIEauMh5mMk6OcVW', 6, NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17', 1982),
(2005, 'Orangtua dari SENI PUSPA NURANI', 'ortu_2324101282', 'ortu_2324101282@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Gihw25feuvc0CMoxeJXkYuF2IMY7JY.xk70Hph8ZK3i4BBvuqadIy', 6, NULL, '2025-12-18 03:04:17', '2025-12-18 03:04:17', 1983),
(2006, 'Orangtua dari Shaira Oktavia', 'ortu_2324101283', 'ortu_2324101283@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$6CzPHCGhZ8EkDBm5g0bNkOkgvh0mz7nbVWUBwq1GniW.OQEQmsM7e', 6, NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18', 1984),
(2007, 'Orangtua dari Sheren Redina', 'ortu_2324101284', 'ortu_2324101284@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9weQY2SQj/t4MHSIJhQs6.QMWA1TdU6s9KlduLn1NEvVpFmyxUEpi', 6, NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18', 1985),
(2008, 'Orangtua dari SRI ISMAYANTI', 'ortu_2324101285', 'ortu_2324101285@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DZ3Dl27roIuCuThvNTYSc.dIQZhMNejEs.2ZEfblBk2B2pDOmpDnC', 6, NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18', 1986),
(2009, 'Orangtua dari SURYA FALAH', 'ortu_2324101286', 'ortu_2324101286@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$U/ARl6sNVpat6yBWfN3u.evaDlx0elMfYV763Z8dpVl1o.9ugDzOO', 6, NULL, '2025-12-18 03:04:18', '2025-12-18 03:04:18', 1987),
(2010, 'Orangtua dari Syifa Frananda Heryanto', 'ortu_2324101287', 'ortu_2324101287@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$X5OhAGcRNQAQhOxCxLExVucr6RDaSRSJCI3RMEau7x7OnifeRBEZG', 6, NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19', 1988),
(2011, 'Orangtua dari AA FAUDZAN NURSETIA', 'ortu_2324101433', 'ortu_2324101433@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$eDpr/s6jPKPFoW82gYe.X./z6Q5n.BCi2gZB/BHN85f6NU593slD2', 6, NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19', 1989),
(2012, 'Orangtua dari ADAM MUHAMMAD RIZKI', 'ortu_2324101434', 'ortu_2324101434@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$J9xx8c25M436VB8pqI/FnOFxDsk/CUfbYGaV/DBCNtPSajpNZGVPu', 6, NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19', 1990),
(2013, 'Orangtua dari AJI WIDAYAT', 'ortu_2324101435', 'ortu_2324101435@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2QTLKx2qwIImtLnipsE.f.7soX/Hi6VOrKTDxCu2.twq3oeiZZRK6', 6, NULL, '2025-12-18 03:04:19', '2025-12-18 03:04:19', 1991),
(2014, 'Orangtua dari ALFHA RADJA YANUAR', 'ortu_2324101436', 'ortu_2324101436@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$M.uFQhu8RvD2Og/hppYyzupUbko1HH0QrmXB3GT/aT0InhLJPlHxK', 6, NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20', 1992),
(2015, 'Orangtua dari Andiki Pratama', 'ortu_2324101437', 'ortu_2324101437@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Y0v6F5mrvZwFRH.vv5SMEu1gy5ByrjdQWRGZ4lz4FLHbYMPheV7gu', 6, NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20', 1993),
(2016, 'Orangtua dari AREL HENDARSYAH', 'ortu_2324101438', 'ortu_2324101438@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nsmR3eh/SbhiUV92mKkvX.Hw2QZS5Cnlo/td5JmeR5x3/JzoPRX4K', 6, NULL, '2025-12-18 03:04:20', '2025-12-18 03:04:20', 1994),
(2017, 'Orangtua dari ARIL GUNAWAN', 'ortu_2324101439', 'ortu_2324101439@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CezfdstULJ0Qt.H.fv1Z0ecMed.6wjU.qn5jYHJejRgJcf7gJl86y', 6, NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21', 1995),
(2018, 'Orangtua dari Deni Anugrah', 'ortu_2324101440', 'ortu_2324101440@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$rTkBlokw75/j96kbBHlakuez3HN/RUvOKcrbJmMaw9uKmN9Cra.Wq', 6, NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21', 1996),
(2019, 'Orangtua dari DIKA D ARIANTO', 'ortu_2324101441', 'ortu_2324101441@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZateWwsY7b0jbQEriNYr/OBZlTwXUubzpWCaDde.PZc0j9DwFd9pW', 6, NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21', 1997),
(2020, 'Orangtua dari Enditha Alifia Salsabila', 'ortu_2324101443', 'ortu_2324101443@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mUu/kubZtuhB.l8j1olBJeUOju1GiM67EbovGE.nq9CmMP8EJ6lia', 6, NULL, '2025-12-18 03:04:21', '2025-12-18 03:04:21', 1998),
(2021, 'Orangtua dari ERVAN MAULANA', 'ortu_2324101444', 'ortu_2324101444@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DlINssw4BfokQ2FcBKseA.zh8w3T0UHlXZK29Sor5J6fSOTDDLFZa', 6, NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22', 1999),
(2022, 'Orangtua dari GALIH RAMADAN', 'ortu_2324101445', 'ortu_2324101445@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$VWjgBEfqQHiJvv2ipA6cP.veq2y/g1oSi.1HZndA1zt7G54LgSjbK', 6, NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22', 2000),
(2023, 'Orangtua dari GERIN RIANDY SOLIHIN', 'ortu_2324101446', 'ortu_2324101446@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/WGS877oDb3n7FXpH.uKheD6jgNVKoZ/3pd2K.iwZ8t8CIfBl3TX2', 6, NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22', 2001),
(2024, 'Orangtua dari GHIN GIN ALAMSYAH', 'ortu_2324101448', 'ortu_2324101448@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$uvZrBS7jfBB2GCJGbgiHveq68wacQmfIcpbMDd4TvusIV2mMHWYwy', 6, NULL, '2025-12-18 03:04:22', '2025-12-18 03:04:22', 2002),
(2025, 'Orangtua dari ILHAM HUSNI', 'ortu_2324101449', 'ortu_2324101449@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$lE4sDzeQ1/8QvfqSTezCNeXu4eRa1A6cxc/NbbO.IeWT2IoV2H1jS', 6, NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23', 2003),
(2026, 'Orangtua dari Intan Nur Fadillah', 'ortu_2324101450', 'ortu_2324101450@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$B4.GaOgXwGhIwUl.1CbqcuEl6sYXuokND2omSbzb7Sq4YvjyqpWLa', 6, NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23', 2004),
(2027, 'Orangtua dari Irpan Maulana', 'ortu_2324101451', 'ortu_2324101451@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$106pJBpNQ3dkIIzOvF5o4.AuJtFb4XI0hTW3H3lhHKjZI4Gt3u/fG', 6, NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23', 2005),
(2028, 'Orangtua dari IRPAN RIFAI', 'ortu_2324101452', 'ortu_2324101452@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$aWmyNWzw6jBNCaYzA8jzDOFd0pXVqX5GMNoJy.apRoUpuDVw7Qt5G', 6, NULL, '2025-12-18 03:04:23', '2025-12-18 03:04:23', 2006),
(2029, 'Orangtua dari Kaufanullah Almugni', 'ortu_2324101453', 'ortu_2324101453@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$RqqubsI/1bljjCDmo3p5g.7FKFooZ.xVkP9OiXzzTEgvOROtOVq5q', 6, NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24', 2007),
(2030, 'Orangtua dari Keizha Adya Mecka', 'ortu_2324101454', 'ortu_2324101454@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$iQgUCje8QzwPtApmuR.RIO4itKdXqhazB589tTzn9perIor.r4uze', 6, NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24', 2008),
(2031, 'Orangtua dari MARIO FEBRIAN', 'ortu_2324101456', 'ortu_2324101456@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZlGNn6Ed/zFidlUrpy.4F.rtL1nZ2JHfHV6RlBXiSyqLYDVh0pZNK', 6, NULL, '2025-12-18 03:04:24', '2025-12-18 03:04:24', 2009),
(2032, 'Orangtua dari Muhammad Rasyid Ridlo', 'ortu_2324101457', 'ortu_2324101457@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$au2JkVbToPA5vlU.jJStXOaT.Ye5Pg361FIiCp0YxJdUNkRFISNje', 6, NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25', 2010),
(2033, 'Orangtua dari NIZMA NURWAHIDAH', 'ortu_2324101458', 'ortu_2324101458@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zIEVtEupTK/oRWtt7/QcjOPoW5Zz2.2yPjw6LDT5eK9PsCSM.KMZ2', 6, NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25', 2011),
(2034, 'Orangtua dari RENATA AURELLIA RAMADHANI', 'ortu_2324101459', 'ortu_2324101459@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$0zxOiKWAmFtGbGvBZ.W/OuROZBbQqLhD.QgN2tNcrsvbL42TFGlje', 6, NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25', 2012),
(2035, 'Orangtua dari RIFA GINASTIAR', 'ortu_2324101460', 'ortu_2324101460@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ZFBXy3CtAm.aNNT7LxpzRe6IggqPHWgKERe/ZHOfRyJ5oTx4GxGPG', 6, NULL, '2025-12-18 03:04:25', '2025-12-18 03:04:25', 2013),
(2036, 'Orangtua dari Sandi Maulana Jalaludin', 'ortu_2324101461', 'ortu_2324101461@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nS18D2kNidAu.SQGBaTMcuySl.ch3wF1bCqjLY3DWpj.6IyuTkPSa', 6, NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26', 2014),
(2037, 'Orangtua dari SHINTA OKTAVIA', 'ortu_2324101463', 'ortu_2324101463@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fABXDzFDaqNCUgBCSAvwEOiO7e.R/OiSutZxt8ihOeV.hYuXr3hGy', 6, NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26', 2015),
(2038, 'Orangtua dari SULISTIANINGTIAS', 'ortu_2324101464', 'ortu_2324101464@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$8ru.v2ATWh4g7MBUTgdAGe3zFUrSQiXxgtB5gIGTj0NoiYz0Bj41C', 6, NULL, '2025-12-18 03:04:26', '2025-12-18 03:04:26', 2016),
(2039, 'Orangtua dari VELANI SUBEKTI', 'ortu_2324101465', 'ortu_2324101465@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$PfbmkKPvzaE1o/o4e/WNI.TBHl7liDIn7kw1qmXzyo6krFhdBPnIO', 6, NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27', 2017),
(2040, 'Orangtua dari Wanda Putri Iwani', 'ortu_2324101466', 'ortu_2324101466@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NF2mQStFrGYxTAqbU1CQQue8cvDLrJwWmTrdqHsiSjXHraSVXQvhi', 6, NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27', 2018),
(2041, 'Orangtua dari YOGA MUHAMMAD FIKRI', 'ortu_2324101467', 'ortu_2324101467@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$DCXXmzAJCXf0EtgQrkdYI.p/o8iesnoRXm0YsqkdDodhuP6OrxWgy', 6, NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27', 2019),
(2042, 'Orangtua dari ZIKRI DELPIANA', 'ortu_2324101468', 'ortu_2324101468@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$CxYp9r9kr8gTpRsIze33uOVJAmGNbco2UTPX2v1lfi0lujPH0lZkO', 6, NULL, '2025-12-18 03:04:27', '2025-12-18 03:04:27', 2020),
(2043, 'Orangtua dari Adelio Farrell Julistira', 'ortu_2324101001', 'ortu_2324101001@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nzQgSWrlOXaWXMCvMGB44ehnbLsVhHoBiSJq.DjxhRylaHgBK9.Om', 6, NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28', 2021),
(2044, 'Orangtua dari AKBAR MAULANA', 'ortu_2324101002', 'ortu_2324101002@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Jmf.cjJeMFSAqZwT9Y2sMOJHWURBifabC0/lIaXbCWt/SEabf33Oy', 6, NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28', 2022),
(2045, 'Orangtua dari AKMAL GHANI LAODA', 'ortu_2324101003', 'ortu_2324101003@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mgbNUb1Y7/PRlTa1pYpot.6FQRx.conJa/GCUhoG0hiIIWnkzc11m', 6, NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28', 2023),
(2046, 'Orangtua dari ALDI ALFAN FEBRIAN', 'ortu_2324101004', 'ortu_2324101004@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$AeQZxWaJQupAtxvenDVgX.WuxRT5a/DC1UAbfW1ZBtubrgFIrRgZe', 6, NULL, '2025-12-18 03:04:28', '2025-12-18 03:04:28', 2024),
(2047, 'Orangtua dari ALDI RENALDI PRATAMA', 'ortu_2324101005', 'ortu_2324101005@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$YjBG1/BBDZ4iEBtf32upU.uHCsVXNe1hJr5crnr2/yjOA7F0W1v62', 6, NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29', 2025),
(2048, 'Orangtua dari Alya Ramadhani Nur Aini', 'ortu_2324101006', 'ortu_2324101006@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mxmw.Rq9yB/OYgddZ7cIO.qIMlFjglHLds9RAokazdnK1reIeWY7m', 6, NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29', 2026),
(2049, 'Orangtua dari ANDIKA JAYA SAPUTRA', 'ortu_2324101007', 'ortu_2324101007@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qrEEbwQeUIG9WyJlB3KnveJRlHuwLTdmOMROgu.6at6XLm4LIStPy', 6, NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29', 2027),
(2050, 'Orangtua dari ANDIKA RAMDANI', 'ortu_2324101008', 'ortu_2324101008@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$2cwbZHb5JaA357nzKkYt3.o.S9CoKb55gK3viv3Fq5qqZyITdhkva', 6, NULL, '2025-12-18 03:04:29', '2025-12-18 03:04:29', 2028),
(2051, 'Orangtua dari ANGEL FRANSISCA JAYA PRATIWI', 'ortu_2324101009', 'ortu_2324101009@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$eOLKfWPgcRtY8OGhRod9oOJEsC8gpiMiBYBST6/bYe/hYo9yMPOxm', 6, NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30', 2029),
(2052, 'Orangtua dari DEDE SUPRIATNA', 'ortu_2324101010', 'ortu_2324101010@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$M5r.7xG3EyaqGqxGLbfQFu4FG10GEAt/cxihh4mNUKXvd1FrSKHce', 6, NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30', 2030),
(2053, 'Orangtua dari FAHRUL RIADU AMARULLOH', 'ortu_2324101011', 'ortu_2324101011@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xrgNQeU7RpQALc9AREyMLuECUbjTNg9CaoExBp9b53HbT/CGB/.W.', 6, NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30', 2031),
(2054, 'Orangtua dari Farhan Fauzan', 'ortu_2324101012', 'ortu_2324101012@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$QuVjRSj.Rs0l1iJafXGapuv1rt2U4FOBZ8mMGnmJG4bJjXlep7uTq', 6, NULL, '2025-12-18 03:04:30', '2025-12-18 03:04:30', 2032),
(2055, 'Orangtua dari FIKA RISCIANI', 'ortu_2324101013', 'ortu_2324101013@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ILMX.P8PmrmkPyCHtE7BZOgi1bvceWPMoyCtOqPTpalbTUE3iBvPG', 6, NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31', 2033),
(2056, 'Orangtua dari FIKKA APRILIANDINI', 'ortu_2324101014', 'ortu_2324101014@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$ctqAj6kN2m3NfpW.PdYCLe9oOn/0sNVLCW5mAM.AAyq5rWjhgZs4S', 6, NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31', 2034),
(2057, 'Orangtua dari GALUH AGUNG PERMANA', 'ortu_2324101015', 'ortu_2324101015@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LOxcSkBAm4resovQi4mPK.yPi0NsFyZhGAGm9REc4G9Z0ajRzjEtG', 6, NULL, '2025-12-18 03:04:31', '2025-12-18 03:04:31', 2035);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `role_type`, `sekolah_id`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `ref_id`) VALUES
(2058, 'Orangtua dari HARIESTA FERNANDO', 'ortu_2324101016', 'ortu_2324101016@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5zxVVUxzWez8jZW2p.9ivO2LvyJYSjksUcn1wbFcOr2axk3E0Stqm', 6, NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32', 2036),
(2059, 'Orangtua dari Intan Dwi Sabila', 'ortu_2324101017', 'ortu_2324101017@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/cYCzJsM7OfUuRUP2t46pewhk.fJhoRXG6LkAAAmAoH6pgdMri5su', 6, NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32', 2037),
(2060, 'Orangtua dari IRSYAL FATHUL MUBAROK', 'ortu_2324101018', 'ortu_2324101018@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$glvekbxNINy3IEsoBzMjke9Qii1q6Fij4RSMLkjOPnSWbZzyUXtwG', 6, NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32', 2038),
(2061, 'Orangtua dari Jimi Ahmad Faturrahman', 'ortu_2324101019', 'ortu_2324101019@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$si1uPma/UpNfYdEf3PZmIOYxNbgafkDp/7AwFxi9jIRlfp4LdgQdu', 6, NULL, '2025-12-18 03:04:32', '2025-12-18 03:04:32', 2039),
(2062, 'Orangtua dari KAKA RAMADHANI SUHERMAN', 'ortu_2324101020', 'ortu_2324101020@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$g0jhjMPGi2hzmfKotVwri.aqYIF4m9CaNTiNc7uuC1IAQAhvrqAQe', 6, NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33', 2040),
(2063, 'Orangtua dari KEISYA SHAORI NIANINDRA PUTRI', 'ortu_2324101021', 'ortu_2324101021@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qTnzjXSqwTjjOtUoZEGYyusIFmu2F0WgIjRTeDoYcFxnGvmJHP5wm', 6, NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33', 2041),
(2064, 'Orangtua dari Muhamad Aria Abdilah', 'ortu_2324101022', 'ortu_2324101022@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$GK10qFG0njX4cT3nZWX4gOs2y6VVQgz1g6d0RLgTRC2d2H7QbPzTm', 6, NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33', 2042),
(2065, 'Orangtua dari MUHAMAD FAUZAN NABIL', 'ortu_2324101023', 'ortu_2324101023@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nk6hMO2xDk.CFOgUoBs.L.ZqPU9wbpFHIz1C60x/yww7xmWrzNleW', 6, NULL, '2025-12-18 03:04:33', '2025-12-18 03:04:33', 2043),
(2066, 'Orangtua dari Muhammad Gifar', 'ortu_2324101024', 'ortu_2324101024@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4pSP.kMGRT4p3ze8ITcmbORu5r0JDoRO2kAKf2jWXyXwcEyA.e13i', 6, NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34', 2044),
(2067, 'Orangtua dari MUHAMMAD RIZKY PRAWIRO', 'ortu_2324101025', 'ortu_2324101025@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zworev4t9tDstSaa6wjTTevPdZwr6I0cbo3oWSjlsh0m8gcWZQ2Le', 6, NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34', 2045),
(2068, 'Orangtua dari NADHIF DZAKI ABDILLAH', 'ortu_2324101026', 'ortu_2324101026@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$kbv.ixtGXFvqPjAZx85E4.gLgq/4OdFktxaT5BjbDEcbJGhIa6qJq', 6, NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34', 2046),
(2069, 'Orangtua dari PANCA FERDIAN PAMUNGKAS', 'ortu_2324101027', 'ortu_2324101027@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$nZQ.J0WjMtDCXWhAqejALuXK3aqRslFjXSWYfJksif0E9L/AqdQyu', 6, NULL, '2025-12-18 03:04:34', '2025-12-18 03:04:34', 2047),
(2070, 'Orangtua dari RADIKA RAYAGA WIGUNA', 'ortu_2324101028', 'ortu_2324101028@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$62Q7Ke6qoB1pdeata6svd.bPqCJbbSsoJs1iF3izi8lAvmM8wn8IG', 6, NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35', 2048),
(2071, 'Orangtua dari Rega Nur Sidiq', 'ortu_2324101029', 'ortu_2324101029@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$JVV8SLR/SKjL6sE.s35AOuTKtIjJiVGCCLJrisNTmn8yw6Cf9ut2C', 6, NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35', 2049),
(2072, 'Orangtua dari REVAL FADILAH', 'ortu_2324101030', 'ortu_2324101030@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xtqEKD1ymHBXmNMJEjE5re08oIOA9ufsS01zS5jSqMrdSTSLK6Dgm', 6, NULL, '2025-12-18 03:04:35', '2025-12-18 03:04:35', 2050),
(2073, 'Orangtua dari Rizky Fauzi', 'ortu_2324101031', 'ortu_2324101031@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$jRDsTmIg3avaQb6aGi9eEuyseG1BugMQQF1pj/HbEr8JbAStciYPm', 6, NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36', 2051),
(2074, 'Orangtua dari ROBI PERMANA ALAMSYAH', 'ortu_2324101032', 'ortu_2324101032@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$u3QsbclteJSnDmhV49hs8u6adpb.VzjZlB7FrROU/P554YLP9UfDy', 6, NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36', 2052),
(2075, 'Orangtua dari SANDI ARIZKI SAPUTRA', 'ortu_2324101033', 'ortu_2324101033@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$1asj746jabocvjiY3mICwOrbIB16LPcFeU4.GG/6p3QKN0EI1asUy', 6, NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36', 2053),
(2076, 'Orangtua dari YOANA TRI MUNAJAT', 'ortu_2324101034', 'ortu_2324101034@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$UhuUZkJtgippRVysqt9t4OVy6SK./R/IzspL9tMV4LOKcIFk6onHK', 6, NULL, '2025-12-18 03:04:36', '2025-12-18 03:04:36', 2054),
(2077, 'Orangtua dari Zidan Septiana Pratama', 'ortu_2324101035', 'ortu_2324101035@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$5OpgIej5CUipUcnkGwOGTO40LuNCx985gT4yWyJOBrrXsA/ym.C0S', 6, NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37', 2055),
(2078, 'Orangtua dari ZILDAN ABROR', 'ortu_2324101036', 'ortu_2324101036@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$uuytK4nXFcSZdvJMI2zfP.WS9ZFQ0z7U0p7wbEH.vdWFIcXDiW.Rm', 6, NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37', 2056),
(2079, 'Orangtua dari ADE PEBRIANA', 'ortu_2324101037', 'ortu_2324101037@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$v5QNnZy.AOtAb37N0xac4eq/ruNw9uGd/yO4XpfW1IJCFvnndcQLq', 6, NULL, '2025-12-18 03:04:37', '2025-12-18 03:04:37', 2057),
(2080, 'Orangtua dari AFRIZAL HERLAMBANG', 'ortu_2324101038', 'ortu_2324101038@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9ftgH.Tobvn17Cv1KF8pZOOLj00UmSLUQuik5EtM9ATjzm5NOIXXW', 6, NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38', 2058),
(2081, 'Orangtua dari AFRIZAL ZAHRAN MULYANA', 'ortu_2324101039', 'ortu_2324101039@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NoDCM5eQd/tWGKZYuQN7melOBs0trogtNeK.8FvlhZlvbqAnzSMeK', 6, NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38', 2059),
(2082, 'Orangtua dari AKBAR AL FADILLAH', 'ortu_2324101040', 'ortu_2324101040@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$9YUG9gALpn10jSsaqV5uiu29MlxJZ.RN448E7yB2.xD6JutL.TrUK', 6, NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38', 2060),
(2083, 'Orangtua dari Alpi Purnama', 'ortu_2324101041', 'ortu_2324101041@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$U5gXR6OZNSa240pjwscxy.id41cuBT/1UeBZq/l/Ea3Xbd2b4LXwS', 6, NULL, '2025-12-18 03:04:38', '2025-12-18 03:04:38', 2061),
(2084, 'Orangtua dari ARIA RIZKY PERMANA', 'ortu_2324101042', 'ortu_2324101042@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$R6WXBsYN26uDwbvyOoT1JOeZlOC1kEqu7RNe/fM1RLh9/h0vTwIn2', 6, NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39', 2062),
(2085, 'Orangtua dari ATHALLAH WAFI RAFID FAADHILAH', 'ortu_2324101043', 'ortu_2324101043@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$HFo7cF270nNdSdQJ0Uuzae8YGIZu7HS6TCcmEMhj.JvOpHc/i.czy', 6, NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39', 2063),
(2086, 'Orangtua dari AYU HARTINI', 'ortu_2324101044', 'ortu_2324101044@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$.qHLOd9D0dzSghyEgQISJOBxFkStWAymlY24mj9YlFUwQZSp0R1f6', 6, NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39', 2064),
(2087, 'Orangtua dari DAFFA ARIEF NUGRAHA', 'ortu_2324101045', 'ortu_2324101045@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$bq1FSc6onj6IIoGYeBWquulFAYT08FCXA898T5UQcL4mcvrTpyGZW', 6, NULL, '2025-12-18 03:04:39', '2025-12-18 03:04:39', 2065),
(2088, 'Orangtua dari DELIA SEKAR ARUM', 'ortu_2324101046', 'ortu_2324101046@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$mIx95xlIX.6RYm4u2uMvTeQDnKJVlpq1/B0BijBDP4tIektZfXUOe', 6, NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40', 2066),
(2089, 'Orangtua dari DIDAN RAMDHANI ABDUL MATIN', 'ortu_2324101047', 'ortu_2324101047@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$j4IdEw2wUxvQlJKLqG7Vp.mqr.LaEnLKXzOuONGAar06WuXakyrey', 6, NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40', 2067),
(2090, 'Orangtua dari Dimas Hermawan', 'ortu_2324101048', 'ortu_2324101048@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Kj50cLpL28bpbiQDJBti5OsOAQdzxVbd8QdZeZoh.KQ9eRFjbPoxS', 6, NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40', 2068),
(2091, 'Orangtua dari ERGIN KUSTIANA', 'ortu_2324101049', 'ortu_2324101049@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$cYkl.raajCAr4iS5D6uPHeeLR9Tby9u5yhZKTJK6NEhFhbfhNmPJe', 6, NULL, '2025-12-18 03:04:40', '2025-12-18 03:04:40', 2069),
(2092, 'Orangtua dari Farid Al - Munawwar', 'ortu_2324101050', 'ortu_2324101050@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$yRj46o/mzEZhxInJ/D92quJZrSce6/51nBAi7ZsbVaTA9KDr6u7kG', 6, NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41', 2070),
(2093, 'Orangtua dari FATAN APRIYANA PRATAMA', 'ortu_2324101051', 'ortu_2324101051@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$LDYVJOpi2ASQ39Qsn77p1uLOrRqh2/0woe1Q7VXigeeEU1ITYr15O', 6, NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41', 2071),
(2094, 'Orangtua dari Gian', 'ortu_2324101052', 'ortu_2324101052@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$eZS7DKc8VsRrMDwP9spxcutEE9Oesxc8KD2ltpkhk5Fy8wGc9xLfC', 6, NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41', 2072),
(2095, 'Orangtua dari HAFIDZ AMAR ALFARIZZIE', 'ortu_2324101053', 'ortu_2324101053@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$/Q8MUUnkU6Ta9wn6Ye/i0eXf6e91gqq0rMP7mgeGJYL2VFtwGIjU.', 6, NULL, '2025-12-18 03:04:41', '2025-12-18 03:04:41', 2073),
(2096, 'Orangtua dari Haikal Zaki Firmansyah', 'ortu_2324101054', 'ortu_2324101054@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$YOVicM.o.oGzFHXJKrD9w.7pl9x.uJ/aUeldvDwQXwI4tJXX3vve6', 6, NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42', 2074),
(2097, 'Orangtua dari JIHAD IRFANSYAH', 'ortu_2324101055', 'ortu_2324101055@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$BCMnu.fediZmUsUg0QQFXe6VY3KthTETJbzbF/XD7b.9NAe72ZZf.', 6, NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42', 2075),
(2098, 'Orangtua dari KENZ FELIX DJAYALARAS PUTRA', 'ortu_2324101056', 'ortu_2324101056@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$j.WPpBaq.bSTKNmbI9JCCOuQGjhimgzOgCLlcqEXrLei03tI2kw56', 6, NULL, '2025-12-18 03:04:42', '2025-12-18 03:04:42', 2076),
(2099, 'Orangtua dari Kesya Arifatun Safanah', 'ortu_2324101057', 'ortu_2324101057@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$b1zHPOjWJ397Ge8kxWhKhuH6mIkOnsqPx5JOHT4OqF7T08hml8klq', 6, NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43', 2077),
(2100, 'Orangtua dari Mochammad Rifqi Tsani', 'ortu_2324101058', 'ortu_2324101058@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$qw05CKB59SY.yeHLs3c4JO3bUikwSVgeCa/H4/.GWTG4Ad86sX2wG', 6, NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43', 2078),
(2101, 'Orangtua dari MOHAMMAD ABHIE RAMDANI', 'ortu_2324101059', 'ortu_2324101059@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$khuG0RtPYL0XTPhCOWJox.w5UMzD1mu9HRCwYkI5DEMF5HM/nWnN2', 6, NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43', 2079),
(2102, 'Orangtua dari MUHAMMAD RASYA ARYADHINATA', 'ortu_2324101060', 'ortu_2324101060@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Tooi8fxEIAX/fIgt9FMUqOVmrodX4uY9kUzwIWfhb.3NIWIwDQzP.', 6, NULL, '2025-12-18 03:04:43', '2025-12-18 03:04:43', 2080),
(2103, 'Orangtua dari Muhammad Ridwan', 'ortu_2324101601', 'ortu_2324101601@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$A/OpvhmYEGN5GtMqiGL3Su3vVSgEF7N5uHnEeiy2RLilHt9Vj/6OC', 6, NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44', 2081),
(2104, 'Orangtua dari NABIL SEPTI RAMDHANI', 'ortu_2324101061', 'ortu_2324101061@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$fa.er1uYRpXUEjxeoYbzD.u9xUnhrbt32fGME6P0wHf.xEnCen83a', 6, NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44', 2082),
(2105, 'Orangtua dari NAUFAL NURUL FAJAR', 'ortu_2324101062', 'ortu_2324101062@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$edNjbcMFunUhuewUvvxEne7lzYjCLnjuFJ6VqBcfAUXZhq12Y11hu', 6, NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44', 2083),
(2106, 'Orangtua dari Nizar Firmansyah', 'ortu_2324101063', 'ortu_2324101063@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$NoH54pkSdZ9yNRFGgbRIme2uEe1IMPLwMYZUj.vxaSITumlz9I2xK', 6, NULL, '2025-12-18 03:04:44', '2025-12-18 03:04:44', 2084),
(2107, 'Orangtua dari RAGIL FAIQ DWINA PUTRA', 'ortu_2324101064', 'ortu_2324101064@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$Y/zdwk1KFvkqjEc5enKGM.t3GXkC9xqaavwYByqWjWgBTVdmjKnEG', 6, NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45', 2085),
(2108, 'Orangtua dari REVAN SEPTIANSYAH RAMADHANI PUTRA', 'ortu_2324101065', 'ortu_2324101065@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$4gqsHaLtv2vqnk4ND/TwCu1USRQDRm2ntuVjGtSBuaxsvkscC8BPS', 6, NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45', 2086),
(2109, 'Orangtua dari Rivaldy Fauzan', 'ortu_2324101067', 'ortu_2324101067@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$WKQGaSmQxs7YXlZ1mc/0xeEE6E.FYu82BmPT3KUNPdjs7MTglQniO', 6, NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45', 2087),
(2110, 'Orangtua dari SELA SALAFIAH', 'ortu_2324101068', 'ortu_2324101068@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$og5P7xdpi8RJ.7dlOnoFJ.egwndW5ZL4R/lpW0/5VaDZLC4Kxj/G.', 6, NULL, '2025-12-18 03:04:45', '2025-12-18 03:04:45', 2088),
(2111, 'Orangtua dari SENDI FEBRIANSYAH NUR HIDAYAT', 'ortu_2324101069', 'ortu_2324101069@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$xrLCzjI0MEqykohVGaH6ouyyM2x8s4ImF19hDUiYokwvcADy9Wybq', 6, NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46', 2089),
(2112, 'Orangtua dari VICKY FACHRIZAL MUHARRAM', 'ortu_2324101070', 'ortu_2324101070@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$IGySlUPWhYC1HvFTnk1kWeml.z0i7eSkCuGqsIAD5zEyY7Lq4fcyq', 6, NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46', 2090),
(2113, 'Orangtua dari Wisnu Wardana sofyan', 'ortu_2324101071', 'ortu_2324101071@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$zycVu.BlLRhphVq1PLyRFeXnMuyk3Kx8xxlB/CDRKFUmDM.yyyvzS', 6, NULL, '2025-12-18 03:04:46', '2025-12-18 03:04:46', 2091),
(2114, 'Orangtua dari ZULLUL ARDAN RAFAYANTO', 'ortu_2324101072', 'ortu_2324101072@jurnalpkl.id', 'orangtua', 5, NULL, '$2y$12$THR3Y4e6jBrFCBYE5qIq8O7z/.gaV7LoVnybQYqmRFLyoOqbXXgme', 6, NULL, '2025-12-18 03:04:47', '2025-12-18 03:04:47', 2092),
(2115, 'Orangtua dari John Doe', 'ortu_8573825709', 'ortu_8573825709@jurnalpkl.id', 'orangtua', 6, NULL, '$2y$12$HB6CJGishIfaMql78wwWfukcqPqKWhCJWnJp2/l7oMLATGDnQQ3ja', 6, NULL, '2025-12-18 03:47:13', '2025-12-18 03:47:13', 2097),
(2116, 'Orangtua dari Jane Smith', 'ortu_0129392472', 'ortu_0129392472@jurnalpkl.id', 'orangtua', 6, NULL, '$2y$12$93WCXY9NvhBuwg4k5BY3deF1/7GobsAwpP1/45mzh9mOAwQMOPD2e', 6, NULL, '2025-12-18 03:47:13', '2025-12-18 03:47:13', 2098),
(2117, 'Orangtua dari test', 'ortu_test', 'ortu_test@jurnalpkl.id', 'orangtua', 6, NULL, '$2y$12$dYe90g3QNnfIReTptKj5kuGtgVpo.m.ADY6i65dC6MZKaLZkxA7x.', 6, NULL, '2025-12-18 03:47:14', '2025-12-18 03:47:14', 2099),
(2118, 'Orangtua dari jk', 'ortu_6758', 'ortu_6758@jurnalpkl.id', 'orangtua', 6, NULL, '$2y$12$PNfl43fkFxKkBFjEzyVWAecy6gpd5z2eLg4WujrXsv71WsijKRJhi', 6, NULL, '2025-12-18 03:47:14', '2025-12-18 03:47:14', 2100);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_reflections`
--

CREATE TABLE `weekly_reflections` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `pembimbing_id` bigint UNSIGNED NOT NULL,
  `week_number` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reflection_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_by_guru_at` timestamp NULL DEFAULT NULL,
  `verified_by_dudi_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensis_siswa_id_foreign` (`siswa_id`),
  ADD KEY `absensis_tanggal_index` (`tanggal`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `dudis`
--
ALTER TABLE `dudis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dudis_sekolah_id_foreign` (`sekolah_id`),
  ADD KEY `dudis_tahun_ajaran_id_foreign` (`tahun_ajaran_id`),
  ADD KEY `dudis_sekolah_id_index` (`sekolah_id`);

--
-- Indexes for table `dudi_pembimbings`
--
ALTER TABLE `dudi_pembimbings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dudi_pembimbings_dudi_id_foreign` (`dudi_id`),
  ADD KEY `dudi_pembimbings_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gurus`
--
ALTER TABLE `gurus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gurus_nip_unique` (`nip`),
  ADD KEY `gurus_sekolah_id_foreign` (`sekolah_id`),
  ADD KEY `gurus_tahun_ajaran_id_foreign` (`tahun_ajaran_id`),
  ADD KEY `gurus_sekolah_id_index` (`sekolah_id`);

--
-- Indexes for table `jurnal_harians`
--
ALTER TABLE `jurnal_harians`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jurnal_harians_siswa_id_tanggal_unique` (`siswa_id`,`tanggal`),
  ADD KEY `jurnal_harians_prakerin_siswa_id_foreign` (`prakerin_siswa_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_sekolah_id_foreign` (`sekolah_id`),
  ADD KEY `kelas_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indexes for table `laporan_mingguans`
--
ALTER TABLE `laporan_mingguans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laporan_mingguans_prakerin_siswa_id_tanggal_mulai_minggu_unique` (`prakerin_siswa_id`,`tanggal_mulai_minggu`),
  ADD KEY `laporan_mingguans_siswa_id_foreign` (`siswa_id`),
  ADD KEY `laporan_mingguans_minggu_ke_index` (`minggu_ke`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penilaian_details`
--
ALTER TABLE `penilaian_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penilaian_tujuan_unique` (`penilaian_pkl_id`,`tujuan_pembelajaran_id`),
  ADD KEY `penilaian_details_tujuan_pembelajaran_id_foreign` (`tujuan_pembelajaran_id`);

--
-- Indexes for table `penilaian_pkls`
--
ALTER TABLE `penilaian_pkls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penilaian_pkls_prakerin_siswa_id_unique` (`prakerin_siswa_id`),
  ADD KEY `penilaian_pkls_dinilai_oleh_guru_id_foreign` (`dinilai_oleh_guru_id`),
  ADD KEY `penilaian_pkls_dinilai_oleh_dudi_id_foreign` (`dinilai_oleh_dudi_id`),
  ADD KEY `idx_penilaian_prakerin_id` (`prakerin_siswa_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prakerins`
--
ALTER TABLE `prakerins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prakerins_sekolah_id_foreign` (`sekolah_id`),
  ADD KEY `prakerins_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indexes for table `prakerin_siswas`
--
ALTER TABLE `prakerin_siswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prakerin_siswas_siswa_id_unique` (`siswa_id`),
  ADD KEY `prakerin_siswas_prakerin_id_foreign` (`prakerin_id`),
  ADD KEY `prakerin_siswas_dudi_id_foreign` (`dudi_id`),
  ADD KEY `prakerin_siswas_dudi_pembimbing_id_foreign` (`dudi_pembimbing_id`),
  ADD KEY `prakerin_siswas_guru_pembimbing_id_foreign` (`guru_pembimbing_id`),
  ADD KEY `idx_prakerin_siswa_id` (`siswa_id`),
  ADD KEY `idx_prakerin_guru_id` (`guru_pembimbing_id`),
  ADD KEY `idx_prakerin_dudi_id` (`dudi_pembimbing_id`),
  ADD KEY `idx_prakerin_status` (`status`),
  ADD KEY `idx_prakerin_siswa_status` (`siswa_id`,`status`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sekolahs`
--
ALTER TABLE `sekolahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswas_nis_unique` (`nis`),
  ADD KEY `siswas_sekolah_id_foreign` (`sekolah_id`),
  ADD KEY `siswas_kelas_id_foreign` (`kelas_id`),
  ADD KEY `siswas_tahun_ajaran_id_foreign` (`tahun_ajaran_id`),
  ADD KEY `siswas_sekolah_id_index` (`sekolah_id`),
  ADD KEY `siswas_kelas_id_index` (`kelas_id`);

--
-- Indexes for table `tahun_ajarans`
--
ALTER TABLE `tahun_ajarans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tahun_ajarans_tahun_ajaran_unique` (`tahun_ajaran`);

--
-- Indexes for table `tujuan_pembelajarans`
--
ALTER TABLE `tujuan_pembelajarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tujuan_pembelajarans_sekolah_id_foreign` (`sekolah_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_ref_id_index` (`ref_id`),
  ADD KEY `users_sekolah_id_foreign` (`sekolah_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weekly_reflections`
--
ALTER TABLE `weekly_reflections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weekly_reflections_student_id_foreign` (`student_id`),
  ADD KEY `weekly_reflections_pembimbing_id_foreign` (`pembimbing_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensis`
--
ALTER TABLE `absensis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=703;

--
-- AUTO_INCREMENT for table `dudis`
--
ALTER TABLE `dudis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dudi_pembimbings`
--
ALTER TABLE `dudi_pembimbings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gurus`
--
ALTER TABLE `gurus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `jurnal_harians`
--
ALTER TABLE `jurnal_harians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `laporan_mingguans`
--
ALTER TABLE `laporan_mingguans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `penilaian_details`
--
ALTER TABLE `penilaian_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `penilaian_pkls`
--
ALTER TABLE `penilaian_pkls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prakerins`
--
ALTER TABLE `prakerins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `prakerin_siswas`
--
ALTER TABLE `prakerin_siswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sekolahs`
--
ALTER TABLE `sekolahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2101;

--
-- AUTO_INCREMENT for table `tahun_ajarans`
--
ALTER TABLE `tahun_ajarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tujuan_pembelajarans`
--
ALTER TABLE `tujuan_pembelajarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2119;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weekly_reflections`
--
ALTER TABLE `weekly_reflections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensis`
--
ALTER TABLE `absensis`
  ADD CONSTRAINT `absensis_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dudis`
--
ALTER TABLE `dudis`
  ADD CONSTRAINT `dudis_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dudis_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dudi_pembimbings`
--
ALTER TABLE `dudi_pembimbings`
  ADD CONSTRAINT `dudi_pembimbings_dudi_id_foreign` FOREIGN KEY (`dudi_id`) REFERENCES `dudis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dudi_pembimbings_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gurus`
--
ALTER TABLE `gurus`
  ADD CONSTRAINT `gurus_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gurus_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `jurnal_harians`
--
ALTER TABLE `jurnal_harians`
  ADD CONSTRAINT `jurnal_harians_prakerin_siswa_id_foreign` FOREIGN KEY (`prakerin_siswa_id`) REFERENCES `prakerin_siswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jurnal_harians_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `laporan_mingguans`
--
ALTER TABLE `laporan_mingguans`
  ADD CONSTRAINT `laporan_mingguans_prakerin_siswa_id_foreign` FOREIGN KEY (`prakerin_siswa_id`) REFERENCES `prakerin_siswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laporan_mingguans_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penilaian_details`
--
ALTER TABLE `penilaian_details`
  ADD CONSTRAINT `penilaian_details_penilaian_pkl_id_foreign` FOREIGN KEY (`penilaian_pkl_id`) REFERENCES `penilaian_pkls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penilaian_details_tujuan_pembelajaran_id_foreign` FOREIGN KEY (`tujuan_pembelajaran_id`) REFERENCES `tujuan_pembelajarans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penilaian_pkls`
--
ALTER TABLE `penilaian_pkls`
  ADD CONSTRAINT `penilaian_pkls_dinilai_oleh_dudi_id_foreign` FOREIGN KEY (`dinilai_oleh_dudi_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_pkls_dinilai_oleh_guru_id_foreign` FOREIGN KEY (`dinilai_oleh_guru_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penilaian_pkls_prakerin_siswa_id_foreign` FOREIGN KEY (`prakerin_siswa_id`) REFERENCES `prakerin_siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prakerins`
--
ALTER TABLE `prakerins`
  ADD CONSTRAINT `prakerins_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prakerins_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prakerin_siswas`
--
ALTER TABLE `prakerin_siswas`
  ADD CONSTRAINT `prakerin_siswas_dudi_id_foreign` FOREIGN KEY (`dudi_id`) REFERENCES `dudis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prakerin_siswas_dudi_pembimbing_id_foreign` FOREIGN KEY (`dudi_pembimbing_id`) REFERENCES `dudi_pembimbings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prakerin_siswas_guru_pembimbing_id_foreign` FOREIGN KEY (`guru_pembimbing_id`) REFERENCES `gurus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prakerin_siswas_prakerin_id_foreign` FOREIGN KEY (`prakerin_id`) REFERENCES `prakerins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prakerin_siswas_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswas`
--
ALTER TABLE `siswas`
  ADD CONSTRAINT `siswas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `siswas_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswas_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tujuan_pembelajarans`
--
ALTER TABLE `tujuan_pembelajarans`
  ADD CONSTRAINT `tujuan_pembelajarans_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_sekolah_id_foreign` FOREIGN KEY (`sekolah_id`) REFERENCES `sekolahs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weekly_reflections`
--
ALTER TABLE `weekly_reflections`
  ADD CONSTRAINT `weekly_reflections_pembimbing_id_foreign` FOREIGN KEY (`pembimbing_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `weekly_reflections_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
