SELECT
user_id as user_guid
, first_name
, last_name
, email
, phone_number
, created_at
, updated_at
, address_id
from {{ source( 'raw_greenery', 'users') }}