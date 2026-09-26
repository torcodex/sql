create table customers
	(cust_id INT, f_name varchar(50), l_name varchar(50), 
	email varchar(50), address varchar(50), city varchar(50), state varchar(50), zip INT)

insert into customers values
	(1, 'Jino', 'joseph', 'jino@gmail.com', 'asd', 'allapy', 'kerala', 1234),
	(2, 'Anu', 'Thomas', 'anu@gmail.com', 'pwd123', 'Kottayam', 'Kerala', 2345),
	(3, 'Rahul', 'Menon', 'rahul@gmail.com', 'rahul@123', 'Kochi', 'Kerala', 3456),
	(4, 'Sneha', 'Nair', 'sneha@gmail.com', 'sneha123', 'Trivandrum', 'Kerala', 4567),
	(5, 'Arjun', 'Varma', 'arjun@gmail.com', 'arjun@456', 'Calicut', 'Kerala', 5678)

select f_name, l_name from customers


select * from customers where f_name like 'G%' and city like 'San Jose'

select * from customers where email like '%gmail%'

select * from customers where l_name not like '%A'




----------------- Assignment-3 ------------------------

create table orderss (ord_id INT IDENTITY(1,1) not null unique, ord_date date, amount int,cust_id INT)

INSERT INTO orderss VALUES
('2026-01-10', 1200, 1),
('2026-01-15', 850, 2),
('2026-02-03', 2500, 3),
('2026-02-18', 1750, 4),
('2026-03-01', 950, 5);

select * from customers c join orderss o on c.cust_id = o.cust_id


select * from customers c left join orderss o on c.cust_id = o.cust_id


select * from customers c right join orderss o on c.cust_id = o.cust_id


select * from customers c full outer join orderss o on c.cust_id = o.cust_id

update orderss set amount = 100 where cust_id = 3