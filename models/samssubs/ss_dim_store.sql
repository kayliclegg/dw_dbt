{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['storeid']) }} as storekey,
storeid,
address,
city,
state,
zip AS zipcode
FROM {{ source('samssubs_landing2', 'store') }}