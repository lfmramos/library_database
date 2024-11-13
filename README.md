# Library Management System

This repository contains SQL scripts for setting up and managing a library database. The system includes tables for books, users, and reservations, and supports basic operations for handling book loans and user reservations.

## Database Schema

The database consists of the following tables:

### `book`

- `id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each book.
- `author` (VARCHAR(255), NOT NULL): Author of the book.
- `title` (VARCHAR(255), NOT NULL): Title of the book.
- `publisher` (VARCHAR(255), NOT NULL): Publisher of the book.
- `pub_Date` (DATE, NOT NULL): Publication date of the book.
- `loaned` (BOOLEAN, DEFAULT FALSE): Indicates whether the book is currently loaned out.

### `user`

- `id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each user.
- `username` (VARCHAR(255), NOT NULL): Username of the user.

### `reservation`

- `id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each reservation.
- `book_id` (INTEGER, NOT NULL, FOREIGN KEY): Reference to the `id` in the `book` table.
- `user_id` (INTEGER, NOT NULL, FOREIGN KEY): Reference to the `id` in the `user` table.

## SQL Scripts

### Create and Set Up Database

The script creates a new database, drops existing tables if they exist, and creates new tables for the library system:

```sql
DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS reservation;

CREATE TABLE book(
    id INTEGER AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
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
    book_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);
