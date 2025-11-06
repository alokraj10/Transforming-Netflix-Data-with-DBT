{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
    user_id,
    movie_id,
    rating AS ratings,  -- Added comma and alias
    rating_timestamp
FROM src_ratings
WHERE rating IS NOT NULL  -- Changed from 'ratings' to 'rating'

{% if is_incremental() %}
    AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})  -- Fixed extra parenthesis
{% endif %}