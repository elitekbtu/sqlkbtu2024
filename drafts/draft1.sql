drop database if exists lab1;
create database lab1;
\c lab1\
drop table if exists users; 
drop table if exists tasks;

create table users(
    id serial, 
    firstname varchar(50), 
    lastname varchar(50)
);

alter table users add column isadmin int default 1 check(isadmin in (0,1))
alter table users alter column isadmin drop default;
alter table users drop constraint users_isadmin_check;
alter table users alter column isadmin type bool using isadmin::boolean;
alter table users alter column isadmin set default false;
alter table users add constraint uniq primary key(id);

create table tasks(
    id serial,
    name varchar(50).
    user_id int
);
drop table tasks;
\c postgres
drop database lab1;