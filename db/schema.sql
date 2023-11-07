CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255),
);

CREATE TABLE Author (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    publisher VARCHAR(255),
);

CREATE TABLE Book (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publisher VARCHAR(255),
    can_be_archived BIT,
);

CREATE TABLE Label (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    can_be_archived BIT,
);

CREATE TABLE Items (
    genre_id INT,
    item_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (item_id) REFERENCES Book(id),
);

CREATE TABLE AuthorItems (
    author_id INT,
    item_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (item_id) REFERENCES Book(id),
);

CREATE TABLE LabelItems (
    label_id INT,
    item_id INT,
    FOREIGN KEY (label_id) REFERENCES Label(id),
    FOREIGN KEY (item_id) REFERENCES Book(id),
);
