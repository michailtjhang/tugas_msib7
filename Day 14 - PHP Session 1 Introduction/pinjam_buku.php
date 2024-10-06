<?php
session_start();
if (!isset($_SESSION['buku'])) {
    $_SESSION['buku'] = ["Belajar PHP", "Framework Laravel", "Algoritma & Struktur Data", "Jaringan Komputer"];
}

if (!isset($_SESSION['buku_dipinjam'])) {
    $_SESSION['buku_dipinjam'] = [];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nomor = $_POST['nomor_buku'] - 1;
    if (isset($_SESSION['buku'][$nomor])) {
        $_SESSION['buku_dipinjam'][] = $_SESSION['buku'][$nomor];
        unset($_SESSION['buku'][$nomor]);
        $_SESSION['buku'] = array_values($_SESSION['buku']);
        echo "Buku berhasil dipinjam.";
    } else {
        echo "Nomor buku tidak valid.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pinjam Buku</title>
</head>
<body>
    <h1>Pinjam Buku</h1>
    <form method="POST">
        <label for="nomor_buku">Pilih nomor buku yang ingin dipinjam:</label><br>
        <select name="nomor_buku">
            <?php
            foreach ($_SESSION['buku'] as $index => $buku) {
                echo "<option value='".($index + 1)."'>".($index + 1).". $buku</option>";
            }
            ?>
        </select><br><br>
        <input type="submit" value="Pinjam Buku">
    </form>
    <a href="index.php">Kembali ke Menu</a>
</body>
</html>
