drop database if exists lab1 ;
create database lab1;
\c lab1\

-- Удаляем таблицы, если они существуют
drop table if exists users;
drop table if exists tasks;

-- Создаем таблицу users

CREATE TABLE users(
  id SERIAL,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

-- SELECT * FROM users;

ALTER TABLE users
    ADD COLUMN isadmin INT;

ALTER TABLE users
    ALTER COLUMN isadmin TYPE BOOL USING isadmin::boolean;

ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;

-- INSERT INTO users VALUES (DEFAULT ,'Aza', 'Qwe', DEFAULT );

ALTER TABLE users
    ADD CONSTRAINT uniq PRIMARY KEY (id);

CREATE TABLE tasks(
  id SERIAL,
  name VARCHAR(50),
  user_id INT
);

-- SELECT * FROM tasks;

drop table if exists tasks;
drop table if exists users;

-- Подключаемся к базе данных postgres и удаляем базу данных lab1
\c postgres
drop database if exists lab1;