<?php

error_reporting(0);

$model =  new pasien();
$data_pasien = $model->dataPasien();
$idedit = $_REQUEST['idedit'];

if (!empty($idedit)) {
    $pasien = $model->getPasien($idedit);
} else {
    $pasien = array();
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Pasien</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <h2 class="my-4">Tambah Data Pasien</h2>
        <form method="POST" action="app/controllers/pasienController.php">
            <div class="mb-3">
                <label for="nama" class="form-label">Nama</label>
                <input type="text" class="form-control" id="nama" name="nama" value="<?= $pasien['nama'] ?>" required>
            </div>
            <div class="mb-3">
                <label for="umur" class="form-label">Umur</label>
                <input type="number" class="form-control" id="umur" name="umur" value="<?= $pasien['umur'] ?>" required>
            </div>
            <div class="mb-3">
                <label for="alamat" class="form-label">Alamat</label>
                <textarea class="form-control" id="alamat" name="alamat" rows="3" required><?= $pasien['alamat'] ?></textarea>
            </div>
            <div class="mb-3">
                <label for="penyakit" class="form-label">Penyakit</label>
                <input type="text" class="form-control" id="penyakit" name="penyakit" value="<?= $pasien['penyakit'] ?>" required>
            </div>
            <?php if (empty($idedit)) { ?>
                <button type="submit" value="save" name="proses" class="btn btn-primary">Tambah Pasien</button>
            <?php } else { ?>
                <button type="submit" value="ubah" name="proses" class="btn btn-warning">Ubah Pasien</button>
            <?php } ?>
            <input type="hidden" name="idx" value="<?= $idedit ?>">
        </form>
        <br>
        <a href="index.php" class="btn btn-secondary">Kembali ke Daftar Pasien</a>
    </div>
</body>

</html>