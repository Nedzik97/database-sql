```mermaid
erDiagram
    FILES {
        id SERIAL PK
        file_name VARCHAR(255)
        MIME_type VARCHAR(50)
        Key VARCHAR(255)
        URL TEXT
    }

    USERS {
        id SERIAL PK
        username VARCHAR(50)
        first_name VARCHAR(50)
        last_name VARCHAR(50)
        email VARCHAR(100)
        password VARCHAR(100)
        avatar INTEGER
    }

    COUNTRIES {
        id SERIAL PK
        name VARCHAR(150)
    }

    PERSONS {
        id SERIAL PK
        first_name VARCHAR(100)
        last_name VARCHAR(100)
        biography TEXT
        date_of_birth DATE
        gender VARCHAR(10)
        country INTEGER
    }

    PICTURES_OF_PERSONS {
        id SERIAL PK
        photo_url TEXT
        is_primary BOOLEAN
        person_id INTEGER
    }

    CHARACTERS {
        id SERIAL PK
        name VARCHAR(255)
        description TEXT
        role VARCHAR(50)
        actor_id INTEGER
    }

    GENRES {
        id SERIAL PK
        name VARCHAR(100)
    }

    DIRECTORS {
        id SERIAL PK
        first_name VARCHAR(100)
        last_name VARCHAR(100)
        avatar INTEGER
    }

    MOVIES {
        id SERIAL PK
        title VARCHAR(255)
        description TEXT
        budget DECIMAL(15)
        release_date DATE
        duration INTERVAL
        director_id INTEGER
        country_id INTEGER
        poster_id INTEGER
    }

    MOVIE_CHARACTERS {
        movie_id INTEGER
        character_id INTEGER
    }

    MOVIE_GENRES {
        movie_id INTEGER
        genre_id INTEGER
    }

    FAVORITE_MOVIES {
        user_id INTEGER
        movie_id INTEGER
    }

    USERS ||--o| FILES: "has avatar"
    PERSONS ||--o| COUNTRIES: "from"
    PICTURES_OF_PERSONS ||--o| PERSONS: "of"
    CHARACTERS ||--o| PERSONS: "acted by"
    DIRECTORS ||--o| FILES: "has avatar"
    MOVIES ||--o| DIRECTORS: "directed by"
    MOVIES ||--o| COUNTRIES: "from"
    MOVIES ||--o| FILES: "has poster"
    MOVIE_CHARACTERS ||--o| MOVIES: "includes"
    MOVIE_CHARACTERS ||--o| CHARACTERS: "features"
    MOVIE_GENRES ||--o| MOVIES: "classified as"
    MOVIE_GENRES ||--o| GENRES: "includes"
    FAVORITE_MOVIES ||--o| USERS: "favorites"
    FAVORITE_MOVIES ||--o| MOVIES: "is favorite"
