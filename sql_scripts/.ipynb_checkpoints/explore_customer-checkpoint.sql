
-- ORDER BY contact_name
-- LIMIT 10;

SELECT company_name, contact_name, contact_title
FROM customers;

-- SELECT company_name, contact_name, contact_title
-- FROM customers
-- WHERE contact_title = 'Sales Representative';

SELECT COUNT(*)
FROM customers
WHERE contact_title = 'Marketing Manager';

SELECT city, COUNT(*) AS count_cust
FROM customers
GROUP BY city
ORDER BY count_cust DESC;

SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

select company_name, contact_title 
FROM customers 
where contact_title IN ('Marketing Manager', 'Owner');

SELECT contact_title, COUNT(*) AS c_count
FROM customers
GROUP BY contact_title
ORDER BY c_count DESC;


