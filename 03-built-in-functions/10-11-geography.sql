-- problem 10
SELECT country_name, iso_code FROM countries
WHERE LENGTH(country_name) - LENGTH(REPLACE(LOWER(country_name), 'a', '')) >= 3 
ORDER BY iso_code;

-- problem 11
SELECT peak_name, river_name, LOWER(CONCAT(SUBSTRING(peak_name, 1, LENGTH(peak_name) - 1), river_name)) AS mix
FROM peaks, rivers
WHERE RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY mix;
