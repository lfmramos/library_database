-- Drop the existing library database if it exists
DROP DATABASE IF EXISTS library;

-- Create a new library database
CREATE DATABASE library;

-- Switch to the newly created library database
USE library;

-- Drop the existing book, user, and reservation tables if they exist
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS reservation;

-- Create the book table
CREATE TABLE book(
    id INTEGER AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY, -- Primary key, auto-incremented
    author VARCHAR(255) NOT NULL, -- Author of the book, cannot be null
    title VARCHAR(255) NOT NULL, -- Title of the book, cannot be null
    publisher VARCHAR(255) NOT NULL, -- Publisher of the book, cannot be null
    pub_Date DATE NOT NULL, -- Publication date, cannot be null
    loaned BOOLEAN DEFAULT FALSE -- Loaned status, defaults to FALSE
);

-- Create the user table
CREATE TABLE user(
    id INTEGER AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY, -- Primary key, auto-incremented
    username VARCHAR(255) NOT NULL -- Username, cannot be null
);

-- Create the reservation table
CREATE TABLE reservation(
    id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY, -- Primary key, auto-incremented
    book_id INTEGER NOT NULL, -- Foreign key to the book table
    user_id INTEGER NOT NULL, -- Foreign key to the user table
    FOREIGN KEY (book_id) REFERENCES book(id), -- Foreign key constraint for book_id
    FOREIGN KEY (user_id) REFERENCES user(id) -- Foreign key constraint for user_id
);

-- Insert initial data into the book table
INSERT INTO book(author,title,publisher,pub_Date) VALUES ('Leo Tolstoi', 'War and Peace', 'Russian Federation', '1867-07-31');
INSERT INTO book(author,title,publisher,pub_Date) VALUES ('Eça de Queirós', 'O Primo Basílio', 'Portuguese Federation', '1878-07-31');

-- Insert multiple rows into the book table
INSERT INTO book (author, title, publisher, pub_date) VALUES
('Harper Lee', 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', '1960-07-11'),
('George Orwell', '1984', 'Secker & Warburg', '1949-06-08'),
('J.K. Rowling', 'Harry Potter and the Philosopher\'s Stone', 'Bloomsbury', '1997-06-26'),
('J.R.R. Tolkien', 'The Hobbit', 'George Allen & Unwin', '1937-09-21'),
('F. Scott Fitzgerald', 'The Great Gatsby', 'Charles Scribner\'s Sons', '1925-04-10'),
('Mary Shelley', 'Frankenstein', 'Lackington, Hughes, Harding, Mavor & Jones', '1818-01-01'),
('Herman Melville', 'Moby-Dick', 'Harper & Brothers', '1851-10-18'),
('Jane Austen', 'Pride and Prejudice', 'T. Egerton', '1813-01-28'),
('Leo Tolstoy', 'War and Peace', 'The Russian Messenger', '1869-01-01'),
('Mark Twain', 'Adventures of Huckleberry Finn', 'Chatto & Windus', '1884-12-10');

-- Insert a single row into the user table
INSERT INTO user(username) VALUES ('Afonso');

-- Insert multiple rows into the user table
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

-- Insert a reservation and update the loaned status of the corresponding book
INSERT INTO reservation (book_id, user_id) VALUES (1, 1);
UPDATE book SET loaned = TRUE WHERE id = 1;
