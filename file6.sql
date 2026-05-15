create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |



Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |


Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |



Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |




Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |



Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |

*/

select * from employees;
select * from departments;

-- 1
select e.emp_name, d.dept_name from employees as e
inner join departments as d
on e.dept_id = d.dept_id order by e.emp_name;

-- 2
select e.emp_name, d.dept_name from employees as e
left join departments as d
on e.dept_id = d.dept_id order by e.emp_name;

-- 3
select d.dept_name, count(e.emp_id) from employees as e
inner join departments as d
on e.dept_id = d.dept_id
group by dept_name;

-- 4
select d.dept_name, sum(e.salary) from employees as e
inner join departments as d
on e.dept_id = d.dept_id group by d.dept_name;

-- 5
select e.emp_name, e.manager_id, m.emp_id, m.emp_name from employees as e
join employees as m
on e.manager_id = m.emp_id
group by manager_id;

-- 6
use sakila;

select * from actor;
select * from film_actor;
select * from film;

-- select actor_id, actor's full name and also the film id.
-- get the film id, the film title and the actor id.
-- find the actor id, actor name and the movie he has work.
-- find the actor id, actor name and the movie he has work only fo the movie whos length is greater then 120
-- get the actor id, actor name, and total number of movies he has work.
-- get the film title and the number of actors that worked in the film.

-- 1-- select actor_id, actor's full name and also the film id.
select actor.actor_id, concat(first_name, ' ', last_name) as full_name, film_actor.film_id
from actor 
join film_actor 
on actor.actor_id = film_actor.actor_id;

-- 2get the film id, the film title and the actor id.
select film.film_id, film.title, actor.actor_id
from film 
join film_actor  on film.film_id = film_actor.film_id
join actor  on film_actor.actor_id = actor.actor_id
order by film.film_id;

-- 3  find the actor id, actor name and the movie he has work.

select actor.actor_id,CONCAT(actor.first_name, ' ', actor.last_name) as actor_name,film.title as movie_title
from actor 
join film_actor on actor.actor_id = film_actor.actor_id
join film  on film_actor.film_id = film.film_id
order by actor.actor_id;

-- 4 find the actor id, actor name and the movie he has work only for the movie who's length is greater then 120
select actor.actor_id,CONCAT(actor.first_name, ' ', actor.last_name) as actor_name,film.title as movie_title,film.length as movie_length
from actor 
join film_actor  on actor.actor_id = film_actor.actor_id
join film  on film_actor.film_id = film.film_id
where f.length > 120;



-- 5 get the actor id, actor name, and total number of movies he has work.
select actor.actor_id,CONCAT(actor.first_name, ' ', actor.last_name) as actor_name,COUNT(film.film_id) as total_movies
from actor 
join film_actor  on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
group by actor.actor_id, actor.first_name, actor.last_name;


-- 6 get the film title and the number of actors that worked in the film.
select film.title as film_title,COUNT(actor.actor_id) as total_actors
from film 
join film_actor  on film.film_id = film_actor.film_id
join actor  on film_actor.actor_id = actor.actor_id
group by film.film_id, film.title;



-- sub quary(quary) : query within a quary  
-- subquary is type of quary where a quary is present within another quary , this subquary is also called as nested sub quary 
-- example :

