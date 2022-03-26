select
  session_id
  , MAX( CASE WHEN event_type = 'checkout' THEN 1 ELSE 0 END ) as has_checkout
  from {{ ref("stg_events") }}
  group by session_id