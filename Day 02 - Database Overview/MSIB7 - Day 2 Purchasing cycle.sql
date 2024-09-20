CREATE TABLE `permintaan_Pembelian` (
  `no_permintaan_pembelian` integer PRIMARY KEY,
  `kode_barang` char(6),
  `tanggal` datetime,
  `tanggal_permintaan` datetime,
  `kuantitas` varchar(255),
  `keterangan` varchar(255)
);

CREATE TABLE `m_barang` (
  `kode_barang` char(6) PRIMARY KEY,
  `nama_barang` varchar(255),
  `harga_unit` double
);

CREATE TABLE `purchase_order` (
  `no_PurchaseOrder` integer PRIMARY KEY,
  `id_vendor` integer,
  `sku_permintaan` integer,
  `tanggal_pesanan` datetime,
  `total_harga` double
);

CREATE TABLE `m_supplier` (
  `id_vendor` integer PRIMARY KEY,
  `nama_supplier` varchar(255),
  `alamat` varchar(255)
);

CREATE TABLE `penerimaan_barang` (
  `no_penerima_barang` integer PRIMARY KEY,
  `no_PurchaseOrder` integer,
  `kode_barang` char(6),
  `status` enum(Baik,Buruk),
  `tanggal_penerimaan` datetime,
  `kuantitas` varchar(255),
  `keterangan` varchar(255)
);

CREATE TABLE `invoice` (
  `no_invoice` integer PRIMARY KEY,
  `sku_penerima_barang` integer,
  `id_pembeli` integer,
  `kode_barang` char(6),
  `tanggal_invoice` datetime,
  `kuantitas` varchar(255),
  `harga_unit` double,
  `diskon` integer,
  `total_harga` double
);

CREATE TABLE `m_pembeli` (
  `id_pembeli` integer PRIMARY KEY,
  `nama_pembeli` varchar(255),
  `no_telp` integer,
  `alamat` varchar(255)
);

CREATE TABLE `retur` (
  `no_retur` integer PRIMARY KEY,
  `id_pembeli` integer,
  `id_vendor` integer,
  `tanggal_retur` datetime,
  `total_harga` double
);

CREATE TABLE `kwitansi_pembayaran` (
  `no_kwitansi` integer PRIMARY KEY,
  `no_invoice` integer,
  `id_pelanggan` integer,
  `tanggal` datetime,
  `total_bayar` double,
  `metode_pembayaran` varchar(255)
);

CREATE TABLE `detail_m_order_barang_pembelian` (
  `no_PurchaseOrder` integer,
  `kode_barang` char(6),
  `kuantitas` varchar(255),
  `harga_unit` double,
  `diskon` integer
);

CREATE TABLE `detail_m_retur_barang_pembelian` (
  `no_retur` integer,
  `kode_barang` char(6),
  `jumlah` varchar(255),
  `harga_unit` double,
  `diskon` integer
);

ALTER TABLE `permintaan_Pembelian` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `detail_m_order_barang_pembelian` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `penerimaan_barang` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `detail_m_retur_barang_pembelian` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `detail_m_order_barang_pembelian` ADD FOREIGN KEY (`no_PurchaseOrder`) REFERENCES `purchase_order` (`no_PurchaseOrder`);

ALTER TABLE `detail_m_retur_barang_pembelian` ADD FOREIGN KEY (`no_retur`) REFERENCES `retur` (`no_retur`);

ALTER TABLE `purchase_order` ADD FOREIGN KEY (`id_vendor`) REFERENCES `m_supplier` (`id_vendor`);

ALTER TABLE `retur` ADD FOREIGN KEY (`id_pembeli`) REFERENCES `m_pembeli` (`id_pembeli`);

ALTER TABLE `retur` ADD FOREIGN KEY (`id_vendor`) REFERENCES `m_supplier` (`id_vendor`);

ALTER TABLE `penerimaan_barang` ADD FOREIGN KEY (`no_PurchaseOrder`) REFERENCES `purchase_order` (`no_PurchaseOrder`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`sku_penerima_barang`) REFERENCES `penerimaan_barang` (`no_penerima_barang`);

ALTER TABLE `kwitansi_pembayaran` ADD FOREIGN KEY (`no_invoice`) REFERENCES `invoice` (`no_invoice`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`id_pembeli`) REFERENCES `m_pembeli` (`id_pembeli`);
