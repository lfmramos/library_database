DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS reservation;

CREATE TABLE book(
    id INTEGER AUTO_INCREMENT NOT NULL UNIQUE  PRIMARY KEY,
    author VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    pub_Date DATE NOT NULL,
    loaned BOOLEAN DEFAULT FALSE
);

CREATE TABLE user(
    id INTEGER AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

CREATE TABLE reservation(
 id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY, 
book_id INTEGER NOT NULL, user_id INTEGER NOT NULL, 
FOREIGN KEY (book_id) REFERENCES book(id), 
FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO book(author,title,publisher,pub_Date) VALUES ('Leo Tolstoi', 'War and Peace', 'Russian Federation', '1867-07-31');
INSERT INTO book(author,title,publisher,pub_Date) VALUES ('Eça de Queirós', 'O Primo Basílio', 'Portuguese Federation', '1878-07-31');

INSERT INTO book (author, title, publisher, pub_date) VALUES
('Harper Lee', 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', '1960-07-11'),
('George Orwell', '1984', 'Secker & Warburg', '1949-06-08'),
('J.K. Rowling', 'Harry Potter and the Philosophers Stone', 'Bloomsbury', '1997-06-26'),
('J.R.R. Tolkien', 'The Hobbit', 'George Allen & Unwin', '1937-09-21'),
('F. Scott Fitzgerald', 'The Great Gatsby', 'Charles Scribners Sons', '1925-04-10'),
('Mary Shelley', 'Frankenstein', 'Lackington, Hughes, Harding, Mavor & Jones', '1818-01-01'),
('Herman Melville', 'Moby-Dick', 'Harper & Brothers', '1851-10-18'),
('Jane Austen', 'Pride and Prejudice', 'T. Egerton', '1813-01-28'),
('Leo Tolstoy', 'War and Peace', 'The Russian Messenger', '1869-01-01'),
('Mark Twain', 'Adventures of Huckleberry Finn', 'Chatto & Windus', '1884-12-10');

INSERT INTO user(username) VALUES ('Afonso');

INSERT INTO user (username) VALUES
('John Doe'),
('Jane Smith'),
('Michael Johnson'),
('Emily Davis'),
('Daniel Brown'),
('Sarah Wilson'),
('David Jones'),
('Laura Garcia'),
('James Martinez'),
('Maria Rodriguez');

INSERT INTO reservation (book_id, user_id) VALUES (1, 1);
UPDATE book SET loaned = TRUE WHERE id = 1;