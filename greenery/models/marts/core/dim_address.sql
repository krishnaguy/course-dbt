with stg_addresses as (
    SELECT
    *
    FROM {{ ref("stg_addresses") }}
)
SELECT
address_id
, address
, zipcode
, state
, country
FROM stg_addresses