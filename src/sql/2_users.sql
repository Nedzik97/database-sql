CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    avatar INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (avatar) REFERENCES files(id)
);

INSERT INTO users (username, first_name, last_name, email, password, avatar) VALUES
('john_doe', 'John', 'Doe', 'john.doe@example.com', 'password123', 3),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', 'securepass456', 2), 
('alex_jones', 'Alex', 'Jones', 'alex.jones@example.com', 'mypassword789', 1),
('emily_davis', 'Emily', 'Davis', 'emily.davis@example.com', 'password101112', 5),
('michael_brown', 'Michael', 'Brown', 'michael.brown@example.com', 'password131415', 4),
('susan_clark', 'Susan', 'Clark', 'susan.clark@example.com', 'pass1234', 6),
('david_martin', 'David', 'Martin', 'david.martin@example.com', 'password5678', 7),
('lisa_white', 'Lisa', 'White', 'lisa.white@example.com', 'mypassword91011', 8),
('robert_wilson', 'Robert', 'Wilson', 'robert.wilson@example.com', 'securepass1213', 9),
('mary_johnson', 'Mary', 'Johnson', 'mary.johnson@example.com', 'password1415', 10);