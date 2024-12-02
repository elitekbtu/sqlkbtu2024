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


