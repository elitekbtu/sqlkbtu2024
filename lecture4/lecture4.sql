create database lecture4;

--logical operations and or not 
select * from film where (length>100 and rental_duration<5); 
-- you can create all logical expressions 
-- hint immportant priority 
--<, >, <=, >=, = , != , <> (not equal)
--between, distinct, null, false, true, 

select * from film whre length between 10 and 50; 
select * from film where  length >=50 and length<100 ; 
select * from film where length not between 50 and 100; 
select * from film where length<50 or length>100; 
--every time we need order vlaues of between; 
select * from film where original_language_id is not distinct from 10;-- equal 

select * from film where original_language_id is distinct from 10; --not  equal 

select num_nonnulls(1,2,3,4,null) -- 4 
select num_nonnulls(1, null, null, null) -- 1  count of not null elements 

-- abs, mod, floor, ceil, 

select ceil(4,35), floor(4,35), round(4,35), trunc(4.1234, 2); -- return 4,12 if 3 returns 4,123

-- random functions 
-- random() 0-1 double values 
select setseed(0,5)
select random(); 
-- returns same value by 0.5 

select 'film: ' || title 'was realised in' || realised_year; --concatenations

-- bit_length(), char_length(), octet_length(); bit length char length, byte length 
select char_length(value1), octet_length(value); 
select title 
    overlay(title placing 'asd' from 3 for 5 ) from film; --for ex txxxxas 2 for 4 homa thomas and so on; 

-- position substring substr funtions on lecture 










