CREATE DATABASE toko;
USE toko;

CREATE TABLE karyawan (
	ID int NOT NULL AUTO_INCREMENT,
    nama varchar(255),
    usia int,
    berat float(1),
    kota varchar(255),
    tahun int,
    PRIMARY KEY (ID)
);

SHOW TABLES;

INSERT INTO karyawan (nama, usia, berat, kota, tahun) VALUES
	('Andi Santosa', 32, 68.3, 'Jakarta', 2010),
    ('Budi Purnama', 33, 88.2, 'Jakarta', 1999),
    ('Cecep Sutisna', 35, 68.1, 'Bandung', 2000),
    ('Dedi Hartanto', 32, 71.3, 'Salatiga', 1998),
    ('Eva Soraya', 32, 48.1, 'Medan', 2015),
    ('Farah Nainah', 29, 52.3, 'Surabaya', 2010),
    ('Gianti Safitri', 22, 51.6, 'Bandung', 2017),
    ('Hamzah Syah', 34, 66, 'Yogyakarta', 2008),
    ('Irene Sukindar', 25, 49.3, 'Jakarta', 2016),
    ('Joni Saputra', 28, 69.8, 'Yogyakarta', 2000),
    ('Budi Raharja', 51, 70, 'Bandung', 1998),
    ('Andi Safitri', 35, 67, 'Jakarta', 2018);

SELECT * FROM karyawan;

SELECT nama, tahun FROM karyawan;

-- FUNGSI yang paling Umum : DISTINCT, COUNT, AVG, SUM

SELECT DISTINCT(kota)
FROM karyawan;

SELECT COUNT(*) AS Jumlah_baris FROM karyawan; 
SELECT ROUND(AVG(usia)) AS Rata_Usia FROM karyawan;
SELECT SUM(berat) AS total_berat FROM karyawan;
SELECT * FROM karyawan LIMIT 5;
SELECT * FROM karyawan WHERE kota='Jakarta' AND (ID%2=0);
SELECT * FROM karyawan WHERE kota in ('Jakarta', 'Bandung');
SELECT berat, kota FROM karyawan WHERE kota='Bandung';
SELECT AVG(usia) AS rata_usia FROM karyawan WHERE berat>60;
SELECT * FROM karyawan WHERE usia>25 ORDER BY usia DESC LIMIT 3;
SELECT * FROM karyawan WHERE usia<30 AND berat>50;


-- LATIHAN
SELECT * FROM karyawan LIMIT 3;
SELECT nama FROM karyawan WHERE kota='Jakarta';
SELECT DISTINCT(kota) FROM karyawan;
SELECT COUNT(kota) AS jumlah FROM karyawan WHERE kota='Bandung';
SELECT AVG(berat) AS rata_berat FROM karyawan WHERE usia > 30;
SELECT SUM(usia) AS total_umur FROM karyawan WHERE berat<55;
SELECT tahun FROM karyawan WHERE nama LIKE 'B%';
