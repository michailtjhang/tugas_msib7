<!DOCTYPE html>
<html>
<head>
    <title>Sistem Manajemen Perpustakaan</title>
</head>
<body>
    <h1>Sistem Manajemen Perpustakaan</h1>
    <ul>
        <li><a href="daftar_buku.php">Lihat Daftar Buku</a></li>
        <li><a href="pinjam_buku.php">Pinjam Buku</a></li>
        <li><a href="kembalikan_buku.php">Kembalikan Buku</a></li>
        <li><a href="index.php?exit=true">Keluar</a></li>
    </ul>

    <?php
    if (isset($_GET['exit']) && $_GET['exit'] == 'true') {
        echo "Keluar dari sistem.";
    }
    ?>
</body>
</html>
