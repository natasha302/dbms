mysql> create table lib_Audit(bid int , bname varchar(20), qty int); 

 create table lib_book(bid int , bname varchar(20), qty int);

insert into lib_book values(1,'DBMS',70); 

insert into lib_book values(2,'SPOS',40);

insert into lib_book values(3,'SPM',10);

insert into lib_book values(4,'CNS',60);

 insert into lib_book values(5,'TOC',20);

 select * from lib_book; 

drop trigger if exists Make_audit1;

delimiter //

CREATE TRIGGER Make_audit1
  AFTER DELETE ON lib_book
  FOR EACH ROW
BEGIN
  INSERT INTO lib_Audit (bid, bname, qty)
  VALUES (OLD.bid, OLD.bname,OLD.qty);
END;
//

delimiter ;


select * from lib_book;  

 select * from lib_Audit;

delete from lib_book where bid = 4;


 select 
* from lib_book;  
+ +  + +  
| bid | bname | qty |  
+ +  + +  
| 1 | DBMS | 70 |  
| 2 | SPOS | 40 |  
| 3 | SPM | 10 |  
| 5 | TOC | 20 |  
+ +  + +  
4 rows in set (0.00 sec) mysql> 
select * from lib_Audit;  
+ +  + +  
| bid | bname | qty |  
+ +  + +  
| 4 | CNS | 60 |  
+ +  + + 


drop trigger if exists Make_audit2;

delimiter //

CREATE TRIGGER Make_audit2
  AFTER UPDATE ON lib_book
  FOR EACH ROW
BEGIN
  INSERT INTO lib_Audit (bid, bname, qty)
  VALUES (OLD.bid, OLD.bname,OLD.qty);
END;
//

delimiter ;

mysql> update lib_book set qty = qty 
+ 10 where bid = 5;  
Query OK, 1 row affected (0.15 sec) Rows 
matched: 1 Changed: 1 Warnings: 0 
mysql> select * from lib_book;  
+ +  + +  
| bid | bname | qty |  
+ +  + +  
| 1 | DBMS | 70 |  
| 2 | SPOS | 40 |  
| 3 | SPM | 10 |  
| 5 | TOC | 30 |  
+ +  + +  
4 rows in set (0.00 sec) mysql> 
select * from lib_Audit;  
+ +  + + 
