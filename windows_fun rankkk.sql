use windowsdb;
-- RANK()
-- the values are same then rank will assign the same rank and next rank will be skipped 
select* ,row_number() over(order by salary),rank() over(order by salary) from employees;

-- DENSE_RANK()
-- is use to share the ranking of two values and give the next to the another it doesnt skip the ranks as ranking does 

select* ,row_number() over(order by salary),rank() over(order by salary) ,dense_rank() over (order by salary )
 from employees;
 
 
 --  order by is compulsary with rank and dense_rank()
 select*,
 rank() over(partition by dept order by salary)
 from employees;
 
 
 select*,
 rank() over(partition by dept order by hire_year)
 from employees;
 
-- salary= max salary of that dept 
-- corelated sub quary 
select* 
 from employees as a 
 where salary = (select max(salary ) from employees where dept=a.dept); 
 
 
 -- we cant use where clause in windows function directly in the query it will give an error 
 -- windows function 
 
 
 select * from 
	(select* ,max(salary)over(partition by dept ) as deptsalary from employees ) as trh
	where salary =deptsalary;
--  to make a varible of function name so we can give that in singlr or double coughts 


select*  from
(select * ,rank() over(partition by dept order by salary desc ) as rnk from employees) as temp 
where rnk=1; 


select * from 
(select * ,dense_rank() over ( partition by dept order by salary desc ) as rnk from employees ) as temp 
where rnk=2;


-- second highest salary
select max(salary ) from employees where salary < (select max(salary) from employees);

 
 select * from
 (select*,rank() over( order by salary ) as rnk from employees ) as temp 
 where rnk=4;