-- P05 DDL KOPMA
-- NPM: 25430039

CREATE DATABASE IF NOT EXISTS kopma_039
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE kopma_039;

-- Hapus tabel jika sudah ada
DROP TABLE IF EXISTS detail_penjualan;
DROP TABLE IF EXISTS detail_pembelian;
DROP TABLE IF EXISTS penjualan;
DROP TABLE IF EXISTS pembelian;
DROP TABLE IF EXISTS barang;
DROP TABLE IF EXISTS anggota;
DROP TABLE IF EXISTS petugas;
DROP TABLE IF EXISTS pemasok;

-- Tabel PETUGAS
CREATE TABLE petugas (
    kode_petugas VARCHAR(10) NOT NULL,
    nama_petugas VARCHAR(100) NOT NULL,
    PRIMARY KEY (kode_petugas)
);

-- Tabel ANGGOTA
CREATE TABLE anggota (
    no_anggota VARCHAR(10) NOT NULL,
    nama_anggota VARCHAR(100) NOT NULL,
    PRIMARY KEY (no_anggota)
);

-- Tabel BARANG
CREATE TABLE barang (
    kode_barang VARCHAR(10) NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    PRIMARY KEY (kode_barang)
);

-- Tabel PEMASOK
CREATE TABLE pemasok (
    kode_pemasok VARCHAR(10) NOT NULL,
    nama_pemasok VARCHAR(100) NOT NULL,
    alamat_pemasok VARCHAR(200),
    telepon_pemasok VARCHAR(20),
    PRIMARY KEY (kode_pemasok)
);

-- Tabel PENJUALAN
CREATE TABLE penjualan (
    no_nota_penjualan VARCHAR(20) NOT NULL,
    tgl_penjualan DATE NOT NULL,
    kode_petugas VARCHAR(10) NOT NULL,
    no_anggota VARCHAR(10),
    PRIMARY KEY (no_nota_penjualan),

    CONSTRAINT fk_penjualan_petugas
        FOREIGN KEY (kode_petugas)
        REFERENCES petugas(kode_petugas),

    CONSTRAINT fk_penjualan_anggota
        FOREIGN KEY (no_anggota)
        REFERENCES anggota(no_anggota)
);

-- Tabel DETAIL_PENJUALAN
CREATE TABLE detail_penjualan (
    no_nota_penjualan VARCHAR(20) NOT NULL,
    kode_barang VARCHAR(10) NOT NULL,
    qty_detail_penjualan INT NOT NULL,
    harga_satuan_detail_penjualan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (no_nota_penjualan, kode_barang),

    CONSTRAINT ck_detail_qty
        CHECK (qty_detail_penjualan > 0),

    CONSTRAINT fk_detail_penjualan_nota
        FOREIGN KEY (no_nota_penjualan)
        REFERENCES penjualan(no_nota_penjualan),

    CONSTRAINT fk_detail_penjualan_barang
        FOREIGN KEY (kode_barang)
        REFERENCES barang(kode_barang)
);

-- Tabel PEMBELIAN
CREATE TABLE pembelian (
    no_nota_pembelian VARCHAR(20) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    kode_petugas VARCHAR(10) NOT NULL,
    kode_pemasok VARCHAR(10) NOT NULL,
    PRIMARY KEY (no_nota_pembelian),

    CONSTRAINT fk_pembelian_petugas
        FOREIGN KEY (kode_petugas)
        REFERENCES petugas(kode_petugas),

    CONSTRAINT fk_pembelian_pemasok
        FOREIGN KEY (kode_pemasok)
        REFERENCES pemasok(kode_pemasok)
);

-- Tabel DETAIL_PEMBELIAN
CREATE TABLE detail_pembelian (
    no_nota_pembelian VARCHAR(20) NOT NULL,
    kode_barang VARCHAR(10) NOT NULL,
    qty_detail_pembelian INT NOT NULL,
    harga_satuan_detail_pembelian DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (no_nota_pembelian, kode_barang),

    CONSTRAINT ck_dbeli_qty
        CHECK (qty_detail_pembelian > 0),

    CONSTRAINT fk_detail_pembelian_nota
        FOREIGN KEY (no_nota_pembelian)
        REFERENCES pembelian(no_nota_pembelian),

    CONSTRAINT fk_detail_pembelian_barang
        FOREIGN KEY (kode_barang)
        REFERENCES barang(kode_barang)
);