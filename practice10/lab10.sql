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

INSERT INTO Customers (customer_id,name, email)
VALUES
    (101,'John Doe', 'johndoe@example.com'),
    (102,'Jane Doe', 'janedoe@example.com');

--1
DO $$
begin
insert into orders(book_id, customer_id, order_date, quantity) values (1,101,CURRENT_DATE,2);
update books
set quantity=quantity-2
where book_id=1;
end $$;

select * from books;
select * from orders;

--2
DO $$
    begin
        if (select Books.quantity from books where book_id=3)<10
        then
            raise notice  'No enough quantity';
            rollback ;
        else
        insert into orders(book_id, customer_id, order_date, quantity) values(3,102,current_date,10);
        update books
        set quantity=quantity-10
        where book_id=3;
        commit;
    end if;
        end

$$;
select * from books;
select *  from orders;



--3
    begin transaction   isolation level read committed;
    update books set price =45 where book_id=2;
commit;
begin transaction  isolation level  read committed ;
select price from books where book_id=2;

select price from books where book_id=2;
commit;

select * from books;


select * from customers;
--4
begin transaction ;
update customers set email='turarbek@gmail.com' where customer_id=101 ;
commit;

select * from customers where customer_id=101;