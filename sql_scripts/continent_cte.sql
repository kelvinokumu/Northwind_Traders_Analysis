-- Group customers based on continents from the country column
SELECT DISTINCT country
FROM customers;

WITH continent_mapping AS (
    SELECT
        country,
        CASE
            WHEN country IN ('Argentina', 'Brazil', 'Venezuela') THEN 'South America'
            WHEN country IN ('Spain', 'Italy', 'Switzerland', 'Belgium', 'Norway', 'Sweden', 'France', 'Austria', 'Poland', 'Germany', 'Denmark', 'Portugal', 'UK', 'Ireland', 'Finland') THEN 'Europe'
            WHEN country IN ('USA', 'Canada','Mexico') THEN 'North America'
        END AS continent
    FROM
        customers
)
-- SELECT c.country, cm.continent
-- FROM customers c
-- JOIN continent_mapping cm ON c.country = cm.country;

SELECT cm.continent, COUNT(c.*)
FROM customers c
JOIN continent_mapping cm ON c.country = cm.country
GROUP BY continent;
