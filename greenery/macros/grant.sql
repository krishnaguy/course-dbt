{% macro grant(role) %}

    {% set sql %}
      GRANT USAGE ON SCHEMA {{ target.schema }} TO GROUP {{ role }};
      GRANT SELECT ON ALL TABLES IN SCHEMA {{ target.schema }} TO GROUP {{ role }};
    {% endset %}

    {% set table = run_query(sql) %}

{% endmacro %}