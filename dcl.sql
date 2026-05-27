CREATE database rajdb;
use rajdb;
create table raj45( id int);
insert into raj45 values (10);

-- TCL 
start transaction;
insert into raj45 values (100),(90);
select* from raj45;
commit;
-- data ko chnage kar deta h or parmenantly save kr deta hai deta ko / consistint state m bhej deta h deta ko ......alter


-- commit /rollback /ddl statement 
use rajdb;

start transaction;
update raj45 set id=500;
set sql_safe_updates=0;
select * from raj45;


start transaction;
insert into raj45 values (10),(11),(50),(68);
delete from raj45 where id=10;
select * from raj45;
commit;
rollback;


start transaction;
insert into raj45 values (768),(500),(400);
savepoint raj45_savepoint_ins;
update raj45 set id =1000;
rollback to raj45_savepoint_ins;

-- drop and truncate are ddl statement  rollback nhi kar skte hai 
-- dlete is dml stetament rollback ho skta hai 



