CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');


select sum(amount) as total_sales from sales;

-- mobilw total sales
select sum(amount) as mobile_total_sales from sales where product='Mobile';

-- we need to find totals sales and avg sales for north region but for the product laptop ans mobile 
select sum(amount),avg(amount) 
from sales 
where region='North' and product in('Laptop','Mobile');

select* from sales;

-- you need tofind out the max amount and min amount for the feb month 
select min(amount),max(amount)
from sales
where month(sale_date)=2;


-- find out the total sales we have for each region 
-- find out the avg sales done by each person 
-- find the total amount and the total transaction then for each product but the amit shoud not be the sales person 
-- find the number of sales done by persons for the amount greater than 10000
-- find the number of transaction done from day one to day 7 for any month 
-- find the total amount avg , max amount for each product for each region 
-- find the total transation amount for each product where the product should be sold more than 13 times

-- 1 
select sum(amount) as total_sales ,region 
from sales
group by region;

-- 2
select avg(amount),sales_person
from sales 
group by sales_person;

-- 3
select sum(amount) as total_sales , count(amount) as total_transaction
from sales
where sales_person != 'Amit'
group by product;

-- 4
select count(amount)
from sales
where amount>10000
group by sales_person;

-- 5
select  day(sale_date),count(amount)
from sales 
where day(sale_date) between 1 and 7
group by day(sale_date);

-- 6 -- find the total amount avg , max amount for each product for each region 
select sum(amount),avg(amount),max(amount),product,region
from sales 
group by product,region;

-- 7-- find the total transation amount for each product where the product should be sold more than 13 times
select count(amount),count(product),product
from sales
group by product
having count(product)>13;

use sakila;
-- where clause is use to filter the data on the table 
-- where clause aggregate functions 
-- having cluse is used  with the group by 
-- having is use to filter the aggregate result 
select product, sum(amount)
from sales
group by product
having sum(amount)>250000 ;

-- i need to find how many sales are done by each person 
select count(amount),sales_person
from sales
group by sales_person
having count(amount)>8;

select region ,sum(amount);


-- find the total transaction done by each person in the decreasing order 
select count(amount),sales_person
from sales
group by sales_person
order by count(amount)desc;

select sales_person,product,count(amount)
from sales
group by sales_person,product;


select year(payment_date),month(payment_date),sum(amount)
from payment
group by year(payment_date),month(payment_date);





