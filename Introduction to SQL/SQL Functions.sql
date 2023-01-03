USE world;

-- STRING PATTERN
SELECT name FROM country WHERE name LIKE 'i%';
SELECT name, population FROM country WHERE name LIKE '%e';
SELECT name, GNP FROM country WHERE name LIKE '_N%';

-- RANGE -> BETWEEN value1 AND value2, bersifat inclusive
SELECT * FROM country;
SELECT name, population FROM country WHERE continent='Asia' AND population BETWEEN 10000000 AND 30000000;
SELECT name, population FROM country WHERE continent='Asia' AND population NOT BETWEEN 10000000 AND 30000000;
SELECT name, lifeExpectancy FROM country WHERE LifeExpectancy BETWEEN 80 AND 90;
SELECT name, lifeExpectancy FROM country WHERE LifeExpectancy NOT BETWEEN 80 AND 90;

-- ORDER BY -> default nya di akhir setelah semua query sebelum limit, karena order by digunakan mengurutkan hasil query
-- Default ASC -> mengurutkan dari terkecil ke terbesar, DESC -> mengurutkan dari besar ke kecil
SELECT name, population FROM country WHERE continent='Asia' AND population BETWEEN 10000000 AND 30000000 ORDER BY population DESC;
SELECT * FROM city;
SELECT name FROM city WHERE CountryCode='idn' ORDER BY name DESC Limit 10;

-- GROUP BY -> Mengelompokkan data berdasarkan kategori di kolom tertentu, biasanya digunakan ketika terdapat agregasi data
SELECT * FROM country;
SELECT Continent, SUM(population) AS Jumlah_Populasi FROM country GROUP BY Continent;
SELECT District, AVG(Population) AS rata_populasi FROM city WHERE countrycode='idn' GROUP BY District ORDER BY rata_populasi;

-- HAVING -> Seperti WHERE namun digunakan setelah GROUPING
SELECT District, AVG(population) AS rata_populasi FROM city WHERE countrycode='idn' GROUP BY District HAVING rata_populasi >1000000 ORDER BY rata_populasi DESC;


-- LATIHAN
SELECT * FROM country WHERE continent='ASIA' AND name LIKE 'J%';
SELECT COUNT(*) FROM country WHERE continent='Europe' AND name LIKE'%N';
SELECT * FROM city;
SELECT * FROM country;
SELECT SUM(population) AS total_populasi, Continent FROM country GROUP BY Continent ORDER BY total_populasi;
SELECT name, LifeExpectancy FROM country WHERE continent='Europe' AND LifeExpectancy BETWEEN 66 AND 75 ORDER BY LifeExpectancy DESC;
SELECT District, SUM(population) AS total_populasi FROM city WHERE CountryCode='chn' GROUP BY District HAVING total_populasi>10000000 ORDER BY total_populasi;

-- AGREGATE FUNCTION -> SUM, AVG, MIN, MAX
-- SCALAR FUNCTION -> ROUND, LENGTH, UCASE, LCASE
-- MIN/MAX() Mencari nilai terkecil/terbesar
SELECT MIN(population) FROM city WHERE countrycode='idn';
SELECT MAX(population) FROM city WHERE countrycode='idn';
SELECT district, MAX(population) FROM city GROUP BY District;
-- ROUND -> Membulatkan
SELECT * FROM country;
SELECT name, region, ROUND(population/surfacearea) AS density FROM country WHERE REGION='Southeast Asia' ORDER BY density;
-- LENGTH -> Menampilkan panjang / jumlah karakter
SELECT name, length(name) AS panjang FROM country WHERE region='southeast asia' ORDER BY panjang;
-- UCASE/LCASE
SELECT ucase(name) FROM country limit 10;
SELECT lcase(name) FROM country limit 10;

-- DATE TIME FUNCTION
USE sakila;
SHOW TABLES;
DESCRIBE payment;
SELECT * from payment limit 5;
-- DAY/DAYNAME() -> menampilkan tanggal hari dari suatu data tipe datetime
SELECT DAY(payment_date) AS tanggal, AVG(amount) AS rata_bayar FROM payment GROUP BY tanggal ORDER BY rata_bayar;
SELECT DAYNAME(payment_date) AS hari, AVG(amount) AS rata_bayar FROM payment GROUP BY hari ORDER BY rata_bayar;
-- MONTH/MONTHNAME() -> Menampilkan bulan
SELECT MONTH(payment_date) AS bulan, SUM(amount) AS total_bayar FROM payment GROUP BY bulan;
SELECT SUM(amount) AS total_bayar FROM payment WHERE MONTH(payment_date) = 8;
SELECT MONTHNAME(payment_date) AS nama_bulan, SUM(amount) AS total_bayar FROM payment GROUP BY nama_bulan;

-- DATE ARITMATIK
SELECT * FROM rental limit 5;
SELECT rental_date, DATE(DATE(rental_date)+1) FROM rental;
-- DATEDIFF, mencari selisih tanggal
SELECT return_date, rental_date, DATEDIFF(DATE(return_date), DATE(rental_date)) AS hari_peminjaman FROM rental; 








