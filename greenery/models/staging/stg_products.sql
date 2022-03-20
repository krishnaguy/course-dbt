SELECT
product_id
, name 
, price
, inventory
FROM {{ source('raw_greenery', 'products')}}