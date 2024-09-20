CREATE TABLE `sales_order` (
  `no_sales_order` integer PRIMARY KEY,
  `kode_barang` char(6),
  `id_pelanggan` integer,
  `tanggal_pesanan` datetime,
  `total_harga` double
);

CREATE TABLE `m_barang` (
  `kode_barang` char(6) PRIMARY KEY,
  `nama_barang` varchar(255),
  `harga_unit` double
);

CREATE TABLE `deliver_order` (
  `no_deliver_order` integer PRIMARY KEY,
  `id_pelanggan` integer,
  `kode_barang` char(6),
  `total` double,
  `keterangan` varchar(255)
);

CREATE TABLE `m_pelanggan` (
  `id_pelanggan` integer PRIMARY KEY,
  `nama_pelanggan` varchar(255),
  `kontak` varchar(255)
);

CREATE TABLE `invoice` (
  `no_invoice` integer PRIMARY KEY,
  `sku_penerima_barang` integer,
  `id_pelanggan` integer,
  `kode_barang` char(6),
  `tanggal_invoice` datetime,
  `kuantitas` varchar(255),
  `harga_unit` double,
  `diskon` integer,
  `total_harga` double
);

CREATE TABLE `retur` (
  `no_retur` integer PRIMARY KEY,
  `kode_barang` char(6),
  `id_pelanggan` integer,
  `id_penjual` integer,
  `tanggal_retur` datetime,
  `total_harga` double
);

CREATE TABLE `m_penjual` (
  `id_penjual` integer PRIMARY KEY,
  `nama_penjual` varchar(255),
  `no_telp` integer,
  `alamat` varchar(255)
);

CREATE TABLE `kwitansi_pembayaran` (
  `no_kwitansi` integer PRIMARY KEY,
  `no_invoice` integer,
  `id_pelanggan` integer,
  `tanggal` datetime,
  `total_bayar` double,
  `metode_pembayaran` varchar(255)
);

CREATE TABLE `detail_m_order_barang_penjualan` (
  `no_PurchaseOrder` integer,
  `kode_barang` char(6),
  `kuantitas` varchar(255),
  `harga_unit` double,
  `diskon` integer
);

CREATE TABLE `detail_m_retur_barang_penjualan` (
  `no_retur` integer,
  `kode_barang` char(6),
  `jumlah` varchar(255),
  `harga_unit` double,
  `diskon` integer
);

ALTER TABLE `detail_m_order_barang_penjualan` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `deliver_order` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `detail_m_retur_barang_penjualan` ADD FOREIGN KEY (`kode_barang`) REFERENCES `m_barang` (`kode_barang`);

ALTER TABLE `sales_order` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `m_pelanggan` (`id_pelanggan`);

ALTER TABLE `deliver_order` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `m_pelanggan` (`id_pelanggan`);

ALTER TABLE `kwitansi_pembayaran` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `m_pelanggan` (`id_pelanggan`);

ALTER TABLE `retur` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `m_pelanggan` (`id_pelanggan`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`id_pelanggan`) REFERENCES `m_pelanggan` (`id_pelanggan`);

ALTER TABLE `detail_m_order_barang_penjualan` ADD FOREIGN KEY (`no_PurchaseOrder`) REFERENCES `sales_order` (`no_sales_order`);

ALTER TABLE `detail_m_retur_barang_penjualan` ADD FOREIGN KEY (`no_retur`) REFERENCES `retur` (`no_retur`);

ALTER TABLE `m_penjual` ADD FOREIGN KEY (`id_penjual`) REFERENCES `retur` (`id_penjual`);

ALTER TABLE `kwitansi_pembayaran` ADD FOREIGN KEY (`no_invoice`) REFERENCES `invoice` (`no_invoice`);
