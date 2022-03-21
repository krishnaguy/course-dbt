with events as (

    select
    *
    FROM {{ ref("stg_events") }}
)
SELECT
year
, month
, day
, hour
, count(*) as num_events
, sum( CASE WHEN event_type = 'checkout' THEN 1 ELSE 0 END ) as num_checkouts
, sum( CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END ) as num_page_views
, sum( CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END ) as num_add_to_carts
, sum( CASE WHEN event_type = 'package_shipped' THEN 1 ELSE 0 END ) as num_packages_shipped
, COUNT( DISTINCT CASE WHEN event_type = 'checkout' THEN user_id ELSE NULL END ) as num_distinct_checkout_users
, COUNT( DISTINCT CASE WHEN event_type = 'page_view' THEN user_id ELSE NULL END ) as num_distinct_page_view_users
, COUNT( DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id ELSE NULL END ) as num_distinct_add_to_cart_users
, COUNT( DISTINCT CASE WHEN event_type = 'package_shipped' THEN user_id ELSE NULL END ) as num_distinct_package_shipped_users
, COUNT( DISTINCT user_id ) as num_distinct_users
, COUNt( DISTINCT session_id ) as num_distinct_sessions
from events
group by year, month, day, hour