SELECT
promo_id
, discount
, status
FROM {{ source('raw_greenery', 'promos')}}