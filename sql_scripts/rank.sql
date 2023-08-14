SELECT
    c.customer_id,
    c.company_name,
    p.product_name AS top_product,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_spending
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    order_details od ON o.order_id = od.order_id
JOIN (
    SELECT
        o.customer_id,
        od.product_id,
        RANK() OVER(PARTITION BY o.customer_id ORDER BY SUM(od.quantity) DESC) AS product_rank
    FROM
        orders o
    JOIN
        order_details od ON o.order_id = od.order_id
    GROUP BY
        o.customer_id, od.product_id
) AS ranked_products ON c.customer_id = ranked_products.customer_id AND od.product_id = ranked_products.product_id
JOIN
    products p ON od.product_id = p.product_id
WHERE
    ranked_products.product_rank = 1
GROUP BY
    c.customer_id, c.company_name, p.product_name
ORDER BY
    total_spending DESC;
