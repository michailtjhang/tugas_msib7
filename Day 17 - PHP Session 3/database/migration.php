<?php

include_once 'koneksi.php';

global $dbh;

try {
    // Check if migration has already been run
    $stmt = $dbh->query("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '$dbname' AND table_name = 'migration_control'");
    $migrationControlExists = $stmt->fetchColumn();

    if ($migrationControlExists == 0) {
        // Create migration control table
        $sqlCreateMigrationControl = "CREATE TABLE migration_control (
            id INT AUTO_INCREMENT PRIMARY KEY,
            migration_name VARCHAR(255) NOT NULL,
            date_executed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )";
        $dbh->exec($sqlCreateMigrationControl);

        // create table user
        $sqlTablePasien = "CREATE TABLE pasien (
            id CHAR(6) PRIMARY KEY,
            nama VARCHAR(100),
            umur INT,
            alamat TEXT,
            penyakit VARCHAR(100)
        )";
        $dbh->exec($sqlTablePasien);

        // insert data into user table
        $sqlInsertUser = "INSERT INTO pasien (id, nama, umur, alamat, penyakit) VALUES 
            ('PSN001', 'Andi Saputra', 25, 'Jl. Merdeka No. 10, Jakarta', 'Demam'),
            ('PSN002', 'Siti Nurhaliza', 30, 'Jl. Kuningan No. 20, Jakarta', 'Flu'),
            ('PSN003', 'Budi Santoso', 40, 'Jl. Sudirman No. 15, Bandung', 'Diabetes'),
            ('PSN004', 'Dewi Persik', 35, 'Jl. Mawar No. 5, Surabaya', 'Hipertensi'),
            ('PSN005', 'Rahmat Hidayat', 50, 'Jl. Kenangan No. 12, Yogyakarta', 'Asma'),
            ('PSN006', 'Rina Melati', 28, 'Jl. Jendral Sudirman No. 23, Medan', 'Penyakit Jantung')";
        $dbh->exec($sqlInsertUser);

        // Mark migration as done
        $sqlInsertMigrationControl = "INSERT INTO migration_control (migration_name) VALUES ('initial_migration')";
        $dbh->exec($sqlInsertMigrationControl);
    }
} catch (PDOException $e) {
    die('Migration Gagal ' . $e->getMessage());
}
