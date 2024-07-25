WITH movie_info AS (
    SELECT 
        m.id movie_id,
        m.title movie_title,
        m.release_date movie_release_date,
        m.duration movie_duration,
        m.description movie_description,
        m.poster_id movie_poster_id,
        d.id director_id,
        d.first_name director_first_name,
        d.last_name director_last_name,
        f."URL" director_photo_url
    FROM movies m
    LEFT JOIN persons d ON m.director_id = d.id
    LEFT JOIN files f ON d.id = f.id
    WHERE m.id = 1
),
poster_info AS (
    SELECT 
        f.id file_id,
        f."URL" file_url,
        f."MIME type" file_mime_type
    FROM files f
    JOIN movie_info mi ON f.id = mi.movie_poster_id
),
director_info AS (
    SELECT 
        p.id person_id,
        p.first_name person_first_name,
        p.last_name person_last_name,
        f."URL" person_photo_url
    FROM persons p
    LEFT JOIN files f ON p.id = f.id
    JOIN movie_info mi ON p.id = mi.director_id
),
actors_info AS (
    SELECT 
        mc.movie_id,
        c.id character_id,
        p.id actor_id,
        p.first_name actor_first_name,
        p.last_name actor_last_name,
        f."URL" actor_photo_url
    FROM movie_characters mc
    JOIN characters c ON mc.character_id = c.id
    LEFT JOIN persons p ON c.actor_id = p.id
    LEFT JOIN files f ON p.id = f.id
    WHERE mc.movie_id = 1
),
genres_info AS (
    SELECT 
        mg.movie_id,
        g.id genre_id,
        g.name genre_name
    FROM movie_genres mg
    JOIN genres g ON mg.genre_id = g.id
    WHERE mg.movie_id = 1
)
SELECT
    mi.movie_id "ID",
    mi.movie_title "Title",
    mi.movie_release_date "Release date",
    mi.movie_duration "Duration",
    mi.movie_description "Description",
    json_build_object(
        'ID', poster_info.file_id,
        'URL', poster_info.file_url,
        'MIME_Type', poster_info.file_mime_type
    ) AS "Poster",
    json_build_object(
        'ID', director_info.person_id,
        'First_Name', director_info.person_first_name,
        'Last_Name', director_info.person_last_name,
        'Photo', json_build_object(
            'URL', director_info.person_photo_url
        )
    ) AS "Director",
    json_agg(json_build_object(
        'ID', ai.actor_id,
        'First_Name', ai.actor_first_name,
        'Last_Name', ai.actor_last_name,
        'Photo', json_build_object(
            'URL', ai.actor_photo_url
        )
    )) AS "Actors",
    json_agg(json_build_object(
        'ID', gi.genre_id,
        'Name', gi.genre_name
    )) AS "Genres"
FROM movie_info mi
LEFT JOIN poster_info ON mi.movie_poster_id = poster_info.file_id
LEFT JOIN director_info ON mi.director_id = director_info.person_id
LEFT JOIN actors_info ai ON mi.movie_id = ai.movie_id
LEFT JOIN genres_info gi ON mi.movie_id = gi.movie_id
GROUP BY 
    mi.movie_id, mi.movie_title, mi.movie_release_date, mi.movie_duration, mi.movie_description,
    poster_info.file_id, poster_info.file_url, poster_info.file_mime_type,
    director_info.person_id, director_info.person_first_name, director_info.person_last_name, director_info.person_photo_url;