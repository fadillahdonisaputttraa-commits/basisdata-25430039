-- MODUL 6: DATA KOPMA
-- NPM: 25430039
-- Database: kopma_039
-- Jalankan setelah p05_ddl_kopma_25430039.sql

USE kopma_039;

-- 1. DATA PETUGAS
INSERT INTO petugas
(kode_petugas, nama_petugas, peran_petugas)
VALUES
('K01', 'Dimas', 'kasir'),
('K02', 'Sari', 'kasir'),
('K03', 'Rina', 'kasir'),
('G01', 'Joko', 'gudang'),
('P01', 'Ketua Kopma', 'ketua');

-- 2. DATA BARANG
INSERT INTO barang
(kode_barang, nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)
VALUES
('ATK-001', 'Pulpen Gel 0.5', 'ATK', 4000, 120, 20),
('ATK-002', 'Buku Tulis 58', 'ATK', 6500, 80, 20),
('MNM-001', 'Air Mineral 600 ml', 'minuman', 4000, 48, 24),
('MKN-001', 'Roti Cokelat', 'makanan', 5000, 6, 10);

-- 3. DATA ANGGOTA
INSERT INTO anggota
(no_anggota, nama_anggota, status_anggota, tanggal_daftar)
VALUES
('A001', 'Andi Pratama', 'aktif', '2026-01-01'),
('A002', 'Siti Rahma', 'aktif', '2026-01-01'),
('A003', 'Budi Santoso', 'nonaktif', '2024-12-10');

-- 4. DATA PEMASOK
INSERT INTO pemasok
(kode_pemasok, nama_pemasok, alamat_pemasok, telepon_pemasok)
VALUES
('S001', 'CV Sumber ATK', 'Metro', '081234567801'),
('S002', 'UD Segar Jaya', 'Lampung', '081234567802');

-- 5. TRANSAKSI PENJUALAN
INSERT INTO penjualan
(no_nota_penjualan, tgl_penjualan, kode_petugas, no_anggota, bayar_penjualan)
VALUES
('PJ-2609-0142', '2026-09-24 10:15:00', 'K03', 'A001', 35000);

-- 6. DETAIL PENJUALAN
INSERT INTO detail_penjualan
(no_nota_penjualan, kode_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 'PJ-2609-0142', kode_barang, 3, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-001';

INSERT INTO detail_penjualan
(no_nota_penjualan, kode_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 'PJ-2609-0142', kode_barang, 2, harga_jual_barang
FROM barang
WHERE kode_barang = 'ATK-002';

INSERT INTO detail_penjualan
(no_nota_penjualan, kode_barang, qty_detail_penjualan, harga_satuan_detail_penjualan)
SELECT 'PJ-2609-0142', kode_barang, 2, harga_jual_barang
FROM barang
WHERE kode_barang = 'MNM-001';

-- 7. MEMPERBARUI STOK SETELAH PENJUALAN
UPDATE barang
SET stok_barang = stok_barang - 3
WHERE kode_barang = 'ATK-001';

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'ATK-002';

UPDATE barang
SET stok_barang = stok_barang - 2
WHERE kode_barang = 'MNM-001';

-- 8. TRANSAKSI PEMBELIAN
INSERT INTO pembelian
(no_nota_pembelian, tgl_pembelian, kode_petugas, kode_pemasok)
VALUES
('PB-2609-0001', '2026-09-25 09:00:00', 'G01', 'S001');

-- 9. DETAIL PEMBELIAN
INSERT INTO detail_pembelian
(no_nota_pembelian, kode_barang, qty_detail_pembelian, harga_satuan_detail_pembelian)
VALUES
('PB-2609-0001', 'ATK-001', 50, 3000),
('PB-2609-0001', 'ATK-002', 30, 5000);

-- 10. PEMBARUAN HARGA ATK-001
UPDATE barang
SET harga_jual_barang = 4200
WHERE kode_barang = 'ATK-001';

-- 11. PEMERIKSAAN DATA
SELECT * FROM petugas;
SELECT * FROM anggota;
SELECT * FROM barang;
SELECT * FROM pemasok;
SELECT * FROM penjualan;
SELECT * FROM detail_penjualan;
SELECT * FROM pembelian;
SELECT * FROM detail_pembelian;