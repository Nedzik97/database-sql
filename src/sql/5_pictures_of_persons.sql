CREATE TABLE pictures_of_persons (
    id SERIAL PRIMARY KEY,
    photo_url TEXT NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    person_id INTEGER NOT NULL,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES persons(id)
);

INSERT INTO pictures_of_persons (photo_url, is_primary, person_id) VALUES
('https://example.com/photos/michael_fassbender_1.jpg', TRUE, 1),
('https://example.com/photos/michael_fassbender_2.jpg', FALSE, 1),
('https://example.com/photos/michael_fassbender_3.jpg', FALSE, 1),
('https://example.com/photos/natalie_portman_1.jpg', TRUE, 2),
('https://example.com/photos/natalie_portman_2.jpg', FALSE, 2),
('https://example.com/photos/natalie_portman_3.jpg', FALSE, 2),
('https://example.com/photos/leonardo_dicaprio_1.jpg', TRUE, 3),
('https://example.com/photos/leonardo_dicaprio_2.jpg', FALSE, 3),
('https://example.com/photos/leonardo_dicaprio_3.jpg', FALSE, 3),
('https://example.com/photos/penelope_cruz_1.jpg', TRUE, 4),
('https://example.com/photos/penelope_cruz_2.jpg', FALSE, 4),
('https://example.com/photos/penelope_cruz_3.jpg', FALSE, 4),
('https://example.com/photos/javier_bardem_1.jpg', TRUE, 5),
('https://example.com/photos/javier_bardem_2.jpg', FALSE, 5),
('https://example.com/photos/javier_bardem_3.jpg', FALSE, 5),
('https://example.com/photos/charlize_theron_1.jpg', TRUE, 6),
('https://example.com/photos/charlize_theron_2.jpg', FALSE, 6),
('https://example.com/photos/charlize_theron_3.jpg', FALSE, 6),
('https://example.com/photos/denzel_washington_1.jpg', TRUE, 7),
('https://example.com/photos/denzel_washington_2.jpg', FALSE, 7),
('https://example.com/photos/denzel_washington_3.jpg', FALSE, 7),
('https://example.com/photos/alicia_vikander_1.jpg', TRUE, 8),
('https://example.com/photos/alicia_vikander_2.jpg', FALSE, 8),
('https://example.com/photos/alicia_vikander_3.jpg', FALSE, 8),
('https://example.com/photos/rami_malek_1.jpg', TRUE, 9),
('https://example.com/photos/rami_malek_2.jpg', FALSE, 9),
('https://example.com/photos/rami_malek_3.jpg', FALSE, 9),
('https://example.com/photos/saoirse_ronan_1.jpg', TRUE, 10),
('https://example.com/photos/saoirse_ronan_2.jpg', FALSE, 10),
('https://example.com/photos/saoirse_ronan_3.jpg', FALSE, 10);