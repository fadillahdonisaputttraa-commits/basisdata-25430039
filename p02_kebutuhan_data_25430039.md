# Dokumen Kebutuhan Data - Klinik DS Sehat

## 1. Latar belakang dan aktivitas organisasi

Klinik DS Sehat merupakan klinik yang melayani pemeriksaan dan pengobatan pasien. 
Kegiatan utama klinik meliputi pendaftaran pasien, pemeriksaan oleh dokter, 
pemberian resep obat, dan pembayaran layanan.

Dokumen kebutuhan data ini digunakan untuk mengidentifikasi data yang diperlukan 
dalam proses pelayanan klinik, mulai dari data pasien sampai data transaksi 
pelayanan dan obat.
## 2. Aktor dan proses bisnis

| Kode | Aktor | Proses Bisnis |
|---|---|---|
| PB-01 | Petugas Pendaftaran | Mendaftarkan pasien baru dan mencatat data pasien. |
| PB-02 | Dokter | Melakukan pemeriksaan pasien dan mencatat hasil pemeriksaan. |
| PB-03 | Dokter | Membuat resep obat berdasarkan hasil pemeriksaan. |
| PB-04 | Petugas Farmasi | Menyiapkan obat sesuai resep dan mencatat pengeluaran obat. |
| PB-05 | Petugas Administrasi | Mencatat pembayaran dan membuat bukti transaksi. |
| PB-06 | Petugas Administrasi | Mengelola data dokter. |
## 3. Dokumen sumber yang dianalisis

Dokumen sumber yang digunakan untuk mengidentifikasi kebutuhan data pada Klinik DS Sehat adalah:

1. Formulir pendaftaran pasien.
2. Kartu atau data identitas pasien.
3. Catatan hasil pemeriksaan pasien.
4. Resep obat.
5. Bukti pembayaran pelayanan.
## 4. Entitas kandidat dan elemen data

Entitas kandidat yang ditemukan dari proses bisnis Klinik DS Sehat adalah:

| Entitas | Elemen Data Utama |
|---|---|
| Pasien | no_pasien, nama_pasien, tanggal_lahir, jenis_kelamin, alamat, no_hp |
| Dokter | id_dokter, nama_dokter, spesialisasi, no_hp |
| Pemeriksaan | id_pemeriksaan, tanggal_pemeriksaan, keluhan, diagnosis, tindakan |
| Resep | id_resep, tanggal_resep, id_dokter, no_pasien |
| Obat | kode_obat, nama_obat, satuan, harga, stok |
| Pembayaran | id_pembayaran, tanggal_pembayaran, total_bayar, metode_bayar |
## 5. Aturan bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap pasien harus memiliki nomor pasien yang unik. |
| AB-02 | Data pasien harus dicatat sebelum pasien mendapatkan pelayanan. |
| AB-03 | Setiap pemeriksaan harus dilakukan oleh satu dokter. |
| AB-04 | Hasil pemeriksaan harus mencatat keluhan dan diagnosis pasien. |
| AB-05 | Resep obat dibuat berdasarkan hasil pemeriksaan dokter. |
| AB-06 | Obat yang diberikan kepada pasien harus tercatat dalam data obat. |
| AB-07 | Setiap pembayaran harus memiliki total biaya dan metode pembayaran. |
| AB-08 | Data transaksi pelayanan harus disimpan sebagai riwayat pelayanan pasien. |
## 6. Kebutuhan informasi

| Kode | Kebutuhan Informasi |
|---|---|
| KI-01 | Informasi data identitas dan kontak pasien. |
| KI-02 | Informasi jadwal dan data dokter yang memberikan pelayanan. |
| KI-03 | Informasi riwayat pemeriksaan pasien berdasarkan tanggal dan dokter. |
| KI-04 | Informasi resep dan obat yang diberikan kepada pasien. |
| KI-05 | Informasi transaksi pembayaran pelayanan pasien. |
## 7. Matriks CRUD

| Proses Bisnis | Pasien | Dokter | Pemeriksaan | Resep | Obat | Pembayaran |
|---|---|---|---|---|---|---|
| PB-01 Pendaftaran pasien | C | R | - | - | - | - |
| PB-02 Pemeriksaan pasien | R | R | C | - | - | - |
| PB-03 Pembuatan resep | R | R | R | C | R | - |
| PB-04 Pengeluaran obat | - | - | - | R | C/U | - |
| PB-05 Pembayaran | R | - | - | - | - | C |
| PB-06 Kelola data dokter | - | C/U/R | - | - | - | - |
## 8. Kamus data awal

