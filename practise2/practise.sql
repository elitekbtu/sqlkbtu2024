create database lab2;
-- Создание новой базы данных с именем "lab2"

\c lab2
-- Подключение к базе данных "lab2"

create table countries (
    country_id serial primary key,
    country_name varchar(255) not null,
    region_id integer,
    population integer
);
-- Создание таблицы "countries" с полями:
-- 1. country_id: автоинкрементируемый первичный ключ (serial),
-- 2. country_name: имя страны (строка длиной до 255 символов), которое не может быть пустым,
-- 3. region_id: идентификатор региона (integer),
-- 4. population: численность населения (integer).

insert into countries (country_name, region_id, population) 
values ('canada', 1, 37590000);
-- Вставка строки для Канады с region_id = 1 и населением 37,590,000.

insert into countries (country_id, country_name) 
values (2, 'mexico');
-- Вставка строки для Мексики с указанным country_id = 2, но без численности населения и region_id (они будут NULL).

insert into countries (country_name, region_id, population) 
values ('france', null, 67000000);
-- Вставка строки для Франции с численностью населения 67,000,000. region_id будет NULL.

insert into countries (country_name, region_id, population) 
values ('brazil', 3, 211000000), 
       ('germany', 2, 83000000), 
       ('japan', 4, 126000000);
-- Вставка строк для Бразилии, Германии и Японии с соответствующими region_id и населением.

alter table countries
alter column country_name set default 'kazakhstan';
-- Изменение столбца country_name, добавление значения по умолчанию 'казахстан'.

insert into countries (region_id, population) 
values (5, 18500000);
-- Вставка новой строки, где указаны только region_id и численность населения. 
-- Имя страны будет установлено как 'казахстан' по умолчанию.

insert into countries default values;
-- Вставка строки с использованием всех значений по умолчанию. 
-- country_id будет автоинкрементирован, а country_name установлено на 'казахстан'.

create table countries_new (like countries including all);
-- Создание новой таблицы countries_new с той же структурой и ограничениями, что и у таблицы countries.

insert into countries_new 
select * from countries;
-- Копирование всех строк из таблицы countries в таблицу countries_new.

update countries
set region_id = 1
where region_id is null;
-- Обновление всех строк в таблице countries, где region_id равно NULL, устанавливая region_id = 1.

select country_name, 
       population * 1.1 as "new population"
from countries;
-- Выбор названия страны и вычисленного значения населения (увеличенного на 10%) для каждой страны из таблицы countries.

delete from countries
where population < 100000;
-- Удаление строк из таблицы countries, где численность населения меньше 100,000.

delete from countries_new
where country_id in (select country_id from countries)
returning *;
-- Удаление строк из таблицы countries_new, где country_id совпадает с country_id из таблицы countries. Возвращает удалённые строки.

delete from countries
returning *;
-- Удаление всех оставшихся строк из таблицы countries и возврат удалённых строк.
