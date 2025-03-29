{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['customerid']) }} as customerkey,
customerid,
customerfname AS custfirstname,
customerlname AS custlastname,
customerbday AS custbirthday,
customerphone AS custphonenumber
FROM {{ source('samssubs_landing2', 'customer') }}