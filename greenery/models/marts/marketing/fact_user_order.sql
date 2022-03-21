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
, order_adjustments as (
    SELECT
    *
    FROM {{ ref("core_int_order_promos")}}
)
SELECT
u.user_guid as user_guid
, u.created_at as created_at
, sum(CASE WHEN o.order_id IS NOT NULL THEN o.order_cost ELSE 0 END) as product_cost
, sum(CASE WHEN o.order_id IS NOT NULL THEN o.shipping_cost ELSE 0 END) as shipping_cost
, sum(CASE WHEN o.order_id IS NOT NULL THEN o.order_total ELSE 0 END ) as order_cost
, sum(CASE WHEN oa.order_id IS NOT NULL THEN oa.total_discount ELSE 0 END ) as discounts
, SUM(CASE WHEN o.order_id IS NOT NULL THEN 1 ELSE 0 END ) as num_orders
, sum( CASE when o.status = 'delivered' THEN 1 else 0 END ) as num_delivered
, SUM( CASE when o.status = 'preparing' THEN 1 else 0 END ) as num_preparing
, SUM( CASE WHEN o.status = 'shipped'  THEN 1 else 0 END ) as num_shipped
FROM users u 
LEFT JOIN orders o on o.user_id = u.user_guid
LEFT JOIN order_adjustments oa on oa.order_id = o.order_id
GROUP BY u.user_guid, u.created_at