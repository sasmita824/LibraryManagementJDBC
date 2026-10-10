USE library_management;

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