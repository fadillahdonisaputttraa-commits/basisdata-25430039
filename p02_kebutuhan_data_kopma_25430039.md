# Dokumen Kebutuhan Data - Koperasi Mahasiswa (Kopma)

## 1. Latar belakang dan aktivitas organisasi

Koperasi Mahasiswa (Kopma) merupakan organisasi yang melayani kebutuhan
mahasiswa melalui kegiatan penjualan barang dan pelayanan kepada anggota.
Aktivitas yang dianalisis meliputi pengelolaan anggota, pengelolaan barang
dan stok, transaksi penjualan, pembayaran, serta pencatatan riwayat transaksi.

Dokumen kebutuhan data ini digunakan untuk mengidentifikasi data yang
dibutuhkan dalam proses bisnis Kopma serta menjadi dasar untuk menentukan
entitas, aturan bisnis, kebutuhan informasi, dan pengelolaan data.
## 2. Aktor dan proses bisnis

| Kode | Aktor | Proses Bisnis |
|---|---|---|
| PB-01 | Ketua | Mengelola data anggota koperasi. |
| PB-02 | Petugas Gudang | Mengelola data barang dan stok. |
| PB-03 | Kasir | Mencatat transaksi penjualan anggota. |
| PB-04 | Kasir | Mencatat pembayaran transaksi. |
| PB-05 | Petugas Gudang | Memperbarui stok setelah barang terjual. |
| PB-06 | Ketua | Mengelola data petugas koperasi. |
## 3. Dokumen sumber yang dianalisis

Dokumen yang digunakan sebagai sumber untuk mengidentifikasi kebutuhan data
Kopma adalah:

1. Formulir pendaftaran anggota.
2. Nota penjualan.
3. Catatan stok barang.
4. Bukti pembayaran transaksi.
5. Rekap transaksi penjualan.
## 4. Entitas kandidat dan elemen data

| Entitas | Elemen Data Utama |
|---|---|
| Anggota | no_anggota, nim_anggota, nama_anggota, no_hp_anggota |
| Barang | kode_barang, nama_barang, satuan, harga_jual, stok_barang |
| Penjualan | no_nota_penjualan, tanggal_penjualan, no_anggota, total_penjualan |
| Detail Penjualan | no_nota_penjualan, kode_barang, jumlah, harga_satuan |
| Pembayaran | id_pembayaran, no_nota_penjualan, tanggal_bayar, metode_bayar |
| Petugas | id_petugas, nama_petugas, jabatan |
## 5. Aturan bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap anggota harus memiliki nomor anggota yang unik. |
| AB-02 | NIM anggota harus dicatat sebagai identitas anggota. |
| AB-03 | Setiap barang harus memiliki kode barang yang unik. |
| AB-04 | Stok barang tidak boleh bernilai kurang dari nol. |
| AB-05 | Setiap transaksi penjualan memiliki satu nomor nota yang unik. |
| AB-06 | Harga barang pada transaksi harus dicatat sesuai harga saat transaksi terjadi. |
## 6. Kebutuhan informasi

| Kode | Kebutuhan Informasi |
|---|---|
| KI-01 | Informasi identitas dan kontak anggota koperasi. |
| KI-02 | Informasi daftar barang dan stok yang tersedia. |
| KI-03 | Informasi riwayat transaksi penjualan anggota. |
| KI-04 | Informasi total pembayaran setiap transaksi. |
| KI-05 | Informasi rekap stok barang berdasarkan periode. |
## 7. Matriks CRUD

| Proses Bisnis | Anggota | Barang | Penjualan | Detail Penjualan | Pembayaran | Petugas |
|---|---|---|---|---|---|---|
| PB-01 Kelola anggota | C/U/R | - | - | - | - | R |
| PB-02 Kelola barang dan stok | - | C/U/R | - | - | - | R |
| PB-03 Transaksi penjualan | R | R | C | C | - | R |
| PB-04 Pembayaran | R | - | R | - | C | R |
| PB-05 Perbarui stok | - | U | R | R | - | R |
| PB-06 Kelola petugas | - | - | - | - | - | C/U/R |
## 8. Kamus data awal

| Elemen | Entitas | Arti | Contoh | Penanggung Jawab |
|---|---|---|---|---|
| no_anggota | Anggota | Nomor unik anggota | A-0457 | Ketua |
| nim_anggota | Anggota | NIM anggota | 2301010123 | Ketua |
| nama_anggota | Anggota | Nama anggota | Andi Saputra | Ketua |
| no_hp_anggota | Anggota | Nomor HP anggota | 081234567890 | Ketua |
| kode_barang | Barang | Kode unik barang | BRG001 | Petugas Gudang |
| nama_barang | Barang | Nama barang | Buku Tulis | Petugas Gudang |
| satuan | Barang | Satuan barang | Buah | Petugas Gudang |
| harga_jual | Barang | Harga jual barang | 5000 | Petugas Gudang |
| stok_barang | Barang | Jumlah barang tersedia | 35 | Petugas Gudang |
| no_nota_penjualan | Penjualan | Nomor nota transaksi | PJ-001 | Kasir |
| tanggal_penjualan | Penjualan | Tanggal transaksi | 2026-10-05 | Kasir |
| total_penjualan | Penjualan | Total nilai transaksi | 50000 | Kasir |
| jumlah | Detail Penjualan | Jumlah barang yang dibeli | 2 | Kasir |
| harga_satuan | Detail Penjualan | Harga barang saat transaksi | 5000 | Kasir |
| id_pembayaran | Pembayaran | Identitas pembayaran | BYR001 | Kasir |
| tanggal_bayar | Pembayaran | Tanggal pembayaran | 2026-10-05 | Kasir |
| metode_bayar | Pembayaran | Metode pembayaran | Tunai | Kasir |
| id_petugas | Petugas | Identitas petugas | PTG001 | Ketua |
| nama_petugas | Petugas | Nama petugas | Sinta | Ketua |
| jabatan | Petugas | Jabatan petugas | Kasir | Ketua |
## 9. Kebutuhan non-fungsional data

