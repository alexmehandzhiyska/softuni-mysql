CREATE TABLE categories (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    daily_rate DOUBLE,
    weekly_rate DOUBLE,
    monthly_rate DOUBLE,
    weekend_rate DOUBLE
);

CREATE TABLE cars (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plate_number INT NOT NULL,
    make VARCHAR(50),
    model VARCHAR(50),
    category_id INT,
    doors INT,
    picture BLOB,
    car_condition TEXT,
    available BOOLEAN
);

CREATE TABLE employees (
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(50),
    notes TEXT
);

CREATE TABLE customers(
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    driver_licence_number INT NOT NULL,
    full_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    zip_code INT,
    notes TEXT
);

CREATE TABLE rental_orders(
	  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition TEXT,
    tank_level INT,
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DOUBLE,
    tax_rate DOUBLE,
    order_status VARCHAR(30),
    notes TEXT
);

INSERT INTO cars(id, plate_number)
VALUES (1, '1'), (2, '12'), (3, '123');

INSERT INTO categories(id, category)
VALUES (1, 'test1'), (2, 'test2'), (3, 'test3');

INSERT INTO customers(id, driver_licence_number)
VALUES (1, '1'), (2, '12'), (3, '123');

INSERT INTO employees(id, first_name, last_name)
VALUES (1, 'test1', 'test2'),(2, 'test3', 'test4'), (3, 'test5', 'test6');

INSERT INTO rental_orders(id, employee_id, customer_id, car_id)
VALUES (1, 1, 1, 1),(2, 1, 2, 2), (3, 2, 3, 3);
