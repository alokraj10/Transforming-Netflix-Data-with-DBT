WITH serc_tags AS (
    SELECT * FROM {{ref('src_genome_tags')}}
)

SELECT
tag_id,
INITCAP(TRIM(tag)) AS tag_name  -- Removed space between TRIM and (tag)
FROM serc_tags  