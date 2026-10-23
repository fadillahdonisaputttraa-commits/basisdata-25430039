# P04 NORMALISASI

**Nama:** Fadillah Doni Saputra  
**NPM:** 25430039  
**Mata Kuliah:** Basis Data  
**Dosen Pengampu:** Dedi Irawan, S.Kom., M.T.I.  
**Tanggal:** 20 Oktober 2026  

---

## 1. UNF (Unnormalized Form)

Pada tahap Unnormalized Form (UNF), data penjualan Kopma masih berada dalam satu relasi besar. Data transaksi dan data barang masih digabungkan sehingga terdapat kelompok data barang yang berulang.

### NOTA_UNF

```text
NOTA_UNF(
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
```

Tanda `{}` menunjukkan grup berulang karena satu nota dapat mempunyai lebih dari satu barang.

---

## 2. 1NF (First Normal Form)

Pada tahap 1NF, grup data yang berulang dihilangkan sehingga setiap atribut memiliki nilai atomik.

### NOTA_1NF

```text
NOTA_1NF(
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
```

Primary Key:

```text
(no_nota_penjualan, kode_barang)
```

Setiap baris menunjukkan satu barang pada satu transaksi.

Contoh:

| no_nota_penjualan | kode_barang | qty | harga_satuan |
|---|---|---:|---:|
| PJ001 | BRG001 | 2 | 5000 |
| PJ001 | BRG002 | 1 | 3000 |

Data sudah atomik, tetapi masih terdapat ketergantungan sebagian terhadap primary key komposit.

---

## 3. Functional Dependency

Functional Dependency digunakan untuk menunjukkan hubungan ketergantungan antaratribut.

### 3.1 Data Penjualan

```text
no_nota_penjualan → tgl_penjualan, kode_petugas, no_anggota
```

### 3.2 Data Petugas

```text
kode_petugas → nama_petugas
```

### 3.3 Data Anggota

```text
no_anggota → nama_anggota
```

### 3.4 Data Barang

```text
kode_barang → nama_barang
```

### 3.5 Detail Penjualan

```text
(no_nota_penjualan, kode_barang)
→ qty_detail_penjualan, harga_satuan_detail_penjualan
```

### 3.6 Nilai Turunan

```text
qty_detail_penjualan, harga_satuan_detail_penjualan
→ subtotal_detail_penjualan
```

Subtotal diperoleh dari jumlah barang dikalikan harga satuan.

---

## 4. 2NF (Second Normal Form)

Pada tahap 2NF, ketergantungan sebagian terhadap primary key komposit dihilangkan dengan memisahkan data ke dalam beberapa relasi.

### 4.1 ANGGOTA

```text
ANGGOTA(
    no_anggota,
    nama_anggota
)
```

Primary Key:

```text
no_anggota
```

### 4.2 PETUGAS

```text
PETUGAS(
    kode_petugas,
    nama_petugas
)
```

Primary Key:

```text
kode_petugas
```

### 4.3 BARANG

```text
BARANG(
    kode_barang,
    nama_barang
)
```

Primary Key:

```text
kode_barang
```

### 4.4 PENJUALAN

```text
PENJUALAN(
    no_nota_penjualan,
    tgl_penjualan,
    kode_petugas,
    no_anggota
)
```

Primary Key:

```text
no_nota_penjualan
```

Foreign Key:

```text
kode_petugas → PETUGAS(kode_petugas)
no_anggota → ANGGOTA(no_anggota)
```

### 4.5 DETAIL_PENJUALAN

```text
DETAIL_PENJUALAN(
    no_nota_penjualan,
    kode_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
```

Primary Key:

```text
(no_nota_penjualan, kode_barang)
```

Foreign Key:

```text
no_nota_penjualan → PENJUALAN(no_nota_penjualan)
kode_barang → BARANG(kode_barang)
```

---

## 5. 3NF (Third Normal Form)

Pada tahap 3NF, ketergantungan transitif dihilangkan. Setiap atribut non-key harus bergantung langsung pada primary key.

### ANGGOTA

```text
ANGGOTA(
    no_anggota PK,
    nama_anggota
)
```

### PETUGAS

```text
PETUGAS(
    kode_petugas PK,
    nama_petugas
)
```

### BARANG

