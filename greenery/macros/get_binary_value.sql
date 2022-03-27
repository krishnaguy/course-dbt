{% macro get_binary_value(col_value, target_val) %}
MAX( CASE WHEN {{ col_value }} = '{{ target_val }}' THEN 1 ELSE 0 END )
{% endmacro %}    