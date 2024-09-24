drop database if exists lab2;
create database lab2;
\c lab2
drop table if exists countries cascade;
create table countries(
    country_id serial primary key,
    country_name varchar(255),
    region_id int, 
    population int
);
insert into countries(country_name, region_id, population) values("Usa", 1, 123456789);
insert into countries(country_name) values("Greece");
insert into countries(region_id) values(null);
insert into countries(country_name, region_id, population) values("Dagestan", 15, 1234567), ("Russia", 12, 34567890), ("Crotia", 10, 5678909);
alter table alter column country_name set default 'Kazakhstan';
insert into countries(country_name) values(default);
insert into countries default values;
create table countries_new (like countries including all);
insert into countries_new select * from countries;
update countries set region_id = 1 where region_id=null;
select country_name, population * 1.1 as "new population" from countries;
delete from countries where population<100000;
delete from countries_new where country_id in(select country_id from countries) returning *;
delete from countries
returning *;
\c postgres