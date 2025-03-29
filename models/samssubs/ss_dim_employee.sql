{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}


select
{{ dbt_utils.generate_surrogate_key(['employeeid']) }} as employeekey,
employeeid,
employeefname AS empfirstname,
employeelname AS emplastname,
employeebday AS empbirthday
FROM {{ source('samssubs_landing2', 'employee') }}