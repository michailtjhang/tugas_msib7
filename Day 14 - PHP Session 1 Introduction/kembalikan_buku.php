<?php
session_start();

if (!isset($_SESSION['buku_dipinjam'])) {
    $_SESSION['buku_dipinjam'] = [];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama_buku = $_POST['nama_buku'];
    $key = array_search($nama_buku, $_SESSION['buku_dipinjam']);
    if ($key !== false) {
        unset($_SESSION['buku_dipinjam'][$key]);
        $_SESSION['buku_dipinjam'] = array_values($_SESSION['buku_dipinjam']); 
        $_SESSION['buku'][] = $nama_buku;
        echo "Buku '$nama_buku' telah dikembalikan.";
    } else {
        echo "Buku tidak ditemukan dalam daftar buku yang dipinjam.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Kembalikan Buku</title>
</head>
<body>
    <h1>Kembalikan Buku</h1>

    <h3>Daftar Buku yang Dipinjam:</h3>
    <ul>
        <?php
        if (empty($_SESSION['buku_dipinjam'])) {
            echo "<li>Tidak ada buku yang dipinjam.</li>";
        } else {
            foreach ($_SESSION['buku_dipinjam'] as $buku) {
                echo "<li>$buku</li>";
            }
        }
        ?>
    </ul>

    <h3>Form Pengembalian Buku:</h3>
    <form method="POST">
        <label for="nama_buku">Nama buku yang ingin dikembalikan:</label><br>
        <input type="text" name="nama_buku"><br><br>
        <input type="submit" value="Kembalikan Buku">
    </form>
    <a href="index.php">Kembali ke Menu</a>
</body>
</html>
