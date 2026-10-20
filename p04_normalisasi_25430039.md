# P04 - Normalisasi Data Kopma

## 1. UNF

NOTA_UNF (
no_nota_penjualan,
tanggal_penjualan,
no_anggota,
nama_anggota,
no_hp_anggota,
id_petugas,
nama_petugas,
jabatan,
{
kode_barang,
nama_barang,
satuan,
jumlah,
harga_satuan
},
id_pembayaran,
tanggal_bayar,
metode_bayar,
total_penjualan
)

Tanda `{}` menunjukkan grup berulang karena satu nota dapat memiliki
lebih dari satu barang.

---

## 2. 1NF

Pada tahap 1NF, grup berulang dihilangkan dan setiap nilai dibuat
atomik. Satu barang pada satu nota dicatat sebagai satu baris.

Kunci komposit:

(no_nota_penjualan, kode_barang)

### NOTA_1NF

NOTA_1NF (
no_nota_penjualan,
kode_barang,
tanggal_penjualan,
no_anggota,
nama_anggota,
no_hp_anggota,
id_petugas,
nama_petugas,
jabatan,
nama_barang,
satuan,
jumlah,
harga_satuan,
id_pembayaran,
tanggal_bayar,
metode_bayar,
total_penjualan
)

---

## 3. 2NF

Pada tahap 2NF, ketergantungan sebagian terhadap kunci komposit
dihilangkan dengan memisahkan data berdasarkan ketergantungannya.

### ANGGOTA

ANGGOTA (
no_anggota,
nim_anggota,
nama_anggota,
no_hp_anggota
)

Primary Key: no_anggota

### BARANG

BARANG (
kode_barang,
nama_barang,
satuan,
harga_jual,
stok_barang
)

Primary Key: kode_barang

### PETUGAS

PETUGAS (
id_petugas,
nama_petugas,
jabatan
)

Primary Key: id_petugas

### PENJUALAN

PENJUALAN (
no_nota_penjualan,
tanggal_penjualan,
no_anggota,
id_petugas,
id_pembayaran,
tanggal_bayar,
metode_bayar,
total_penjualan
)

Primary Key: no_nota_penjualan

### DETAIL_PENJUALAN

DETAIL_PENJUALAN (
no_nota_penjualan,
kode_barang,
jumlah,
harga_satuan
)

Primary Key:
(no_nota_penjualan, kode_barang)

---

## 4. Functional Dependency

### Anggota

no_anggota → nim_anggota, nama_anggota, no_hp_anggota

### Barang

kode_barang → nama_barang, satuan, harga_jual, stok_barang

### Petugas

id_petugas → nama_petugas, jabatan

### Penjualan

no_nota_penjualan → tanggal_penjualan, no_anggota, id_petugas,
id_pembayaran, tanggal_bayar, metode_bayar, total_penjualan

### Detail Penjualan

(no_nota_penjualan, kode_barang) → jumlah, harga_satuan

---

## 5. 3NF (Third Normal Form)

Pada tahap 3NF, setiap atribut non-kunci harus bergantung langsung
pada primary key dan tidak terdapat ketergantungan transitif.

### ANGGOTA

ANGGOTA (
no_anggota,
nim_anggota,
nama_anggota,
no_hp_anggota
)

Primary Key: no_anggota

### BARANG

BARANG (
kode_barang,
nama_barang,
satuan,
harga_jual,
stok_barang
)

Primary Key: kode_barang

### PETUGAS

PETUGAS (
id_petugas,
nama_petugas,
jabatan
)

Primary Key: id_petugas

### PENJUALAN

PENJUALAN (
no_nota_penjualan,
tanggal_penjualan,
no_anggota,
id_petugas,
id_pembayaran,
tanggal_bayar,
metode_bayar,
total_penjualan
)

Primary Key: no_nota_penjualan

Foreign Key:
- no_anggota → ANGGOTA(no_anggota)
- id_petugas → PETUGAS(id_petugas)

### DETAIL_PENJUALAN

