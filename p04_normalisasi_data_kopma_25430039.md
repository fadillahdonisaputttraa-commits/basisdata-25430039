# P04 NORMALISASI DATA KOPMA

## Identitas

Nama: Fadillah Doni Saputra  
NPM: 25430039  
Mata Kuliah: Basis Data  
Dosen: Dedi Irawan, S.Kom., M.T.I.  
Tanggal: 20 Oktober 2026

---

## A. Data Awal Kopma

Data awal penjualan Kopma terdiri dari data nota, anggota, petugas, barang, serta detail barang yang dibeli.

Data transaksi yang masih digabungkan menyebabkan adanya pengulangan data.

---

## B. UNF

NOTA_UNF (
no_nota_penjualan,
tgl_penjualan,
kode_petugas,
nama_petugas,
no_anggota,
nama_anggota,
{
kode_barang,
nama_barang,
qty_detail_penjualan,
harga_satuan_detail_penjualan,
subtotal_detail_penjualan
},
jumlah_penjualan,
diskon_penjualan,
total_penjualan
)

Masalah utama pada UNF adalah terdapat grup berulang pada data barang.

---

## C. 1NF

NOTA_1NF (
no_nota_penjualan,
kode_barang,
tgl_penjualan,
kode_petugas,
nama_petugas,
no_anggota,
nama_anggota,
nama_barang,
qty_detail_penjualan,
harga_satuan_detail_penjualan,
subtotal_detail_penjualan,
jumlah_penjualan,
diskon_penjualan,
total_penjualan
)

Primary Key:

(no_nota_penjualan, kode_barang)

Pada tahap ini setiap nilai bersifat atomik dan satu baris mewakili satu barang dalam satu nota.

---

## D. 2NF

Pemisahan tabel dilakukan berdasarkan dependensi fungsional.

### Tabel ANGGOTA

| Atribut | Keterangan |
|---|---|
| no_anggota | Primary Key |
| nama_anggota | Nama anggota |

### Tabel PETUGAS

| Atribut | Keterangan |
|---|---|
| kode_petugas | Primary Key |
| nama_petugas | Nama petugas |

### Tabel BARANG

| Atribut | Keterangan |
|---|---|
| kode_barang | Primary Key |
| nama_barang | Nama barang |

### Tabel PENJUALAN

| Atribut | Keterangan |
|---|---|
| no_nota_penjualan | Primary Key |
| tgl_penjualan | Tanggal penjualan |
| kode_petugas | Foreign Key |
| no_anggota | Foreign Key |

### Tabel DETAIL_PENJUALAN

| Atribut | Keterangan |
|---|---|
| no_nota_penjualan | Primary Key / Foreign Key |
| kode_barang | Primary Key / Foreign Key |
| qty_detail_penjualan | Jumlah barang |
| harga_satuan_detail_penjualan | Harga pada transaksi |

---

## E. Functional Dependency

no_nota_penjualan → tgl_penjualan, kode_petugas, no_anggota

kode_petugas → nama_petugas

no_anggota → nama_anggota

kode_barang → nama_barang

(no_nota_penjualan, kode_barang) →
qty_detail_penjualan, harga_satuan_detail_penjualan

qty_detail_penjualan, harga_satuan_detail_penjualan →
subtotal_detail_penjualan

FD harus berasal dari aturan bisnis, bukan hanya dari contoh data.

---

## F. 3NF

Relasi akhir 3NF:

**ANGGOTA**

ANGGOTA(no_anggota PK, nama_anggota)

**PETUGAS**

PETUGAS(kode_petugas PK, nama_petugas)

**BARANG**

BARANG(kode_barang PK, nama_barang)

**PENJUALAN**

PENJUALAN(
no_nota_penjualan PK,
tgl_penjualan,
kode_petugas FK,
no_anggota FK
)

**DETAIL_PENJUALAN**

DETAIL_PENJUALAN(
no_nota_penjualan PK/FK,
kode_barang PK/FK,
qty_detail_penjualan,
harga_satuan_detail_penjualan
)

---

## G. BCNF

Semua determinan yang digunakan pada relasi hasil normalisasi merupakan candidate key/superkey.

Dengan demikian relasi hasil normalisasi memenuhi BCNF.

---

## H. Nilai Turunan

Subtotal:

qty_detail_penjualan × harga_satuan_detail_penjualan

Total penjualan:

Σ subtotal_detail_penjualan

Nilai turunan dapat dihitung ketika dibutuhkan sehingga tidak perlu menjadi sumber data utama.

---

## I. Skema Relasional Akhir

```text
ANGGOTA
- no_anggota (PK)
- nama_anggota

PETUGAS
- kode_petugas (PK)
- nama_petugas

BARANG
- kode_barang (PK)
- nama_barang

PENJUALAN
- no_nota_penjualan (PK)
- tgl_penjualan
- kode_petugas (FK)
- no_anggota (FK)

DETAIL_PENJUALAN
- no_nota_penjualan (PK, FK)
- kode_barang (PK, FK)
- qty_detail_penjualan
- harga_satuan_detail_penjualan
```

Relasi:

```text
ANGGOTA 1 ──── N PENJUALAN
PETUGAS 1 ──── N PENJUALAN
PENJUALAN 1 ──── N DETAIL_PENJUALAN
BARANG 1 ──── N DETAIL_PENJUALAN
```

Dokumen ini berisi rangkuman data dan hasil normalisasi proyek Kopma.