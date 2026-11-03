-- =====================================================
-- DATA KLINIK DS SEHAT
-- Nama: Fadillah Doni Saputra
-- NPM : 25430039
-- =====================================================

USE klinik_039;

-- 1. DATA PASIEN
INSERT INTO pasien VALUES
('P001','Andi Saputra','Metro','081234567801'),
('P002','Budi Santoso','Bandar Lampung','081234567802'),
('P003','Citra Lestari','Metro','081234567803'),
('P004','Dewi Anggraini','Lampung Timur','081234567804'),
('P005','Eko Pratama','Metro','081234567805');

-- 2. DATA DOKTER
INSERT INTO dokter VALUES
('D001','Dr. Ahmad','Umum','081234568001'),
('D002','Dr. Siti','Anak','081234568002'),
('D003','Dr. Budi','Gigi','081234568003'),
('D004','Dr. Rina','Penyakit Dalam','081234568004'),
('D005','Dr. Agus','Kulit','081234568005');

-- 3. DATA OBAT
INSERT INTO obat VALUES
('O001','Paracetamol','Tablet',100,5000),
('O002','Amoxicillin','Kapsul',80,10000),
('O003','Antasida','Tablet',90,4000),
('O004','Vitamin C','Tablet',120,3000),
('O005','CTM','Tablet',70,2500);

-- 4. DATA PEMERIKSAAN
INSERT INTO pemeriksaan VALUES
('PM001','P001','D001','2026-10-01','Demam','Influenza'),
('PM002','P002','D002','2026-10-01','Batuk','Infeksi saluran pernapasan'),
('PM003','P003','D003','2026-10-02','Sakit gigi','Karies gigi'),
('PM004','P004','D004','2026-10-02','Nyeri perut','Gangguan pencernaan'),
('PM005','P005','D005','2026-10-03','Gatal kulit','Dermatitis');

-- 5. DATA RESEP
INSERT INTO resep VALUES
('R001','PM001','2026-10-01'),
('R002','PM002','2026-10-01'),
('R003','PM003','2026-10-02'),
('R004','PM004','2026-10-02'),
('R005','PM005','2026-10-03');

-- 6. DATA DETAIL RESEP
INSERT INTO detail_resep VALUES
('DR001','R001','O001',10,'3 kali sehari'),
('DR002','R002','O002',10,'3 kali sehari'),
('DR003','R003','O001',5,'2 kali sehari'),
('DR004','R004','O003',10,'3 kali sehari'),
('DR005','R005','O005',5,'2 kali sehari');

-- 7. DATA PEMBAYARAN
INSERT INTO pembayaran VALUES
('BY001','P001','PM001','2026-10-01',50000,'Tunai'),
('BY002','P002','PM002','2026-10-01',75000,'Transfer'),
('BY003','P003','PM003','2026-10-02',60000,'Tunai'),
('BY004','P004','PM004','2026-10-02',45000,'QRIS'),
('BY005','P005','PM005','2026-10-03',55000,'Transfer');