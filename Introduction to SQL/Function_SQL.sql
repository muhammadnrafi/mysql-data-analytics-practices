USE world;

-- SOAL 1
SELECT name, population FROM country WHERE name LIKE '%e' ORDER BY population DESC LIMIT 10;

-- SOAL 2
SELECT COUNT(*) FROM country WHERE indepyear BETWEEN 1900 AND 1945;

-- SOAL 3
SELECT * FROM city;
SELECT countrycode, COUNT(DISTINCT(district)) AS jumlah_distrik FROM city GROUP BY countrycode ORDER BY jumlah_distrik DESC LIMIT 5;

-- SOAL 4
SELECT * FROM country;
SELECT name, headofstate, length(headofstate) AS panjang_nama FROM country ORDER BY panjang_nama DESC LIMIT 10;

-- SOAL 5
SELECT COUNT(*) AS jumlah FROM country WHERE headofstate LIKE '_e%';

-- SOAL 6
SELECT * FROM country;
SELECT continent, SUM(surfacearea) AS luas_area FROM country GROUP BY continent ORDER BY luas_area;

-- SOAL 7
USE world;
SELECT * FROM countrylanguage;
SELECT countrycode, COUNT(Language) AS jumlah_bahasa FROM countrylanguage WHERE IsOfficial='T' GROUP BY countrycode ORDER BY jumlah_bahasa DESC LIMIT 2;

-- SOAL 8
SELECT * FROM country;
SELECT region, SUM(GNP) AS total_gnp FROM country WHERE continent='Asia' OR continent = 'Europe' GROUP BY region HAVING total_gnp>1000000;

-- SOAL 9
USE sakila;
SELECT * FROM payment;
SELECT MONTHNAME(payment_date) AS Bulan, SUM(amount) AS omset FROM payment WHERE YEAR(payment_date) = 2005 GROUP BY Bulan ORDER BY omset;

-- SOAL 10
SELECT MAX(DATEDIFF(DATE(return_date), DATE(rental_date))) AS lama_pinjam_max FROM rental; 


SELECT name AS Negara FROM country WHERE name LIKE 'i%' AND continent='europe';

SELECT AVG(GNP) FROM country WHERE continent='oceania';

SELECT name as Negara, GNP FROM country WHERE GNP > (SELECT AVG(GNP) FROM country WHERE continent='oceania') ORDER BY GNP DESC;

SELECT country.name AS negara, countrylanguage.percentage AS persentase
	FROM country, countrylanguage 
    WHERE country.code = countrylanguage.countrycode AND language='spanish'
    ORDER BY persentase DESC;
    
SELECT * FROM countrylanguage WHERE countrycode='idn' AND isofficial='t';
    
SELECT country.name, city.name, city.population, countrylanguage.language
	FROM country
    INNER JOIN city
    ON country.capital = city.ID 
    INNER JOIN countrylanguage
    ON country.code=countrylanguage.countrycode
    WHERE countrylanguage.countrycode='idn' AND countrylanguage.isofficial='T';
    
SELECT * FROM city WHERE name='jakarta';