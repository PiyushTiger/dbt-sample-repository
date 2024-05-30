-- joins two tables, renaming or droping columns from the second table that are not non-unique

{%- macro join_tables(ref1, ref2, id1, id2, join_type) -%}

    {%- set columns1 = adapter.get_columns_in_relation(ref1) -%}
    {%- set columns2 = adapter.get_columns_in_relation(ref2) -%}
    {%- set unique_cols = [] -%}
    -- store the columns unique to ref2
    {% for col in columns2 %}
        {% if col not in  columns1 %}
            {%- set _ = unique_cols.append(col) -%}
        {% endif %}
    {% endfor %}

    -- select all columns from ref1 and unique columns from ref2
    select
    {% for col in columns1 %}
        table1.{{col.name}} as {{col.name}},
    {% endfor %}
    {% for col in unique_cols %}
        {% if not loop.last %}
                table2.{{col.name}} as {{col.name}},
        {% else %}
                table2.{{col.name}} as {{col.name}}
        {% endif %}
    {% endfor %}
    from
    {{ ref1 }} as table1
    {{ join_type }}
    {{ ref2 }} as table2
        on table1.{{ id1 }} = table2.{{ id2 }}
{%- endmacro -%}

