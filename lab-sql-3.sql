USE sakila;
# 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;
# 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
SELECT COUNT(DISTINCT language_id)
FROM film;
# 3. How many movies were released with `"PG-13"` rating?
SELECT COUNT(film.rating)
FROM film
WHERE rating LIKE 'PG-13';
# 4. Get 10 the longest movies from 2006.
SELECT *
FROM film
WHERE release_year LIKE '2006'
ORDER BY length DESC
LIMIT 10;
# 5. How many days has been the company operating (check `DATEDIFF()` function)?
# SELECT MIN(rental_date)
# FROM rental;
SELECT datediff(MAX(rental_date), MIN(rental_date)) as days_of_operation
FROM rental;
# 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, substring(rental_date, 6, 2) AS month, substring(rental_date, 9, 2) AS day 
FROM rental
LIMIT 20;
# 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
CASE
    WHEN DAYOFWEEK(rental_date) = 1 OR DAYOFWEEK(rental_date) = 7 THEN 'weekend'
    ELSE 'workday'
END as day_type
FROM rental;
# 8. How many rentals were in the last month of activity?
SELECT COUNT(*) as rental_count
FROM rental
WHERE rental_date >= DATE_SUB((SELECT MAX(rental_date) FROM rental), INTERVAL 30 DAY);