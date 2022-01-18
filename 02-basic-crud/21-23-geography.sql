-- problem 21
SELECT peak_name FROM peaks ORDER BY peak_name;

-- problem 22

SELECT country_name, population FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC, country_name
LIMIT 30;

-- problem 23
SELECT country_name, country_code, IF(currency_code = 'EUR', 'Euro', 'Not Euro')
FROM countries
ORDER BY country_name;
