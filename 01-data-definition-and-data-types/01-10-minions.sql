-- problem 1

CREATE TABLE minions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age INT
);

CREATE TABLE towns (
	town_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);

-- problem 2

ALTER TABLE towns CHANGE COLUMN town_id id INT;
ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY minions(town_id)
REFERENCES towns(id);

-- problem 3

INSERT INTO towns (id, name)
VALUES (1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna');

INSERT INTO minions (id, name, age, town_id)
VALUES (1, 'Kevin', 22, 1), (2, 'Bob', 15, 3), (3, 'Steward', NULL, 2);

-- problem 4

TRUNCATE TABLE minions;

-- problem 5

DROP TABLE minions;
DROP TABLE towns;

-- problem 6

CREATE TABLE people (
	id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture BLOB,
    height FLOAT(3, 2),
    weight FLOAT(5, 2),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT
);

INSERT INTO people (id, name, picture, height, weight, gender, birthdate, biography)
VALUES (1, 'Test1', NULL, 1.57, 45, 'f', '2007-01-13', 'manioka'),
(2, 'Test2', NULL, 1.85, 87, 'm', '2007-01-13', 'kiro'),
(3, 'Test3', NULL, 2.00, 120, 'm', '2007-01-13', 'manioka'),
(4, 'Test4', NULL, 1.67, 50, 'f', '2007-01-13', 'kiro'),
(5, 'Test5', NULL, 1.72, 68, 'f', '2007-01-13', 'manioka');

-- problem 7

CREATE TABLE users (
	id BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture BLOB,
    last_login_time TIMESTAMP,
    is_deleted BOOLEAN
);

INSERT INTO users (id, username, password, profile_picture, last_login_time, is_deleted)
VALUES (1, 'qvor', '123456', NULL, NULL, false),
(2, 'peyov', '123456', NULL, NULL, true),
(3, 'vaz', '123456', NULL, NULL, true),
(4, 'ivanov', '123456', NULL, NULL, false),
(5, 'dalcho', '123456', NULL, NULL, true);

-- problem 8

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY users(id, username);

-- problem 9

ALTER TABLE users
MODIFY COLUMN last_login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- problem 10 

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY users(id);

ALTER TABLE users
MODIFY COLUMN username VARCHAR(30) UNIQUE;
