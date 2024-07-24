CREATE TABLE files (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50),
    file_key VARCHAR(255) NOT NULL,
    file_url TEXT
);

INSERT INTO files (file_name, mime_type, file_key, file_url) VALUES
('user_icon_1.jpg', 'image/jpeg/1', 'keys/user_icon_1.jpg', 'https://example.com/files/user_icon_1.jpg'),
('user_icon_2.jpg', 'image/jpeg/2', 'keys/user_icon_2.jpg', 'https://example.com/files/user_icon_2.jpg'),
('user_icon_3.jpg', 'image/jpeg/3', 'keys/user_icon_3.jpg', 'https://example.com/files/user_icon_3.jpg'),
('user_icon_4.jpg', 'image/jpeg/4', 'keys/user_icon_4.jpg', 'https://example.com/files/user_icon_4.jpg'),
('user_icon_5.jpg', 'image/jpeg/5', 'keys/user_icon_5.jpg', 'https://example.com/files/user_icon_5.jpg');
