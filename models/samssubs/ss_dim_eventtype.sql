{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['event_name']) }} as eventtypekey,
event_name as eventname
FROM {{ source('samssubs_landing', 'web_traffic_events') }}