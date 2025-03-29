{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['page_url']) }} as pagekey,
page_url as pageurl
FROM {{ source('samssubs_landing', 'web_traffic_events') }}