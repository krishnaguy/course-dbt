with users as (
    SELECT
    *
    FROM {{ ref("dim_user") }}
)
, orders as (

    SELECT
    *
    FROM {{ ref("stg_orders") }}
)
, order_discounts as (
    SELECT 
    *
    FROM {{ ref("core_int_order_promos") }}
)
SELECT
o.order_id
, o.user_id
, o.created_at
, od.total_revenue
, od.total_discount
, od.discounted_revenue
, o.order_cost
, o.shipping_cost
, o.order_total
, o.tracking_id
, o.shipping_service
, o.status
, o.estimated_delivery_at
, o.delivered_at
, o.delivered_at - o.created_at as delivery_days
, od.order_id  IS NOT NULL as has_discounts
FROM orders o
LEFT JOIN order_discounts od on o.order_id = od.order_id
LEFT JOIN users u on o.user_id = u.user_guid
