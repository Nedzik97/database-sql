CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO countries (name) VALUES
('New Zealand'),
('USA'),
('Mexico'),
('UK'),
('Canada'),
('Australia'),
('France'),
('Germany'),
('Italy'),
('Japan');