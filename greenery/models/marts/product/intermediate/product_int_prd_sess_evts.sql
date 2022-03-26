with product_events as (
SELECT 
 session_id
 , product_id
 , MAX( CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END ) as has_page_view
 , MAX( CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END ) as has_add_to_cart
 from {{ ref('stg_events') }}
 where product_id is not null
 group by session_id, product_id
)
SELECT
pe.product_id
, pe.has_page_view
, pe.has_add_to_cart
, sess.has_checkout
FROM product_events pe 
LEFT JOIN {{ ref('product_int_sess_evts') }} sess 
ON pe.session_id = sess.session_id