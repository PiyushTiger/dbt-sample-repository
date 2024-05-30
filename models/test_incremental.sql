{{ 
config(
    materialized='incremental',
    unique_key='salesid',
    merge_update_columns = ['COMMISSION']
)
}}

select * from {{ ref('target_view') }}

{% if is_incremental() %}

  where saletime >= (select coalesce(max(saletime), '1900-01-01') from {{ this }})

{% endif %}
