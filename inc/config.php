<?php
// Start session
session_start();

// Base URL
const BASE_URL = 'http://localhost:8000/';

// Database config
const DB_HOST = 'localhost';
const DB_USER = 'root';
const DB_PASS = '';
const DB_NAME = 'kampus_crud';

// Navigasi
const NAV_PAGES = [
    ['title' => 'Home',    'url' => 'index.php'],
    ['title' => 'Daftar Mahasiswa', 'url' => 'list.php'],
    ['title' => 'Tambah Mahasiswa', 'url' => 'create.php'],
    ['title' => 'Logout',  'url' => 'logout.php']
];

// Autoload
spl_autoload_register(function ($class_name) {
    $file = __DIR__ . '/../class/' . $class_name . '.php';
    if (file_exists($file)) {
        include $file;
    }
});