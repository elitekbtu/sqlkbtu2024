-- Numeric binary date boolean types

-- Nummeric smallint 2 bytes int
-- real and double  float data types

create database lecture2;
create table decimal_test(
    value decimal(5, 2) --999,99
);
insert into decimal_test (value) values(999.99)
select * from decimal_test;



-- serial types: smallserial , serial 2, 4 bytes bigserial
-- auto - increment type  

create table users(
    id serial, 
    name varchar(200);
);
insert into users (name) values("beknur");
select * from users;
alter sequence users_id_seq increment by 3;
alter sequence users_id_seq restart with 100;
-- postgresql.org website 

-- character types
-- varchar char (n) n is limit 
create table table1(
    col1 char(5); --fixed
    col2 varchar(5); --non-fixed
);

insert into table1 (col1, col2) values ("abc", "abc")
-- actet_length() check length field 
-- text type 

-- bytea - binary string "stores 01" 1 or 4 bytes
-- timestapm time interval so on datatypes in postgresql.org

-- boolean true false unknown 

-- lecture 2 finished

-- dml 
-- key words create select from ..
-- comments

/*

hekllefkel
jeklwd;kjgehjkl;w;w  comments 
hbjekl;;w'
*/
-- max limit identifer 63 bytes
-- update my_table set a = 5;


create table "TABLE2"(
    id serial
);
select * from "TABLE2";

-- insert data 

-- insert into 

create table table3{
    id serial primary key, 
    name varchar(200),
    price int, 
    weight int
}
insert into table3(name, price, weight) values("turar", 12, 123);
select * from table3;

insert into table3 values(default, "pepsi", 145, 55.5 double::integer);
-- insert into table3 values(default, "pepsi", 145); weight will be null

insert into table3 default values;


-- lecture 3 second part 

insert into table3 (name, price, weight) select name, price, weight from table3 where id=3;
-- selecting from other table 

insert into table3(name, price, weight) values("turar", 12, 123),
values("turar", 12, 123), values("turar", 12, 123), values("turar", 12, 123) ;

-- grouping insert 

-- update change exists values 

-- alias change table name in inside command for ex: table12345 you can change alias tb123;


update table3 set price=100 where price is null;

update table3 set price = price*1.2, name ="smth",  where price=200;

update table3 set price = price*1.2, name ="smth",  where price=200;
select * from table3; 
-- sub 
update table3 set weight = (select max(weight) from table3) where weight is null;

update table3 set (weight, name) = (select max(weight), max(price) from table3) where weight is null;

create table category(
    id serial primary key, 
    name varchar(200)
);
insert into category(name) values("ghjkl;", "ghjkl;'","ertyuio");

-- deleting data 
delete from table3 where category =1 ;
delete from table using "another table"  
