--1
create index idx_countries_name on countries(name);
--2
create index idx_employees_name_surname on employees(name, surname);
--3
create unique index idx_employees_salary_range on employees(salary);
--4
create index idx_employees_name_substring on employees ((substring(name from 1 for 4)));
--5
create index idx_employees_departments on employees(department_id, salary);
create index idx_departments_budget on departments(budget);