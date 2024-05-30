{% macro test_macro() %}

{% set query %}
        select salesid, listid, sellerid
        from {{ ref('sellers_sales') }}
{% endset %}

{% set results = run_query(query) %}
{{ print(results.rows.count()) }}

{% endmacro %}

