5.
# Modify the CREATE TABLE of tourists -

DROP TABLE IF EXISTS tourists;
CREATE TABLE tourists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    passport_number TEXT UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Other')) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT UNIQUE NOT NULL,
    country_id INTEGER NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id)
);



# Create a new table tour_tourists -

DROP TABLE IF EXISTS tour_tourists;
CREATE TABLE tour_tourists (
    tourist_id INTEGER NOT NULL,
    tour_id INTEGER NOT NULL,
    PRIMARY KEY (tourist_id, tour_id),
    FOREIGN KEY (tourist_id) REFERENCES tourists(id) ON DELETE CASCADE,
    FOREIGN KEY (tour_id) REFERENCES tours(id) ON DELETE CASCADE
);



# Inserting data into the tour_tourists table -

INSERT INTO tour_tourists (tourist_id, tour_id)
VALUES (1, 3), (1, 5), (2, 3), (2, 6), (3, 7), (3, 10), (4, 2), (4, 8),
    (5, 1), (5, 4), (6, 11), (6, 12), (7, 9), (7, 8), (8, 6), (9, 3), (10, 5);



6.
CREATE PROCEDURE GetMoviesRevenueByYear(IN input_year INT)
BEGIN
    SELECT movie_name, revenue
    FROM movies
    WHERE YEAR(release_date) = input_year;
END;
