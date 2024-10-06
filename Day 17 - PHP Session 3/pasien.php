<?php

$model =  new pasien();
$data_pasien = $model->dataPasien();

?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Pasien</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ======================== Font Awesome ========================= -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div class="container">
        <h2 class="my-4">Daftar Pasien Rumah Sakit</h2>
        <a href="index.php?url=pasien_form" class="btn btn-success mb-3">Tambah Pasien <i class="fa-solid fa-plus ms-2"></i></a>
        <table id="tableData" class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Umur</th>
                    <th>Alamat</th>
                    <th>Penyakit</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($data_pasien > 0): ?>
                    <?php foreach ($data_pasien as $row): ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['nama']; ?></td>
                            <td><?php echo $row['umur']; ?></td>
                            <td><?php echo $row['alamat']; ?></td>
                            <td><?php echo $row['penyakit']; ?></td>
                            <td>
                                <form action="app/controllers/pasienController.php" method="POST">
                                    <a href="index.php?url=pasien_form&idedit=<?= $row['id']; ?>" class="btn btn-warning btn-sm"><i class="fa-solid fa-pen-to-square"></i></a>
                                    <button type="submit" name="proses" value="hapus" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data <?= $row['nama'] ?>?');"><i class="fa-solid fa-trash"></i></button>
                                    <input type="hidden" name="idx" value="<?= $row['id'] ?>">
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6">Tidak ada data pasien.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>

</html>