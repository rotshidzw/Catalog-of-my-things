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

CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY
    title VARCHAR(190)
    color VARCHAR(190)
);