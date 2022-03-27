{% macro get_product_events() %}
{% set query %}
SELECT
DISTINCT event_type
FROM {{ ref('stg_events') }}
WHERE product_id is not null 
order by 1
{% endset %}

{% set results = run_query(query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}

{% macro get_order_events() %}
{% set query %}
SELECT
DISTINCT event_type
FROM {{ ref('stg_events') }}
WHERE order_id is not null 
order by 1
{% endset %}

{% set results = run_query(query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}