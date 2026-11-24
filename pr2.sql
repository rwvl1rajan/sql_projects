create database if not exists pr2;
use pr2;

create table if not exists customers (
customerid int primary key ,
first_name varchar(20),
lastname varchar(20),
email varchar(255),
registrationdate date default(curdate()));

truncate table customers;
insert into customers values (1,'rajan','singh','rajansingh@gmail.com',default) ;
insert into customers values (2,'rajan2','singh2','rajansing2h@gmail.com',default) ;


create table orders (
orderid int primary key,
customerid int,
orderdate date default(curdate()),
total_amount int);

select * from customers;
create table employee (
empid int primary key,
first_name varchar(60),
last_name varchar(60),
department varchar(20),
hiredate date default(curdate()),
salary int);

insert into orders values
(1,1,default,40000),
(2,2,default,50000);

insert into employee values
(1,'amit','singh','it',default,500000),
(2,'manish','singh','it',default,500000);

select * from orders o
join customers c
on o.customerid =c.customerid;



SELECT *
FROM customers c
LEFT JOIN orders o
ON o.customerid = c.customerid
UNION
SELECT *
FROM customers c
RIGHT JOIN orders o
ON o.customerid = c.customerid;

select * from (select c.customerid,
        o.orderid,
        o.orderdate,
        o.total_amount from customers c
join orders o
on o.customerid= c.customerid) as temp where total_amount > (select avg(total_amount) from orders) ;

select * from employee where salary >= (select avg(salary) from employee);

select year(orderdate),month(orderdate), monthname(orderdate) from orders;
select datediff(orderdate,curdate()),month(orderdate), monthname(orderdate) from orders;

select concat(first_name,' ', last_name) from employee;

select *, replace(last_name,'singh','kaushik') from employee;

update employee
set last_name=replace(last_name,'singh','kaushik')
where last_name like '%singh%';

select upper(last_name),lower(first_name) from employee;

select trim(email) from customers;

select *, sum(total_amount) over(order by total_amount) from orders;

select *, rank() over(order by total_amount)  from orders;
select *,
case 
when total_amount >39000 and total_amount< 45000 then total_amount *0.10
when total_amount >4500 and total_amount< 55000 then total_amount *0.50
end as meoww
from orders;

select * from employee;





INSERT INTO employee VALUES
(3, 'rahul', 'sharma', 'hr', DEFAULT, 450000),
(4, 'priya', 'patel', 'finance', DEFAULT, 600000),
(5, 'neha', 'verma', 'it', DEFAULT, 550000),
(6, 'rohit', 'gupta', 'sales', DEFAULT, 400000),
(7, 'ankit', 'mehta', 'marketing', DEFAULT, 650000),
(8, 'pooja', 'shah', 'hr', DEFAULT, 480000),
(9, 'vikas', 'jain', 'finance', DEFAULT, 700000),
(10, 'simran', 'kaur', 'it', DEFAULT, 750000),
(11, 'arjun', 'reddy', 'sales', DEFAULT, 520000),
(12, 'kavita', 'desai', 'marketing', DEFAULT, 580000);

select * , case
when salary <=500000 then 'medium'
when salary <=300000 then 'low'
when salary >=500000 then 'high' end as meowww from  employee;
