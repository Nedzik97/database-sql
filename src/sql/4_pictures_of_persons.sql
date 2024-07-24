CREATE TABLE pictures_of_persons (
    id SERIAL PRIMARY KEY,
    photo_url TEXT NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    person_id INTEGER NOT NULL, 
    FOREIGN KEY (person_id) REFERENCES persons(id)
);

INSERT INTO pictures_of_persons (photo_url, is_primary, person_id) VALUES
('https://example.com/photos/emma_watson_1.jpg', TRUE, 1),
('https://example.com/photos/emma_watson_2.jpg', FALSE, 1),
('https://example.com/photos/emma_watson_3.jpg', FALSE, 1),
('https://example.com/photos/chris_hemsworth_1.jpg', TRUE, 2),
('https://example.com/photos/chris_hemsworth_2.jpg', FALSE, 2),
('https://example.com/photos/chris_hemsworth_3.jpg', FALSE, 2),
('https://example.com/photos/scarlett_johansson_1.jpg', TRUE, 3),
('https://example.com/photos/scarlett_johansson_2.jpg', FALSE, 3),
('https://example.com/photos/scarlett_johansson_3.jpg', FALSE, 3),
('https://example.com/photos/tom_hiddleston_1.jpg', TRUE, 4),
('https://example.com/photos/tom_hiddleston_2.jpg', FALSE, 4),
('https://example.com/photos/tom_hiddleston_3.jpg', FALSE, 4),
('https://example.com/photos/zendaya_coleman_1.jpg', TRUE, 5),
('https://example.com/photos/zendaya_coleman_2.jpg', FALSE, 5),
('https://example.com/photos/zendaya_coleman_3.jpg', FALSE, 5);