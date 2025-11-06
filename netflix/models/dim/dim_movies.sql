WITH src_movies AS (
    SELECT * FROM {{ ref('src_movies') }}
)
SELECT
    movie_id,
    INITCAP(TRIM(title)) AS movie_title,  -- Removed space between TRIM and (title)
    SPLIT(genres, '|') AS genre_array,
    genres
FROM src_movies