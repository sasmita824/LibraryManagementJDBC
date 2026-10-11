-- Library Management System Database

CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- 1. Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

-- 2. Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    quantity INT DEFAULT 1,
    FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
);

-- 3. Create Members table
CREATE TABLE IF NOT EXISTS Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- 4. Create Book_Issues table
CREATE TABLE IF NOT EXISTS Book_Issues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    FOREIGN KEY (book_id)
        REFERENCES Books(book_id),
    FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

-- 5. Insert sample authors
INSERT INTO Authors (author_name)
VALUES
('R. K. Narayan'),
('Chetan Bhagat'),
('Rabindranath Tagore');

-- 6. Insert sample books
INSERT INTO Books (title, author_id, category, quantity)
VALUES
('Malgudi Days', 1, 'Fiction', 5),
('Five Point Someone', 2, 'Novel', 3),
('Gitanjali', 3, 'Poetry', 4);

-- 7. Insert sample members
INSERT INTO Members (member_name, email, phone)
VALUES
('Rahul Sharma', 'rahul@example.com', '9876543210'),
('Priya Das', 'priya@example.com', '9876501234');

-- 8. Insert sample book issues
INSERT INTO Book_Issues
(book_id, member_id, issue_date, return_date)
VALUES
(1, 1, '2026-10-01', NULL),
(2, 2, '2026-10-03', '2026-10-08');

-- 9. Display all books with their authors
SELECT
    Books.book_id,
    Books.title,
    Authors.author_name,
    Books.category,
    Books.quantity
FROM Books
INNER JOIN Authors
    ON Books.author_id = Authors.author_id;

-- 10. Display book issue details
SELECT
    Book_Issues.issue_id,
    Books.title,
    Authors.author_name,
    Members.member_name,
    Book_Issues.issue_date,
    Book_Issues.return_date
FROM Book_Issues
INNER JOIN Books
    ON Book_Issues.book_id = Books.book_id
INNER JOIN Authors
    ON Books.author_id = Authors.author_id
INNER JOIN Members
    ON Book_Issues.member_id = Members.member_id;
