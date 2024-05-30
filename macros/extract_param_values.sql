{# This macro collects data from a query and inserts it into a list #}

{% macro extract_param_values(query) %}
    {% set query_to_process %}
       select parameter_value from test.parameters where parameter_name = '{{ query }}'
    {% endset %}

    {% set results = run_query(query_to_process) %}

    {% if execute %}
    {% set results_list = results.columns[0][0] %}
    {% else %}
    {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}

{% endmacro %}
