-- problem 1

SELECT * FROM departments;

-- problem 2

SELECT name FROM departments;

-- problem 3

SELECT first_name, last_name, salary FROM employees;

-- problem 4

SELECT first_name, middle_name, last_name FROM employees;

-- problem 5

SELECT CONCAT(first_name, '.', last_name, '@softuni.bg')
AS 'full_email_address'
FROM employees;

-- problem 6

SELECT DISTINCT salary FROM employees;

-- problem 7

SELECT * FROM employees WHERE job_title = 'Sales Representative';

-- problem 8

SELECT first_name, last_name, job_title FROM employees WHERE salary >= 20000 AND salary <= 30000;

-- problem 9

SELECT CONCAT(first_name, ' ', middle_name, ' ', last_name) FROM employees WHERE salary IN (25000, 14000, 12500, 23600);

-- problem 10

SELECT first_name, last_name FROM employees WHERE manager_id IS NULL;

-- problem 11

SELECT first_name, last_name, salary FROM employees WHERE salary > 50000 ORDER BY salary DESC;

-- problem 12

SELECT first_name, last_name FROM employees ORDER BY salary DESC LIMIT 5;

-- problem 13

SELECT first_name, last_name FROM employees WHERE department_id != 4;

-- problem 14

SELECT * FROM employees ORDER BY salary DESC, first_name, last_name DESC, middle_name;

-- problem 15

CREATE VIEW v_employees_salaries AS
SELECT first_name, last_name, salary
FROM employees;

-- problem 16

CREATE VIEW v_employees_job_titles AS
SELECT CONCAT(first_name, ' ', IF(middle_name IS NULL, '', CONCAT(middle_name, ' ')), last_name), job_title
FROM employees;

-- problem 17

SELECT DISTINCT job_title FROM employees ORDER BY job_title;

-- problem 18

SELECT * FROM projects 
ORDER BY start_date, 
name LIMIT 10;

-- problem 19

SELECT first_name, last_name, hire_date FROM employees 
ORDER BY hire_date DESC 
LIMIT 7;

-- problem 20

UPDATE employees 
SET salary = salary * 1.12
WHERE department_id IN (1, 2, 4, 11);

SELECT salary FROM employees;
