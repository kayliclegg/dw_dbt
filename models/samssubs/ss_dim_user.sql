{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['user_email']) }} as userkey,
user_email as useremail
FROM {{ source('samssubs_landing', 'web_traffic_events') }}