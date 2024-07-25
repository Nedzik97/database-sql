SELECT
    c.id character_id,
    c.name character_name,
    COALESCE(SUM(m.budget), 0) total_budget 
FROM
    characters c
LEFT JOIN
    movie_characters mc ON c.id = mc.character_id
LEFT JOIN
    movies m ON mc.movie_id = m.id
GROUP BY
    c.id, c.name