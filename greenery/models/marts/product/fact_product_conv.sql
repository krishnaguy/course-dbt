WITH product_events as (
SELECT
product_id
, SUM( has_page_view_event ) as num_view_sessions 
, SUM( CASE WHEN has_checkout_event = 1 and has_add_to_cart_event = 1 THEN 1 ELSE 0 END ) as num_purchase_sessions
FROM {{ ref("product_int_prd_sess_evts") }}
GROUP BY product_id

)
SELECT
pe.product_id
, num_view_sessions
, num_purchase_sessions
, (pe.num_purchase_sessions/GREATEST(pe.num_view_sessions, CAST(1 as bigint))::numeric)::numeric(16, 2) as conversion_rate
from product_events pe
