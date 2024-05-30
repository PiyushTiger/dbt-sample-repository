{% for col in adapter.get_columns_in_relation(ref('sellers_sales')) %}
update {{ ref('sellers_sales') }}
SET QTYSOLD = 10
Where salesid = 2
{% endfor %}
