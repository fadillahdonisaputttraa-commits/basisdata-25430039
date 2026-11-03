
-- =====================================================
-- DDL DATABASE KLINIK DS SEHAT
-- Nama : Fadillah Doni Saputra
-- NPM  : 25430039
-- =====================================================

USE klinik_039;

-- 1. Tabel PASIEN
CREATE TABLE IF NOT EXISTS pasien (
    id_pasien VARCHAR(10) PRIMARY KEY,
    nama_pasien VARCHAR(100) NOT NULL,
    alamat TEXT,
    no_telepon VARCHAR(15)
) ENGINE=InnoDB;

-- 2. Tabel DOKTER
CREATE TABLE IF NOT EXISTS dokter (
    id_dokter VARCHAR(10) PRIMARY KEY,
    nama_dokter VARCHAR(100) NOT NULL,
    spesialisasi VARCHAR(50),
    no_telepon VARCHAR(15)
) ENGINE=InnoDB;

-- 3. Tabel PEMERIKSAAN
CREATE TABLE IF NOT EXISTS pemeriksaan (
    id_pemeriksaan VARCHAR(10) PRIMARY KEY,
    id_pasien VARCHAR(10) NOT NULL,
    id_dokter VARCHAR(10) NOT NULL,
    tanggal_pemeriksaan DATE NOT NULL,
    keluhan TEXT,
    diagnosis TEXT,
    CONSTRAINT fk_pemeriksaan_pasien
        FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien),
    CONSTRAINT fk_pemeriksaan_dokter
        FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
) ENGINE=InnoDB;

-- 4. Tabel RESEP
CREATE TABLE IF NOT EXISTS resep (
    id_resep VARCHAR(10) PRIMARY KEY,
    id_pemeriksaan VARCHAR(10) NOT NULL,
    tanggal_resep DATE NOT NULL,
    CONSTRAINT fk_resep_pemeriksaan
        FOREIGN KEY (id_pemeriksaan)
        REFERENCES pemeriksaan(id_pemeriksaan)
) ENGINE=InnoDB;

-- 5. Tabel OBAT
CREATE TABLE IF NOT EXISTS obat (
    id_obat VARCHAR(10) PRIMARY KEY,
    nama_obat VARCHAR(100) NOT NULL,
    jenis_obat VARCHAR(50),
    stok INT NOT NULL DEFAULT 0,
    harga DECIMAL(12,2) NOT NULL,
    CONSTRAINT chk_obat_stok CHECK (stok >= 0),
    CONSTRAINT chk_obat_harga CHECK (harga >= 0)
) ENGINE=InnoDB;

-- 6. Tabel DETAIL_RESEP
CREATE TABLE IF NOT EXISTS detail_resep (
    id_detail_resep VARCHAR(10) PRIMARY KEY,
    id_resep VARCHAR(10) NOT NULL,
    id_obat VARCHAR(10) NOT NULL,
    jumlah INT NOT NULL,
    aturan_pakai VARCHAR(150),
    CONSTRAINT fk_detail_resep_resep
        FOREIGN KEY (id_resep) REFERENCES resep(id_resep),
    CONSTRAINT fk_detail_resep_obat
        FOREIGN KEY (id_obat) REFERENCES obat(id_obat),
    CONSTRAINT chk_detail_jumlah CHECK (jumlah > 0)
) ENGINE=InnoDB;

-- 7. Tabel PEMBAYARAN
CREATE TABLE IF NOT EXISTS pembayaran (
    id_pembayaran VARCHAR(10) PRIMARY KEY,
    id_pasien VARCHAR(10) NOT NULL,
    id_pemeriksaan VARCHAR(10) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    total_bayar DECIMAL(12,2) NOT NULL,
    metode_pembayaran VARCHAR(30) NOT NULL,
    CONSTRAINT fk_pembayaran_pasien
        FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien),
    CONSTRAINT fk_pembayaran_pemeriksaan
        FOREIGN KEY (id_pemeriksaan)
        REFERENCES pemeriksaan(id_pemeriksaan),
    CONSTRAINT chk_total_bayar CHECK (total_bayar >= 0)
) ENGINE=InnoDB;
