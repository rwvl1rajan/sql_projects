-- customer table
create database if not exists redwhiteprojects;
drop table  if exists customers;
use redwhiteprojects;
create table customers (
customerid int primary key,
name varchar(30) not null,
email varchar(36) ,
address varchar(255));

insert into customers values (1,'rajan','rajan@gmail.com','71249 rhb');
insert into customers values (2,'rajan2','rajan2@gmail.com','71249 rhb2');
insert into customers values (3,'rajan3','rajan3@gmail.com','71249 rhb3');
insert into customers values (4,'alice','rajan4@gmail.com','71249 rhb4');
insert into customers values (5,'rajan5','rajan5@gmail.com','71249 rhb5');

update customers set address ='rhb3' where customerid=3;
select * from customers;
delete from  customers where customerid=1;

select * from customers where name='alice';




-- order table

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount int
);

INSERT INTO orders VALUES
(1,1, '2026-11-01', 2500.00),
(2,2, '2026-11-02', 1500.50),
(3,3, '2026-11-05', 3200.00),
(4,1, '2026-11-10', 4500.75),
(5,4, '2026-11-15', 1800.00);


select * from orders where customer_id=1;

update orders set total_amount=45000 where order_id=1;

delete from orders where order_id=3;
insert into orders values (5,4, '2026-11-15', 1800.00);
select * from orders where order_date between '2026-10-20' and '2026-11-20';

select max(total_amount),min(total_amount),avg(total_amount) from orders;




-- product table 
CREATE TABLE Products (productiD int PRIMARY KEY ,productname varchar(100),price int,stock int
);
insert into Products values
(1,'Laptop', 55000.00, 10),
(2,'Mobile', 25000.00, 20),
(3,'Keyboard', 1200.00, 50),
(4,'Mouse', 600.00, 40),
(5,'Monitor', 15000.00, 0);

select * from products order by price desc;

update products set price =100 where productid=1;
insert into Products values
(6,'Laptop', 55000.00, 0);
delete from products where stock=0;

select * from products where price >500 and price <2000;

select  max(price),min(price) from products;





-- orders details table

create table orderdetails (
orderdetailid int primary key auto_increment,orderid int,productid int,quantity int, subtotal int);

insert into orderdetails (orderid, productid, quantity, subtotal)
values
(1, 1, 1, 55000.00),
(2, 2, 2, 50000.00),
(3, 3, 3, 3600.00),
(4, 4, 2, 1200.00),
(5, 5, 1, 15000.00);

select * from orderdetails where orderid=1;

select sum(subtotal) from orderdetails;

select * from orderdetails order by quantity desc limit 3;


select count(*) from orderdetails where productid=1;



