{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['p.productid']) }} as productkey,
p.productid,
productname,
producttype,
productcost,
productcalories,
breadtype,
length 
FROM {{ source('samssubs_landing2', 'product') }} p
JOIN {{ source('samssubs_landing2', 'sandwich') }} s on p.productid = s.productid