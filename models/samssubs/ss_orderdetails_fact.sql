{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    c.customerkey,
    e.employeekey,
    d.datekey,
    p.productkey,
    s.storekey,
    od.orderlineqty,
    od.orderlineprice,
    od.pointsearned,
    o.ordertotal
FROM {{ source('samssubs_landing2', '"ORDER"') }} o
INNER JOIN {{ source('samssubs_landing2', 'orderdetails') }} od ON o.ordernumber = od.ordernumber
INNER JOIN {{ source('samssubs_landing2', 'employee') }} em ON em.employeeid = o.employeeid
INNER JOIN {{ ref('ss_dim_customer') }} c ON c.customerid = o.customerid
INNER JOIN {{ ref('ss_dim_employee') }} e ON e.employeeid = o.employeeid
INNER JOIN {{ ref('ss_dim_date') }} d ON d.date = o.orderdate
INNER JOIN {{ ref('ss_dim_product') }} p ON p.productid = od.productid
INNER JOIN {{ ref('ss_dim_store') }} s ON s.storeid = em.storeid