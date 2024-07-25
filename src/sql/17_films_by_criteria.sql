SELECT m.title, m.description, m.budget, m.release_date, m.duration, m.director_id, m.country_id, m.poster_id
FROM movies m
JOIN movie_genres mg ON m.id = mg.movie_id
JOIN genres g ON mg.genre_id = g.id
WHERE m.country_id = 1
  AND m.release_date >= '2022-01-01'
  AND m.duration > INTERVAL '2 hours 15 minutes'
  AND g.name IN ('Action', 'Drama');