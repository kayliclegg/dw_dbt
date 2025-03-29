{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
{{ dbt_utils.generate_surrogate_key(['date_day']) }} as datekey,
date_day as date,
day_of_week as day,
month_of_year as month,
quarter_of_year as quarter,
year_number as year
from cte_date