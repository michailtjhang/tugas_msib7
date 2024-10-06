<?php
// Data siswa dan nilai
$siswa = [
    "Budi" => [80, 75, 90],
    "Siti" => [85, 70, 95],
    "Andi" => [60, 65, 70],
];

// Fungsi untuk menghitung rata-rata nilai
function hitungRataRata($nilai)
{
    $total = 0;
    foreach ($nilai as $n) {
        $total += $n;
    }
    return $total / count($nilai);
}

// Fungsi untuk menentukan nilai huruf
function tentukanNilai($rataRata)
{
    if ($rataRata >= 85) {
        return "A";
    } elseif ($rataRata >= 70) {
        return "B";
    } elseif ($rataRata >= 60) {
        return "C";
    } else {
        return "D";
    }
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Penilaian Siswa</title>
    <style>
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

    <h1 style="text-align: center;">Hasil Penilaian Siswa</h1>

    <table>
        <tr>
            <th>Nama</th>
            <th>Rata-rata</th>
            <th>Nilai Akhir</th>
        </tr>

        <?php
        // Loop untuk menampilkan hasil penilaian
        foreach ($siswa as $nama => $nilai) {
            $rataRata = hitungRataRata($nilai);
            $nilaiAkhir = tentukanNilai($rataRata);
            echo "<tr>";
            echo "<td>$nama</td>";
            echo "<td>" . number_format($rataRata, 2) . "</td>";
            echo "<td>$nilaiAkhir</td>";
            echo "</tr>";
        }
        ?>

    </table>

</body>

</html>