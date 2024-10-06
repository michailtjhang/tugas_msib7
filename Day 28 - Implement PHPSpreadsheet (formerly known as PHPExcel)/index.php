<?php
// Mengimpor autoload dari Composer
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Csv;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Data penduduk
$dataPenduduk = [
    ['John Doe', 30, 'Jakarta', 'Programmer'],
    ['Jane Doe', 25, 'Surabaya', 'Designer'],
    ['Michael Smith', 40, 'Bandung', 'Manager'],
];

// Fungsi untuk ekspor CSV
if (isset($_POST['export_csv'])) {
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // Menambahkan header kolom
    $sheet->setCellValue('A1', 'Nama');
    $sheet->setCellValue('B1', 'Usia');
    $sheet->setCellValue('C1', 'Alamat');
    $sheet->setCellValue('D1', 'Pekerjaan');

    // Menambahkan data
    $row = 2;
    foreach ($dataPenduduk as $data) {
        $sheet->setCellValue('A' . $row, $data[0]);
        $sheet->setCellValue('B' . $row, $data[1]);
        $sheet->setCellValue('C' . $row, $data[2]);
        $sheet->setCellValue('D' . $row, $data[3]);
        $row++;
    }

    // Simpan ke CSV
    $writer = new Csv($spreadsheet);
    $fileName = 'data_penduduk.csv';
    header('Content-Type: application/csv');
    header('Content-Disposition: attachment;filename="'.$fileName.'"');
    header('Cache-Control: max-age=0');
    $writer->save('php://output');
    exit;
}

// Fungsi untuk ekspor XLSX
if (isset($_POST['export_xlsx'])) {
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // Menambahkan header kolom
    $sheet->setCellValue('A1', 'Nama');
    $sheet->setCellValue('B1', 'Usia');
    $sheet->setCellValue('C1', 'Alamat');
    $sheet->setCellValue('D1', 'Pekerjaan');

    // Menambahkan data
    $row = 2;
    foreach ($dataPenduduk as $data) {
        $sheet->setCellValue('A' . $row, $data[0]);
        $sheet->setCellValue('B' . $row, $data[1]);
        $sheet->setCellValue('C' . $row, $data[2]);
        $sheet->setCellValue('D' . $row, $data[3]);
        $row++;
    }

    // Simpan ke XLSX
    $writer = new Xlsx($spreadsheet);
    $fileName = 'data_penduduk.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="'.$fileName.'"');
    header('Cache-Control: max-age=0');
    $writer->save('php://output');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Penduduk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Data Penduduk</h1>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Nama</th>
                <th>Usia</th>
                <th>Alamat</th>
                <th>Pekerjaan</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($dataPenduduk as $data): ?>
                <tr>
                    <td><?= $data[0] ?></td>
                    <td><?= $data[1] ?></td>
                    <td><?= $data[2] ?></td>
                    <td><?= $data[3] ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <form method="POST">
        <button type="submit" name="export_csv" class="btn btn-primary">Export to CSV</button>
        <button type="submit" name="export_xlsx" class="btn btn-success">Export to XLSX</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
