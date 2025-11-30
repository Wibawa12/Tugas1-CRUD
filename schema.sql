-- schema.sql
CREATE DATABASE kampus_crud;
USE kampus_crud;

-- Tabel mahasiswa (entitas utama)
CREATE TABLE mahasiswa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nim VARCHAR(15) NOT NULL UNIQUE,
  nama VARCHAR(100) NOT NULL,
  prodi ENUM('Teknik Informatika', 'Sistem Informasi', 'Manajemen', 'Akuntansi', 'Lainnya') NOT NULL DEFAULT 'Lainnya',
  angkatan YEAR NOT NULL,
  status ENUM('aktif', 'cuti', 'lulus', 'nonaktif') NOT NULL DEFAULT 'aktif',
  foto_path VARCHAR(512) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel user untuk autentikasi (admin & mahasiswa)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'mahasiswa') NOT NULL DEFAULT 'mahasiswa',
  fullname VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Data awal untuk testing
INSERT INTO users (username, password, role, fullname) VALUES
('admin', '$2a$12$zNRUmQ5gDXGWBUp7MS8WWOsL0M3iLKaLmMAnhfQ8zfCzNfk72rpeu', 'admin', 'Administrator'),
('25101001', '$2a$12$2Gttz.qHk8coKXGeYEabaOa1rs9imJCEj/8/CnenYrWoT5mXx0Xya', 'mahasiswa', 'Budi Santoso');

INSERT INTO mahasiswa (nim, nama, prodi, angkatan, status) VALUES
('25101001', 'Budi Santoso', 'Teknik Informatika', 2023, 'aktif'),
('25102005', 'Citra Dewi', 'Sistem Informasi', 2023, 'aktif');