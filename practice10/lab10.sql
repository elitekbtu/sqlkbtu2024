
CREATE  database  lab10;
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INTEGER
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES Books(book_id),
    customer_id INTEGER,
    order_date DATE,
    quantity INTEGER
);

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO Books (title, author, price, quantity)
VALUES
    ('Database 101', 'A. Smith', 40.00, 10),
    ('Learn SQL', 'B. Johnson', 35.00, 15),
    ('Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (name, email)
VALUES
    ('John Doe', 'johndoe@example.com'),
    ('Jane Doe', 'janedoe@example.com');

--1
BEGIN;
INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);
UPDATE Books SET quantity = quantity - 2 WHERE book_id = 1;
COMMIT;

--2
DO $$
BEGIN
    IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN
        RAISE NOTICE 'Insufficient quantity for book_id 3';
        ROLLBACK;
    ELSE
        INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, CURRENT_DATE, 10);

        UPDATE Books SET quantity = quantity - 10 WHERE book_id = 3;
        COMMIT;
    END IF;
END $$;
SELECT * FROM Books;
SELECT * FROM Orders;

--3
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Books SET price = 38.00 WHERE book_id = 2;
COMMIT;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM Books WHERE book_id = 2;

SELECT price FROM Books WHERE book_id = 2;
COMMIT;

--4
BEGIN;
UPDATE Customers SET email = 'newemail@example.com' WHERE customer_id = 101;
COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;