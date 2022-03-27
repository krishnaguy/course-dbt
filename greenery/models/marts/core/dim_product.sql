with stg_products as (

    SELECT
    *
    FROM {{ ref("stg_products") }}
)
SELECT
product_id
, name as product_name
, price
, inventory
FROM stg_products