<?php
class Buku {
    public $judul;
    public $pengarang;
    public $tahunTerbit;
    public $genre;

    public function __construct($judul, $pengarang, $tahunTerbit, $genre) {
        $this->judul = $judul;
        $this->pengarang = $pengarang;
        $this->tahunTerbit = $tahunTerbit;
        $this->genre = $genre;
    }

    public function getDetailBuku() {
        return "{$this->judul}, oleh {$this->pengarang} (Tahun: {$this->tahunTerbit}, Genre: {$this->genre})";
    }
}

class Perpustakaan {
    public $lokasi;
    private $daftarBuku = [];

    public function __construct($lokasi) {
        $this->lokasi = $lokasi;
    }

    public function tambahBuku($buku) {
        $this->daftarBuku[] = $buku;
    }

    public function getDaftarBuku() {
        if (empty($this->daftarBuku)) {
            return "Belum ada buku di perpustakaan ini.";
        }

        $output = "Daftar Buku di Perpustakaan {$this->lokasi}:\n";
        foreach ($this->daftarBuku as $index => $buku) {
            $output .= ($index + 1) . ". " . $buku->getDetailBuku() . "\n";
        }
        return $output;
    }
}

// Membuat beberapa objek Buku
$buku1 = new Buku("Belajar PHP", "John Doe", 2021, "Pemrograman");
$buku2 = new Buku("Framework Laravel", "Jane Doe", 2020, "Web Development");
$buku3 = new Buku("Algoritma dan Struktur Data", "Budi Santoso", 2019, "Ilmu Komputer");

// Membuat objek Perpustakaan
$perpustakaan = new Perpustakaan("Jakarta");

// Menambahkan buku ke dalam perpustakaan
$perpustakaan->tambahBuku($buku1);
$perpustakaan->tambahBuku($buku2);
$perpustakaan->tambahBuku($buku3);

// Mencetak daftar buku di perpustakaan
echo nl2br($perpustakaan->getDaftarBuku());