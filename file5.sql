-- Self join

create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);

select * from employees;

select empl.emp_id, empl.emp_name, empl.manager_id, mngr.emp_id, mngr.emp_name
from employees as empl
join employees as mngr
where empl.manager_id=mngr.emp_id;

select e.emp_id, e.emp_name, e.department from employees as e;
select m.emp_id, m.emp_name, m.department from employees as m;

select e.emp_id, e.emp_name, e.manager_id, e.department, m.emp_id, m.emp_name, m.department
from employees as e join employees as m
where e.manager_id = m.emp_id and e.department = m.department;

-- you need to find the employee name and its salary if it is greater than salary of its manager
select e.emp_id, e.emp_name, e.manager_id, e.department, m.emp_id, m.emp_name, m.department
from employees as e join employees as m
where e.manager_id = m.emp_id and e.salary>m.salary;

-- 1 show all the emp name with all the manager name
-- 2 show employee with its grand manager
-- 3 find the emps who are also the manager

-- 3
select empl.emp_id, empl.emp_name, empl.manager_id, mngr.emp_id, mngr.emp_name, mngr.manager_id,
supermngr.emp_id, supermngr.emp_name from
employees as empl left join employees as mngr
on (empl.manager_id = mngr.emp_id)
left join employees as supermngr
on (mngr.manager_id = supermngr.emp_id);