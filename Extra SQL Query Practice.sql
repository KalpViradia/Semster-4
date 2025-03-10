CREATE TABLE book (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    category_id INT,
    price DECIMAL(10,2),
    publication_year INT,
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE author (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100)
);

CREATE TABLE member (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    membership_type VARCHAR(50) CHECK (membership_type IN ('Standard', 'Premium', 'VIP'))
);

CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE book_issue (
    id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);

--1. List all members whose membership type is VIP and whose first name is AMIT or NEHA.
SELECT * 
FROM member 
WHERE membership_type = 'VIP' 
AND first_name IN ('AMIT', 'NEHA');

--2. List the different types of books under the Science category along with their prices.
SELECT book.title, book.price 
FROM book
JOIN category ON book.category_id = category.id
WHERE category.name = 'Science';

--3. List all books written by authors of Indian nationality that were published after 2015.
SELECT book.title, book.publication_year 
FROM book
JOIN author ON book.author_id = author.id
WHERE author.nationality = 'Indian' 
AND book.publication_year > 2015;

--4. Find the member who has the highest number of issued books.
SELECT TOP 1 member.id, member.first_name, member.last_name, COUNT(book_issue.id) AS issued_books 
FROM book_issue
JOIN member ON book_issue.member_id = member.id
GROUP BY member.id, member.first_name, member.last_name
ORDER BY issued_books DESC;

--5. List category-wise book's maximum price, minimum price, average price.
SELECT category.name AS category, 
       MAX(book.price) AS max_price, 
       MIN(book.price) AS min_price, 
       AVG(book.price) AS avg_price 
FROM book
JOIN category ON book.category_id = category.id
GROUP BY category.name;

--6. List the members who have never issued a book.
SELECT * 
FROM member 
WHERE id NOT IN (SELECT DISTINCT member_id FROM book_issue);

--7. List all books that have been issued, along with the details of the members who issued them.
SELECT book.title, member.first_name, member.last_name, book_issue.issue_date, book_issue.return_date 
FROM book_issue
JOIN book ON book_issue.book_id = book.id
JOIN member ON book_issue.member_id = member.id;

--8. List all books that were issued during the financial year 2024-25 along with the number of times they were issued.
SELECT book.title, COUNT(book_issue.id) AS issue_count 
FROM book_issue
JOIN book ON book_issue.book_id = book.id
WHERE book_issue.issue_date BETWEEN '2024-04-01' AND '2025-03-31'
GROUP BY book.title;

--9. Find all members who have issued Science books more than 3 times.
SELECT member.id, member.first_name, member.last_name, COUNT(book_issue.id) AS issue_count 
FROM book_issue
JOIN book ON book_issue.book_id = book.id
JOIN category ON book.category_id = category.id
JOIN member ON book_issue.member_id = member.id
WHERE category.name = 'Science'
GROUP BY member.id, member.first_name, member.last_name
HAVING COUNT(book_issue.id) > 3;