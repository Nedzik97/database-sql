CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget DECIMAL(15),
    release_date DATE,
    duration INTERVAL,
    director_id INTEGER,
    country_id INTEGER,
    poster_id INTEGER,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (director_id) REFERENCES directors(id),
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (poster_id) REFERENCES files(id)
);

INSERT INTO movies (title, description, budget, release_date, duration, director_id, country_id, poster_id) VALUES
('The Lost Kingdom', 'A tale of a lost kingdom and the heroes who try to restore it.', 95000000.00, '2024-11-20', '2 hours 30 minutes', 1, 7, 21),
('Middle Earth Adventure', 'An epic journey through middle earth.', 85000000.00, '2025-02-15', '2 hours 45 minutes', 1, 7, 22),
('Cyber City', 'A futuristic city with cyber enhancements and the fight for freedom.', 135000000.00, '2024-09-10', '2 hours 15 minutes', 2, 5, 23),
('Space Odyssey', 'A journey through space exploring unknown galaxies.', 145000000.00, '2025-01-20', '2 hours 40 minutes', 2, 5, 24),
('Whispering Shadows', 'A mysterious story of shadows whispering secrets in the night.', 45000000.00, '2024-03-27', '1 hour 55 minutes', 3, 8, 25),
('Dark Fantasy', 'A dark fantasy tale with supernatural elements.', 70000000.00, '2025-07-01', '2 hours 10 minutes', 3, 8, 26),
('Haunted Forest', 'A chilling story set in an enchanted forest.', 60000000.00, '2025-11-05', '1 hour 50 minutes', 3, 8, 27),
('Journey to the Depths', 'An underwater adventure exploring the deepest parts of the ocean.', 105000000.00, '2025-06-14', '2 hours 25 minutes', 4, 3, 28),
('Alien Worlds', 'Exploring alien worlds in a thrilling sci-fi adventure.', 115000000.00, '2025-09-15', '2 hours 50 minutes', 4, 3, 29),
('Deep Sea Quest', 'A quest for lost treasures in the depths of the sea.', 95000000.00, '2025-12-20', '2 hours 30 minutes', 4, 3, 30),
('Futuristic Warriors', 'A battle for survival in a dystopian future.', 110000000.00, '2026-03-10', '2 hours 20 minutes', 4, 3, NULL),
('Echoes of Time', 'A time-traveling adventure that spans different eras.', 120000000.00, '2024-05-22', '2 hours 35 minutes', 5, 6, NULL),
('The Last Crusade', 'An epic quest for a legendary artifact.', 130000000.00, '2025-04-12', '2 hours 45 minutes', 5, 6, NULL),
('The Silent Warrior', 'A story of a lone warrior fighting for justice.', 80000000.00, '2024-07-15', '2 hours 10 minutes', 6, 1, NULL),
('Mystery of the Temple', 'A historical mystery unraveling ancient secrets.', 72000000.00, '2024-08-20', '1 hour 55 minutes', 7, 2, NULL),
('Quantum Leap', 'A sci-fi adventure exploring the limits of human potential.', 90000000.00, '2025-02-10', '2 hours 30 minutes', 8, 4, NULL),
('Eternal Night', 'A thrilling adventure set in a world of darkness.', 78000000.00, '2025-05-25', '2 hours 20 minutes', 9, 5, NULL), 
('The Enigma', 'A suspenseful tale of a mysterious enigma.', 85000000.00, '2025-08-30', '2 hours 35 minutes', 10, 6, NULL),
('Chronicles of the Lost', 'A journey into a forgotten world with hidden treasures.', 88000000.00, '2025-11-10', '2 hours 15 minutes', 6, 1, NULL),
('Legend of the Phoenix', 'An epic saga of a legendary bird and its journey.', 90000000.00, '2026-01-05', '2 hours 45 minutes', 7, 2, NULL);

