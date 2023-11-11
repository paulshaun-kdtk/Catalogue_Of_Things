CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Author (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    publisher VARCHAR(255)
);

CREATE TABLE Label (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Book (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publisher VARCHAR(255),
    can_be_archived BOOLEAN
);

CREATE TABLE Items (
    id INT PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE AuthorBooks (
    author_id INT,
    book_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);

CREATE TABLE LabelBooks (
    label_id INT,
    book_id INT,
    FOREIGN KEY (label_id) REFERENCES Label(id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);

--many-to-many relationship between Genre and Books
CREATE TABLE GenreBooks (
    genre_id INT,
    book_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);
