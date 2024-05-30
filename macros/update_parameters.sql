{% macro update_parameters(param_name, param_value) %}

	UPDATE {{ ref('parameters') }}
	SET parameter_value = dateadd(day, 1, '{{ param_value }}')
	WHERE parameter_name = '{{ param_name }}'

{% endmacro %}
