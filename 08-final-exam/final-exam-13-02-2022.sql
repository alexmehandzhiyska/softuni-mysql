SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SET GLOBAL log_bin_trust_function_creators = 1;

create database online_store;
use online_store;

-- problem 01

create table brands (
    id int not null primary key auto_increment,
    name varchar(40) not null unique
);

create table categories (
    id int not null primary key auto_increment,
    name varchar(40) not null unique
);

create table reviews (
    id int not null primary key auto_increment,
    content text,
    rating decimal(10, 2) not null,
    picture_url varchar(80) not null,
    published_at datetime not null
);

create table products (
    id int not null primary key auto_increment,
    name varchar(40) not null,
    price decimal(19, 2) not null,
    quantity_in_stock int,
    description text,
    brand_id int not null,
    category_id int not null,
    review_id int,
    foreign key (brand_id) references brands(id),
    foreign key (category_id) references categories(id),
    foreign key (review_id) references reviews(id)
);

create table customers (
    id int not null primary key auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    phone varchar(30) not null unique,
    address varchar(60) not null,
    discount_card bit(1) not null default 0
);

create table orders (
    id int not null primary key auto_increment,
    order_datetime datetime not null,
    customer_id int not null,
    foreign key (customer_id) references customers(id)
);

create table orders_products (
    order_id int,
    product_id int,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

-- problem 02

insert into reviews (content, picture_url, published_at, rating)
select left(description, 15), reverse(name), date('2010-10-10'), price / 8
from products
where id >= 5;

-- problem 03

update products
set quantity_in_stock = quantity_in_stock - 5
where quantity_in_stock >= 60 and quantity_in_stock <= 70;

-- problem 04

delete from customers
where id not in (select customer_id from orders);

-- problem 05

select id, name
from categories
order by name desc;

-- problem 06

select p.id, b.id as brand_id, p.name, p.quantity_in_stock
from products as p
join brands as b on p.brand_id = b.id
where price > 1000 and quantity_in_stock < 30
order by quantity_in_stock, id;

-- problem 07

select distinct r.id, content, rating, picture_url, published_at
from reviews as r
left join products as p on r.id = p.review_id
where content like 'My%' and length(content) > 61
order by rating desc;

-- problem 08

select
       concat(first_name, ' ', last_name) as full_name,
       address,
       o.order_datetime
from customers as c
join orders as o on c.id = o.customer_id
where year(order_datetime) <= 2018
order by full_name desc;

-- problem 09

select count(p.name) as items_count, c.name, sum(p.quantity_in_stock) as total_quantity
from products as p
join categories as c on p.category_id = c.id
group by c.name
order by items_count desc, total_quantity asc
limit 5;

-- problem 10

delimiter $$
create function udf_customer_products_count(name varchar(30))
returns int
begin
    return (
        select count(p.name)
        from customers as c
        join orders as o on c.id = o.customer_id
        join orders_products as op on o.id = op.order_id
        join products p on op.product_id = p.id
        where first_name = name);
end
$$

SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';


-- problem 11

delimiter $$
create procedure udp_reduce_price(category_name varchar(50))
begin
    update products as p
    right join reviews as r on p.review_id = r.id
    join categories as c on p.category_id = c.id
    set price = price * 0.7
    where c.name = category_name and
          r.rating < 4;
end
$$

CALL udp_reduce_price ('Phones and tablets');
