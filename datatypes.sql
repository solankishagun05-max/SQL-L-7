-- data types 
create database if not exists datatypes;
use datatypes;

-- numeric 
create table test1(id tinyint);
insert into test1 values (-1),(10);
insert into test1 values (128);-- out of range (1bite -> 8bit -> 2**8 (-128 to 127))
select* from test1;
-- small int - 2bytes 
-- medium int - 3 bytes 
-- int- 4bytes 


create table test2 ( age tinyint unsigned ); 
-- unsigned turns the whole range into positive side  (-128 to 127 ) 
insert into test2 values (250);
select * from test2;



-- FLOAT,DOUBLE 
create table test3(salary float, salary2 double );

insert into test3 values ( 1989.98756,1989.8934682393);


-- float gives only 2 values after the decimal 
-- double gives all values after the decimal   

select* from test3;

create table test4( price double(6,2)); -- total is 6,2 is decimal value ,4 are the value before integer 
insert into test4 values( 123.834989795);-- only 2 decimal values 
insert into test4 values(1234.847897593758);
insert into test4 values(4453);
insert into test4 values(44513); -- 5 integer value  beacuse of 5 integer value it give the error 


-- STRING DATA TYPES (CHAR AND VARCHAR) 
create table test5( country_code char(3)); -- char fixed length character store karta hai and memomry weastage ko support karta hai 
-- char kabhi bhi ending m whitespace nhi consider karta hai 
-- it is faster 
insert into test5 values ('ind');
insert into test5 values ('india'); -- ERROR because we have given the fix memory location or no og character ......... 

insert into test5 values( 'he     ');  -- char kabhi bhi ending m whitespace nhi consider karta hai

 select*, char_length(country_code) from test5;  
 
 



