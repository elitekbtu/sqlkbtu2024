drop database if exists lab1 ;
create database lab1;
\c lab1\
drop table if exists users cascade;
drop table if exists tasks;
create table users (
    id serial primary key,
    firstname varchar(50),
    lastname varchar(50)
);

alter table users add column isadmin boolean;
alter table users alter column isadmin set default false;

create table tasks (
    id serial primary key,
    name varchar(50)
);

drop table tasks;
drop table users cascade;

\c postgres
drop database lab1;
