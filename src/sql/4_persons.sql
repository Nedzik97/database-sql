CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender VARCHAR(10),
    country INTEGER,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country) REFERENCES countries(id)
);

INSERT INTO persons (first_name, last_name, biography, date_of_birth, gender, country) VALUES
('Michael', 'Fassbender', 'Michael Fassbender is a German-Irish actor known for his roles in movies like 12 Years a Slave and X-Men.', '1977-04-02', 'Male', 1),
('Natalie', 'Portman', 'Natalie Portman is an American actress and filmmaker known for her roles in Black Swan and the Star Wars series.', '1981-06-09', 'Female', 2),
('Leonardo', 'DiCaprio', 'Leonardo DiCaprio is an American actor and film producer known for his roles in Titanic, Inception, and The Revenant.', '1974-11-11', 'Male', 2), 
('Penélope', 'Cruz', 'Penélope Cruz is a Spanish actress known for her work in films like Vicky Cristina Barcelona and Volver.', '1974-04-28', 'Female', 3),
('Javier', 'Bardem', 'Javier Bardem is a Spanish actor recognized for his roles in No Country for Old Men and Skyfall.', '1969-03-01', 'Male', 3),
('Charlize', 'Theron', 'Charlize Theron is a South African-American actress known for her roles in Mad Max: Fury Road and Monster.', '1975-08-07', 'Female', 4), 
('Denzel', 'Washington', 'Denzel Washington is an American actor and director known for his roles in Training Day and Malcolm X.', '1954-12-28', 'Male', 2),
('Alicia', 'Vikander', 'Alicia Vikander is a Swedish actress known for her roles in Ex Machina and The Danish Girl.', '1988-10-03', 'Female', 5),
('Rami', 'Malek', 'Rami Malek is an American actor known for his role in Bohemian Rhapsody and the TV series Mr. Robot.', '1981-05-12', 'Male', 2),
('Saoirse', 'Ronan', 'Saoirse Ronan is an Irish actress known for her performances in Lady Bird and Brooklyn.', '1994-04-12', 'Female', 6);