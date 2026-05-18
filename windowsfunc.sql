-- partition by....
use shadidb;
select * from employees;

-- 1 
select *, sum(salary) over(partition by department),sum(salary) over()
from employees;

-- 2
select *, sum(salary) over(partition by department order by salary),sum(salary) over()
from employees;

-- 3
select name,salary,department,sum(salary) over(partition by department) ,(salary /sum(salary) over(partition by department))*100 
from employees;

create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;


select* ,sum(salary) over(partition by hire_year order by salary )from employees;

select* ,sum(salary) over(partition by dept order by hire_year)from employees;


select*, max(salary) over(partition by dept order by hire_year)
from employees;



select*, max(salary) over(partition by dept , hire_year)
from employees;


select * ,avg(salary ) over(partition by dept ),
case 
	when salary >avg(salary) over(partition by dept ) then"above salary"
    else 'less salary'
    end
from employees;


-- function related to windows 
-- 1st function (ROW NUMBER) 
-- majaorly works for to give unique number for every row 
-- we can also use partition by in this and order by too and will return  acoording to the codition 
-- assign unique value 
select * ,row_number() over(order by salary) from employees;

select * ,row_number() over() from employees;

select * ,row_number() over(partition by dept) from employees;

-- 2nd function (RANK) 
-- it will give the rank according to the condition 
-- based on comparesion it will assign the ranks to the row 

select*, rank() over(order by salary desc)
from employees;

select*, rank() over(partition by dept order  by salary desc)
from employees;

select*, rank() over(partition by hire_year order  by salary desc)
from employees;
