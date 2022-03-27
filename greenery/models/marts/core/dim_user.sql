with stg_users as (
    SELECT
    *
    from {{ ref("stg_users")}}
)
SELECT
user_guid
, first_name
, last_name
, email as email
, phone_number
, created_at
, updated_at
, address_id
from stg_users