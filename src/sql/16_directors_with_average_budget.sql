SELECT
    d.id "Director ID",
    CONCAT(d.first_name, ' ', d.last_name) "Director name",
    AVG(m.budget) "Average budget"
FROM
    directors d
JOIN
    movies m ON d.id = m.director_id
GROUP BY
    d.id, d.first_name, d.last_name