USE geography;

-- problem 12

SELECT mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM peaks AS p
JOIN mountains AS m ON p.mountain_id = m.id
JOIN mountains_countries AS mc ON m.id = mc.mountain_id
WHERE p.elevation > 2835 AND mc.country_code = 'BG'
ORDER BY p.elevation DESC;

-- problem 13

SELECT mc.country_code, COUNT(m.mountain_range) AS mountain_range
FROM mountains AS m
JOIN mountains_countries AS mc ON m.id = mc.mountain_id
GROUP BY country_code
HAVING country_code IN ('BG', 'RU', 'US')
ORDER BY mountain_range DESC;

-- problem 14

SELECT c.country_name, r.river_name
FROM countries AS c
LEFT JOIN countries_rivers AS cr ON c.country_code = cr.country_code
LEFT JOIN rivers AS r ON cr.river_id = r.id
JOIN continents AS co ON c.continent_code = co.continent_code
WHERE co.continent_name = 'Africa'
ORDER BY c.country_name ASC
LIMIT 5;

-- problem 15

SELECT c.continent_code, c.currency_code, COUNT(*) AS 'currency_usage'
FROM countries AS c
GROUP BY c.continent_code, c.currency_code
HAVING currency_usage > 1 AND currency_usage = (
	SELECT COUNT(*) AS cn
  FROM countries AS c2
  WHERE c2.continent_code = c.continent_code
  GROUP BY c2.currency_code
  ORDER BY cn DESC
  LIMIT 1
)
ORDER BY c.continent_code , c.continent_code;

-- problem 16

SELECT COUNT(*) AS country_count
FROM (
	SELECT mc.country_code AS mc_country_code
  FROM mountains_countries AS mc
  GROUP BY mc.country_code
) AS d
RIGHT JOIN countries AS c ON c.country_code = d.mc_country_code
WHERE d.mc_country_code IS NULL;

-- problem 17

SELECT c.country_name, MAX(p.elevation) AS highest_peak_elevation, MAX(r.length) AS longest_river_length
FROM countries AS c
JOIN mountains_countries AS mc ON c.country_code = mc.country_code
JOIN peaks AS p ON mc.mountain_id = p.mountain_id
JOIN countries_rivers AS cr ON c.country_code = cr.country_code
JOIN rivers AS r ON cr.river_id = r.id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC , longest_river_length DESC , c.country_name
LIMIT 5;

