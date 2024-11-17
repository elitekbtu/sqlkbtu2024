CREATE TABLE salesman(
  salesman_id INT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  comission NUMERIC
);

CREATE TABLE customers(
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INT,
  salesman_id INT REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
  ord_no INT PRIMARY KEY,
  purch_amt REAL,
  ord_date DATE,
  customer_id INT REFERENCES customers(customer_id),
  salesman_id INT REFERENCES salesman(salesman_id)
);

INSERT INTO customers VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', DEFAULT, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders VALUES (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760 ,'2012-09-10' ,3002, 5001);

INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15),
                            (5002, 'Nail Knite', 'Paris', 0.13),
                            (5005, 'Pit Alex', 'London', 0.11),
                            (5006, 'Mc Lyon', 'Paris', 0.14),
                            (5003, 'Lauson Hen', DEFAULT, 0.12),
                            (5007, 'Paul Adam', 'Rome', 0.13);
--3
CREATE ROLE junior_dev LOGIN PASSWORD 'qweqwe';

--4
CREATE VIEW salesman_view1 AS SELECT * FROM salesman WHERE city = 'New York';

--5
CREATE VIEW qwe AS SELECT s.name, c.cust_name FROM salesman AS s INNER JOIN customers AS c USING (salesman_id);
GRANT ALL PRIVELEGES ON qwe TO junior_dev;

--6
CREATE VIEW qw AS SELECT * FROM customers ORDER BY grade DESC NULLS LAST LIMIT 1 OFFSET 0;
GRANT SELECT ON qw TO junior_dev;

--7
CREATE VIEW q AS SELECT city, count(salesman_id) FROM salesman GROUP BY city;

--8
SELECT s.name, count(*) FROM salesman AS s INNER JOIN customers AS c USING (salesman_id) GROUP BY salesman_id HAVING count(*) > 1;

--9
CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;