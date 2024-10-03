drop database if exists lab4;

create database lab4;
drop table if exists warehouses cascade;
drop table if exists boxes cascade;

create table warehouses(
    code int,
    location character varying (255),
    capacity int
);

create table boxes (
    code character(4),
    contents character varying (255),
    value real,
    warehouse int
);

insert into warehouses (code, location, capacity) values
(1,'chicago',3),
(2,'chicago',4),
(3,'new york',7),
(4,'los angeles',2),
(5,'san francisco',8);

insert into boxes (code, contents, value, warehouse) values
('omnt','rocks',180,3),
('4h8p','rocks',250,1),
('4rt3','scissors',190,4),
('763h','rocks',200,1),
('8jn6','papers',75,1),
('8y6u','papers',50,3),
('9j6f','papers',175,2),
('ll08','rocks',140,4),
('рон6','scissors',125,1),
('p2t6','scissors',150,2),
('tu55','papers',90,5);

select * from warehouses;
select * from boxes;

select * from warehouses;

select * from boxes
where value > 150;

select distinct contents from boxes;

select warehouse, count(*) as box_count
from boxes
group by warehouse;

select warehouse, count(*) as box_count
from boxes
group by warehouse
having count(*) > 2;

insert into warehouses (code, location, capacity)
values (4, 'new york', 3);

insert into boxes (code, contents, value, warehouse)
values ('h5rt', 'papers', 200, 2);

update boxes
set value = value * 0.85
where value = (select value from boxes order by value desc offset 2 limit 1);

delete from boxes
where value < 150;

delete from boxes
using warehouses
where boxes.warehouse = warehouses.code
and warehouses.location = 'new york'
returning boxes.*;