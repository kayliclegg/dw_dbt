{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['traffic_source']) }} as trafficsourcekey,
traffic_source as trafficsource
FROM {{ source('samssubs_landing', 'web_traffic_events') }}