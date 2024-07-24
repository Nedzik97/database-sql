CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    avatar_file_id INTEGER,
    FOREIGN KEY (avatar_file_id) REFERENCES files(id)
);

INSERT INTO users (username, first_name, last_name, email, password, avatar_file_id) VALUES
('john_doe', 'John', 'Doe', 'john.doe@example.com', 'password123', 3),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', 'securepass456', 2), 
('alex_jones', 'Alex', 'Jones', 'alex.jones@example.com', 'mypassword789', 1),
('emily_davis', 'Emily', 'Davis', 'emily.davis@example.com', 'password101112', 5),
('michael_brown', 'Michael', 'Brown', 'michael.brown@example.com', 'password131415', 4);