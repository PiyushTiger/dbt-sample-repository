{% set query %}
SELECT pricepaid, listid, sellerid, commission  from {{ ref('sellers_sales') }} where salesid = 2
{% endset %}
{% set results = run_query(query) %}
{{ print(VAR_RCD_TYP) }}
{{ print(VAR_ROW_XPTN_DT) }}
{{ print(VAR_RCD_ACTN_TYP) }}
{{ print(VAR_ROW_STAT) }}
