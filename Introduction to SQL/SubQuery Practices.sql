-- SUBQUERY -> QUERY DALAM QUERY
USE world;
SELECT name, population FROM city WHERE countrycode='idn' ORDER BY population;
SELECT name, min(population) FROM city WHERE countrycode='idn'; -- ERROR
SELECT min(population) FROM city WHERE countrycode='idn'; -- Mencari kota terkecil
-- CONTOH SUBQUERY:
SELECT name, population FROM city WHERE countrycode='idn' AND population=(SELECT min(population) FROM city WHERE countrycode='idn');

-- LATIHAN
-- Menampilkan negara dengan populasi diatas rata rata populasi dunia
SELECT AVG(population) AS rata_populasi FROM country;
SELECT name, population FROM country WHERE population>(SELECT AVG(population) FROM country) ORDER BY population;
-- tampilkan region di dunia yang memiliki lifeex diatas rata rata dunia
SELECT AVG(lifeexpectancy) FROM country;
SELECT region, AVG(lifeexpectancy) AS rata_harapan_hidup FROM country GROUP BY region HAVING rata_harapan_hidup>(SELECT AVG(lifeexpectancy) FROM country);

SELECT * FROM CITY;
SELECT * FROM COUNTRY;
SELECT * FROM COUNTRYLANGUAGE;

SELECT country.name AS negara, city.name AS kota, countrylanguage.language AS bahasa
	FROM country, city, countrylanguage
    WHERE country.capital = city.ID AND country.countrycode=countrylanguage=countrycode;
    
SELECT country.name AS negara, city.name AS kota, countrylanguage.language AS bahasa
    FROM city
    JOIN country
    ON city.ID = country.capital
    JOIN countrylanguage
    ON country.code = countrylanguage.countrycode
    WHERE countrylanguage.isofficial='T' AND country.region='Southeast asia';
    
    
USE sakila;
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;
SELECT * FROM actor;
SELECT * FROM film_actor;

-- SOAL 5
SELECT film.title, category.name AS category
	FROM film
    JOIN film_actor
    ON film.film_id = film_actor.film_id
    JOIN film_category
    ON film_actor.film_id = film_category.film_id
    JOIN category
    ON film_category.category_id = category.category_id
    WHERE film_actor.actor_id = 107 AND category.name = 'sci-fi';

-- SOAL 4
SELECT category.name, count(category.category_id) AS jumlah_movie
	FROM category
    LEFT JOIN film_category
    ON category.category_id = film_category.category_id
    RIGHT JOIN film_actor
    ON film_category.film_id = film_actor.film_id
    WHERE film_actor.actor_id = 107
    GROUP BY category.name;
-- SOAL 3
SELECT film_actor.actor_id, actor.first_name, actor.last_name, count(distinct(film_actor.film_id)) AS jumlah_movie
	FROM film_actor
    JOIN actor
    ON film_actor.actor_id = actor.actor_id
    GROUP BY film_actor.actor_id
    ORDER BY jumlah_movie DESC, actor.first_name DESC
    LIMIT 10;




-- SOAL 2
SELECT category.name, count(film_category.film_id) AS jumlah, AVG(film.rental_rate)
	FROM category
    JOIN film_category
    ON category.category_id = film_category.category_id
    JOIN film
    ON film_category.film_id = film.film_id
    GROUP BY category.name
    ORDER BY jumlah DESC;
    
-- SOAL 1
SELECT film.title, category.name AS category, film.length
	FROM film
    JOIN film_category
    ON film.film_id = film_category.film_id
    JOIN category
    ON film_category.category_id = category.category_id 
    WHERE category.name='comedy'
    ORDER BY film.length;
    


