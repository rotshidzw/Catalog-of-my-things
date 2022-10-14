CREATE DATABASE catalog_things_db;

CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY
    genre_id
    author_id
    label_id 
    publish_date DATE
    archived BOOLEAN
    publisher VARCHAR(190)
    cover_state VARCHAR(190)

    CONSTRAINT fk_books_label_id FOREIGN KEY (label_id) REFERENCES labels(id)
     
    CONSTRAINT fk_books_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
     
    CONSTRAINT fk_books_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id)

    PRIMARY KEY (id)
);

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY
    genre_id
    author_id
    label_id 
    publish_date DATE
    archived BOOLEAN
    on_spotify BOOLEAN

    CONSTRAINT fk_music_album_label_id FOREIGN KEY (label_id) REFERENCES labels(id)
     
    CONSTRAINT fk_music_album_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
     
    CONSTRAINT fk_music_album_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id)       

    PRIMARY KEY (id)
);

CREATE TABLE game (
    id INT GENERATED ALWAYS AS IDENTITY
    genre_id
    author_id
    source_id
    label_id 
    publish_date DATE
    archived BOOLEAN
    multiplayer BOOLEAN
    last_played_at DATE

    CONSTRAINT fk_game_label_id FOREIGN KEY (label_id) REFERENCES labels(id)
     
    CONSTRAINT fk_game_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
     
    CONSTRAINT fk_game_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id)       

    PRIMARY KEY (id)
);

CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY
    title VARCHAR(190)
    color VARCHAR(190)
);

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY
    name VARCHAR(190)
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY
    first_name VARCHAR(190)
    last_name VARCHAR(190)
);
