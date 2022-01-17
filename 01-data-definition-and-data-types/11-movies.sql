CREATE TABLE directors (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE genres (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE categories (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE movies (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year YEAR,
    length TIME,
    genre_id INT,
    category_id INT,
    rating FLOAT,
    notes TEXT
);

INSERT INTO directors (id, director_name, notes)
VALUES (1, 'Makaron Ilarionopolski', NULL),
(2, 'Smirnen Hristov', NULL),
(3, 'Yovko Yordanov', 'The best director ever'),
(4, 'Debelqn Dimchov', NULL),
(5, 'Vapcar Nikolov', NULL);

INSERT INTO genres (id, genre_name, notes)
VALUES (1, 'comedy', NULL),
(2, 'horror', 'rand'),
(3, 'adventure', NULL),
(4, 'action', NULL),
(5, 'mystery', NULL);

INSERT INTO categories (id, category_name, notes)
VALUES (1, 'test1', NULL),
(2, 'test2', 'rand'),
(3, 'test3', NULL),
(4, 'test4', NULL),
(5, 'test5', NULL);

INSERT INTO movies (id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
VALUES (1, 'test1', 1, 1976, '00:55:00', 1, 3, 6, NULL),
(2, 'test2', 1976, 2, '00:55:00', 3, 5, 1.5, 'test'),
(3, 'test3', 1976, 3, '00:55:00', 4, 2, 3, NULL),
(4, 'test4', 1976, 4, '00:55:00', 1, 4, 4, NULL),
(5, 'test5', 1976, 5, '00:55:00', 2, 1, 6, NULL);
