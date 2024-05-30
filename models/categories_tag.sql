{{ config(
    tags=["dim"]
) }}

select * from {{ ref('dim_categories') }}
