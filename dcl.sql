use testdb4;

grant select on testdb4.emp to ishan; -- for giving access 
grant delete on testdb4.* to ishan ;
set sql_safe_updates=0;
revoke delete on testdb4.emp from ishan;

-- revoke this delete prevlige from the ishan user 
-- give select and insert privilage to a particular table 
-- create a table with three columns and insert atleast two rows 
-- now give onw column acces to this select statement also give the update privilage to the second or third column  
-- remove all the privilages from this ishan user 


create database sh;
use sh;
create table emp1( id int,name varchar (20),location varchar (10));
insert into emp1 values ( 1,'nirbhay','jaipur'),(2,'mihir','udaipur');
grant select(id) on sh.emp1 to ishan;
grant update(name , location ) on sh.emp1 to ishan;
revoke select on sh.emp1 from ishan;
revoke update on sh.emp1 from ishan;


-- create three users and create a group (roll) with the name sales select,insert ,update and add user in the roll 
-- login in roll and check permision granted or not 

create user a identified by '123';
create user b identified by '123';
create user c identified by '123';
create role 'group' ;
grant 'group' to 'a','b','c';  

