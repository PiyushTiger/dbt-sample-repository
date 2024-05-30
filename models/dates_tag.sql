{{ config(
    tags=["dim"]
) }}

select piyush from {{ ref('dim_dates') }}
