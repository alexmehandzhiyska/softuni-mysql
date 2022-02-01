-- problem 01
CREATE TABLE people (
	  person_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    passport_id INT NOT NULL UNIQUE
);

CREATE TABLE passports (
	  passport_id INT NOT NULL PRIMARY KEY,
    passport_number VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO people (person_id, first_name, salary, passport_id)
VALUES 
(1, 'Roberto', 43300.00, 102),
(2, 'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);

INSERT INTO passports (passport_id, passport_number)
VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

ALTER TABLE people
ADD CONSTRAINT PRIMARY KEY(person_id);

ALTER TABLE people
ADD CONSTRAINT fk_passport_id FOREIGN KEY (passport_id)
REFERENCES passports(passport_id);

ALTER TABLE passports
MODIFY COLUMN passport_number VARCHAR(20) NOT NULL UNIQUE;


-- problem 02
CREATE TABLE manufacturers (
	  manufacturer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    established_on DATE NOT NULL
);

CREATE TABLE models (
	  model_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO manufacturers (manufacturer_id, name, established_on)
VALUES 
(1, 'BMW', '1916-03-01'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01');

INSERT INTO models (model_id, name, manufacturer_id)
VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3);

-- problem 03
CREATE TABLE students (
	  student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE exams (
	  exam_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students_exams (
	  student_id INT NOT NULL,
    exam_id INT NOT NULL,
    PRIMARY KEY(student_id, exam_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO students (student_id, name)
VALUES
(1, 'Mila'),
(2, 'Toni'),
(3, 'Ron');

INSERT INTO exams (exam_id, name)
VALUES
(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g');

INSERT INTO students_exams (student_id, exam_id)
VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

-- problem 04
CREATE TABLE teachers (
	  teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    manager_id INT
);

INSERT INTO teachers (teacher_id, name, manager_id)
VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

ALTER TABLE teachers
ADD CONSTRAINT fk_manager_teacher FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id);

-- problem 05
CREATE DATABASE online_store;
USE online_store;

CREATE TABLE item_types (
	  item_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE items (
	  item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    item_type_id INT NOT NULL,
    FOREIGN KEY (item_type_id) REFERENCES item_types(item_type_id)
);

CREATE TABLE cities (
	  city_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE customers (
	  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthday DATE,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE orders (
	  order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
	  order_id INT NOT NULL,
    item_id INT NOT NULL,
    PRIMARY KEY (item_id, order_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- problem 06
CREATE DATABASE university;
USE university;

CREATE TABLE subjects (
	  subject_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50)
);

CREATE TABLE majors (
	  major_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE students (
	  student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(12) NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    major_id INT NOT NULL,
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE payments (
	  payment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(8, 2) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE agenda (
	  student_id INT NOT NULL,
    subject_id INT NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- problem 09
USE geography;

SELECT mountain_range, peak_name, elevation AS peak_elevation
FROM peaks JOIN mountains ON peaks.mountain_id = mountains.id
WHERE mountains.mountain_range = 'Rila'
ORDER BY peak_elevation DESC;


