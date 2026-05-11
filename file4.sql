-- joins in sql

create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');

select * from customers;

-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');

select * from orders;

select customers.customer_id,customers.customer_name,orders.product_name 
from customers
join orders 
where customers.customer_id=orders.customer_id;
-- inner join,left join ,right join , full join
-- inner join it is type of join which will filtered the data on common values.
-- left join 
-- whoever data and rows of both the table are not matched than it gives null values
select customers.customer_id,customers.customer_name,orders.product_name 
from customers
left join orders 
on customers.customer_id=orders.customer_id;
-- customer who do not purchase any product
select customers.customer_id,customers.customer_name,orders.product_name 
from customers
left join orders 
on customers.customer_id=orders.customer_id
where product_name is null;
-- customer who  purchase any product
select customers.customer_id,customers.customer_name,orders.product_name 
from customers
left join orders 
on customers.customer_id=orders.customer_id
where product_name is not null;

elect customers.customer_id, customers.customer_name, orders.customer_id, product_name
from customers left join orders on customers.customer_id = orders.customer_id
where product_name is not null;

INSERT INTO orders VALUES(106, 11, 'Ice cream');
select customers.customer_id, customers.customer_name, orders.customer_id, product_name
from customers right join orders on customers.customer_id = orders.customer_id;

-- natural join
select customers.customer_id, customers.customer_name, orders.customer_id, product_name
from customers natural join orders;
insert into orders values(106,11,'ice cream');
-- right join 
select customers.customer_id,customers.customer_name,orders.product_name 
from customers
right join orders 
on customers.customer_id=orders.customer_id;
 -- natural join
select customers.customer_id,customers.customer_name,orders.product_name 
from customers
natural join orders;
-- self joint -> a table when join with itself



