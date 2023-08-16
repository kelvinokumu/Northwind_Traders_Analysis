WITH MonthlyProductSales AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        p.product_name,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS monthly_revenue
    FROM
        orders o
    JOIN
        order_details od ON o.order_id = od.order_id
    JOIN
        products p ON od.product_id = p.product_id
    GROUP BY
        month, p.product_name
),
RankedProductsPerMonth AS (
    SELECT
        month,
        product_name,
        monthly_revenue,
        RANK() OVER(PARTITION BY month ORDER BY monthly_revenue DESC) AS product_rank
    FROM
        MonthlyProductSales
)
SELECT
    r.month,
    r.product_name AS top_product,
    r.monthly_revenue
FROM
    RankedProductsPerMonth r
WHERE
    r.product_rank = 1
ORDER BY
    r.month, r.monthly_revenue DESC;
