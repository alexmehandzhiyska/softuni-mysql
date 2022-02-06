USE soft_uni;

-- problem 01
SELECT  employee_id, job_title, a.address_id, address_text
FROM employees AS e
JOIN addresses AS a ON e.address_id = a.address_id
ORDER BY a.address_id ASC
LIMIT 5;

-- problem 02

SELECT e.first_name, e.last_name, t.name, a.address_text
FROM employees AS e
JOIN addresses AS a ON e.address_id = a.address_id
JOIN towns AS t ON a.town_id = t.town_id
ORDER BY e.first_name ASC, e.last_name ASC
LIMIT 5;

-- problem 03

SELECT employee_id, first_name, last_name, d.name AS department_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
WHERE name = 'Sales'
ORDER BY e.employee_id DESC;

-- problem 04

SELECT employee_id, first_name, salary, d.name AS department_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
WHERE salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

-- problem 05

SELECT employee_id, first_name
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM employees_projects)
ORDER BY employee_id DESC;

SELECT e.employee_id, first_name
FROM employees AS e
LEFT JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

-- problem 06

SELECT first_name, last_name, hire_date, name AS dept_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
WHERE hire_date > '1999-01-01' AND (d.name = 'Sales' OR d.name = 'Finance')
ORDER BY hire_date ASC;

-- problem 07

SELECT e.employee_id, e.first_name, p.name AS project_name
FROM employees AS e
JOIN employees_projects AS ep ON ep.employee_id = e.employee_id
JOIN projects AS p ON ep.project_id = p.project_id
WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;

-- problem 08

SELECT e.employee_id, e.first_name, IF(YEAR(p.start_date) < 2005, p.name, NULL) AS project_name
FROM employees AS e
JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name ASC;

-- problem 09

SELECT e.employee_id, e.first_name, e.manager_id, m.first_name
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
WHERE m.employee_id IN (3, 7)
ORDER BY e.first_name ASC;

-- problem 10

SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS employee_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_name, d.name
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
JOIN departments AS d ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

-- problem 11

SELECT AVG(e.salary) AS min_average_salary
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
GROUP BY d.department_id
ORDER BY min_average_salary ASC
LIMIT 1;
