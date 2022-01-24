-- problem 01
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'Sa%';

-- problem 02
SELECT first_name, last_name FROM employees WHERE last_name LIKE '%ei%';

-- problem 03
SELECT first_name 
FROM employees
WHERE (department_id = 3 OR department_id = 10) AND (YEAR(hire_date) >= 1995 AND YEAR(HIRE_DATE) <= 2005) 
ORDER BY employee_id;

-- problem 04
-- SELECT first_name, last_name FROM employees WHERE job_title NOT LIKE '%engineer%' ORDER BY employee_id;

-- problem 05
SELECT name FROM towns WHERE LENGTH(name) = 5 OR LENGTH(name) = 6 ORDER BY name;

-- problem 06
SELECT town_id, name FROM towns 
WHERE LEFT(name, 1) IN ('M', 'K', 'B', 'E')
ORDER BY name;

-- problem 07
SELECT town_id, name FROM towns 
WHERE LEFT(name, 1) NOT IN ('R', 'B', 'D')
ORDER BY name;

-- problem 08
CREATE VIEW v_employees_hired_after_2000
AS SELECT first_name, last_name FROM employees WHERE YEAR(hire_date) > 2000;

SELECT * FROM v_employees_hired_after_2000;

-- problem 09
SELECT first_name, last_name FROM employees WHERE LENGTH(last_name) = 5;
