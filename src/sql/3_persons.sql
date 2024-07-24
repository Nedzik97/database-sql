CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender VARCHAR(10),
    country_of_origin VARCHAR(100)
);

INSERT INTO persons (first_name, last_name, biography, date_of_birth, gender, country_of_origin) VALUES
('Emma', 'Watson', 'Emma Watson is a British actress and activist known for her role as Hermione Granger in the Harry Potter series...', '1990-04-15', 'Female', 'UK'),
('Chris', 'Hemsworth', 'Chris Hemsworth is an Australian actor famous for his portrayal of Thor in the Marvel Cinematic Universe...', '1983-08-11', 'Male', 'Australia'),
('Scarlett', 'Johansson', 'Scarlett Johansson is an American actress known for her work in films such as Lost in Translation and the Avengers series...', '1984-11-22', 'Female', 'USA'),
('Tom', 'Hiddleston', 'Tom Hiddleston is a British actor recognized for his role as Loki in the Marvel Cinematic Universe...', '1981-02-09', 'Male', 'UK'),
('Zendaya', 'Coleman', 'Zendaya Coleman is an American actress and singer known for her roles in Euphoria and Spider-Man: Homecoming...', '1996-09-01', 'Female', 'USA');
