--1
create function inc(a integer) returns integer as
$$
BEGIN 
    return a+10;
END;
$$
    language plpgsql; 

--2
create function compare_numbers(a integer, b integer) returns text as
$$
BEGIN
    if a > b then
        return 'Greater';
    elsif a = b then
        return 'Equal';
    else
        return 'Lesser';
    end if;
END;
$$
    language plpgsql;

--3
create function numseries(n integer) returns text as
$$
declare
    result text := '';
    i integer;
BEGIN
    for i in 1..n loop
        result := result || i || ' ';
    end loop;
    return trim(result);
END;
$$
language plpgsql;

--4
create function find_em(employee_name varchar) returns table (id int, name varchar, position varchar, salary numeric) as
$$
BEGIN
    return query select id, name, position, salary
        FROM employees
        WHERE name = employee_name;
END;
$$
language plpgsql;

--5

create function list_products(category_name varchar) returns table (product_id int, product_name varchar, price numeric) as
$$
BEGIN
    return query select product_id, product_name, price
                 from products
                 where category = category_name;
END;
$$
language plpgsql;


--6
create function calcbonus(salary numeric) returns numeric as
$$
BEGIN
    return salary * 0.1;
END;
$$
language plpgsql;
--7


create function upd_sal(employee_id int) returns void as
$$
DECLARE
    curr_sal numeric;
    bonus numeric;
BEGIN
    select salary into curr_sal from employees where id = employee_id;
    bonus := calcbonus(curr_sal);
    update employees set salary = curr_sal + bonus where id = employee_id;
END;
$$
language plpgsql;

