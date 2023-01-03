USE world;
SHOW TABLES;

SELECT * FROM city limit 5;
SELECT * FROM country limit 5;
SELECT * FROM countrylanguage limit 5;

-- SOAL 1
SELECT COUNT(DISTINCT(Language)) AS jumlah_bahasa FROM countrylanguage;
-- SOAL 2
SELECT * FROM countrylanguage;
SELECT COUNT(Language) AS jumlah_bahasa FROM countrylanguage WHERE Language='English' AND IsOfficial='T';
-- SOAL 3
SELECT Name, Population, GNP FROM country WHERE Region='Southeast Asia';
-- SOAL 4
SELECT AVG(LifeExpectancy) AS rata_harapan_hidup FROM country WHERE Continent='Asia';
-- SOAL 5 
SELECT DISTINCT(Region) FROM country WHERE Continent='Europe';
-- SOAL 6
SELECT COUNT(Name) AS jumlah_kota FROM city WHERE CountryCode='nld';
-- SOAL 7
SELECT SUM(Population) AS jumlah_populasi FROM city WHERE CountryCode='ind';
-- SOAL 8
SELECT Name, Population FROM city WHERE CountryCode='idn' Limit 10;