```text
BARANG(
    kode_barang PK,
    nama_barang
)
```

### PENJUALAN

```text
PENJUALAN(
    no_nota_penjualan PK,
    tgl_penjualan,
    kode_petugas FK,
    no_anggota FK
)
```

### DETAIL_PENJUALAN

```text
DETAIL_PENJUALAN(
    no_nota_penjualan PK/FK,
    kode_barang PK/FK,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
```

Dengan pemisahan tersebut, atribut non-key pada setiap tabel bergantung langsung pada primary key tabel masing-masing.

---

## 6. BCNF (Boyce-Codd Normal Form)

BCNF memeriksa bahwa setiap determinan pada functional dependency merupakan superkey.

### ANGGOTA

```text
no_anggota → nama_anggota
```

`no_anggota` merupakan primary key.

**Memenuhi BCNF.**

### PETUGAS

```text
kode_petugas → nama_petugas
```

`kode_petugas` merupakan primary key.

**Memenuhi BCNF.**

### BARANG

```text
kode_barang → nama_barang
```

`kode_barang` merupakan primary key.

**Memenuhi BCNF.**

### PENJUALAN

```text
no_nota_penjualan
→ tgl_penjualan, kode_petugas, no_anggota
```

`no_nota_penjualan` merupakan primary key.

**Memenuhi BCNF.**

### DETAIL_PENJUALAN

```text
(no_nota_penjualan, kode_barang)
→ qty_detail_penjualan, harga_satuan_detail_penjualan
```

Kombinasi tersebut merupakan primary key.

**Memenuhi BCNF.**

Berdasarkan pemeriksaan tersebut, relasi hasil normalisasi memenuhi BCNF.

---

## 7. Nilai Turunan

### 7.1 Subtotal

Subtotal dapat dihitung dari jumlah barang dan harga satuan.

```text
subtotal_detail_penjualan =
qty_detail_penjualan × harga_satuan_detail_penjualan
```

### 7.2 Total Penjualan

Total penjualan diperoleh dari penjumlahan seluruh subtotal dalam satu nota.

```text
total_penjualan =
Σ subtotal_detail_penjualan
```

Nilai tersebut merupakan nilai turunan karena dapat dihitung dari data yang sudah tersedia pada detail transaksi.

---

## 8. Hasil Normalisasi

Hasil normalisasi menghasilkan lima relasi utama:

```text
ANGGOTA
PETUGAS
BARANG
PENJUALAN
DETAIL_PENJUALAN
```

### Skema Relasional

```text
ANGGOTA(
    no_anggota PK,
    nama_anggota
)

PETUGAS(
    kode_petugas PK,
    nama_petugas
)

BARANG(
    kode_barang PK,
    nama_barang
)

PENJUALAN(
    no_nota_penjualan PK,
    tgl_penjualan,
    kode_petugas FK,
    no_anggota FK
)

DETAIL_PENJUALAN(
    no_nota_penjualan PK/FK,
    kode_barang PK/FK,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan
)
```

### Relasi

```text
ANGGOTA 1 ──── N PENJUALAN

PETUGAS 1 ──── N PENJUALAN

PENJUALAN 1 ──── N DETAIL_PENJUALAN

BARANG 1 ──── N DETAIL_PENJUALAN
```

---

## 9. Kesimpulan

Normalisasi data dilakukan secara bertahap mulai dari UNF, 1NF, 2NF, 3NF, hingga BCNF.

Pada UNF masih terdapat grup data barang yang berulang. Pada 1NF grup berulang dihilangkan dan setiap nilai dibuat atomik. Pada 2NF ketergantungan sebagian terhadap primary key komposit dihilangkan dengan memisahkan data ke dalam tabel yang sesuai.

Pada 3NF ketergantungan transitif dihilangkan sehingga atribut non-key bergantung langsung pada primary key. Selanjutnya dilakukan pemeriksaan BCNF untuk memastikan setiap determinan merupakan superkey.

Hasil akhir normalisasi menghasilkan tabel ANGGOTA, PETUGAS, BARANG, PENJUALAN, dan DETAIL_PENJUALAN yang saling berhubungan melalui primary key dan foreign key. Struktur tersebut membuat data lebih terorganisir dan mengurangi pengulangan data.