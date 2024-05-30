{% snapshot target_sellers_sales %}
{{
    config(
      target_database='SQL_DBT',
      target_schema='snapshots',
      unique_key='salesid',
      strategy='check',
      check_cols='all',
    )
}}

select * from {{ ref('sellers_sales') }}

{% endsnapshot %}
