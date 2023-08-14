-- customers per country 
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

-- Most common contact titles
SELECT contact_title, COUNT(*) AS title_count
FROM customers
GROUP BY contact_title
ORDER BY title_count DESC;

-- Employees by title
SELECT title, COUNT(*) AS employee_count
FROM employees
GROUP BY title
ORDER BY employee_count DESC;

-- Calculate total sales per product
SELECT product_id, SUM(unit_price * quantity * (1 - discount)) AS total_sales
FROM order_details
GROUP BY product_id
ORDER BY total_sales DESC;

-- Identify most frequently used discounts
SELECT discount, COUNT(*) AS discount_count
FROM order_details
GROUP BY discount
ORDER BY discount_count DESC;

-- Calculate order processing time
SELECT order_id, order_date, shipped_date, (shipped_date - order_date) AS processing_time
FROM orders
ORDER BY processing_time DESC;

-- Identify most used shippers
SELECT shipper_id, COUNT(*) AS order_count
FROM orders
GROUP BY shipper_id
ORDER BY order_count DESC;

-- Identify products with the highest unit prices
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- Count products by category
SELECT category_id, COUNT(*) AS product_count
FROM products
GROUP BY category_id
ORDER BY product_count DESC;

-- Identify the number of orders handled by each shipper
SELECT company_name, COUNT(*) AS order_count
FROM shippers
INNER JOIN orders ON shippers.shipper_id = orders.shipper_id
GROUP BY company_name
ORDER BY order_count DESC;

-- Calculate the average delivery time for each shipper
SELECT company_name, AVG(shipped_date - order_date) AS avg_delivery_time
FROM shippers
INNER JOIN orders ON shippers.shipper_id = orders.shipper_id
GROUP BY company_name;

-- Join Customers and Orders tables to analyze customer behavior
SELECT c.customer_id, c.company_name, COUNT(o.order_id) AS order_count, AVG(o.freight) AS avg_freight
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.company_name
ORDER BY order_count DESC;

-- -- Join Orders and Order Details tables to calculate total revenue per order
SELECT o.order_id, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id;

-- -- Join Employees and Orders tables to analyze order distribution by employees
SELECT e.employee_name, COUNT(o.order_id) AS order_count
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.employee_name
ORDER BY order_count DESC;

SELECT orders.order_id, customers.company_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
