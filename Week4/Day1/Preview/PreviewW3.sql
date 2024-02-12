--Nomor 1
SELECT first_name, last_name
FROM actor
ORDER BY first_name DESC;

--Nomor 2
SELECT * FROM actor
WHERE first_name LIKE 'C%'
LIMIT 10;

--Nomor 3
SELECT title, rental_rate, rating
FROM film
WHERE rating IN('G', 'R') AND (rental_rate BETWEEN 2 AND 5);

--Nomor 4
SELECT rating, AVG(rental_duration)
FROM film
GROUP BY rating;

--Nomor 5
SELECT film.title, film_actor.actor_id, film_actor.film_id
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 15;