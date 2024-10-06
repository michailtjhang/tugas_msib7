<?php

session_start();
if (!isset($_SESSION['buku'])) {
    $_SESSION['buku'] = ["Belajar PHP", "Framework Laravel", "Algoritma & Struktur Data", "Jaringan Komputer"];
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Buku</title>
</head>
<body>
    <h1>Daftar Buku</h1>
    <ul>
        <?php
        foreach ($_SESSION['buku'] as $buku) {
            echo "<li>$buku</li>";
        }
        ?>
    </ul>
    <a href="index.php">Kembali ke Menu</a>
</body>
</html>
