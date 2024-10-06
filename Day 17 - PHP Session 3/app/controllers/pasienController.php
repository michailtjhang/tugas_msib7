<?php
include_once '../../database/koneksi.php';
include_once '../models/pasien.php';

//tangkap reuest
$nama = htmlspecialchars($_POST['nama']);
$umur = htmlspecialchars($_POST['umur']);
$alamat = htmlspecialchars($_POST['alamat']);
$penyakit = htmlspecialchars($_POST['penyakit']);

$data = [
    $nama,
    $umur,
    $alamat,
    $penyakit
];

$model = new pasien();
$tombol = $_REQUEST['proses'];

switch ($tombol) {
    case 'save':
        $model->simpan($data);
        break;
    case 'ubah':
        $data[] = $_POST['idx'];
        $model->ubah($data); 
        break;
    case 'hapus':
        unset($data);
        $data[] = $_POST['idx'];
        $model->hapus($data);
        break;
    default;
        header('location:../../index.php?url=pasien');
        break;
}
header('location:../../index.php?url=pasien');