| No | Elemen Data | Entitas | Keterangan | Contoh | Penanggung Jawab |
|---|---|---|---|---|---|
| 1 | no_pasien | Pasien | Nomor unik pasien | PSN001 | Petugas Pendaftaran |
| 2 | nama_pasien | Pasien | Nama lengkap pasien | Andi Saputra | Petugas Pendaftaran |
| 3 | tanggal_lahir | Pasien | Tanggal lahir pasien | 2000-05-10 | Petugas Pendaftaran |
| 4 | jenis_kelamin | Pasien | Jenis kelamin pasien | L | Petugas Pendaftaran |
| 5 | alamat | Pasien | Alamat tempat tinggal pasien | Bandar Lampung | Petugas Pendaftaran |
| 6 | no_hp | Pasien | Nomor telepon pasien | 081234567890 | Petugas Pendaftaran |
| 7 | id_dokter | Dokter | Identitas unik dokter | D001 | Petugas Administrasi |
| 8 | nama_dokter | Dokter | Nama lengkap dokter | Dr. Budi | Petugas Administrasi |
| 9 | spesialisasi | Dokter | Bidang keahlian dokter | Umum | Petugas Administrasi |
| 10 | id_pemeriksaan | Pemeriksaan | Identitas unik pemeriksaan | PM001 | Dokter |
| 11 | tanggal_pemeriksaan | Pemeriksaan | Tanggal pemeriksaan | 2026-10-05 | Dokter |
| 12 | keluhan | Pemeriksaan | Keluhan yang disampaikan pasien | Demam | Dokter |
| 13 | diagnosis | Pemeriksaan | Hasil diagnosis dokter | Influenza | Dokter |
| 14 | tindakan | Pemeriksaan | Tindakan yang diberikan | Pemeriksaan umum | Dokter |
| 15 | id_resep | Resep | Identitas unik resep | RSP001 | Dokter |
| 16 | tanggal_resep | Resep | Tanggal pembuatan resep | 2026-10-05 | Dokter |
| 17 | kode_obat | Obat | Kode unik obat | OBT001 | Petugas Farmasi |
| 18 | nama_obat | Obat | Nama obat | Paracetamol | Petugas Farmasi |
| 19 | satuan | Obat | Satuan obat | Tablet | Petugas Farmasi |
| 20 | harga | Obat | Harga obat | 5000 | Petugas Farmasi |
| 21 | stok | Obat | Jumlah obat tersedia | 100 | Petugas Farmasi |
| 22 | id_pembayaran | Pembayaran | Identitas unik pembayaran | BYR001 | Petugas Administrasi |
| 23 | total_bayar | Pembayaran | Total biaya yang harus dibayar | 50000 | Petugas Administrasi |
| 24 | metode_bayar | Pembayaran | Cara pembayaran pasien | Tunai | Petugas Administrasi |
## 9. Kebutuhan non-fungsional data

1. Data transaksi pelayanan klinik diperkirakan dapat mencapai sekitar 60 transaksi per hari.
2. Data pelayanan dan pembayaran pasien harus disimpan sebagai riwayat dan tidak dihapus sembarangan.
3. Data pribadi pasien seperti alamat dan nomor telepon hanya dapat diakses oleh petugas yang memiliki kewenangan.
4. Data kesehatan pasien seperti hasil pemeriksaan dan diagnosis hanya dapat diakses oleh dokter dan petugas yang diberi kewenangan.
5. Data harus memiliki format yang konsisten agar mudah dicari dan digunakan dalam laporan.
6. Sistem harus menyediakan data yang dapat digunakan untuk membuat laporan pelayanan dan transaksi.
## 10. Isu kualitas data yang diantisipasi

Beberapa masalah kualitas data yang dapat terjadi pada Klinik DS Sehat antara lain:

