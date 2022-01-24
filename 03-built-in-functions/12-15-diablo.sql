-- problem 12
SELECT name, DATE_FORMAT(start, '%Y-%m-%d') AS start
FROM games
WHERE YEAR(start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;

-- problem 13

SELECT user_name, SUBSTRING(email, POSITION('@' IN email) + 1, LENGTH(email)) AS email_provider
FROM users
ORDER BY email_provider, user_name;

-- problem 14
SELECT user_name, ip_address
FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

-- problem 15
SELECT name,
IF(HOUR(start) >= 0 AND HOUR(start) < 12, 'Morning', IF(HOUR(start) < 18, 'Afternoon', 'Evening')) AS part_of_day,
IF(duration <= 3, 'Extra Short', IF(duration <= 6, 'Short', IF(duration <= 10, 'Long', 'Extra Long'))) AS duration
FROM games;


