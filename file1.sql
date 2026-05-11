use sakila;
CREATE TABLE employees (
    emp_id       INT            PRIMARY KEY,
    first_name   VARCHAR(50)    NOT NULL,
    last_name    VARCHAR(50)    NOT NULL,
    email        VARCHAR(100)   NOT NULL,
    department   VARCHAR(50),
    job_title    VARCHAR(60),
    salary       DECIMAL(10,2),
    hire_date    DATE,
    birth_date   DATE,
    phone        VARCHAR(20),
    city         VARCHAR(50),
    country      VARCHAR(50),
    is_active    CHAR(1)
);


INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');



-- Find employees with salary between 65,000 and 85,000
select * 
from employees 
where salary between 65000 and 85000;

-- List employees in the IT or Finance department
select emp_id,first_name,last_name,department,job_title from employees where department in('IT','Finance');
-- Find employees whose last name ends with son;
select emp_id,first_name,last_name,department from employees where last_name like '%son';
-- Find active employees (is_active = 'y';) in the IT department

-- Display first_name in UPPERCASE and last_name in lowercase for Finance employees
select emp_id,upper(first_name) as first_name_upper, lower(last_name)as last_name_lower,salary from employees where department='Finance';

-- Find employees whose first name has more than 4 characters
select emp_id,first_name,length(first_name) as name_length, department
 from employees
 where length(first_name) > 4;
-- Show full name and its character length for Marketing employees
select emp_id,concat(first_name,'',last_name) as full_name, length(concat(first_name,'',last_name)) as full_name_length from employees where department ='Marketing';
-- Display hire year and years-ago for each Finance employee
select emp_id,first_name,last_name,hire_date,year(hire_date),year(now()),year(hire_date)
from employees
where department = 'Finance'; 
-- Show each IT employees salary rounded to nearest 10,000 and its remainder
select emp_id, first_name, last_name, salary, round(salary,-4) as rounded_salary, round(salary,-4)-salary as salary_remainder
from employees
where department ='IT';
-- Q10. Find employees using an Outlook email address
select emp_id, first_name, last_name, email
from employees
where email like '%@outlook.com';
-- Ques: 11
select emp_id, first_name, last_name, hire_date, datediff(now(),hire_date) as days_employed
from employees
where datediff(now(),hire_date) > 2000
order by datediff(now(),hire_date) desc;

-- Ques: 12
select emp_id, first_name, last_name, email, substring(email,1,locate('@',email)-1) as username
from employees
where department = 'hr';

-- Ques: 13
select concat(first_name, ' ', last_name) as full_name, department, salary
from employees
where department not in('it', 'finance') and salary not between 60000 and 80000
order by salary desc;

-- Ques: 14
select emp_id, first_name, last_name, email, upper(substring(email,1,locate('@',email)-1)) as username_upper, char_length(substring(email,1,locate('@',email)-1)) as username_length
from employees
where char_length(substring(email,1,locate('@',email)-1)) > 6;

-- Ques: 15
select emp_id, concat(first_name,' ', last_name) as fullname, birth_date, timestampdiff(year, birth_date, now()) as age, salary, department
from employees
where timestampdiff(year, birth_date, now()) between 32 and 38 and is_active = 'y' and salary > 65000
order by timestampdiff(year, birth_date, now()) asc, salary desc;




















-- for doing sorting we use order by : ORDER BY 
select * 
from employees
order by salary;

-- for descending order : ORDER BY column_name desc by default in ascending order 
select*
from employees 
order by salary desc;


select first_name ,department ,salary from employees 
order by department, salary;
-- do only when we get same multiple column only 

select salary, hire_date,year(hire_date)
from employees 
order by year(hire_date),salary desc;


-- multi Row function

select distinct(department) from employees;
-- distint is a keyword and function too 

select distinct department , salary from employees;

-- calculation performs on data --> aggregate function 

select count(department) from employees;

select count(district),count(address_id),count(address2) from address;-- count never count null 

select count(department), count( distinct department) from employees;
 -- if we use aggregate function so we can't acces any other  column directly (column ka nam use nhi kar skte hai ) 

select sum( salary ) ,count(salary),avg(salary) , min(salary), max(salary)
from employees;

-- function -->  sum(),min(),max(),avg(),count(),distinct()--> distinct is function and keyword too.......alter

select sum(salary),sum(distinct salary) from employees ;


-- group by clause 
select department ,count(salary) 
from employees
group by department
having count(salary)>=6
order by sum(salary) desc;



-- aggrigate function 
select sum(salary),count(salary)
from employees
where department ='Finance';

-- group by is statement/keyword  used for grouping the simillar values ......for performing calculations 
-- the column which we use in group by we have to select that column only or too ..... 

select department ,sum(salary) 
from employees
group by department;

select department,count(department ) 
from employees
group by department; 


select department ,sum(salary),count(department),avg(salary)
from employees 
group by department ;


select job_title
from employees 
where job_title='Marketing lead'
group by job_title;


select job_title
from employees 
group by job_title
having job_title='Marketing lead';

-- from this payment table find the total amount and the avg amount 
-- form this pay table find the total no transactions donr by coustomer id 1 
-- form this pay table find the total no transactions donr by coustomer id 2 and 5 
-- find the avg amount spend in the year 2005 

select sum(amount) as total_amount, avg(amount) as avg_amount
from payment;

select count(amount) as no_trans 
from payment
where customer_id=1;

select count(amount) as no_trans 
from payment
where customer_id=2 or customer_id = 5;

select avg (amount)
from payment 
where year(payment_date)=2005;

-- total trans done by each customer id 
-- find now also get taotal transaction and total ammount spend after the customer id 3 
-- find the occurance for each amount value  
-- find the total amount given in the table 
-- get the avg amount spent by each staff 
-- get the total amount spend in each month 
-- get the total amount spend for each moth of each year
  
  
 -- 1
select customer_id,sum(amount)  from payment group by customer_id;
-- 2
select sum(amount) from payment where customer_id >3;
-- 3
select amount,count(amount) from payment group by amount;
-- 4
select sum(amount) from payment ;
-- 5
select staff_id, avg (amount) from payment group by staff_id;
-- 6
select month(payment_date),sum(amount) from payment group by month(payment_date);
-- 7
select year(payment_date),month(payment_date),sum(amount) from payment group by  year(payment_date),month(payment_date);























































