
  {{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.date_day,
s.store_name,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
p.product_name,
f.quantity,
f.total_amount
FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_customer') }} c ON c.cust_key = f.cust_key
LEFT JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_key = f.employee_key
LEFT JOIN {{ ref('oliver_dim_date') }} d ON d.date_key= f.date_key
LEFT JOIN {{ ref('oliver_dim_product') }} p ON p.product_key = f.product_key
LEFT JOIN {{ ref('oliver_dim_store') }} s ON s.store_key= f.store_key
