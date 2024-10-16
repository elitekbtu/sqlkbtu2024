/*
1. Basic Queries and Joins
Create two tables: employees (with columns: id, name, department) and salaries (with columns: employee_id, salary).
Write a query to join these tables and show each employee's name and salary.
Find the employee with the highest salary in the HR department.
*/

create table employee (
    id serial primary key, 
    name varchar(255), 
    department varchar(255)
);

create table salaries (
    employee_id int references employee(id), 
    salary int
);

-- Join the tables to show each employee's name and salary
select e.name, s.salary
from employee as e
join salaries as s on e.id = s.employee_id;

-- Find the employee with the highest salary in the HR department
select * from employee as e
join salaries as s on e.id = s.employee_id
where e.department = 'HR'
order by s.salary desc
limit 1;


/*
2. Aggregation Functions
Create a sales table (with columns: id, product_name, sale_amount, sale_date).
Write a query to find the total sales for each product.
Calculate the average sales amount for the month of October.
Find the product with the highest number of sales.
*/

create table sales (
    id serial primary key, 
    product_name varchar(255), 
    sale_amount int, 
    sale_date date
); 

-- Find the total sales for each product
select product_name, sum(sale_amount) as total_sum 
from sales 
group by product_name; 

-- Calculate the average sales amount for the month of October
select avg(sale_amount) as avg_sales
from sales
where extract(month from sale_date) = 10;

-- Find the product with the highest number of sales
select product_name
from sales
group by product_name
order by sum(sale_amount) desc
limit 1;


/*
3. Subqueries
Create a table students (with columns: id, name, grade).
Write a query to find students whose grades are higher than the average grade.
Use a subquery to find the second-highest grade in the class.
*/

create table students (
    id integer, 
    name text, 
    grade double precision
);

-- Find students whose grades are higher than the average grade
select name from students where grade > (select avg(grade) from students);

-- Use a subquery to find the second-highest grade in the class
select grade from students where grade = (select grade from students order by grade desc limit 1 offset 1);


/*
4. Set Operations
Create two tables: orders (with columns: id, customer_name) and canceled_orders (with columns: id, customer_name).
Write a query to find all orders that were either placed or canceled, but not both.
*/

create table orders (
    id serial primary key, 
    customer_name varchar(255)
);

create table canceled_orders (
    id serial primary key, 
    customer_name varchar(255)
);

-- Find all orders that were either placed or canceled, but not both
select * from orders
except 
select * from canceled_orders

union

select * from canceled_orders
except 
select * from orders;


/*
5. Window Functions
Create a transactions table (with columns: transaction_id, customer_id, amount, transaction_date).
Write a query to calculate the cumulative sum of transaction amounts for each customer, ordered by transaction date.
*/

create table transactions (
    transaction_id serial primary key, 
    customer_id int, 
    amount int, 
    transaction_date date
);

-- Calculate the cumulative sum of transaction amounts for each customer, ordered by transaction date
select customer_id, 
       transaction_date, 
       amount, 
       sum(amount) over (partition by customer_id order by transaction_date) as cumulative_sum
from transactions
order by customer_id, transaction_date;


select sum(purch_amt) from orders; 
select avg(purch_amt) from orders; 
select count(cust_name) from customers; 
select min(purch_amt) from orders; 

select * from customers where cust_name like '%b';
select * from orders where customer_id in(select customer_id from customers where  city = 'New York');
select * from orders where customer_id in (select customer_id from customers) and purch_amt>10;
select sum(grade) from customers;
select * from customers where cust_name is not null;
select max(grade) from customers;