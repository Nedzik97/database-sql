SELECT
    m.id movie_id,
    m.title movie_title, 
    COUNT(mc.character_id) actors_count 
FROM
    movies m
LEFT JOIN
    movie_characters mc ON m.id = mc.movie_id
WHERE
     release_date BETWEEN CURRENT_DATE - INTERVAL '5 years' AND CURRENT_DATE
GROUP BY
    m.id, m.title