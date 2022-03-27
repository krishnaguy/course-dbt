{% set event_types=get_order_events() %}
select
  session_id
  {% for event in event_types %}
  , {{ get_binary_value('event_type', event) }} as has_{{ event }}_event
  {% endfor %}
  from {{ ref("stg_events") }}
  group by session_id