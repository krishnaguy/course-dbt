SELECT
address_id
, address
, zipcode
, state
, country
from {{ source('raw_greenery',  'addresses') }}