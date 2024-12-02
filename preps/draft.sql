create database newdb; 
create table prsdt(
    name text, 
    age integer, 
    gender boolean
); 
create view myview as select name, age from prsdt; 

create vew myview2 as select name, age from prsdt where name = 'beknur' with local check option; 

create vew myview3 as select name, age from prsdt where name = 'beknur' with cascaded check option; 

create materialized view myview4 as select name, age from prsdt with no data; 

refresh materialized view myview4;

create materialized view myview5 as select name, age from prsdt with data; 

create unique index myindex on prsdt(name); 

refresh materialized view cuncurrently myview5; 

alter view myview5 rename to myviewfive; 

drop view if exists myview5; 

-- you can't update view
--if view have 
--(group by, having, limit, offset, distinct, with, union intersect, except)
--also 
--(sum, count, avg, min, max etc)


create view testview as select name, gender from prsdt; 
insert into testview (name, gender) values (default, default);


-- roles and membership, ownership

create role name; 
drop role name; 

--select existing roles 

select rolname from pg_roles; 

create role myrole login; 
create user myrole; 
create role myrole2 createdb; 
--create role ability
create role rolecreator createrole; 
--create role with password

create role myrolewps password 'mypass'; 

alter role myrolewps with password 'newpass'; 
alter role myrolewps with password null;
alter role myrolewps createdb createrole; 

--role membership

grant select insert on table prsdt to myrolewps; 
grant all privileges on database newdb to myrole2; 
grant myrolewps to myrole; 
drop role myrole2; 
--ownership 

alter table prsdt owner to myrole; 
reassign owned by myrole to myrole2; 
drop owned by myrole; 
drop role myrole;  