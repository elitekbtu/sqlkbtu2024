drop database if exists lab2;
--1
create database lab2;

\c lab2

drop table if exists countries cascade;
--2
create table countries (
    country_id serial primary key,
    country_name varchar(255),
    region_id integer,
    population integer
);
--3
insert into countries (country_name, region_id, population)
values ('canada', 1, 37590000);
--4
insert into countries (country_name)
values ('mexico');
--5
insert into countries (country_name, region_id)
values ('france', null);
--6
insert into countries (country_name, region_id, population)
values
    ('brazil', 3, 211000000),
    ('germany', 4, 83000000),
    ('japan', 5, 126000000);
--7
alter table countries
alter column country_name set default 'kazakhstan';
--8
insert into countries (country_name, region_id, population)
values (default,5, 18500000);
--9
insert into countries default values;
--10
drop table if exists countries_new;
create table countries_new (like countries including all);
--11
insert into countries_new
select * from countries;
--12
update countries
set region_id = 1
where region_id is null;
--13
select country_name,
       population * 1.1 as "new population"
from countries;
--14
delete from countries
where population < 100000;
--15
delete from countries_new
where country_id in (select country_id from countries)
returning *;
--16
delete from countries
returning *;

\c postgres