1. Volume transaksi diperkirakan sekitar 150 nota penjualan per hari.
2. Data transaksi penjualan harus disimpan sebagai riwayat minimal lima tahun.
3. Data pribadi anggota seperti nomor HP hanya dapat dilihat oleh pihak yang memiliki kewenangan.
4. Data stok harus menggunakan format yang konsisten agar mudah diperiksa dan dibuatkan laporan.
5. Data transaksi harus dapat digunakan untuk menghasilkan laporan penjualan dan stok.
## 10. Isu kualitas data yang diantisipasi

1. Data anggota dapat tercatat lebih dari satu kali apabila nomor anggota tidak diperiksa terlebih dahulu.
2. Kesalahan memasukkan kode atau nama barang dapat menyebabkan data barang tidak akurat.
3. Stok dapat berbeda dari kondisi sebenarnya jika transaksi tidak langsung dicatat.
4. Kesalahan pencatatan harga dapat menyebabkan total transaksi tidak sesuai.
5. Data transaksi yang tidak lengkap dapat menyulitkan pembuatan laporan.
## 11. Latihan Poin Loyalitas

Kopma memberikan program poin loyalitas kepada anggota berdasarkan nilai
belanja yang dilakukan.

### 11.1 Elemen Data Tambahan

| Elemen | Entitas | Arti | Contoh | Penanggung Jawab |
|---|---|---|---|---|
| poin_anggota | Anggota | Jumlah poin yang dimiliki anggota | 35 | Ketua |
| poin_diperoleh | Penjualan | Jumlah poin yang diperoleh dari transaksi | 5 | Kasir |
| poin_digunakan | Penjualan | Jumlah poin yang digunakan anggota | 50 | Kasir |
| diskon_poin | Penjualan | Nilai potongan dari penukaran poin | 5000 | Kasir |

### 11.2 Aturan Bisnis Tambahan

| Kode | Aturan Bisnis |
|---|---|
| AB-07 | Setiap kelipatan Rp10.000 dari belanja anggota menghasilkan 1 poin. |
| AB-08 | Poin yang diperoleh dari transaksi ditambahkan ke saldo poin anggota. |
| AB-09 | Anggota dapat menukarkan 50 poin untuk mendapatkan potongan Rp5.000. |
| AB-10 | Poin yang digunakan untuk penukaran harus dikurangi dari saldo poin anggota. |

### 11.3 Kebutuhan Informasi Tambahan

| Kode | Kebutuhan Informasi |
|---|---|
| KI-06 | Informasi jumlah poin yang dimiliki setiap anggota. |
| KI-07 | Informasi jumlah poin yang diperoleh dari setiap transaksi. |
| KI-08 | Informasi riwayat penukaran poin dan potongan harga anggota. |

### 11.4 Pembaruan Matriks CRUD

| Proses Bisnis | Anggota | Barang | Penjualan | Detail Penjualan | Pembayaran | Petugas |
|---|---|---|---|---|---|---|
| PB-01 Kelola anggota | C/U/R | - | - | - | - | R |
| PB-02 Kelola barang dan stok | - | C/U/R | - | - | - | R |
| PB-03 Transaksi penjualan | R/U | R | C | C | - | R |
| PB-04 Pembayaran | R | - | R | - | C | R |
| PB-05 Perbarui stok | - | U | R | R | - | R |
| PB-06 Kelola data petugas | - | - | - | - | - | C/U/R |
## 12. Perbaikan Pernyataan Kebutuhan Kabur

### 12.1 Data anggota harus aman

**Pernyataan awal:**  
"Data anggota harus aman."

**Perbaikan:**  
Data pribadi anggota seperti nomor HP hanya dapat dilihat oleh pengguna yang
memiliki hak akses, sedangkan pengguna tanpa hak akses tidak dapat melihat data
tersebut.

### 12.2 Sistem harus cepat mencari barang

**Pernyataan awal:**  
"Sistem harus cepat mencari barang."

**Perbaikan:**  
Pencarian barang berdasarkan kode barang atau nama barang harus menampilkan
data barang yang sesuai sehingga petugas dapat menemukan informasi barang
yang dibutuhkan dengan cepat.

### 12.3 Laporan stok harus akurat

**Pernyataan awal:**  
"Laporan stok harus akurat."

**Perbaikan:**  
Jumlah stok pada laporan harus sesuai dengan hasil pencatatan barang masuk
dan barang keluar yang tersimpan dalam data transaksi.
