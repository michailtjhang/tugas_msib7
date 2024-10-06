<?php

include_once 'database/koneksi.php';

// models
include_once 'app/models/pasien.php';

$url = !isset($_GET['url']) ? 'pasien' : $_GET['url'];

// Mengecek apakah migration.php sudah dijalankan
if (!defined('MIGRATION_INCLUDED')) {
    include_once 'database/migration.php';
    define('MIGRATION_INCLUDED', true);
}

if ($url == 'pasien') {
    include_once 'pasien.php';
} else if (!empty($url)) {
    include_once $url . '.php';
} else {
    include_once 'pasien.php';
}