1. Data pasien dapat tercatat lebih dari satu kali jika petugas tidak melakukan pengecekan terlebih dahulu.
2. Kesalahan penulisan nama, alamat, atau nomor telepon dapat menyebabkan data pasien tidak akurat.
3. Stok obat dapat berbeda antara data dengan kondisi obat yang sebenarnya jika pengeluaran obat tidak langsung dicatat.
4. Data pemeriksaan yang tidak lengkap dapat menyulitkan pencarian riwayat pelayanan pasien.
5. Kesalahan pencatatan pembayaran dapat menyebabkan ketidaksesuaian antara transaksi dan jumlah pembayaran.
## 11. Parameter P

Parameter P dihitung berdasarkan dua digit terakhir NIM.

P = (39 mod 9) + 1
P = 3 + 1
P = 4

Berdasarkan nilai P = 4:
- Batas maksimal item per transaksi = P + 2 = 6 item.
- Persentase diskon atau denda harian = 4.
- Perkiraan volume transaksi harian = 40 + (5 × 4) = 60 transaksi per hari.
## 12. Perbaikan Pernyataan Kebutuhan

### 12.1 Data pasien harus aman

**Pernyataan awal:**  
Data pasien harus aman.

**Perbaikan:**  
Data pribadi pasien seperti alamat dan nomor telepon hanya dapat diakses oleh petugas yang memiliki kewenangan. Data pemeriksaan pasien hanya dapat diakses oleh dokter dan petugas yang diberi hak akses.

### 12.2 Sistem harus cepat mencari data pasien

**Pernyataan awal:**  
Sistem harus cepat mencari data pasien.

**Perbaikan:**  
Pencarian data pasien berdasarkan nomor pasien atau nama pasien harus menampilkan hasil yang sesuai sehingga petugas dapat menemukan data pasien dengan cepat.

### 12.3 Laporan pelayanan harus akurat

**Pernyataan awal:**  
Laporan pelayanan harus akurat.

**Perbaikan:**  
Laporan pelayanan harus menggunakan data pemeriksaan dan pembayaran yang tercatat pada transaksi, sehingga jumlah pelayanan dan total pembayaran dapat dicocokkan dengan data sumber.
## 13. Titik Analisis

### Titik Analisis 1 — Kebutuhan terlalu umum

Kebutuhan data harus dapat diturunkan menjadi elemen data yang jelas. Pada Klinik DS Sehat, kebutuhan seperti data pasien tidak cukup hanya disebutkan secara umum, tetapi harus dijabarkan menjadi elemen seperti no_pasien, nama_pasien, tanggal_lahir, alamat, dan no_hp.

Hal ini dilakukan agar kebutuhan dapat diterjemahkan menjadi struktur data dan dapat diuji.

### Titik Analisis 2 — Proses dan entitas

Proses bisnis merupakan kegiatan yang dilakukan oleh aktor, sedangkan entitas merupakan objek atau kejadian yang datanya dicatat. Pada Klinik DS Sehat, “pendaftaran pasien” merupakan proses bisnis, sedangkan “Pasien” merupakan entitas.

Pemisahan ini diperlukan agar proses bisnis dan entitas tidak tertukar dalam perancangan data.

### Titik Analisis 3 — Pemeriksaan matriks CRUD

Matriks CRUD digunakan untuk memastikan setiap entitas memiliki proses yang mengelola datanya. Jika terdapat entitas yang tidak memiliki aktivitas Create atau tidak digunakan oleh proses tertentu, entitas tersebut perlu diperiksa kembali apakah memang diperlukan atau membutuhkan proses pemeliharaan data.
## 14. Dokumen sumber fiktif

### Formulir Pendaftaran Pasien

Formulir pendaftaran pasien digunakan oleh petugas pendaftaran untuk mencatat data awal pasien sebelum mendapatkan pelayanan.

| Elemen Data | Sumber dari Formulir | Entitas Tujuan |
|---|---|---|
| no_pasien | Nomor pasien | Pasien |
| nama_pasien | Nama pasien | Pasien |
| tanggal_lahir | Tanggal lahir | Pasien |
| jenis_kelamin | Jenis kelamin | Pasien |
| alamat | Alamat pasien | Pasien |
| no_hp | Nomor telepon | Pasien |

Formulir tersebut menjadi sumber data untuk membuat atau memperbarui data pasien. Data yang dicatat kemudian digunakan dalam proses pemeriksaan dan pelayanan pasien.
