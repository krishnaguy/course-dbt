SELECT
event_id
, session_id
, user_id
, event_type
, page_url
, created_at
, EXTRACT( year from created_at ) as year
, EXTRACT( month from created_at ) as month
, EXTRACT( day from created_at ) as day
, EXTRACT( hour from created_at ) as hour
, EXTRACT( minute from created_at ) as minute
, EXTRACT( second from created_at ) as seconds
FROM {{ source('raw_greenery',  'events') }}