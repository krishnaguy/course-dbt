{% set product_event_types =get_product_events() %}
{% set order_event_types=get_order_events() %}
with product_events as (
SELECT 
 session_id
 , product_id
 {% for event in product_event_types %}
   , {{ get_binary_value('event_type', event ) }} as has_{{ event }}_event
 {% endfor %}
 from {{ ref('stg_events') }}
 where product_id is not null
 group by session_id, product_id
)
SELECT
pe.product_id
{% for event in product_event_types %}
, pe.has_{{ event }}_event
{% endfor %}
{% for event in order_event_types %}
, sess.has_{{ event }}_event
{% endfor %}
FROM product_events pe 
LEFT JOIN {{ ref('product_int_sess_evts') }} sess 
ON pe.session_id = sess.session_id