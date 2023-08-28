SELECT
    customer_id,
    company_name,
    contact_name,
    contact_title,
    city,
    country,
    CASE
        WHEN country = 'USA' THEN 'Domestic'
        ELSE 'International'
    END AS customerCategory
FROM
    customers;
	
SELECT
    CASE
        WHEN country = 'USA' THEN 'Domestic'
        ELSE 'International'
    END AS customerCategory,
    COUNT(*) AS customerCount
FROM
    customers
GROUP BY
    customerCategory;


SELECT
    customer_id,
    company_name,
    contact_name,
    contact_title,
    city,
    country,
    CASE
        WHEN contact_title = 'Owner' THEN 'High Level'
        WHEN contact_title IN ('Manager', 'Sales Manager') THEN 'Mid Level'
        ELSE 'Other'
    END AS contactLevel
FROM
    customers;
	

SELECT
    CASE
        WHEN contact_title = 'Owner' THEN 'High Level'
        WHEN contact_title IN ('Manager', 'Sales Manager') THEN 'Mid Level'
        ELSE 'Other'
    END AS contactLevel,
    COUNT(*) AS customerCount
FROM
    customers
GROUP BY
    contactLevel;

SELECT
    customer_id,
    company_name,
    contact_name,
    contact_title,
    city,
    country,
    CASE
        WHEN LENGTH(company_name) <= 10 THEN 'Short Name'
        WHEN LENGTH(company_name) > 10 AND LENGTH(company_name) <= 20 THEN 'Medium Name'
        ELSE 'Long Name'
    END AS companyNameCategory
FROM
    customers;
	
	
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.1 THEN '0-10% Discount'
        WHEN discount > 0.1 AND discount <= 0.2 THEN '11-20% Discount'
        ELSE 'More than 20% Discount'
    END AS discountRange,
    COUNT(*) AS orderCount
FROM
    order_details
GROUP BY
    discountRange;

SELECT
    CASE
        WHEN unit_price < 10 THEN 'Low Price'
        WHEN unit_price >= 10 AND unit_price < 50 THEN 'Moderate Price'
        ELSE 'High Price'
    END AS priceCategory,
    AVG(quantity) AS avgQuantity,
    AVG(unit_price * quantity * (1 - discount)) AS avgRevenue
FROM
    order_details
GROUP BY
    priceCategory;
	
	
	
SELECT
    CASE
        WHEN quantity_per_unit LIKE '%pieces%' THEN 'Pieces'
        WHEN quantity_per_unit LIKE '%dozen%' THEN 'Dozen'
        ELSE 'Other'
    END AS quantityCategory,
    AVG(unit_price) AS avgUnitPrice
FROM
    products
GROUP BY
    quantityCategory;

SELECT
    CASE
        WHEN discontinued = 1 THEN 'Discontinued'
        ELSE 'Available'
    END AS availabilityCategory,
    AVG(unit_price) AS avgUnitPrice,
	 COUNT(*) AS productCount
FROM
    products
GROUP BY
    availabilityCategory;
	