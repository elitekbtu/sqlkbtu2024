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



/*
DDL (Data Definition Language) Tasks:
Create a Table: Create a table employees with the following fields:

id (integer, primary key)
name (varchar(100), not null)
position (varchar(50))
salary (decimal(10, 2))
hire_date (date)
Modify a Table:
Add a new column department (varchar(50)) to the employees table.

Drop a Table:
Drop the departments table from the database.

Alter a Column:
Change the data type of the salary column in the employees table to integer.

Create Index:
Create an index on the salary column in the employees table for faster queries.

DML (Data Manipulation Language) Tasks:
Insert Records:
Insert 3 new employees into the employees table with different names, positions, and salaries.

Update Records:
Update the salary of the employee whose id is 2, setting it to 75000.

Delete Records:
Delete all employees who have a salary less than 30000 from the employees table.

Bulk Insert:
Insert multiple rows into the employees table in one query with values for name, position, and salary.

Merge/Upsert:
Insert a new employee or update the salary of an existing employee if the id already exists.

DQL (Data Query Language) Tasks:
Select Basic:
Retrieve all columns from the employees table.

Conditional Select:
Select all employees who have a salary greater than 50000.

Join Tables:
Join the employees table with a departments table and retrieve the employee names along with their department names.

Group By and Aggregate:
Group employees by their position and calculate the average salary for each position.

Order By:
Select all employees and order them by their hire_date in descending order.

Use Subqueries:
Select all employees whose salary is higher than the average salary of all employees.
*/

/*
DDL (Data Definition Language) Tasks:
Create a Table: Create a table employees with the following fields:

id (integer, primary key)
name (varchar(100), not null)
position (varchar(50))
salary (decimal(10, 2))
hire_date (date)
Modify a Table:
Add a new column department (varchar(50)) to the employees table.
*/

create table employees(
    id integer primary key, 
    name varchar(100) not null, 
    position varchar(50), 
    salary decimal(10, 2),
    hire_date date
);

alter table employees add column department varchar(50); 
drop table departments; 
alter table employees alter column salary type integer using salary::integer;
create index idx_salary on employees(salary);

insert into employees (id, name, position, salary, hire_date)
values 
(1, 'John Doe', 'Software Engineer', 60000, '2024-01-15'),
(2, 'Jane Smith', 'Product Manager', 85000, '2023-11-01'),
(3, 'Alice Johnson', 'Designer', 45000, '2024-05-10');

update employees
set salary = 75000
where id = 2;

delete from employees
where salary < 30000;

insert into employees (id, name, position, salary, hire_date)
values 
(4, 'Mark Brown', 'HR Manager', 50000, '2024-03-21'),
(5, 'Emily Davis', 'Data Scientist', 95000, '2023-07-14'),
(6, 'Chris Wilson', 'Marketing Coordinator', 42000, '2024-09-05');


insert into employees (id, name, position, salary, hire_date)
values (2, 'Jane Smith', 'Product Manager', 90000, '2023-11-01')
on conflict (id)
do update set salary = excluded.salary;

select * from employees; 
select * from employees where salary>50000; 
select e.name, d.name from employee e join departments d on e.id = d.id; 

select position, avg(position) from employees group by position;
select * from employees where salary>(select avg(salary) from employees);


