-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2025 at 08:56 AM
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
(56, 2100, 90, '2025-12-12', '19:58:08', '19:59:02', 'hadir', NULL, 'absensi/masuk/693c116004274_1765544288.jpg', 'absensi/pulang/693c11963efde_1765544342.jpg', NULL, 0, '2025-12-12 12:58:08', '2025-12-12 12:59:02');

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
(173, 'Akun Pengguna', 'melakukan aksi pada data akun pengguna: test (test) (Username: test.test)', 'App\\Models\\User', 'created', 1590, 'App\\Models\\User', 1575, '{\"attributes\": {\"username\": \"test.test\"}}', NULL, '2025-12-16 09:59:33', '2025-12-16 09:59:33');

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
(11, 5, 1, 'Robotic School', 'Robotic', 'Bantul', '-7.3700390', '108.5408452', 100, 'Joe', 'Ibnu', '2025-10-23 10:35:43', '2025-10-25 13:23:42'),
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
(101, 78, 1, 2059, '2025-11-05', '2025-11-11', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(102, 78, 2, 2059, '2025-11-12', '2025-11-18', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(103, 79, 1, 2075, '2025-11-05', '2025-11-11', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(104, 79, 2, 2075, '2025-11-12', '2025-11-18', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(105, 80, 1, 2082, '2025-11-05', '2025-11-11', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(106, 80, 2, 2082, '2025-11-12', '2025-11-18', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(107, 81, 1, 2092, '2025-11-05', '2025-11-11', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(108, 81, 2, 2092, '2025-11-12', '2025-11-18', NULL, 0, NULL, 0, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(109, 82, 1, 2064, '2025-11-20', '2025-11-26', NULL, 0, NULL, 0, '2025-11-05 01:48:06', '2025-11-05 01:48:06'),
(110, 82, 2, 2064, '2025-11-27', '2025-11-30', NULL, 0, NULL, 0, '2025-11-05 01:48:06', '2025-11-05 01:48:06'),
(111, 83, 1, 2066, '2025-11-20', '2025-11-26', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(112, 83, 2, 2066, '2025-11-27', '2025-11-30', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(113, 84, 1, 2088, '2025-11-20', '2025-11-26', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(114, 84, 2, 2088, '2025-11-27', '2025-11-30', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(115, 85, 1, 2077, '2025-11-20', '2025-11-26', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(116, 85, 2, 2077, '2025-11-27', '2025-11-30', NULL, 0, NULL, 0, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
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
(58, '2025_11_26_000001_add_foto_columns_to_absensis_table', 42);

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
(10, 'sela', 'sely', '2025-11-04 17:00:00', '2025-11-17 17:00:00', 'Prakerin Gelombang 1 2025/2026', '73598582', 5, 1, '2025-11-05 01:39:49', '2025-11-05 01:39:49'),
(11, 'lsjfweoghwipg', 'nuirwthiewhgowi', '2025-11-19 17:00:00', '2025-11-29 17:00:00', 'Prakerin Gelombang 2 2025/2026', '3452', 5, 1, '2025-11-05 01:46:20', '2025-11-05 01:46:20'),
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
(78, 10, 2059, 11, 24, 110, 'berjalan', '768', 5, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(79, 10, 2075, 11, 24, 110, 'berjalan', '768', 5, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(80, 10, 2082, 11, 24, 110, 'berjalan', '768', 5, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(81, 10, 2092, 11, 24, 110, 'berjalan', '768', 5, '2025-11-05 01:43:22', '2025-11-05 01:43:22'),
(82, 11, 2064, 12, 25, 110, 'berjalan', '73598582', 5, '2025-11-05 01:48:06', '2025-11-05 01:48:06'),
(83, 11, 2066, 12, 25, 110, 'berjalan', '73598582', 5, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(84, 11, 2088, 12, 25, 110, 'berjalan', '73598582', 5, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
(85, 11, 2077, 12, 25, 110, 'berjalan', '73598582', 5, '2025-11-05 01:48:07', '2025-11-05 01:48:07'),
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
(5, 'SMKN 1 BANJAR', 'negeri', '2025-10-14', '2025-11-13', 1, 620, 50, 'Jl.Kyai Haji Mustopa', 'Dede Ruslianto', '2025-09-21 23:35:02', '2025-11-06 14:18:05'),
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
('BBSYMTPDotSJY17sO21llLzDrBathHcuxyjpqnoM', 1587, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoia2NrWGFYOXFkdGIzTkpmVEFob1pidjlLaXExU25KbjBRbmZVQUxLTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vanVybmFsLXBrbC50ZXN0L3BlbmlsYWlhbi1wa2xzLzkiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNTg3O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkdEl5MldNcUxYa3VQeFgxamlxQmJKZWtxcVl6b2NQTXlzVU4za2U2TjhSOWUxSGphb1hLejIiO3M6ODoiZmlsYW1lbnQiO2E6MDp7fX0=', 1765545115),
('dXG3MttjVKoRgONt9wpdY5Unlwa7Y4FLpQbClYo7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR1VCOUxHQ3pSeFBWTUFWYjYxRnNheWRrY2s3WEh2WTRwdEI3Z1pxRSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cHM6Ly9qdXJuYWwtcGtsLnRlc3QvcGVuaWxhaWFuLXBrbHMvOSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwczovL2p1cm5hbC1wa2wudGVzdC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765878644),
('EI6nXudrm9FuWscOJw3cSyDjyovsaVAYQvBGdbZj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRG9LbzcyOUhVRmEwcHI1UzFRT2M2VTBoZ2tYa0lVSTFyaGxWQ1BWbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vanVybmFsLXBrbC50ZXN0L3RhaHVuLWFqYXJhbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkNmVuNmwwbS5ZajhlVFU5QVRIZ0JkT0ZreXBZdEZHbkFLZDk0NHFrQmF2SmhNc2pXQ3YvQWEiO30=', 1765961757),
('FxzJx1YGFzNHjkHdxzsIW6afKmrZRdoeL0OGNyrG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN3FHRWhhdWM1ZmlOalVnRGNEdmhNQm9ZVlVTMlExblZlUzBsM2lBMCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMjoiaHR0cDovL2p1cm5hbC1wa2wudGVzdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vanVybmFsLXBrbC50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765878600),
('M4F53COsdRcz7Cr3795qNsJ4Pnxn0Tk8YnOy7kVZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNzgwS0hnSFJwQ1BJWTdNakw4MzV1dnJ6QVJlQUVPdUMzUjRqQ1pKUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMzoiaHR0cHM6Ly9qdXJuYWwtcGtsLnRlc3QiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMzoiaHR0cHM6Ly9qdXJuYWwtcGtsLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765878600),
('ZAgNjDEQdflLfkQNsjK24oJ2GwSK4dEhFAE3BcLw', 1575, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiY2RXU3dJMHhreGFFaGJOdlJaTXhvNVVZRTJyQWdTVkFEQTc4cjU3ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vanVybmFsLXBrbC50ZXN0L3BlbmlsYWlhbi1wa2xzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTU3NTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHQwWjRjSHE1SkZSZGlvYzdESGhHL2U5aDNFOHNSTlZGYkliVzNvVXJjNkJ1ZkxyWjBpVnRxIjtzOjI0OiJzZWxlY3RlZF90YWh1bl9hamFyYW5faWQiO3M6MToiMSI7fQ==', 1765879573);

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
  `role_type` enum('super_admin','admin_sekolah','guru','siswa','dudi','dudi_pembimbing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siswa',
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
(1590, 'test (test)', 'test.test', 'test.test@jurnalpkl.id', 'dudi_pembimbing', 6, NULL, '$2y$12$bHFAWBD02A.m623vz/iMduLdApLCt9tk6wEq89cQAxDh2fgUEzvzW', 5, NULL, '2025-12-16 09:59:33', '2025-12-16 09:59:33', 37);

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
  ADD KEY `absensis_siswa_id_foreign` (`siswa_id`);

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
  ADD KEY `dudis_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

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
  ADD KEY `gurus_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

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
  ADD KEY `laporan_mingguans_siswa_id_foreign` (`siswa_id`);

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
  ADD KEY `siswas_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1591;

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
