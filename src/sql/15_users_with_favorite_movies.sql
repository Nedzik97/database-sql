SELECT
    u.id user_id,
    u.username username,
    ARRAY_AGG(f.movie_id) favorite_movie_ids
FROM
    users u
LEFT JOIN
    favorite_movies f ON u.id = f.user_id
GROUP BY
    u.id, u.username