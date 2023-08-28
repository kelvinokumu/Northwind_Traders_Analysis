SELECT
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    shipper_id,
    freight,
    CASE
        WHEN shipped_date IS NULL THEN 'Not Shipped'
        ELSE 'Shipped'
    END AS shippingStatus
FROM
    orders;


SELECT
    CASE
        WHEN shipped_date IS NULL THEN 'Not Shipped'
        ELSE 'Shipped'
    END AS shippingStatus,
    COUNT(*) AS orderCount
FROM
    orders
GROUP BY
    shippingStatus;
