CREATE TABLE favorite_movies (
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE
);

INSERT INTO favorite_movies (user_id, movie_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 5),
(3, 2),
(3, 4),
(3, 5),
(4, 3),
(5, 3),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(9, 1),
(9, 4),
(10, 2),
(10, 5),
(10, 6);