<?php

class pasien
{
    private $koneksi;
    public function __construct()
    {
        global $dbh;
        $this->koneksi = $dbh;
    }

    public function dataPasien()
    {
        // mengambil dan melihat table jenis_produk
        $sql = "SELECT * FROM pasien";

        // menggunakan mekanisme prepere statement PDO
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchALL();

        return $rs;
    }

    public function getPasien($id)
    {
        // mengambil dan melihat table jenis_produk
        $sql = "SELECT * FROM pasien where id = ?";

        // menggunakan mekanisme prepere statement PDO
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();

        return $rs;
    }

    public function simpan($data)
    {
        $kodeAuto = $this->kodeAuto();
        $sql = "INSERT INTO pasien (id, nama, umur, alamat, penyakit)
            VALUES (?, ?, ?, ?, ?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute(array_merge([$kodeAuto], $data));
    }

    public function ubah($data)
    {
        $sql = "UPDATE pasien SET nama=?, umur=?, alamat=?, penyakit=?
        WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

    public function hapus($data)
    {
        $sql = "DELETE FROM pasien WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }

    public function kodeAuto()
    {
        $sql = "SELECT MAX(CAST(SUBSTRING(id, 4) AS UNSIGNED)) as max_id FROM pasien";
        $rs = $this->koneksi->query($sql)->fetch();

        $kode = ($rs['max_id'] ?? 0) + 1;
        return "PSN" . sprintf("%03d", $kode);
    }
}