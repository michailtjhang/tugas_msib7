<?php
// Mengimpor autoload dari Composer
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Csv;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Membuat objek spreadsheet dan lembar kerja
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Menambahkan header kolom
$sheet->setCellValue('A1', 'Nama');
$sheet->setCellValue('B1', 'Usia');
$sheet->setCellValue('C1', 'Alamat');
$sheet->setCellValue('D1', 'Pekerjaan');

// Data penduduk
$dataPenduduk = [
    ['John Doe', 30, 'Jakarta', 'Programmer'],
    ['Jane Doe', 25, 'Surabaya', 'Designer'],
    ['Michael Smith', 40, 'Bandung', 'Manager'],
];

// Menambahkan data ke lembar kerja
$row = 2; // Baris awal data setelah header
foreach ($dataPenduduk as $data) {
    $sheet->setCellValue('A' . $row, $data[0]);
    $sheet->setCellValue('B' . $row, $data[1]);
    $sheet->setCellValue('C' . $row, $data[2]);
    $sheet->setCellValue('D' . $row, $data[3]);
    $row++;
}

// Simpan data dalam format CSV
$writer = new Csv($spreadsheet);
$writer->save('data_penduduk.csv');

// Simpan data dalam format XLSX
$writer = new Xlsx($spreadsheet);
$writer->save('data_penduduk.xlsx');

// Fungsi pencarian berdasarkan nama
function cariPenduduk($nama, $dataPenduduk)
{
    foreach ($dataPenduduk as $data) {
        if (stripos($data[0], $nama) !== false) {
            return $data;
        }
    }
    return null;
}

// Contoh penggunaan pencarian data penduduk
$hasilCari = cariPenduduk('Jane Doe', $dataPenduduk);
if ($hasilCari) {
    echo 'Penduduk ditemukan: ' . implode(', ', $hasilCari);
} else {
    echo 'Penduduk tidak ditemukan';
}
