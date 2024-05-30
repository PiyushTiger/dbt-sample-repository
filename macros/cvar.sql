{% macro cvar(var_name) -%}

    {%- 
        set all_project_vars = {
            "unit": var("unit", "day"),
            "offset": var("offset", "1"),
	    "db_schema": var("db_schema", "test"),
            "venue_name": var("venue_name", "Toyota Park")
        }
    -%}
    
    {{ return(all_project_vars[var_name]) }}

{%- endmacro %}
