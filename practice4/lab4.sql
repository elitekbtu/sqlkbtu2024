create database lab4;

create table warehouse(
    code int,
    location varchar(255),
    capacity int
);

create table boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse int
);


insert into warehouse(code, location, capacity)
values
(1,'Chicago',3),
(2,'Chicago',4),
(3,'New York',7),
(4,'Los Angeles',2),
(5,'San Francisco',8);


insert into boxes(code, contents, value, warehouse)
values
('OMN7','Rocks',180,3),
('4H8P','Rocks',250,1),
('4RT3','Scissors',190,4),
('763H','Rocks',200,1),
('8JN6','Papers',75,1),
('8Y6U','Papers',50,3),
('9J6F','Papers',175,2),
('LL08','Rocks',140,4),
('РОН6','Scissors',125,1),
('P2T6','Scissors',150,2),
('TU55','Papers',90,5);

--4
select * from  warehouse;
select * from boxes;

--5
select * from boxes
where value>150;

--6
select  distinct contents
from boxes;

--7
select warehouse ,COUNT(*) as warehouse_count
from boxes group by warehouse;

--8
select warehouse,COUNT(*) as warehouse_count from boxes group by warehouse having count(*)>2;

--9
insert into warehouse(code, location, capacity) values(3,'New York',3);

select * from warehouse;
select * from boxes;

--10
insert into boxes(code, contents, value, warehouse) values('H5RT','Papers',200,2);
select * from boxes;

--11
update boxes
set value=value*0.85 where value=(select value  from boxes order by  value desc offset 2 limit 1);


--12
delete from boxes
where value<150;


--13
delete from boxes using warehouse where boxes.warehouse=warehouse.code and warehouse.location='New York' returning *;