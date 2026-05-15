-- sub quary(quary) : query within a query  
-- subquary is type of query where a query is present within another query , this subquery is also called as nested sub query 
-- subquery has two parts outer query and inner query    ..... outerquery (innerquary)
-- inner will execute first 
create database shadidb;
use shadidb;
create table biodata(
id int,
name varchar(20),
age int);

insert into biodata values(1,'rahul',28),(1,'anjali',28),(3,'aishwarya',40),(4,'naina',23);

select* from biodata; 

select age from biodata where name='rahul';

select *from biodata where age>(select age from biodata where name='rahul'); 

select max(age) from biodata;
select *from biodata where age=40;
select * from biodata where age=(select *from biodata where age=40);



-- find out the total char of the  person rahul 
select char_length(name)
from biodata 
where name='rahul';

select name from biodata where char_length(name)=5;

select name from biodata where char_length(name)=(select char_length(name)
from biodata 
where name='rahul');
-- type of sub query
-- single row sub query ->
--  ti is type of query in which the inner query return 1 

use sakila;

select * from film;


-- get that movies where the rental rate is same for the movire of african agg
select RENTAL_RATE from film 
where title='AFRICAN EGG';
SELECT title ,rental_rate
from film
where rental_rate=(select RENTAL_RATE from film where title='AFRICAN EGG');

-- questions
-- 1 get the movie id and name where the rental rate is equal to the minimum rate
-- 2 get the movie id movie name and the duration where the duration is greater than the avg duration of the movie 
-- 3 get the movie id for the movies where the reliesed year of the movie should be equal of the relasing year of the alone trip and the rating should be same as of the movie appolo team 
 select  film_id,title
 from film 
 where rental_rate=(select min(rental_rate) from film);
 
 
 select film_id,title,rental_duration
 from film
 where rental_duration >=(select avg(rental_duration ) from film);
 
 
 select film_id, title
 from film
 
 where release_year=(select release_year from film where title = 'ALONE TRIP') and rating=(select rating from film where title='APOLLO TEEN');
 
 -- multirow subquery -> if it returns more than one row  
 -- multirow subquery sub query mai arithmatic support nhi krta h (comparenhi karsakte hai ) 
 
 use shadidb;
 select * from biodata;
 
 select * from biodata 
 where age in (select age from biodata where name ='anjali' or name = 'aishwarya')and name!='rahul';
 
 
 -- find the name for rahul where the age is nor equal to the age of anjali not ashirwarya ....alter
 
 select * from biodata
 where age not in (select age from biodata where name ='anjali' or name = 'aishwarya')and name!='rahul';
 
 
 
 CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);

INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);



select *
from employees;

select min(salary) 
from employees ;

select* from employees where salary=(select min(salary) from employees) ;


select salary 
from employees
where name='Alice'or name='Bob';

select * from employees where salary in ( select salary 
from employees
where name='Alice'or name='Bob');
 
 select * from employees where department in(select department from employees where name ='Alice'or name='Bob'); 
 
 
 select salary from employees where emp_id=103 or emp_id=107;
select * from employees where salary not in  (select salary from employees where emp_id=103 or emp_id=107);

-- any operator-> kse se bhi 
 select * from employees where salary > any (select salary from employees where emp_id=103 or emp_id=107);
 
 select * from employees where department='HR';
 select * from employees where salary > any (select salary from employees where department='HR');
 
  select * from employees where salary > all(select salary from employees where department='HR');
  
  select * from employees where department='IT'; 
  
  select * from employees where salary >all(select salary from employees where department='IT');
  
  
  -- find the emp details who works in it dept and have the salary greater than the salary of emp id 101 
  -- find the name of a person whos salary is greater than all the salary of hr or it dept 
  -- find the emp id and emp name of the user whos salary is greater than the salary of any emp working under the manager id 101
  -- find out the second hightest salary from this table 
  
  
  select * from employees where department ='IT' and emp_id=101;
  -- 1
  select * from employees where department='IT' and salary > all ( select salary from employees where  emp_id=101);
  
  select name , salary , department from employees where department='HR' or department='IT';
  
  -- 2
  select * from employees where salary > all( select salary from employees where department='HR' or department='IT');
  
  -- 3 find the emp id and emp name of the user whos salary is greater than the salary of any emp working under the manager id 101
  
  select emp_id,name  from employees where salary > all (select salary from employees where manager_id = 101) ;
  
 -- 4 
 select max(salary) from employees ;
 select max(salary)  as second_highest from employees where salary <( select max(salary) from employees);
 
 use shadidb;
 
 
 create table departments(
 dept_id int,
 dept_name varchar(20),
 location varchar(20));
 
 insert into departments values( 10,"hr","mummbai"),(20,"it","banglore"),(30,"finance","delhi");

-- find out those persons who have the depratment delhi and banglore location 
   
select * from employees
where department =any(select dept_name from departments where location in ('banglore','delhi'));



 
 
 
 