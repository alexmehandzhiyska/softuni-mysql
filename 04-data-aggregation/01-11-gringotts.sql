-- problem 01
SELECT COUNT(id) AS `count` FROM wizzard_deposits;

-- problem 02
SELECT MAX(magic_wand_size) AS longest_magic_wand FROM wizzard_deposits;

-- problem 03
SELECT deposit_group, MAX(magic_wand_size) AS longest_magic_wand
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand ASC, deposit_group ASC;

-- problem 04
SELECT deposit_group 
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size)
LIMIT 1;

-- problem 05
SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum ASC;

-- problem 06
SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group ASC;	

-- problem 07
SELECT deposit_group, SUM(deposit_amount) AS total_sum
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;

-- problem 08
SELECT deposit_group, magic_wand_creator, MIN(deposit_charge)
FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator ASC, deposit_group ASC;

-- problem 09
SELECT
	CASE
		WHEN age >= 0 AND age <= 10 THEN '[0-10]'
        WHEN age <= 20 THEN '[11-20]'
        WHEN age <= 30 THEN '[21-30]'
		WHEN age <= 40 THEN '[31-40]'
        WHEN age <= 50 THEN '[41-50]'
        WHEN age <= 60 THEN '[51-60]'
        ELSE '[61+]' END 
        AS age_group,
    COUNT(*) AS 'wizard_count'
FROM wizzard_deposits
GROUP BY age_group
ORDER BY age_group ASC;

-- problem 10
SELECT LEFT(first_name, 1) AS first_letter
FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter ASC;

-- problem 11
SELECT deposit_group, is_deposit_expired, AVG(deposit_interest) AS average_interest
FROM wizzard_deposits
WHERE deposit_start_date > '1985/01/01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired ASC;
