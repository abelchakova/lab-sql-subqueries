# Challenge
# Write SQL queries to perform the following tasks using the Sakila database:

# 1.Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT f.title AS film_title,
    COUNT(*) AS number_of_copies
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title;

# 2.List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT f.title AS film_title, f.length AS film_length
FROM film f
WHERE f.length > (SELECT AVG(length) FROM film);

# 3.Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';