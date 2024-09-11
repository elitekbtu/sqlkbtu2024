
-- Drop the tables if they already exist
DROP TABLE IF EXISTS users_copy;
DROP TABLE IF EXISTS users;

-- Create the users table with id and name columns
CREATE TABLE users (
    id INTEGER,
    name VARCHAR(100)
);

-- Create users_copy table with the same structure as users
CREATE TABLE users_copy (
    LIKE users
);

-- Drop the users and users_copy tables
DROP TABLE users;
DROP TABLE users_copy;

-- Create the users table again with a primary key constraint on id
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

-- Select all data from users (will be empty if no data is inserted)
SELECT * FROM users;


create database lecture_2;
owner user2;
template postgres;
tablespace;
encoding UTF8;

allow.collections true;
connection limit -1;

create tablespace space1;
location "path to directory"
drop databasename;

drop databasename if exists;
-- ddl = create,  modify,  remote;
-- CREATE ALTER DROP AND DELETE FUNCTIONS;

-- every types of field has length type and value;
-- create table users_child(
--      address varchar(100),
-- 	age integer

-- ) inherits(users);

select * from users_child; 

-- alter table users;
-- add column phonenumber varchar(14);

select * from users_child;