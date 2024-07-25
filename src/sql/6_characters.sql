CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
    actor_id INTEGER,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (actor_id) REFERENCES persons(id)
);

INSERT INTO characters (name, description, role, actor_id) VALUES
('Hero', 'A brave hero who saves the world.', 'leading', 1),
('Villain', 'An evil villain who causes trouble.', 'leading', 2),
('Sidekick', 'A helpful sidekick to the hero.', 'supporting', 3),
('Mysterious Figure', NULL, 'supporting', 4),
('Enigmatic Stranger', NULL, 'supporting', 5),
('Masked Avenger', NULL, 'leading', 6),
('Silent Guardian', NULL, 'supporting', 7),
(NULL, NULL, 'background', NULL),
(NULL, NULL, 'background', NULL),
(NULL, NULL, 'background', NULL);