DETAIL_PENJUALAN (
no_nota_penjualan,
kode_barang,
jumlah,
harga_satuan
)

Primary Key:
(no_nota_penjualan, kode_barang)

Foreign Key:
- no_nota_penjualan → PENJUALAN(no_nota_penjualan)
- kode_barang → BARANG(kode_barang)

### Penjelasan

Pada tahap 3NF, data anggota, barang, petugas, dan transaksi telah
dipisahkan berdasarkan ketergantungannya.

Atribut pada tabel ANGGOTA bergantung pada no_anggota.
Atribut pada tabel BARANG bergantung pada kode_barang.
Atribut pada tabel PETUGAS bergantung pada id_petugas.
Atribut pada tabel PENJUALAN bergantung pada no_nota_penjualan.
Sedangkan atribut jumlah dan harga_satuan pada DETAIL_PENJUALAN
bergantung pada kombinasi no_nota_penjualan dan kode_barang.

Dengan demikian, tidak terdapat ketergantungan transitif pada
struktur tabel hasil normalisasi.

## 6. BCNF (Boyce-Codd Normal Form)

BCNF diperiksa dengan memastikan setiap determinan pada functional
dependency merupakan superkey.

### Pemeriksaan

1. no_anggota → nim_anggota, nama_anggota, no_hp_anggota
   - Determinan: no_anggota
   - no_anggota merupakan primary key pada ANGGOTA.
   - Memenuhi BCNF.

2. kode_barang → nama_barang, satuan, harga_jual, stok_barang
   - Determinan: kode_barang
   - kode_barang merupakan primary key pada BARANG.
   - Memenuhi BCNF.

3. id_petugas → nama_petugas, jabatan
   - Determinan: id_petugas
   - id_petugas merupakan primary key pada PETUGAS.
   - Memenuhi BCNF.

4. no_nota_penjualan → atribut transaksi
   - Determinan: no_nota_penjualan
   - no_nota_penjualan merupakan primary key pada PENJUALAN.
   - Memenuhi BCNF.

5. (no_nota_penjualan, kode_barang) → jumlah, harga_satuan
   - Determinan merupakan primary key pada DETAIL_PENJUALAN.
   - Memenuhi BCNF.

Berdasarkan pemeriksaan tersebut, seluruh relasi hasil normalisasi
memenuhi BCNF.

## 7. Nilai Turunan

### Total Penjualan

Total penjualan dapat dihitung berdasarkan jumlah dan harga satuan
setiap detail barang:

total = jumlah × harga_satuan

Kemudian nilai setiap detail dijumlahkan untuk memperoleh total
transaksi.

Namun, total_penjualan tetap dapat disimpan pada tabel PENJUALAN
karena elemen tersebut memang tercantum dalam kebutuhan data Kopma.

### Stok Barang

stok_barang merupakan jumlah barang yang tersedia dan digunakan
dalam pengelolaan serta pelaporan stok.

---

## 8. Hasil Akhir

Hasil normalisasi menghasilkan lima relasi utama:

1. ANGGOTA
2. BARANG
3. PETUGAS
4. PENJUALAN
5. DETAIL_PENJUALAN

Struktur tersebut mengurangi pengulangan data dan memisahkan data
berdasarkan ketergantungannya.

---

## 9. Kesimpulan

Normalisasi data Kopma dilakukan secara bertahap dari UNF, 1NF, 2NF,
3NF, hingga BCNF. Pada UNF masih terdapat grup data barang yang
berulang. Pada 1NF grup tersebut dihilangkan dan data dibuat atomik.

Pada 2NF data dipisahkan berdasarkan ketergantungannya sehingga
terbentuk tabel ANGGOTA, BARANG, PETUGAS, PENJUALAN, dan
DETAIL_PENJUALAN. Selanjutnya pada 3NF diperiksa agar tidak terdapat
ketergantungan transitif.

Hasil pemeriksaan functional dependency menunjukkan bahwa determinan
pada setiap relasi merupakan superkey sehingga struktur akhir dapat
dinyatakan memenuhi BCNF.