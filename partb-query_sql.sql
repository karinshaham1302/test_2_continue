2. group by -

א.
SELECT genre, COUNT(*) AS genre_count
FROM movies
GROUP BY genre;

ב.
SELECT year, SUM(revenue) AS total_revenue
FROM movies
GROUP BY year
ORDER BY year;

ג.
SELECT genre, ROUND(AVG(revenue), 2) AS average_revenue
FROM movies
GROUP BY genre
ORDER BY average_revenue DESC;

ד.
SELECT genre, language, ROUND(AVG(revenue), 2) AS average_revenue
FROM movies
GROUP BY genre, language
ORDER BY genre, language;

ה.
SELECT language, COUNT(*) AS movie_count
FROM movies
GROUP BY language
ORDER BY movie_count ASC
LIMIT 1;

ו.
SELECT country, COUNT(*) AS movie_count
FROM movies
GROUP BY country
ORDER BY movie_count DESC
LIMIT 1;

ז.
SELECT genre, COUNT(*) AS movie_count
FROM movies
GROUP BY genre
HAVING COUNT(*) > 2;

ח.
SELECT year, SUM(revenue) AS total_revenue
FROM movies
GROUP BY year
HAVING SUM(revenue) > 1000;

ט.
SELECT language, COUNT(*) AS movie_count
FROM movies
GROUP BY language
HAVING COUNT(*) >= 3;



3. join -

א.
SELECT t.first_name, t.last_name,
    c.country_name
FROM tourists t
INNER JOIN countries c ON t.country_id = c.id;

ב.
SELECT t.first_name, t.last_name,
    tr.tour_name, tr.start_date, tr.end_date,
    tr.price, tr.guide_name
FROM tourists t
INNER JOIN tours tr ON t.tour_id = tr.id;

ג.
SELECT t.first_name, t.last_name,
    tr.tour_name, tr.start_date, tr.end_date,
    tr.price, tr.guide_name
FROM tourists t
LEFT JOIN tours tr ON t.tour_id = tr.id;

ד.
SELECT t.first_name, t.last_name,
    tr.tour_name, tr.start_date, tr.end_date,
    tr.price, tr.guide_name
FROM tourists t
FULL JOIN tours tr ON t.tour_id = tr.id;

ה.
SELECT *
FROM tourists
WHERE tour_id IS NULL;

DELETE FROM tourists
WHERE id = (
    SELECT id
    FROM tourists
    WHERE tour_id IS NULL
    LIMIT 1
);

ו.
SELECT *
FROM tours tr
LEFT JOIN tourists t ON tr.id = t.tour_id
WHERE t.id IS NULL;

ז.
SELECT COUNT(*)
FROM tours tr
LEFT JOIN tourists t ON tr.id = t.tour_id
WHERE t.id IS NULL;

ח.
SELECT t.first_name, t.last_name, tr.tour_name
FROM tourists t
CROSS JOIN tours tr;

