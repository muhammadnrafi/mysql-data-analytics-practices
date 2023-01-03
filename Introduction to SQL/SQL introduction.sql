-- untuk run QUERY, highlight bagian yang ingin dijalankan lalu press ctrl+enter atau sama dengan petir dengan import table from
-- pastikan menutup query dengan titik koma ; untuk menunjukkan bahwa query telah selesai
-- sql tidak case sensitive

CREATE DATABASE toko; -- membuat database baru bernama toko, kalau belum memiliki isi nama nya tidak akan muncul di daftar
USE toko; -- untuk menggunakan database tertentu
SHOW TABLES; -- cek tabel apa saja
CREATE TABLE karyawan (-- membuat tabel baru dengan nama karyawan
	nama varchar(255), -- membuat kolom nama di tabel karyawan, dengan tipe data varchar/string dan jumlah karakter maksimum 255
    usia int, -- membuat kolom usia di tabel karyawan dengan tipe data integer
    kota varchar(255) -- membuat kolom kota
); -- menunjukkan satu query

SHOW TABLES; -- ada tabel karyawan namun masih kosong

INSERT INTO karyawan VALUES -- menambahkan baris/data baru ke dalam tabel karyawan
	('ANDI', 33, 'Jakarta'), -- buat isi dari tabel sesuai urutan kolom yang sudah dibuat
    ('BUDI', 40, 'Surabaya');

SELECT * FROM karyawan; -- * berarti memanggil semua isi

INSERT INTO karyawan (nama, kota) -- menambahkan data baru ke kolom tertentu
	VALUES('CACA', 'Bandung');

SELECT * FROM karyawan;

SET SQL_SAFE_UPDATES = 0; -- kalau tidak bisa update, set mode server menjadi boleh
UPDATE karyawan -- mengubah data pada baris yang sudah ada di tabel karyawan
	SET usia=30 -- menambahkan nilai 30 pada kolom usia
    WHERE nama='CACA'; -- ketika nama == caca
SELECT * FROM karyawan;

DELETE FROM karyawan WHERE nama='CACA'; -- menghapus data dengan value caca pada kolom nama dari tabel karyawan
SELECT * FROM karyawan;

ALTER TABLE karyawan -- untuk mengubah nama/menambah kolom pada tabel karyawan
	CHANGE usia umur int; -- ubah kolom usia jadi kolom umur dengan data tipe tetap integer
-- kalau mau nambah kolom pakai keywod ADD -> ADD umur int -> ADD nama kolom dan data tipe
SELECT * FROM karyawan;

DROP TABLE karyawan; -- menghapujs tabel karyawan 
SHOW TABLES;
DROP DATABASE toko; -- menghapus database toko
