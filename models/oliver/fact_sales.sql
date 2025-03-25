{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
) }}

SELECT
    c.cust_key,
    e.employee_key,
    d.date_key,
    p.product_key,
    s.store_key,
    l.quantity,
    l.unit_price,
    o.total_amount
FROM {{ source('oliver_landing', 'orders') }} o
INNER JOIN {{ source('oliver_landing', 'orderline') }} l ON o.order_id = l.order_id
INNER JOIN {{ ref('oliver_dim_customer') }} c ON c.customer_id = o.customer_id
INNER JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_id = o.employee_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.date_day = o.order_date
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.product_id = l.product_id
INNER JOIN {{ ref('oliver_dim_store') }} s ON s.store_id = o.store_id
