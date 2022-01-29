-- problem 12
SELECT department_id, MIN(salary) AS minimum_salary
FROM employees
WHERE department_id IN (2, 5, 7) AND hire_date > '2000/01/01'
GROUP BY department_id;

-- problem 13
CREATE TABLE new_table AS 
SELECT * FROM employees 
WHERE salary > 30000;

DELETE FROM new_table
WHERE manager_id = 42;

UPDATE new_table
SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, AVG(salary) AS avg_salary
FROM new_table
GROUP BY department_id
ORDER BY department_id;

-- problem 14
SELECT department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id
HAVING max_salary < 30000 OR max_salary > 70000
ORDER BY department_id;

-- problem 15
SELECT COUNT(salary)
FROM employees
WHERE manager_id IS NULL;

-- problem 16
SELECT 
	department_id,
	(SELECT DISTINCT salary 
    FROM employees AS e2
    WHERE e1.department_id = e2.department_id
    ORDER BY salary DESC
    LIMIT 2, 1) AS third_highest_salary
FROM employees AS e1
GROUP BY department_id
HAVING third_highest_salary IS NOT NULL
ORDER BY department_id ASC;

-- problem 17
SELECT first_name, last_name, department_id FROM employees AS e1
WHERE salary > (SELECT AVG(salary) FROM employees AS e2 WHERE e1.department_id = e2.department_id)
ORDER BY department_id, employee_id
LIMIT 10;

-- problem 18
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY department_id;
