CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    avatar INTEGER,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (avatar) REFERENCES files(id)
);

INSERT INTO directors (first_name, last_name, avatar) VALUES
('Peter', 'Jackson', 17),
('Ridley', 'Scott', 11),
('Guillermo', 'del Toro', 19),
('James', 'Cameron', 13),
('Steven', 'Spielberg', 20),
('Christopher', 'Nolan', 12),
('Quentin', 'Tarantino', 14),
('Martin', 'Scorsese', 18),
('David', 'Fincher', 16),
('Francis', 'Ford Coppola', 15);