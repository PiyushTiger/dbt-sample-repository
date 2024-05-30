{{ config(
  materialized='table',
  post_hook = "{{ update_parameters('last_sale_time', extract_param_values('last_sale_time')) }}"
) }}

{%set param_value =  extract_param_values('last_sale_time') %}

SELECT *
FROM test.sellers_sales
WHERE saletime = '{{ param_value }}'
