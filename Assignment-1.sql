CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

select * from Salesman


CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);


INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);


CREATE TABLE Ord (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
money)

INSERT INTO Ord Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)


-- 1. Answer:-
insert into ord values (5004, 2314, 103,'2022-05-12',1300)

-- 2. Answer:-
ALTER TABLE Salesman ALTER COLUMN SalesmanId INT NOT NULL; -- 1st alteration

alter table Salesman add constraint pk_11 primary key(SalesmanId) -- 2nd alteration

alter table Salesman add constraint df_1 default 'Texas' for City -- 3rd alteration

ALTER TABLE Customer ALTER COLUMN SalesmanId INT NOT NULL;
-------- FOUND ERROR, TO BE CHECKED ---------

alter table Customer add constraint fk_1 foreign key(SalesmanId) references Salesman(SalesmanId) ------ FOUND ERROR, TO BE CHECKED --------

select SalesmanId from Customer
select SalesmanId from Salesman
-------- FOUND ERROR, TO BE CHECKED ---------

ALTER TABLE Customer ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

-- 3. Answer:-
select * from Customer where PurchaseAmount > 500 and CustomerName like '%N'


-- 4. Answer:-
select SalesmanId from Salesman 
Union
select SalesmanId from Customer

select SalesmanId from Salesman 
Intersect
select SalesmanId from Customer

-- 5. Answer:-

select o.Orderdate, s.Name, c.CustomerName, s.Commission, s.city 
	from Salesman s join ord o on s.SalesmanId = o.SalesmanId 
	join Customer c on o.CustomerId = c.CustomerId 
	where c.PurchaseAmount between 500 and 1500;

-- 6. Answer:- 

select * from Salesman s right join Ord o on s.SalesmanId=o.SalesmanId