SELECT
order_id
, product_id
, quantity
FROM {{ source('raw_greenery', 'order_items')}}