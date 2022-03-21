with order_items as (
    SELECT 
    *
    FROM {{ ref("stg_order_items") }}
),
orders as (
    SELECT
    *
    FROM {{ ref("stg_orders") }}
),
promos as (
    SELECT
    *
    FROM {{ ref("stg_promos") }}
),
products as (
    SELECT
    *
    FROM {{ ref("stg_products") }} 
)
select 
oi.order_id as order_id
, sum(prd.price*oi.quantity) as total_revenue
, sum(prd.price*oi.quantity*pro.discount*0.01) as total_discount
, SUM( CASE  WHEN pro.discount IS NOT NULL THEN prd.price*oi.quantity - prd.price*oi.quantity*pro.discount*0.01 ELSE prd.price*oi.quantity END) as discounted_revenue
from order_items oi
left join orders o on oi.order_id = o.order_id
left join promos pro on o.promo_id = pro.promo_id
left join products prd on oi.product_id = prd.product_id
where o.promo_id is not null
group by oi.order_id
order by oi.order_id
